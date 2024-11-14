package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalAction
 */

@WebServlet("/calc.do")
public class CalAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int	n1=Integer.parseInt(request.getParameter("num1"));
		int	n2=Integer.parseInt(request.getParameter("num2"));
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out= response.getWriter();
		
		out.println("<html>");
		
		out.println("<body>");
		out.println("+ 결과 :"+(n1+n2)+"<br>");
		out.println("- 결과 :"+(n1-n2)+"<br>");
		out.println("* 결과 :"+(n1*n2)+"<br>");
		out.printf("/ 결과 :%.1f<br>",(float)n1/n2);
		out.println("<a href='calculator.jsp'>다시하기</a>");
		
		out.println("</body>");
		out.println("</html>");
	}

}
