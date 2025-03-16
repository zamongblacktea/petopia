package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.RoomVo;
import vo.RsvRoomVo;

public class RoomDao {
	//single-ton : 객체1개만 생성 서비스
	static RoomDao single = null;

	//SessionFactory생성하는 객체
	SqlSessionFactory factory;
	
	public RoomDao() {
		super();
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public static RoomDao getInstance() {

		if (single == null)
			single = new RoomDao();

		return single;
	}
	
	//숙소 리스트 조회
	public List<RsvRoomVo> selectList(int acom_idx) {
		// TODO Auto-generated method stub
		
		List<RsvRoomVo> list = null;
		
		SqlSession sqlsession  = factory.openSession();
		
		//작업 수행
		list = sqlsession.selectList("room.room_list", acom_idx);
		
		
		//닫기
		sqlsession.close();
		
		
		return list;
	}//end: selectList
	
	
	//글 가져오기 메소드
	public RsvRoomVo selectOne(int acom_idx) {
		// TODO Auto-generated method stub
		
		RsvRoomVo vo = null;

		//1.sqlsession 얻어오기
		SqlSession sqlsession = factory.openSession();
		
		//2.작업
		vo = sqlsession.selectOne("room.room_list_one", acom_idx);
		

		
		//3.닫기
		sqlsession.close();



		return vo;
		

	}//end: selectOne
	
	
	
	
	//글 가져오기 메소드
	public List<RoomVo> selectImgList(int acom_idx) {
		// TODO Auto-generated method stub
		
		List<RoomVo> list = null;

		//1.sqlsession 얻어오기
		SqlSession sqlsession = factory.openSession();
		
		//2.작업
		list = sqlsession.selectList("room.room_img", acom_idx);
		

		
		//3.닫기
		sqlsession.close();



		return list;
		

	}//end: selectOne
	
	
	
	public RsvRoomVo selectPriceOne(int room_idx) {
		// TODO Auto-generated method stub
		
		RsvRoomVo vo = null;

		//1.sqlsession 얻어오기
		SqlSession sqlsession = factory.openSession();
		
		//2.작업
		vo = sqlsession.selectOne("room.room_list_one", room_idx);
		

		
		//3.닫기
		sqlsession.close();



		return vo;
		

	}//end: selectOne
	
}//end: RoomDao