package fa.tranning.sondt21_jwd_assignment_03.service;

import fa.tranning.sondt21_jwd_assignment_03.model.entity.Content;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;

import java.util.List;

public interface  ContentService {
    List<Content> findContentByMember(Member member);
    boolean create(Content content);
}
