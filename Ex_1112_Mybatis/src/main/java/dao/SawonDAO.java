package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	SqlSessionFactory factory;
	private SawonDAO() {
		factory=MyBatisConnector.getInstance().getFactory();
	}
	
	public List<SawonVO> select(){
	
		SqlSession sqlSession=factory.openSession();
		
		List<SawonVO> list=sqlSession.selectList("sawon.sawon_list");
	
		sqlSession.close();
	
		return list;
	}
	
	//사원 한 명 조회
	public SawonVO selectSawon(int sabun) {
		
		SqlSession sqlSession=factory.openSession();
		SawonVO vo=sqlSession.selectOne("sawon.one_sawon",sabun);
		
		sqlSession.close();
		
		return vo;
	}
	
	//insert update delete 할 때
	// sqlSession.commit(); OR  openSession(true);
	public int insertSawon(SawonVO vo) {
		
		SqlSession sqlSession=factory.openSession(true);
		int cnt= sqlSession.insert("sawon.insert_sawon",vo);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public SawonVO selectSaname(String saname) {
		SqlSession sqlSession=factory.openSession();
		SawonVO vo=sqlSession.selectOne("sawon.search_sawon",saname);
		
		sqlSession.close();
		
		return vo;
		
	}
	
	public int deleteSawon(int sabun) { 
		SqlSession sqlSession= factory.openSession(true);
		int cnt=sqlSession.delete("sawon.delete_sawon", sabun);
		
		sqlSession.close();
		
		return cnt;
	}
}
