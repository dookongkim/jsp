package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;



@WebServlet("/sawon_insert.do")
public class SawonInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String saname=request.getParameter("saname");
		String sagen=request.getParameter("sagen");
		String sajob=request.getParameter("sajob");
		String sahire=request.getParameter("sahire");
		int deptno=Integer.parseInt(request.getParameter("deptno"));
		int samgr=Integer.parseInt(request.getParameter("samgr"));
		int sapay=Integer.parseInt(request.getParameter("sapay"));
		
		//db에 추가할 정보를 vo에 저장
		SawonVO vo=new SawonVO();
		
		vo.setSaname(saname);
		vo.setSagen(sagen);
		vo.setSajob(sajob);
		vo.setSahire(sahire);
		vo.setDeptno(deptno);
		vo.setSamgr(samgr);
		vo.setSapay(sapay);
		
		SawonDAO.getInstance().insertSawon(vo);
		
		response.sendRedirect("sawonlist.do");
		
		
		
	}

}
