package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class MemberCheckAction
 */

@WebServlet("/member/check_id.do")
public class MemberCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// /member/check_id.do?mem_id=hong
		
		//0.수신인코딩설정
		request.setCharacterEncoding("utf-8");
		
		//1.아이디 받기
		String mem_id = request.getParameter("mem_id");
		
		//2.mem_id에 해당되는 사용자정보 얻어오기
		MemberVo vo= MemberDao.getInstance().selectOne(mem_id);
		//만일 기존DB에 아이디가 없다면 null이 리턴된다.
		//신규회원입장에서 이미 사용중인 아이디를 입력하면 사용불가능
		
		//3.사용유무 판단
		//boolean bResult = (vo==null);
		//vo가 null이면 참이된다.
		
		//위의 코드 풀어서 쓰면
		boolean bResult = false;
		//현재 아이디에 대한 회원이 없으면 사용가능하다고 설정
		if(vo==null) bResult =true;
		
		
		//요청한 클라이언트가 json으로 알려달라고 함
		// {"result" : true} or {"result" : false}
		
		String result = String.format("{\"result\" : %b}", bResult);
		
		
		//4.응답처리
		//응답처리 : 요청자에게 응답하는 내용이 어떤 타입인지 알려줘야함
		//지금 넘어가는 데이터는 json이야 text/json; ->but 엄격한 곳에서는 아래와 같은코드 json으로 인식x
		//그래서 정확하게 써주려면 application/json;이라고 알려줘야함
		response.setContentType("application/json; charset=utf-8;");
		
		response.getWriter().print(result);
	}
}
