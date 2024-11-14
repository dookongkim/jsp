package action;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberListAct
 */
@WebServlet("/member_list.do")
public class MemberListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//model2(MVC 패턴) : 비즈니스 로직과 UI 로직을 완 전 히 분리해서 작업하는 형태
		//M (model) : DAO
		//V (view) : JSP
		//C (controller) : Servlet 
		
		
		//회원목록 조회vv
		MemberDAO dao=MemberDAO.getInstance();
		List<MemberVO> list =dao.selectList();
		
		//request 영역에 list객체를 바인딩
		request.setAttribute("list", list);
		
		//저장한 list를 어떤 jsp에서 사용할지 포워딩
		RequestDispatcher disp= request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
		
		
	}

}
