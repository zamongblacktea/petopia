package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.PaymentVo;
import vo.RsvVo;

public class PaymentDao {
	
	
	
	//single-ton : 객체1개만 생성 서비스
		static PaymentDao single = null;

		//SessionFactory생성하는 객체
		SqlSessionFactory factory;
		
		public PaymentDao() {
			super();
			// TODO Auto-generated constructor stub
			factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		}

		public static PaymentDao getInstance() {

			if (single == null)
				single = new PaymentDao();

			return single;
		}
		
	
	
	
		//결제 정보 update 메소드
		public int insert(PaymentVo vo) {
			// TODO Auto-generated method stub
			int res = 0;
			
			
			SqlSession sqlsession  = factory.openSession();
			
			//작업 수행
			res = sqlsession.insert("payment.insert_payment" , vo);
			
			
			//트랜잭션 커밋
			sqlsession.commit();
			
			
			//닫기
			sqlsession.close();
			
			
			
			
			return res;
		}

		public int selectMaxPayIdx() {
			// TODO Auto-generated method stub
			
			int pay_idx = 0;
			SqlSession sqlsession  = factory.openSession();
			
			//작업 수행
			pay_idx = sqlsession.selectOne("payment.select_max_pay_idx");
						
			
			//닫기
			sqlsession.close();
			
			return pay_idx;
		}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}//end: payment
