package fa.tranning.sondt21_jwd_assignment_03.service.Impl;

import fa.tranning.sondt21_jwd_assignment_03.dao.Impl.MemberDaoImpl;
import fa.tranning.sondt21_jwd_assignment_03.dao.MemberDao;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;
import fa.tranning.sondt21_jwd_assignment_03.service.MemberService;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class MemberServiceImpl implements MemberService {
    MemberDao memberDao = new MemberDaoImpl();

    @Override
    public List<Member> findAllMember() {
        return memberDao.findAllMembers();
    }

    @Override
    public boolean createMember(Member member) {
        try {
            memberDao.createMember(member);
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    @Override
    public Optional<Member> findByMemberId(Long id) {
        return memberDao.findByMemberId(id);
    }

    @Override
    public boolean createOrUpdateMember(Member member) {
        return member != null && member.getId() != null ? updateMember(member) : createMember(member);
    }

    @Override
    public boolean updateMember(Member member) {
        try {
            memberDao.updateMember(member);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
