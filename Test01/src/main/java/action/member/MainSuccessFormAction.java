package action.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AcomDao;
import dao.MemberDao;
import vo.AcomRoomVo;
import vo.MemberVo;

/**
 * Servlet implementation class MainAction
 */

@WebServlet("/main/main_success.do")
public class MainSuccessFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1.전체회원목록가져오기
		List<MemberVo>list = MemberDao.getInstance().selectList();
		List<AcomRoomVo> price = AcomDao.getInstance().selectListPrice();
		
		//2.request binding
		//아래 코드는 공유 공간에 데이터를 저장해주는 역할을 한다 
		//공유공간에 저장을 해주면 jstl/El 즉 아래의 member_list.jsp 이 
		//공유공간에 저장해둔 데이터를 꺼내와서 작동할 수 있도록 해준다.
		request.setAttribute("list",list);
		request.setAttribute("price",price);


		//Dispatcher
		String forward_page = "main_success.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}
