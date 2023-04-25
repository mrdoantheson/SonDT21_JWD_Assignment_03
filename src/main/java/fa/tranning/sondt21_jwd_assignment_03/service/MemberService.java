package fa.tranning.sondt21_jwd_assignment_03.service;

import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;

import java.util.List;
import java.util.Optional;

public interface MemberService {
    List<Member> findAllMember();
    boolean createMember(Member member);
    Optional<Member> findByMemberId(Long id);
    boolean createOrUpdateMember(Member member);
    boolean updateMember(Member member);
}
