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

@WebServlet("/csboard/list.do")
public class CsboardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//0.수신인코딩설정 (검색어에 한글이 들어오니까)
		request.setCharacterEncoding("utf-8");
		
		//아래코드 수정
		//List<VisitVo> list = VisitDao.getInstance().selectConditionList(map);
		
		//List<CsboardVo> list = null;
		//어디서 로그인을 했길래 null값이 넘어왔을까?
		
		//int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		
		/*
		 * int mem_idx = 0; //값이 안들어올수도있으니 기본값유지를 위한 예외처리해주기
		 * 
		 * try { mem_idx = Integer.parseInt(request.getParameter("mem_idx")); } catch
		 * (Exception e) { // TODO: handle exception }
		 */
		
		// 1.parpameter받기
		//String mem_id = request.getParameter("mem_id");
		
		// 2.mem_id 이용해서 회원정보 검색
		//MemberVo user = MemberDao.getInstance().selectOne(mem_id);
		
		
		String memIdxStr = request.getParameter("mem_idx");
		int mem_idx = 0; // 기본값 설정

		if (memIdxStr != null && !memIdxStr.isEmpty()) {
		    try {
		        mem_idx = Integer.parseInt(memIdxStr);
		    } catch (NumberFormatException e) {
		        System.out.println("mem_idx 값 변환 오류: " + e.getMessage());
		    }
		}
		//목록 가져오기        Dao도 selectList인 마이바티스에게 시킴 SqlSession
		//아래는 전체검색임
		//List<CsboardVo> list =CsboardDao.getInstance().selectOne(mem_idx);
		//얘를 foreach문 jstl 으로 뿌려야함.
		
		//CsboardVo list =CsboardDao.getInstance().selectList(mem_idx);
		
		List<CsboardVo> list = CsboardDao.getInstance().selectList(mem_idx);
		
		//List<CsboardVo> listall = CsboardDao.getInstance().selectListAdmin();
		//관리자용이랑 
		//로그인처럼 만들기
		
		/*
		 * System.out.println("list 값 확인: " + list); // 리스트가 비어있는지 확인
		 * request.setAttribute("list", list);
		 */
		
		/*
		 * if (user.getMem_grade().equals("관리자")) { // 세션안에 user를 넣겠다.
		 * 
		 * //request binding request.setAttribute("list", listall);
		 * 
		 * //return;
		 * 
		 * } else { // 세션안에 user를 넣겠다. session.setAttribute("user", user);
		 * request.setAttribute("list", list);
		 * 
		 * //return; }
		 * 
		 */
		
		//request binding
		request.setAttribute("list", list);
		
		//Dispatcher
		String forward_page = "list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	
		
	}

}

