package fa.tranning.sondt21_jwd_assignment_03.controller;

import fa.tranning.sondt21_jwd_assignment_03.dao.Impl.MemberDaoImpl;
import fa.tranning.sondt21_jwd_assignment_03.dao.MemberDao;
import fa.tranning.sondt21_jwd_assignment_03.model.entity.Member;
import fa.tranning.sondt21_jwd_assignment_03.service.Impl.MemberServiceImpl;
import fa.tranning.sondt21_jwd_assignment_03.service.MemberService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.internal.util.StringHelper;

import java.io.IOException;

@WebServlet(name = "editProfileFormController", value = "/contents/edit_profile")
public class EditProfileController extends HttpServlet {
    MemberDao memberDao = new MemberDaoImpl();
    MemberService memberService = new MemberServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/content/EditProfile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("first-name");
        String lastName = req.getParameter("last-name");
        String phone = req.getParameter("phone");
        String description = req.getParameter("description");

        Member member = (Member) req.getSession().getAttribute("memberLogin");

        member.setFirstName(firstName);
        member.setLastName(lastName);
        member.setPhone(phone);
        member.setDescription(description);

        memberService.updateMember(member);

        resp.sendRedirect(req.getContextPath() + "/contents");
    }
}