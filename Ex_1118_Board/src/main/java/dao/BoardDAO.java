package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;
	
	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private BoardDAO() {
		factory=MyBatisConnector.getInstance().getFactory();
	}
	
	public List<BoardVO> selectList(){
		
		SqlSession sqlSession=factory.openSession();
		List<BoardVO> list=sqlSession.selectList("b.board_list");
		
		sqlSession.close();
		
		return list;
		
	}
	
	public int insert( BoardVO vo) {
		
		SqlSession sqlSession=factory.openSession();
		int res=sqlSession.insert("b.board_insert",vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
		
	}
	public BoardVO selectOne(int idx) {
		
		SqlSession sqlSession=factory.openSession();
		BoardVO vo=sqlSession.selectOne("b.board_one", idx);
		
		sqlSession.close();
		
		return vo;
		
	}
	
	public int update_readhit(int idx) {
		
		SqlSession sqlSession=factory.openSession();
		int res=sqlSession.update("b.update_readhit",idx);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
		
	}
	
	//댓글처리를 위한 step+1
	public int update_step(BoardVO baseVO) {
		SqlSession sqlSession=factory.openSession();
		int res=sqlSession.update("b.update_step",baseVO);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
	
	public int reply( BoardVO vo) {
		
		SqlSession sqlSession=factory.openSession();
		int res=sqlSession.insert("b.board_reply_insert",vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
		
	}
	
	//삭제 ( 된 것 처럼 업데이트 )
	public int del_update(int idx) {
		SqlSession sqlSession=factory.openSession();
		int res=sqlSession.update("b.del_update", idx);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
		
	}
	
	public int board_update(BoardVO vo) {
		SqlSession sqlSession=factory.openSession();
		int res= sqlSession.update("b.board_update", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
		
	}
	
	
	
}	












