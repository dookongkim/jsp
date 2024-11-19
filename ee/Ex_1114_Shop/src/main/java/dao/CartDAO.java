package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CartVO;

public class CartDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static ProductDAO single = null;

	public static ProductDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new ProductDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
SqlSessionFactory factory;
	
	public CartDAO() {
		factory=MyBatisConnector.getInstance().getFactory();
	}
	
	//회원별 장바구니 목록
	
	public List<CartVO> select( int m_idx ){
		SqlSession sqlSession=factory.openSession();
		List<CartVO> list=sqlSession.selectList("c.cart_list",m_idx);
		sqlSession.close();
		
		return list;
		
	}
	
	//회원별 장바구니 상품의 총합
	public int selectTotalAmount (int m_idx ) {
		SqlSession sqlSession=factory.openSession();
		int total=sqlSession.selectOne("c.cart_total_amount",m_idx);
		
		sqlSession.close();
		
		return total;
	}
	
	
}
