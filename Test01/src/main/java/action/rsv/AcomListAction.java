package action.rsv;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AcomDao;
import dao.RsvDao;
import vo.AcomVo;




/**
 * Servlet implementation class AcomListAction
 */

@WebServlet("/rsv/list.do")
public class AcomListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// param 받기
		String search = request.getParameter("search");
        String pageParam = request.getParameter("page");
        int page = (pageParam != null && !pageParam.trim().isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = 5;
        int offset = (page - 1) * pageSize;

		if (search == null)
			search = ""; // search가 null로 입력되면 전체 검색으로 초기화시키기

		String search_text = request.getParameter("search_text");

		// 검색조건 담을 객체(map) 선언
		Map<String, String> map = new HashMap<String, String>();
        map.put("limit", String.valueOf(pageSize));
        map.put("offset", String.valueOf(offset));

		// 숙소 이름/주소로 검색하기
		if (search_text != null && !search_text.isEmpty()) { // null이거나 비어있지 않는 경우
			map.put("acom_name", search_text);// 이름검색
			map.put("acom_addr", search_text);// 주소검색

				}
		int update = 0;
		
		
		//DB에 요청
		update = RsvDao.getInstance().updateChk();
		
		//System.out.println("입력값:"+ update);
		//list 객체 가져오기
		//List<AcomVo> list = AcomDao.getInstance().selectList();
		List<AcomVo> list = AcomDao.getInstance().selectListMap(map);

		


		
		//binding
		request.setAttribute("list", list);

		request.setAttribute("page", page);

		
		
		//Dispatcher
		String forward_page = "rsv_board.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}
