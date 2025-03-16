package action.member;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;
//회원정보를 수정하는 서블릿
/**
 * Servlet implementation class JoinModifyAciton
 */

@WebServlet("/mypage/member_modify.do")

public class MemberModifyAciton extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//0.수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// 1.pstmt parameter 설정
		int mem_idx =Integer.parseInt(request.getParameter("mem_idx")); 
		String mem_name = request.getParameter("mem_name");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_email = request.getParameter("mem_email");
		String mem_phone = request.getParameter("mem_phone");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_addr = request.getParameter("mem_addr");
		
		
		//2.VO (SungVo가서 idx가 포함된 생성자 하나를 더 만들어야함)
		//데이터를 전달할때는 하나의 단위로 묶어서 전달하는것이 유리 ->5개의 변수를 박싱 하려고 VO포장
		MemberVo vo =new MemberVo(mem_idx, mem_name, mem_id, mem_pwd, mem_email, mem_phone, mem_zipcode, mem_addr);
		//idx가 빠져있어서 마이페이지 수정이 안되었음. 안넣으면 0으로 들어가야함
		
		
		//3.DB update
		int res = MemberDao.getInstance().update(vo);
		
		
		// 6.로그인처리(세션공간에 user저장) requset를 통해서 세션이 이루어짐
		HttpSession session = request.getSession();
		
		//로그인한 유저정보를 세션에서 가져옴
        MemberVo user = (MemberVo) session.getAttribute("user");
		// 5.등급이 관리자이면 관리자 페이지로 이동 일반이면 일반페이지로 이동

		if (user.getMem_grade().equals("관리자")) { // 세션안에 user를 넣겠다.

			response.sendRedirect("../admin/main.do");

			//return;
			
		} else { // 세션안에 user를 넣겠다. session.setAttribute("user", user);
			
			//수정 한 내용을 읽어오는 코드
			user = MemberDao.getInstance().selectOne(mem_idx);
			//읽어온것을 다시 세션에 저장
			session.setAttribute("user", user);
			
			response.sendRedirect("../main/main_success.do");

			//return;
		}
		//4.메인화면(리스트)이동
		//response.sendRedirect("../main/main_success.do");
		//response.sendRedirect("main.do");
							//do 경로 넣을때 /로 시작하면x
		
		// 회원 정보를 세션에 저장
	
		

	}

}


