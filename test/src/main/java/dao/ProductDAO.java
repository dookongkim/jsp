package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ProductVO;

public class ProductDAO {
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
	public ProductDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//카테고리별 상품조회
	public List<ProductVO> select( String category ){
		SqlSession sqlSession = factory.openSession();
		List<ProductVO> list = 
				sqlSession.selectList("p.product_list", category);
		sqlSession.close();
		return list;
	}
	
	//상품등록
	public int insert( ProductVO vo ) {
		
		SqlSession sqlSession = factory.openSession();
		int cnt = sqlSession.insert("p.product_insert", vo);
		sqlSession.commit();
		sqlSession.close();
		
		return cnt;
	}
	
	//수정할 상품 조회
	public ProductVO updOne( int idx ) {
		
		SqlSession sqlSession = factory.openSession();
		ProductVO vo = sqlSession.selectOne("p.upd_one", idx);
		sqlSession.close();
		
		return vo;
		
	}
	
	//상품수정
	public int update( ProductVO vo ) {
		SqlSession sqlSession = factory.openSession();
		int cnt = sqlSession.update("p.upd_product", vo);
		sqlSession.commit();
		sqlSession.close();
		
		return cnt;
	}
	
	//상세보기를 위한 상품조회
	public ProductVO selectOne( int idx ) {
		
		SqlSession sqlSession = factory.openSession();
		ProductVO vo = 
				sqlSession.selectOne("p.product_one", idx);
		sqlSession.close();
		
		return vo;
	}
}














