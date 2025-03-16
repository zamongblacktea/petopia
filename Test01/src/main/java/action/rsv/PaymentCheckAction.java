package action.rsv;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.PaymentDao;
import dao.RsvDao;
import util.PaymentUtil;
import vo.PaymentVo;
import vo.RsvVo;

@WebServlet("/rsv/verify.do")
public class PaymentCheckAction extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       

    	
    	
        //결제 정보 Prameter 가져오기
		int		mem_idx		= Integer.parseInt(request.getParameter("mem_idx"));
		int		room_idx	= Integer.parseInt(request.getParameter("room_idx"));
		int		acom_idx	= Integer.parseInt(request.getParameter("acom_idx"));
		String  imp_uid		= request.getParameter("imp_uid");						//api 정보
		String  merchant_uid		= request.getParameter("merchant_uid");			//api 정보
		int		room_cap	= Integer.parseInt(request.getParameter("room_cap"));	
		String 	rsv_in 		= request.getParameter("rsv_in");
		String 	rsv_out 	= request.getParameter("rsv_out");
		int 	rsv_pet		= Integer.parseInt(request.getParameter("rsv_pet"));
		String 	rsv_petinfo	= request.getParameter("rsv_petinfo");
		int 	rsv_price	= Integer.parseInt(request.getParameter("rsv_price"));
		
        String  pay_status  = "";
        String  rsv_status  = "";
        String  pay_type	= "";
        System.out.println("in" + rsv_in);
        System.out.println("out" + rsv_out);
		
        // 요청 바디(JSON)에서 imp_uid, merchant_uid 읽기
//        StringBuilder sb = new StringBuilder();
//        BufferedReader reader = request.getReader();
//        String line;
//        while ((line = reader.readLine()) != null) {
//            sb.append(line);
//        }
        
//        System.out.println("---------------------------------");
//        System.out.println(sb.toString());
//        System.out.println("---------------------------------");
//        
//        
//        JSONObject requestBody = new JSONObject(sb.toString());

//        String impUid = requestBody.getString("imp_uid");
//        String merchantUid = requestBody.getString("merchant_uid");

//        System.out.println("imp :" + imp_uid);
//        System.out.println("merchant :" + merchant_uid);
        
        try {
            // 1. 포트원 API 액세스 토큰 가져오기
            String accessToken = PaymentUtil.getAccessToken();

            // 2. 결제 정보 조회
            JSONObject payment = PaymentUtil.getPaymentData(imp_uid, accessToken);

            // 3. 결제 상태 확인
            String status = payment.getJSONObject("response").getString("status");
            if ("paid".equals(status)) {
            	
            	//결제 성공시 payment db 결제 정보 입력
            	PaymentVo vo = new PaymentVo(acom_idx, mem_idx, room_idx , pay_type, pay_status, imp_uid, merchant_uid, rsv_price);
            	pay_status 	= "결제완료";
            	pay_type	= "카드";
                vo.setAcom_idx(acom_idx);
                vo.setMem_idx(mem_idx);
                vo.setRoom_idx(room_idx);
                vo.setPay_type(pay_type);
                vo.setPay_status(pay_status);
                vo.setImp_uid(imp_uid);
                vo.setMerchant_uid(merchant_uid);
                vo.setAmount(rsv_price);
        		
                //확인용 sysout
                System.out.println("acom"+ acom_idx);
                System.out.println("mem"+ mem_idx );
                System.out.println("room"+ room_idx );
                System.out.println("type"+ pay_type );
                System.out.println("status"+ pay_status );
                System.out.println("imp"+ imp_uid );
                System.out.println("merchant"+ merchant_uid );
                System.out.println("price"+ rsv_price );
                //System.out.println(""+ );
                
              
                //db insert
            	PaymentDao.getInstance().insert(vo);
            	
            	// select max(pay_idx) from payment
            	int pay_idx = PaymentDao.getInstance().selectMaxPayIdx();
            	
               // 결제 성공시 reservation table에 DB정보 입력하기
                
                RsvVo vo2 = new RsvVo();
                rsv_status = "예약완료";
                vo2.setRoom_idx(room_idx);
                vo2.setAcom_idx(acom_idx);
                vo2.setMem_idx(mem_idx);
                vo2.setRsv_in(rsv_in);
                vo2.setRsv_out(rsv_out);
                vo2.setRsv_pet(rsv_pet);
                vo2.setRsv_petinfo(rsv_petinfo);
                vo2.setPay_idx(pay_idx);
                vo2.setRsv_status(rsv_status);
                vo2.setRsv_price(rsv_price);
                
            	//DB insert
            	RsvDao.getInstance().insert(vo2);
            	
            	

            	
            	
            	response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                 
                response.getWriter().write(new JSONObject().put("success", true).put("message", "결제 검증 완료").toString());
            } else {
                response.getWriter().write(new JSONObject().put("success", false).put("message", "결제 상태가 완료가 아닙니다.").toString());
            }
        } catch (Exception e) {
        	
        	e.printStackTrace();
        	
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(new JSONObject().put("success", false).put("message", "결제 검증 실패: " + e.getMessage()).toString());
        }

        
    }
	
	
	
}
