package fa.tranning.sondt21_jwd_assignment_03.dao.Impl;

import fa.tranning.sondt21_jwd_assignment_03.dao.ContentDao;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Content;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;
import fa.tranning.sondt21_jwd_assignment_03.util.HibernateConnectionConfig;
import org.hibernate.Session;

import java.util.List;

public class ContentDaoImpl implements ContentDao {
    @Override
    public void createContent(Content content) {
        try (Session session = HibernateConnectionConfig.getSession()) {
            session.beginTransaction();
            session.persist(content);
            session.getTransaction().commit();
        }
    }

    @Override
    public List<Content> findAllContentByMember(Member member) {
        try (Session session = HibernateConnectionConfig.getSession()) {
            return session
                    .createQuery("FROM Content c WHERE c.member = :member ", Content.class)
                    .setParameter("member", member)
                    .getResultList();
        }
    }
}
