package action.rsv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentAciton
 */

@WebServlet("/rsv/payment.do")
public class PaymentAciton extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int		res			= 0;
		
		int		mem_idx		= Integer.parseInt(request.getParameter("mem_idx"));
		int		room_idx	= Integer.parseInt(request.getParameter("room_idx"));
		int		acom_idx	= Integer.parseInt(request.getParameter("acom_idx"));
		int		room_cap	= Integer.parseInt(request.getParameter("room_cap"));
		String 	rsv_in 		= request.getParameter("rsv_in");
		String 	rsv_out 	= request.getParameter("rsv_out");
		String 	mem_name	= request.getParameter("mem_name");
		String 	mem_email	= request.getParameter("mem_email");
		String 	mem_phone	= request.getParameter("mem_phone");
		String 	mem_addr 	= request.getParameter("mem_addr ");
		int 	rsv_pet		= Integer.parseInt(request.getParameter("rsv_pet"));
		String 	rsv_petinfo	= request.getParameter("rsv_petinfo");
		int 	rsv_price	= Integer.parseInt(request.getParameter("rsv_price"));
		String 	rsv_status	= request.getParameter("rsv_status");
		
		
		//RsvVo vo = new RsvVo(room_idx, acom_idx, mem_idx, rsv_in, rsv_out, room_cap, rsv_pet, rsv_petinfo, rsv_status, rsv_price);
				
		//res = RsvDao.getInstance().insert(vo);
		
		
		
		response.sendRedirect("/member/main.do");
	}

}