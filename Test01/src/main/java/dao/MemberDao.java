package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.MemberVo;

public class MemberDao {

	//singleton : 1개의 객체로 서비스하자
	static MemberDao single = null;

	public static MemberDao getInstance() {

		if (single == null)
			single = new MemberDao();

		return single;
	}

	// MemberDao.getInstance()를 통해서만 객체를 참조해라:  
	// new MemberDao() 금지
	private MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
		
	//관리자 조회
	public List<MemberVo> selectList() {

		List<MemberVo> list = new ArrayList<MemberVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement(명령처리객체)
			pstmt = conn.prepareStatement(sql);

			//3.ResultSet얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {

				MemberVo vo = new MemberVo();
				//rs가 가리키는 행(레코드)값을 읽어와 VO포장
				vo.setMem_idx(rs.getInt("mem_idx"));
				vo.setMem_name(rs.getString("mem_name"));
				vo.setMem_id(rs.getString("mem_id"));
				vo.setMem_pwd(rs.getString("mem_pwd"));
				vo.setMem_email(rs.getString("mem_email"));
				vo.setMem_phone(rs.getString("mem_phone"));
				vo.setMem_zipcode(rs.getString("mem_zipcode"));
				vo.setMem_addr(rs.getString("mem_addr"));
				vo.setMem_ip(rs.getString("mem_ip"));
				vo.setMem_grade(rs.getString("mem_grade"));
				
				//ArrayList에 추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				//닫기(열린역순)
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
	
	//idx를 이용해서 1건데이터 읽어오기
	public MemberVo selectOne(int mem_idx) {

		MemberVo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//                                                1 <- pstmt parameter index 
		String sql = "select * from member where mem_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement(명령처리객체)
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setInt(1, mem_idx);

			//3.ResultSet얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {

				vo = new MemberVo();
				//rs가 가리키는 행(레코드)값을 읽어와 VO포장
				vo.setMem_idx(rs.getInt("mem_idx"));
				vo.setMem_name(rs.getString("mem_name"));
				vo.setMem_id(rs.getString("mem_id"));
				vo.setMem_pwd(rs.getString("mem_pwd"));
				vo.setMem_email(rs.getString("mem_email"));
				vo.setMem_phone(rs.getString("mem_phone"));
				vo.setMem_zipcode(rs.getString("mem_zipcode"));
				vo.setMem_addr(rs.getString("mem_addr"));
				vo.setMem_ip(rs.getString("mem_ip"));
				vo.setMem_grade(rs.getString("mem_grade"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				//닫기(열린역순)
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return vo;
	}
	//mem_id를 이용해서 1건의 데이터 얻어오기 ->로그인시 사용
	public MemberVo selectOne(String mem_id) {

		MemberVo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//                                                1 <- pstmt parameter index 
		String sql = "select * from member where mem_id=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement(명령처리객체)
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, mem_id);

			//3.ResultSet얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {

				vo = new MemberVo();
				//rs가 가리키는 행(레코드)값을 읽어와 VO포장
				vo.setMem_idx(rs.getInt("mem_idx"));
				vo.setMem_name(rs.getString("mem_name"));
				vo.setMem_id(rs.getString("mem_id"));
				vo.setMem_pwd(rs.getString("mem_pwd"));
				vo.setMem_email(rs.getString("mem_email"));
				vo.setMem_phone(rs.getString("mem_phone"));
				vo.setMem_zipcode(rs.getString("mem_zipcode"));
				vo.setMem_addr(rs.getString("mem_addr"));
				vo.setMem_ip(rs.getString("mem_ip"));
				vo.setMem_grade(rs.getString("mem_grade"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				//닫기(열린역순)
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return vo;
	}

	
	//추가 insert 템플릿사용
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		//                                                             1,2,3,4,5,6,7,8,9  sql문은?세미콜론 없는것 주의
		String sql = "insert into member values(seq_member_idx.nextVal,?,?,?,?,?,?,?,?,'일반',?)";

		try {

			//1.Connection 얻기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, vo.getMem_name());
			pstmt.setString(2, vo.getMem_id());
			pstmt.setString(3, vo.getMem_pwd());
			pstmt.setString(4, vo.getMem_email());
			pstmt.setString(5, vo.getMem_phone());
			pstmt.setString(6, vo.getMem_zipcode());
			pstmt.setString(7, vo.getMem_addr());
			pstmt.setString(8, vo.getMem_ip());
			pstmt.setString(9, vo.getMem_business());
			//pstmt.setString(9, vo.getMem_grade());
			
			
			//4.DB insert
			res = pstmt.executeUpdate(); // select 외의 모든 SQL문장 처리시 사용

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				//닫기(열린역순)
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}
	
	//회원정보수정 MemberModify를 위한 update
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		//            							 1       2
		String sql = "update member set mem_name=?,mem_id=?,mem_pwd=?,mem_email=?,mem_phone=?,mem_zipcode=?,mem_addr=? where mem_idx=?";
			//			  3            4		   5			6           7			8	
		
		try {

			//1.Connection 얻기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			//3.pstmt parameter 설정
			pstmt.setString(1, vo.getMem_name());
			pstmt.setString(2, vo.getMem_id());
			pstmt.setString(3, vo.getMem_pwd());
			pstmt.setString(4, vo.getMem_email());
			pstmt.setString(5, vo.getMem_phone());
			pstmt.setString(6, vo.getMem_zipcode());
			pstmt.setString(7, vo.getMem_addr());
		
			pstmt.setInt(8, vo.getMem_idx());
			//4.DB insert
			res = pstmt.executeUpdate(); // select 외의 모든 SQL문장 처리시 사용

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				//닫기(열린역순)
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}

	public int delete(int mem_idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		//                                             1  <- pstmt parameter index
		String sql = "delete from member where mem_idx=?";

		try {

			//1.Connection 얻기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setInt(1, mem_idx);

			//4.DB delete
			res = pstmt.executeUpdate(); // select 외의 모든 SQL문장 처리시 사용

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				//닫기(열린역순)
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}
}
	

