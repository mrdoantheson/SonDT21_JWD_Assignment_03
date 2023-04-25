package fa.tranning.sondt21_jwd_assignment_03.dao;

import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;

import java.util.List;
import java.util.Optional;

public interface MemberDao {
    List<Member> findAllMembers();

    void createMember(Member member);

    Optional<Member> findByMemberId(Long id);

    Member findMemberByEmailAndPassword(String email, String password);
    Member findMemberByEmail(String email);

    void updateMember(Member member);
}
