package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;


@WebServlet("/delete_sawon.do")
public class SawonDeleteAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sabun=Integer.parseInt(request.getParameter("sabun"));
		
		int res=SawonDAO.getInstance().deleteSawon(sabun);
		
		System.out.println("delete 결과1 : "+res);
		
		RequestDispatcher disp=request.getRequestDispatcher("sawonlist.do");
		disp.forward(request, response);
	}

}
