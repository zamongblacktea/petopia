package action.rsv;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RsvDao;
import vo.RsvVo;

/**
 * Servlet implementation class RsvInfoAction
 */

@WebServlet("/rsv/info.do")
public class RsvInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		
		
		
		//select list 불러오기
		//List<RsvVo> rsv = RsvDao.getInstance().selectOne(mem_idx);
		List<RsvVo> list_one = RsvDao.getInstance().selectListOne(mem_idx);
		
		//바인딩
		request.setAttribute("list_one", list_one);
		//Dispatcher
		String forward_page = "rsv_info.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}
