package action;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class PhotoInsertAct
 */
@WebServlet("/insert.do")
public class PhotoInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String web_path="/upload/";
		ServletContext application=request.getServletContext();
		String path=application.getRealPath(web_path);
		System.out.println("절대경로 :" +path);
		
		int max_size=1024*1024*1000;
		
		MultipartRequest mr= new MultipartRequest(request, path ,max_size,"utf-8",new DefaultFileRenamePolicy());
		
		String filename="";
		
		File f=mr.getFile("photo");
		if(f !=null ) {
			filename=f.getName();
			System.out.println("filename: " +filename);
		}
		
		String title=mr.getParameter("title");
		String pwd=mr.getParameter("pwd");		
		String ip=request.getRemoteAddr();
		
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		

		PhotoDAO dao=PhotoDAO.getInstance();
		PhotoVO vo=new PhotoVO();
		vo.setTitle(title);
		vo.setFilename(filename);
		vo.setPwd(pwd);
		vo.setIp(ip);


		int result=dao.insert(vo);
		
		System.out.println("res : " +result);
		
		response.sendRedirect("list.do");
		
	}

}
