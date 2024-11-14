package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberUpdateAct
 */
@WebServlet("/update.do")
public class MemberUpdateAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int idx=Integer.parseInt(request.getParameter("idx"));

		
		
		//회원목록 조회
			
		MemberDAO dao=MemberDAO.getInstance();
		MemberVO vo=dao.selectOne(idx);
			//request 영역에 list객체를 바인딩
		request.setAttribute("vo", vo);
				
			//저장한 list를 어떤 jsp에서 사용할지 포워딩
		RequestDispatcher disp= request.getRequestDispatcher("member_update_form.jsp");
			
		disp.forward(request, response);
	
		
		
	
		
		
		
	}

}
