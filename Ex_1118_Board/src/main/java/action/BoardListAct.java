package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;


@WebServlet("/list.do")
public class BoardListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//전체 게시글 조회
		List<BoardVO> list=BoardDAO.getInstance().selectList();

		//list 바인딩
		request.setAttribute("list", list);
		
		//조회수 기록을 위해 세션에 저장되있던 show 정보 삭제
		HttpSession session=request.getSession();
		session.removeAttribute("show");
		
		RequestDispatcher disp=request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
	}

}
