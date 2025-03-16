package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;


//회원정보를 불러오는 서블릿
/**
 * Servlet implementation class SungModifyFormAction
 */

@WebServlet("/mypage/member_modify_form.do")
public class MemberModifyFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		//0.수신인코딩 설정
				request.setCharacterEncoding("utf-8");
				
		//1.idx받기
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));


		
		
		//2.idx에 해당되는 VO객체 얻어오기(수정원본)
		 MemberVo vo =MemberDao.getInstance().selectOne(mem_idx); 
		 
		// System.out.println(vo.getIdx());
		
		//3.request binding
		request.setAttribute("vo", vo);
		//서블릿단과 jsp 연결하는 과정을 나타낸다.
		
		//Dispatcher
		String forward_page = "member_modify_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}