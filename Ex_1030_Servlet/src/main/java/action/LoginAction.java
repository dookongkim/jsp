package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String[] hobby = request.getParameterValues("hobby");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out= response.getWriter();
		
		out.println("<html>");
		
		out.println("<body>");
		out.println("id : "+id);		
		out.println("pwd : "+pwd+"<br>");
		
		int cnt=1;
		if(hobby != null) {
			for(String h:hobby) {
				out.println("취미"+cnt++ +" : "+h+"<br>");
				
			}
		}
		
		out.println("</body>");
		
		out.println("</html>");
		
		
		
	}

}
