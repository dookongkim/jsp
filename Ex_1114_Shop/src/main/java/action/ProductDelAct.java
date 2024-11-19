package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ProductDAO;
import vo.CartVO;


@WebServlet("/productDel.do")
public class ProductDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category=request.getParameter("category");
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		//장바구니의 품목 먼저 제거
		int res=CartDAO.getInstance().cartDelete(idx);
		
		//실제 상품 제거
		res=ProductDAO.getInstance().delete(idx);
		
		response.sendRedirect("list.do?category="+category);
		
		
		
	}

}
