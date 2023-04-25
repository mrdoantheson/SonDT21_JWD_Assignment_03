package fa.tranning.sondt21_jwd_assignment_03.service.Impl;

import fa.tranning.sondt21_jwd_assignment_03.dao.ContentDao;
import fa.tranning.sondt21_jwd_assignment_03.dao.Impl.ContentDaoImpl;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Content;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;
import fa.tranning.sondt21_jwd_assignment_03.service.ContentService;

import java.util.List;

public class ContentServiceImpl implements ContentService {
    ContentDao contentDao = new ContentDaoImpl();

    @Override
    public List<Content> findContentByMember(Member member) {
        return contentDao.findAllContentByMember(member);
    }

    @Override
    public boolean create(Content content) {
        try {
            contentDao.createContent(content);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
