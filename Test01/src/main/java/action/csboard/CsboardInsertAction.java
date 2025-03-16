package action.csboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CsboardDao;
import vo.CsboardVo;


/**
 * Servlet implementation class CsboardInsertAction
 */

@WebServlet("/csboard/insert.do")
public class CsboardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		// /visit/insert.do?cs_title=홍길동&cs_content=내용&cs_type=이용문의&mem_idx=3
	
		//0.수신인코딩 설정
		request.setCharacterEncoding("utf-8");
	
		//1.parameter받기
		String cs_title = request.getParameter("cs_title");
		
		//						\n -> <br>변경
		String cs_content = request.getParameter("cs_content").replaceAll("\n", "<br>");
		String cs_type =request.getParameter("cs_type");
		
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		String mem_name = request.getParameter("mem_name");
		//3.CsboardVo 포장 : 정보를 묶어서 한번에 넘기려면 안전하기도하고 넘길때 수월
		CsboardVo vo =new CsboardVo(cs_title, cs_content, cs_type,mem_idx,mem_name);
		
		//4.DB insert
		int res = CsboardDao.getInstance().insert(vo);
		
		//5.목록보기
		response.sendRedirect("../main/main_success.do");
	
		
	}

}

