package controller;
 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import util.NewsUtil;
import vo.NewsVo;

@Controller
@RequestMapping("/news/")
public class NewsController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;

	
	
	// 뉴스 메인 버튼
	@RequestMapping("main_list.do")
	public String main_list() {
		return "news/main_news";
	}
	
	// 뉴스 폼 띄우기
	@RequestMapping("list_form.do")
	public String list_form(Model model, @RequestParam(value = "query", defaultValue = "반려동물") String query) {

		request.setAttribute("query", query);  // query 값을 JSP로 전달
		return "news/news_list_form";
	}
	
	// 뉴스 리스트 띄우기
	@RequestMapping("list.do")
	public String list(Model model,
			@RequestParam(value = "query", defaultValue = "반려동물") String query,
	        @RequestParam(value = "start", defaultValue = "1") int start,
	        @RequestParam(value = "display", defaultValue = "20") int display,
	        @RequestParam(value = "sort", defaultValue = "sim") String sort
			) {
		
		// 검색 정보를 이용해서 검색
		List<NewsVo> list = NewsUtil.search_local(query, display, start, sort);

		// 날짜 변환 적용
		for (NewsVo vo : list) {
			String formattedDate = formatDate(vo.getDate());
			vo.setDate(formattedDate);
		}

		// request binding
		model.addAttribute("list", list);
		return "news/news_list";
	}
	
	// 날짜 변환 메서드
    private String formatDate(String dateStr) {
        try {
            // API에서 반환하는 날짜 형식에 맞춰 수정
            SimpleDateFormat inputFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH);
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");

            Date date = inputFormat.parse(dateStr);
            return outputFormat.format(date);
        } catch (ParseException e) {
            return dateStr; // 변환 실패 시 원본 날짜 반환
        }
    }
    
    
}
