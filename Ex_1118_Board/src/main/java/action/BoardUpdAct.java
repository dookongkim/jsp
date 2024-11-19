package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/upd.do")
public class BoardUpdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		BoardVO vo=BoardDAO.getInstance().selectOne(idx);
		
		request.setAttribute("vo", vo);

		RequestDispatcher disp=request.getRequestDispatcher("board_update.jsp");
		
		disp.forward(request, response);
		
	}

}
