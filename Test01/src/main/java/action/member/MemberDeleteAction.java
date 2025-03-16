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


/**
 * Servlet implementation class MemberDeleteAction
 */

@WebServlet("/mypage/delete.do")
public class MemberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// /member/delete.do?mem_idx=3
		
		//1.parmeter받기
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		
		//2.DB delete
		int res= MemberDao.getInstance().delete(mem_idx);
		
		//3.메인페이지으로 이동
		//response.sendRedirect("list.do");
		//response.sendRedirect("../main/main.do");
		//비회원용 메인페이지로 이동시키기
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
		
		
		
	}

}

