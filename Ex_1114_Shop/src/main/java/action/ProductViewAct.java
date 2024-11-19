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

import dao.ProductDAO;
import vo.ProductVO;


@WebServlet("/view.do")
public class ProductViewAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		ProductVO vo=ProductDAO.getInstance().selectOne(idx);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp=request.getRequestDispatcher("product_detail.jsp");
		disp.forward(request, response);
		
	}

}