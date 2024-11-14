package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class IdCheckAct
 */
@WebServlet("/check_id.do")
public class IdCheckAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id=request.getParameter("id");
		MemberVO vo=MemberDAO.getInstance().selectOne(id);
		
		String result="";
		int res=0;
		if(vo==null) {
			//가입이 가능한 상태
			res=1;
			result=String.format("[{'r':'%d'},{'res':'은 가입 가능한 아이디 입니다'},{'id':'%s'}]", res,id);
		}else {
			result=String.format("[{'r':'%d'},{'res':'은 가입 불가능한 아이디 입니다'},{'id':'%s'}]",res, id);
		}
		//json 구조에 한글이 포함되어 있을 때 , 인코딩
		response.setContentType("text/plain;charset=UTF-8");
		
		//콜백메서드
		response.getWriter().println(result);
		
	}

}
