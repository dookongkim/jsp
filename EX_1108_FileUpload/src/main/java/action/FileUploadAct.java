package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAct
 */
@WebServlet("/upload.do")
public class FileUploadAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("utf-8");
		
		//파일 저장할 절대경로
		String web_path="/img/";
		//현재 프로젝트를 관리하는 객체
		ServletContext application=request.getServletContext();
		//상대경로 -> 절대경로
		String path=application.getRealPath(web_path);
		
		System.out.println("절대경로 : "+path);
		
		//최대 업로드 용량
		int max_size= 1024*1024*1000; //1000mb
		
		//파일을 포함하고 있는 파라미터 수신을 위한 객체
		MultipartRequest mr=new MultipartRequest( request,path,max_size,"utf-8",new DefaultFileRenamePolicy() );
		
		//업로드 된 파일정보 가져오기
		String filename="no_file";
		
		File f=mr.getFile("photo");
		if( f !=null ) {
			filename=f.getName();
			System.out.println(filename);
		}
		
		//파일 이외의 파라미터 받기
		String title=mr.getParameter("title");
		
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		RequestDispatcher disp=request.getRequestDispatcher("result.jsp");
		
		disp.forward(request, response);
	}	
		
}		
