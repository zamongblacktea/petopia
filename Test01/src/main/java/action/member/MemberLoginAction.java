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
 * Servlet implementation class MemberLoginAction
 */

@WebServlet("/member/login.do")
public class MemberLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/// member/login.do?mem_id=hong&mem_pwd=1234

		// 0.수신인코딩
		request.setCharacterEncoding("utf-8");

		// 1.parpameter받기
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");

		// 2.mem_id 이용해서 회원정보 검색
		MemberVo user = MemberDao.getInstance().selectOne(mem_id);
		//System.out.println(user);

		// 3.아이디가 틀린경우 ->table DB에 값이 없으니까
		if (user == null) {
			// 아래코드는 : 접속한 유저에게 아이디가 틀렸다는 정보를 넘기면서 다시로그인하도록 하는 코드
			response.sendRedirect("login_form.do?reason=fail_id");
			// Redirect : jsp 페이지 돌아가는 방법 1) Redirect 2)forword
			// 아이디가 틀렸으니 유저에게 알려줘야함
			// response.sendRedirect("login_form.do ->로그인 다시해
			// ?reason=fali_id") ->이유는 id가 틀려서 로그인에 실패했기 때문이야.
			return;
		}

		// 4.비밀번호가 틀린경우
		if (user.getMem_pwd().equals(mem_pwd) == false) {
			// 아래코드는 : 접속한 유저에게 비밀번호가 틀렸다는 정보를 넘기면서 다시로그인하도록 하는 코드
			response.sendRedirect("login_form.do?reason=fail_pwd&mem_id=" + mem_id);
			return;
		}
		// 6.로그인처리(세션공간에 user저장) requset를 통해서 세션이 이루어짐
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		// 5.등급이 관리자이면 관리자 페이지로 이동 일반이면 일반페이지로 이동

		if (user.getMem_grade().equals("관리자")) { // 세션안에 user를 넣겠다.

			response.sendRedirect("../admin/main.do");

			//return;
			
		} else { // 세션안에 user를 넣겠다. session.setAttribute("user", user);
			response.sendRedirect("../main/main_success.do");

			//return;
		}

		// 6.로그인처리(세션공간에 user저장) requset를 통해서 세션이 이루어짐
		// HttpSession session = request.getSession();
		// session.setAttribute("user", user);

		// 7.메인화면으로 이동 주소 수정해야함
		// response.sendRedirect("main.do");

	}

}
