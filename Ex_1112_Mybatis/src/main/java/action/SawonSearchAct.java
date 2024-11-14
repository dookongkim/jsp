package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawon_search.do")
public class SawonSearchAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search_name=request.getParameter("saname");
		
		SawonVO vo=SawonDAO.getInstance().selectSaname(search_name);
		
//		if(vo==null) {
//			RequestDispatcher disp=request.getRequestDispatcher("sawonlist.do");
//			disp.forward(request, response);
//		}
		request.setAttribute("search_name", vo);
		
		RequestDispatcher disp=request.getRequestDispatcher("sawon_search.jsp");
		
		disp.forward(request, response);
		
	}

}
