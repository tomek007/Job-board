package pl.coderslab.app.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.app.entity.Province;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Transactional
@Repository
public class ProvinceDao {
    @PersistenceContext
    private EntityManager entityManager;

    public void save(Province province) {
        entityManager.persist(province);
    }

    public List<Province> getAll() {
        Query query = entityManager.createQuery("SELECT b FROM Province b");
        return query.getResultList();
    }

}
