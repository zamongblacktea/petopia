package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.RsvVo;

public class RsvDao {
	//single-ton : 객체1개만 생성 서비스
	static RsvDao single = null;

	//SessionFactory생성하는 객체
	SqlSessionFactory factory;
	
	public RsvDao() {
		super();
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}


	public RsvDao(SqlSessionFactory factory) {
		// TODO Auto-generated constructor stub
	}


	public static RsvDao getInstance() {

		if (single == null)
			single = new RsvDao();

		return single;
	}
	
	//내 예약내역 검색하기
	public List<RsvVo> selectList() {
		// TODO Auto-generated method stub
		
		List<RsvVo> list = null;
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		list = sqlsession.selectList("rsv.rsv_list");
		
		
		//닫기
		sqlsession.close();
		
		
		return list;
	}

	
	//예약정보 update 메소드
	public int insert(RsvVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		res = sqlsession.insert("rsv.rsv_insert", vo);
		
		
		//트랜잭션 커밋
		sqlsession.commit();
		
		
		//닫기
		sqlsession.close();
		
		
		
		
		return res;
	}

	public RsvVo selectOne(int mem_idx) {
		// TODO Auto-generated method stub
		RsvVo vo = null;
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		vo = sqlsession.selectOne("rsv.rsv_list_one", mem_idx);
		
		
		//닫기
		sqlsession.close();
		
		
		return vo;
	}

	public List<RsvVo> selectListOne(int mem_idx) {
		// TODO Auto-generated method stub
		List<RsvVo> list = null;
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		list = sqlsession.selectList("rsv.rsv_list_one", mem_idx);
		
		
		//닫기
		sqlsession.close();
		
		
		return list;
	}
	
	
	//체크아웃시 체크인 수 감소하는 스케쥴러 메소드
	public int updateChk() {
		
		
		int res = 0;
		
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		res = sqlsession.update("rsv.rsv_update_chk");
		
		
		//트랜잭션 커밋
		sqlsession.commit();
		
		//입력확인용 syso
		//System.out.println("입력값:" + sqlsession);
		
		//닫기
		sqlsession.close();
		
		
		
		
		return res;
		
		
	}
	
	
	
	
	
	
	
	
	
	
}//end:RsvDao

	
	
	
	
	

