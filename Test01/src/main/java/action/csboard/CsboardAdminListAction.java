package action.csboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CsboardDao;
import vo.CsboardVo;

/**
 * Servlet implementation class CsboardListAction
 */

@WebServlet("/csboard/list_all.do")
public class CsboardAdminListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//0.수신인코딩설정 (검색어에 한글이 들어오니까)
		request.setCharacterEncoding("utf-8");
		//목록 가져오기        Dao도 selectListAdmin에게인 마이바티스에게 시킴 SqlSession
		//아래는 전체검색임
		//얘를 foreach문 jstl 으로 뿌려야함.
		
		List<CsboardVo> list = CsboardDao.getInstance().selectListAdmin();
		
		
		
		//request binding
		request.setAttribute("list", list);
		
		//Dispatcher
		String forward_page = "list_all.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	
		
	}

}

