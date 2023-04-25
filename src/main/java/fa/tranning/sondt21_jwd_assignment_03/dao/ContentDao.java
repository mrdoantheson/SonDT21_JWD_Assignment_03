package fa.tranning.sondt21_jwd_assignment_03.dao;

import fa.tranning.sondt21_jwd_assignment_03.model.entity.Content;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;

import java.util.List;

public interface ContentDao {
    void createContent(Content content);
    List<Content> findAllContentByMember(Member member);
}
