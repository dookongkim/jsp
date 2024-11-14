package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloAction
 */

// url-mapping : 서버에서 요청받은 url 을 실행시켜주는 식별자
@WebServlet("/hello.do")
public class HelloAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	  서블릿( server + let ) 
	  1. 서버에서 실행되는 서비스 객체 
	  2. 웹 응용프로그램을 만드는 자바기술이며, 실행 결과값을 html 구조로 돌려준다
	  3. html의 정적인 문제를 해결할 수 있음 ( 동적 움직임 )
	  4. 자바언어로 작성되어 있어 자바의 일반적인 특징을 모두 가지고 있음
	  5. 객체지향적.  
	  */
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-- HelloAction 서블릿이 실행됨 --");
		
		//request : 요청처리객체 ( 외부에서 들어온 값을 받는 객체 )
		//response : 응답처리객체 ( 최종 결과를 반환하는 객체 ) 
		
		//접속자의 ip 가져오는 코드
		String ip = request.getRemoteAddr();
		System.out.println(ip + "님 접속감지");
		
		//response 를 통해 결과를 html 구조로 출력
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<style> h1{color:red} </style>");
		out.println("</head>");
		
		out.println("<body>");
		out.println("<h1>");		
		out.printf("[%s]님 접속을 환영합니다",ip);
		out.println("</h1>");
		out.println("</body>");
		
		out.println("</html>");
		
		
	}

}
