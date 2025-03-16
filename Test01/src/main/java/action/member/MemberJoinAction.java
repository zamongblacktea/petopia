package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class MemberInsertAction
 */

@WebServlet("/member/join.do")
public class MemberJoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// /member
		
		//0.수신인코딩
		
		request.setCharacterEncoding("utf-8");
		
		//1.parameter받기
		String mem_name = request.getParameter("mem_name");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_email = request.getParameter("mem_email");
		String mem_phone = request.getParameter("mem_phone");
		String mem_zipcode = request.getParameter("mem_zipcode");
	    String mem_addr = request.getParameter("mem_addr");
	    String mem_business = request.getParameter("mem_business");
		//String mem_grade = request.getParameter("mem_grade");

		
		//2.회원가입자의 IP구하기
		String mem_ip	= request.getRemoteAddr();
		
		//위의 7개를 묶어서 insert에게 보내주기
		//insert로 보내주고 난 후에는 목록보기(메인)으로 가야한다.
		
		//3.MemberVo포장 ->VO쪽가서 위의 7개쪽 포장해야함
	
		System.out.println(mem_zipcode);
		
		MemberVo vo = new MemberVo(mem_name, mem_id, mem_pwd, mem_email, mem_phone, mem_addr, mem_zipcode, mem_ip, mem_business);
		//MemberVo vo = new MemberVo( mem_name, mem_id, mem_pwd, mem_email, mem_phone, mem_zipcode, mem_addr, mem_ip);
				
		//4.DB insert ->처리된 행 수가 들어가게 되어있음
		//Dao에 insert 추가하기
		int res =MemberDao.getInstance().insert(vo);
		
		//5.목록보기 이동
		//응답을 하는데 /member/main.do로 다시 접속해라 
		response.sendRedirect("../main/main.do");
		
		
	}

}
