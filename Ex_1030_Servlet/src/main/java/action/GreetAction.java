package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GreetAction
 */

//url 매핑은 다른 servlet의 url 매핑과 중복되면 안된다
@WebServlet("/greet.do")
public class GreetAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//클라이언트 측에서 넘겨준 파라미터를 수신
		//서블릿으로 전달되는 모든 파라미터는 String으로 받아짐
		String myId=request.getParameter("id");
		
		//수신된 파라미터가 null인 경우 체크
		//greet.do? ---> null
		//greet.do?id= ---> "" , empty
		
		if(myId==null || myId.isEmpty()) {
			myId="이름없음";
		}
		
		String nation=request.getParameter("nation");
		if(nation==null || nation.isEmpty()) {
			nation="kor";
		}
		
		String msg="";
		
		if( nation.equals("kor")) {
			msg="한국을 선택함";
		}else if( nation.equals("eng")) {
			msg="미국을 선택함";
		}else if( nation.equals("jpn")) {
			msg="일본을 선택함";
		}else if( nation.equals("chn")) {
			msg="착짱죽짱";
		}
		
		//응답처리객체 준비
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter() ;
		
		out.println("<html>");
		out.println("<head>");
		out.println("<style>  </style>");
		out.println("</head>");
		
		out.println("<body>");
		out.println(myId +"님 환영 <br>");		
	
		out.println("<h1>"+msg+"</h1>");
		out.println("</body>");
		
		out.println("</html>");
			
		
		
		
		
		
		
		
		
	}

}
