package carrot.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carrot.bean.dao.MemberDAO;
import carrot.bean.dto.MemberDTO;

@WebServlet(urlPatterns="/member/change_password.do")
public class changePassWordServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
	MemberDTO mdto=(MemberDTO)req.getSession().getAttribute("memberinfo");
	
String member_id = mdto.getMember_id();

String member_pw =req.getParameter("member_pw");

MemberDTO member = new MemberDTO();
member.setMember_id(member_id);
member.setMember_pw(member_pw);

MemberDAO mdao = new MemberDAO();
mdao.changePassword(member);

resp.sendRedirect("change_password_result.jsp");
}
catch(Exception e) {
	e.printStackTrace();
	resp.sendError(500);
}
}
}
