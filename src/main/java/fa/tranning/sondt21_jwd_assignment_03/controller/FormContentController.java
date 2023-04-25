package fa.tranning.sondt21_jwd_assignment_03.controller;

import fa.tranning.sondt21_jwd_assignment_03.model.entity.Content;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;
import fa.tranning.sondt21_jwd_assignment_03.service.ContentService;
import fa.tranning.sondt21_jwd_assignment_03.service.Impl.ContentServiceImpl;
import fa.tranning.sondt21_jwd_assignment_03.service.Impl.MemberServiceImpl;
import fa.tranning.sondt21_jwd_assignment_03.service.MemberService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

@WebServlet(name = "contentFormController", value = "/contents/add")
public class FormContentController extends HttpServlet {
    ContentService contentService = new ContentServiceImpl();
    MemberService memberService = new MemberServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String memberId = req.getParameter("member_id");
        if (memberId != null) {
            Optional<Member> memberOptional =
                    memberService.findByMemberId(Long.parseLong(memberId));
            Member member = memberOptional.orElseThrow(() -> new IllegalArgumentException("Not found member with id " + memberId));
            req.setAttribute("members", member);
        }

        req.getRequestDispatcher("/WEB-INF/view/content/FormContent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String title = req.getParameter("title");
        String brief = req.getParameter("brief");
        String content = req.getParameter("content");

        Member member = (Member) req.getSession().getAttribute("memberLogin");

        Content newContent = new Content();
        newContent.setTitle(title);
        newContent.setBrief(brief);
        newContent.setContent(content);
        newContent.setCreateDate(LocalDateTime.now());
        newContent.setMember(member);

        contentService.create(newContent);

        resp.sendRedirect(req.getContextPath() + "/contents");
    }
}
