package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.AcomRoomVo;
import vo.AcomVo;
import vo.Conn_AcomVo;

public class AcomDao {
	//single-ton : 객체1개만 생성 서비스
	static AcomDao single = null;

	//SessionFactory생성하는 객체
	SqlSessionFactory factory;
	
	public AcomDao() {
		super();
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public static AcomDao getInstance() {

		if (single == null)
			single = new AcomDao();

		return single;
	}
	
	//숙소 리스트 조회
	public List<AcomVo> selectList() {
		// TODO Auto-generated method stub
		
		List<AcomVo> list = null;
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		list = sqlsession.selectList("acom.acom_room_list");
		
		
		//닫기
		sqlsession.close();
		
		
		return list;
	}
	
	
	
	
	public AcomVo selectOne(int acom_idx) {
		// TODO Auto-generated method stub
		
		AcomVo vo = null;

		//1.sqlsession 얻어오기
		SqlSession sqlsession = factory.openSession();
		
		//2.작업
		vo = sqlsession.selectOne("acom.acom_list_one", acom_idx);
		

		
		//3.닫기
		sqlsession.close();



		return vo;
		

	}//end: selectOne
	
	
	
	
	//검색용 selectList
	public List<AcomVo> selectListMap(Map<String, String> map) {
		
		List<AcomVo> list = new ArrayList<AcomVo>();
		
		

		//1.sqlsession 얻어오기
		SqlSession sqlsession = factory.openSession();
		
		//2.작업												param 전달
		list = sqlsession.selectList("acom.acom_map_list", map);
		
		//3.닫기
		sqlsession.close();



		return list;
	
	}//end: mapList
	
	
	//검색용 selectList
	public int InsertAcomMap(Map<String, Object> map) {
		
		int res = 0;
		
		//1.sqlsession 얻어오기
		SqlSession sqlsession = factory.openSession();
		
		//2.작업												param 전달
		res = sqlsession.insert("acom.acom_insert_map", map);
		
		//3.commit
		sqlsession.commit();
		
		//4.닫기
		sqlsession.close();



		return res;
	
	}//end: mapList
	
	//검색용 selectList
		public int InsertRoomMap(Map<String, Object> map) {
			
			int res = 0;
			
			//1.sqlsession 얻어오기
			SqlSession sqlsession = factory.openSession();
			
			//2.작업												param 전달
			res = sqlsession.insert("acom.acom_room_map", map);
			
			//3.commit
			sqlsession.commit();
			
			//4.닫기
			sqlsession.close();



			return res;
		
		}//end: mapList
	
	
	//검색용 selectList
	public List<Conn_AcomVo> selectListContentId(Map<String, String> map) {
		
		List<Conn_AcomVo> list = new ArrayList<Conn_AcomVo>();

		//1.sqlsession 얻어오기
		SqlSession sqlsession = factory.openSession();
		
		//2.작업												param 전달
		list = sqlsession.selectList("acom.acom_contentid", map);
		
		//3.닫기
		sqlsession.close();



		return list;
	
	}//end: mapList
	
	
	//최저가순 숙소 리스트 조회
	public List<AcomRoomVo> selectListPrice() {
		// TODO Auto-generated method stub
		
		List<AcomRoomVo> list = null;
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		list = sqlsession.selectList("acom.acom_price_list");
		
		
		//닫기
		sqlsession.close();
		
		
		return list;
	}
	
	
}//end: AcomDao