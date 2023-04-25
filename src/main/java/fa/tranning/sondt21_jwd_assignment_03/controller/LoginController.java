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

import java.io.IOException;
import java.util.List;

@WebServlet(name = "loginController", value = "/login")
public class LoginController extends HttpServlet {
    MemberService memberService = new MemberServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/auth/LoginPage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        MemberDao memberDao = new MemberDaoImpl();
        Member checkMember = memberDao.findMemberByEmailAndPassword(email, password);

        if (checkMember != null) {
            Member member = memberDao.findMemberByEmail(email);
            req.getSession().setAttribute("memberLogin", member);
            resp.sendRedirect(req.getContextPath() + "/contents/edit_profile");
        } else {
            req.setAttribute("errorInvalidEmail", "Email or password invalid");
            req.getRequestDispatcher("/WEB-INF/view/auth/LoginPage.jsp").forward(req, resp);
        }
    }
}
