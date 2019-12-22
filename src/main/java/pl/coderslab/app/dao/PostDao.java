package pl.coderslab.app.dao;

import org.springframework.stereotype.Repository;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.app.entity.Post;
import pl.coderslab.app.entity.Province;
import pl.coderslab.app.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.security.PublicKey;
import java.util.List;

@Transactional
@Repository
public class PostDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void save(Post post) {
        entityManager.persist(post);
    }

    public void update(Post post) {
        entityManager.merge(post);
    }

    public void delete(Post post) {
        entityManager.remove(entityManager.contains(post) ?
                post : entityManager.merge(post));
    }

    public List<Post> getLatestsPosts(int number) {
        Query query = entityManager.createQuery("SELECT b FROM Post b").setMaxResults(number);
        return query.getResultList();
    }

    public Post get(int id) {
        return entityManager.find(Post.class, id);
    }

    public List<Post> getAll() {
        Query query = entityManager.createQuery("SELECT b FROM Post b");
        return query.getResultList();
    }

    public List<Post> getAllByID(int id) {
        Query query = entityManager.createQuery("SELECT b FROM Post b WHERE b.user.id = :id").setParameter("id", id);
        return query.getResultList();
    }

    public List<Post> search(String post_search) {
        Query query = entityManager.createQuery("SELECT b FROM Post b WHERE b.title LIKE :post_search " +
                "or b.description LIKE :post_search or b.location LIKE :post_search or b.province.province_name LIKE :post_search or b.category.category_name LIKE :post_search").setParameter("post_search", "%"+post_search+"%");
        return query.getResultList();
    }

}