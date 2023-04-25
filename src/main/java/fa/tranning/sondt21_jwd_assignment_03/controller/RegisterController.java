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
import java.util.Optional;

@WebServlet(name = "registerController", value = "/register")
public class RegisterController extends HttpServlet {
    MemberService memberService = new MemberServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String memberId = req.getParameter("member_id");
        if (memberId != null) {
            Optional<Member> memberOptional =
                    memberService.findByMemberId(Long.parseLong(memberId));
            Member member = memberOptional.orElseThrow(() -> new IllegalStateException("Not found member with id" + memberId));
            req.setAttribute("members", member);
        }
        req.getRequestDispatcher("/WEB-INF/view/auth/RegisterPage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String userName = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        MemberDao memberDao = new MemberDaoImpl();
        Member checkMember = memberDao.findMemberByEmail(email);

        if (checkMember == null) {
            Member member = new Member();
            member.setUsername(userName);
            member.setEmail(email);
            member.setPassword(password);

            memberService.createMember(member);
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("errorExistsEmail", "Email already exists");
            req.getRequestDispatcher("/WEB-INF/view/auth/RegisterPage.jsp").forward(req, resp);
        }

    }
}
