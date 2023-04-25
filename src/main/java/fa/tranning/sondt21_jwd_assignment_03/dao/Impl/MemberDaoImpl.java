package fa.tranning.sondt21_jwd_assignment_03.dao.Impl;

import fa.tranning.sondt21_jwd_assignment_03.dao.MemberDao;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;
import fa.tranning.sondt21_jwd_assignment_03.util.HibernateConnectionConfig;
import org.hibernate.Session;

import java.util.List;
import java.util.Optional;

public class MemberDaoImpl implements MemberDao {
    @Override
    public List<Member> findAllMembers() {
        try (Session session = HibernateConnectionConfig.getSession()) {
            return session
                    .createQuery("FROM Member", Member.class)
                    .getResultList();
        }
    }

    @Override
    public void createMember(Member member) {
        try (Session session = HibernateConnectionConfig.getSession()) {
            session.beginTransaction();
            session.persist(member);
            session.getTransaction().commit();
        }
    }

    @Override
    public Optional<Member> findByMemberId(Long id) {
        try (Session session = HibernateConnectionConfig.getSession()) {
            return Optional.ofNullable(session.get(Member.class, id));
        }
    }
    @Override
    public Member findMemberByEmailAndPassword(String email, String password) {
        try (Session session = HibernateConnectionConfig.getSession()) {
            return session
                    .createQuery("FROM Member m WHERE m.email = :email AND m.password = :password", Member.class)
                    .setParameter("email", email)
                    .setParameter("password", password).getSingleResultOrNull();
        }
    }

    @Override
    public Member findMemberByEmail(String email) {
        try (Session session = HibernateConnectionConfig.getSession()) {
            return session
                    .createQuery("FROM Member m WHERE m.email = :email", Member.class)
                    .setParameter("email", email).getSingleResultOrNull();
        }
    }

    @Override
    public void updateMember(Member member) {
        try (Session session = HibernateConnectionConfig.getSession()) {
            session.beginTransaction();
            session.merge(member);
            session.getTransaction().commit();
        }
    }
}
