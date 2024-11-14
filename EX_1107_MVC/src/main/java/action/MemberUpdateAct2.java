package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberUpdateAct2
 */
@WebServlet("/member_update.do")
public class MemberUpdateAct2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String addr=request.getParameter("addr");
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setAddr(addr);
		vo.setIdx(idx);
		
		//DB에 값 추가
		int res=MemberDAO.getInstance().update(vo);
		
		System.out.println("update 결과 : "+res);
		
		String param="no";
		if(res>0) {
			param="yes";
		}
		
		String resultStr=String.format("[{'param':'%s'}]",param );
		
		response.getWriter().println(resultStr);
		
		
	}

}
