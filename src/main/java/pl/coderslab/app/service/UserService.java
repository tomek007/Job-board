package pl.coderslab.app.service;

import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.app.dao.UserDao;
import pl.coderslab.app.entity.User;
import pl.coderslab.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;
import java.util.ArrayList;

@Service("userService")
public class UserService {

    private UserRepository userRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    private UserDao userDao;

    @Autowired
    public UserService(UserRepository userRepository,
                       UserDao userDao,
                       BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.userDao = userDao;
    }

    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        user.setRole("USER");
        userRepository.save(user);
    }

    public User findUser(Integer id) {
        return userDao.findUser(id);
    }

    public User findUser(String email) {

        User user = null;

        try {
            user = userDao.findUserByEmailEquals(email).getSingleResult();
            return user;
        } catch (NoResultException nre) {
            //Ignore this because as per your logic this is ok!
        }

        return null;

    }

    public User loginUser(String email, String password) {

        User user = this.findUser(email);

        if (user != null && user.getPassword().equals(password)) {
            return user;
        }

        return null;

    }

}