package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CsboardVo;
import vo.MemberVo;


public class CsboardDao {
	
	//Mybatis 객체 
	SqlSessionFactory factory;

	//singleton : 1개의 객체로 서비스하자
	static CsboardDao single = null;

	public static CsboardDao getInstance() {

		if (single == null)
			single = new CsboardDao();

		return single;
	}

	// CsboardDao.getInstance()를 통해서만 객체를 참조해라:  
	// new CsboardDao() 금지
	private CsboardDao() {
		// TODO Auto-generated constructor stub
		factory=MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//문의게시판 입력하기
	public int insert(CsboardVo vo) {
		// TODO Auto-generated method stub
		int res = 0; //초기화
		
		//1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true);
		//true를 줘서 자동 commit되도록함
		
		//2.작업수행					namespace.mapper_id,parameter(여기서는 vo)
		res = sqlSession.insert("csboard.csboard_insert",vo);   
		//             마이바티스가 할수 있는 insert함수가 있음
		
		//3.닫기
		sqlSession.close();
		return res;
	}//end: insert
	
	
	//문의게시판 1개얻어오기 
	/*
	 * public CsboardVo selectOne(int mem_idx) {
	 * 
	 * CsboardVo vo = null;
	 * 
	 * 
	 * //1.SqlSession 얻어오기 SqlSession sqlSession = factory.openSession(true);
	 * //true를 줘서 자동 commit되도록함
	 * 
	 * //2.작업수행 namespace.mapper_id,parameter(여기서는 vo) vo =
	 * sqlSession.selectOne("csboard.csboard_one",mem_idx);
	 * 
	 * //3.닫기 sqlSession.close();
	 * 
	 * 
	 * return vo;
	 * 
	 * }
	 */
	public List<CsboardVo> selectList(int mem_idx){
		
		//List<CsboardVo> list= null;
		
		//1.SqlSession 작업객체 얻어오기
		// DB의 Connection얻어온다.(DBCP)
		SqlSession sqlSession = factory.openSession();
		
		//2.작업수행					 namespace.mapper_id
		//							 sawon.xml mapper의 내용참조해서 작업수행해라
		//list = sqlSession.selectList("csboard.csboard_list");
		//mybatis안에 selectList라는 객체가있음 
		//csboard.csboard_list에서 가져온정보를 selectList에서 포장한다.
		
		List<CsboardVo> list = sqlSession.selectList("csboard.csboard_list", mem_idx); // mem_idx를 전달
		
		// mapeer의 이름 sawon sawon안에 있는 id = sawon list  ->sawon.xml가서 확인
		
		//3.닫기 작업 : 내부에서는 conn.close()
		sqlSession.close();
		
		/*
		 * if (list == null || list.isEmpty()) {
		 * System.out.println("CsboardDao.selectList() - 조회된 데이터 없음 (mem_idx: " +
		 * mem_idx + ")"); } else {
		 * System.out.println("CsboardDao.selectList() - 조회된 데이터 수: " + list.size()); }
		 */

		return list;
		
	}

	public List<CsboardVo> selectListAdmin() {
		// TODO Auto-generated method stub
		
		SqlSession sqlSession = factory.openSession();
		
		List<CsboardVo> listall = sqlSession.selectList("csboard.csboard_list_all"); 
		
		sqlSession.close();
		return listall;
	}

	

	

	
}


