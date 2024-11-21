package action;

import java.io.IOException;
import java.net.URLEncoder;

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
		request.setCharacterEncoding("utf-8");
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		BoardVO vo=BoardDAO.getInstance().selectOne(idx);
		
		request.setAttribute("vo", vo);
		
		int page=Integer.parseInt(request.getParameter("page"));
		String search=request.getParameter("search");
		String search_text=request.getParameter("search_text");
		
		String encode_search_text=URLEncoder.encode(search_text,"UTF8");
		
		RequestDispatcher disp=request.getRequestDispatcher("board_update.jsp?page="+page+"&search="+search+"&search_text="+encode_search_text);
		
		disp.forward(request, response);
		
	}

}
