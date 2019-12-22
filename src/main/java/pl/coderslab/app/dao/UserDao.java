package pl.coderslab.app.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pl.coderslab.app.entity.User;

@Repository
public class UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    public long countUsers() {
        return entityManager.createQuery("SELECT COUNT(o) FROM User o", Long.class).getSingleResult();
    }

    public List<User> findAllUsers() {
        return entityManager.createQuery("SELECT o FROM User o", User.class).getResultList();
    }

    public User findUser(Integer id) {
        if (id == null) return null;
        return entityManager.find(User.class, id);
    }

    @Transactional
    public void persist(User user) {
        this.entityManager.persist(user);
    }

    public TypedQuery<User> findUserByEmailEquals(String email) {
        if (email == null || email.length() == 0) throw new IllegalArgumentException("The email argument is required");
        TypedQuery<User> q = entityManager.createQuery("SELECT o FROM User AS o WHERE o.email = :email", User.class);
        q.setParameter("email", email);
        return q;
    }

}
