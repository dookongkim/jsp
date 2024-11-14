package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/list.do")
public class PhotoListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//DAO 에서 전체 목록을 가져오기
		PhotoDAO dao=PhotoDAO.getInstance();
		List<PhotoVO> list=dao.selectList();
		
		//바인딩
		request.setAttribute("list", list);
		//포워딩
		RequestDispatcher disp=request.getRequestDispatcher("photo_list.jsp");
		disp.forward(request, response);
		
	}

}
