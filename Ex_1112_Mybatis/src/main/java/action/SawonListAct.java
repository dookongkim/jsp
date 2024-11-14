package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;


@WebServlet("/sawonlist.do")
public class SawonListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<SawonVO> list = SawonDAO.getInstance().select();
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp=request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}

}
