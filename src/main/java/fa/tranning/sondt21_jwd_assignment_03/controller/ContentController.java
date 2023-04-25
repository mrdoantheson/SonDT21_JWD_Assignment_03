package fa.tranning.sondt21_jwd_assignment_03.controller;

import fa.tranning.sondt21_jwd_assignment_03.model.entity.Content;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;
import fa.tranning.sondt21_jwd_assignment_03.service.ContentService;
import fa.tranning.sondt21_jwd_assignment_03.service.Impl.ContentServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "contentController", value = "/contents")
public class ContentController extends HttpServlet {
    ContentService contentService = new ContentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Member member = (Member) req.getSession().getAttribute("memberLogin");

        List<Content> contents = contentService.findContentByMember(member);
        req.setAttribute("contents", contents);

        req.getRequestDispatcher("/WEB-INF/view/content/ViewContents.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Member member = (Member) req.getSession().getAttribute("memberLogin");

        List<Content> contents = contentService.findContentByMember(member);
        req.setAttribute("contents", contents);
        req.getRequestDispatcher("/WEB-INF/view/content/ViewContent.jsp").forward(req, resp);
    }
}
