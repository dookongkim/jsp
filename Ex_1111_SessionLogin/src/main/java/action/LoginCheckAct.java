package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/login_check.do")
public class LoginCheckAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		
		MemberDAO dao=MemberDAO.getInstance();
		MemberVO vo=dao.selectOne(id);
		
		
		String result="";
		String param="";
		
		response.setCharacterEncoding("UTF-8");
		
		//아이디가 다르면
		if(vo==null) {
			param="no_id";
			result=String.format("[{'param':'%s'}]", param);
			response.getWriter().println(result);
			return;
		}
		//비밀번호가 다르면
		if(!pwd.equals(vo.getPwd())) {
			param="no_pwd";
			result=String.format("[{'param':'%s'}]", param);
			response.getWriter().println(result);
			return;
		}
		
		//로그인 성공
		//유저정보 (vo)를 세션스코프에 저장 (바인딩)
		//세션은 서버의 메모리(ram)을 사용하기에, 많이 사용할수록 브라우저를 느리게 만들고, 그에 따른 비용상승을 유발
		
		HttpSession session = request.getSession();
		session.setAttribute("user", vo);
		
		//세션 유지시간 (기본 30분) -> 60분
		session.setMaxInactiveInterval(3600);  // 3600초 (
		
		param="clear";
		result=String.format("[{'param':'%s'}]", param);
		response.getWriter().println(result);
		
		}
}
