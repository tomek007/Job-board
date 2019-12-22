package pl.coderslab.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.coderslab.app.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

}