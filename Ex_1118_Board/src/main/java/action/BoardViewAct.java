package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;


@WebServlet("/view.do")
public class BoardViewAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		BoardVO vo=BoardDAO.getInstance().selectOne(idx);
		
		//조회수 증가
		HttpSession session=request.getSession();
		String show=(String)session.getAttribute("show");
		
		if(show ==null) {
			int res=BoardDAO.getInstance().update_readhit(idx);
			session.setAttribute("show", "y");
		}
		BoardVO vo1=BoardDAO.getInstance().selectOne(idx);
		request.setAttribute("vo", vo1);
		
		RequestDispatcher disp=request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
		
		
	}

}
