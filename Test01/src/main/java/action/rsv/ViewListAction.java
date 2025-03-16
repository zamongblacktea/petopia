package action.rsv;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AcomDao;
import dao.RoomDao;
import vo.AcomVo;
import vo.RoomVo;
import vo.RsvRoomVo;

/**
 * Servlet implementation class ViewListAction
 */

@WebServlet("/rsv/viewlist.do")
public class ViewListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int acom_idx = Integer.parseInt(request.getParameter("acom_idx"));
		int room_idx = Integer.parseInt(request.getParameter("room_idx"));
		
		
		AcomVo acom = AcomDao.getInstance().selectOne(acom_idx);
		List<RoomVo> img = RoomDao.getInstance().selectImgList(acom_idx);
		List<RsvRoomVo> room_list = RoomDao.getInstance().selectList(acom_idx);  
		List<AcomVo> list = AcomDao.getInstance().selectList();
		//RsvRoomVo price = RoomDao.getInstance().selectPriceOne(room_idx);
		
		//바인딩
		request.setAttribute("acom", acom);
		request.setAttribute("room_list", room_list);
		request.setAttribute("list", list);
		request.setAttribute("img", img);

		
		//Dispatcher
		String forward_page = "rsv_viewer.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}