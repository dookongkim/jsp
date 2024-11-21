package action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;


@WebServlet("/update.do")
public class BoardUpdFin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setIdx(idx);
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO.getInstance().board_update(vo);
		//&page=${param.page}&search=${param.search}&search_text=${param.search_text}
		
		int page=Integer.parseInt(request.getParameter("page"));
		String search=request.getParameter("search");
		String search_text=request.getParameter("search_text");
		String encode_search_text=URLEncoder.encode(search_text,"UTF8");
		
		response.sendRedirect("list.do?&page="+page+"&search="+search+"&search_text="+encode_search_text);
		
		
		
	}

}
