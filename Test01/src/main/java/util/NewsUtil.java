package util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;

import vo.NewsVo;

public class NewsUtil {

	public static List<NewsVo> search_local(String query, int display, int start, String sort){
		List<NewsVo> list = new ArrayList<NewsVo>();
		
		try {
			// 전달정보를 인코딩
			query = URLEncoder.encode(query, "utf-8");
			String str_url = String.format("https://openapi.naver.com/v1/search/news?query=%s&display=%d&start=%d&sort=%s",query,display,start,sort);
			
			//Kakao Local 검색 APIKEY
			String naver_clientId = MyOpenAPIKey.Naver.CLIENT_ID; // 애플리케이션 클라이언트 아이디
			String naver_clientSecret = MyOpenAPIKey.Naver.CLIENT_SECRET;	// 애플리케이션 클라이언트 시크릿
			
			URL url = new URL(str_url);
			
			// 요청시 헤더정보(APIKEY)를 넘길 수 있다
			HttpsURLConnection urlConn = (HttpsURLConnection) url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", naver_clientId);
			urlConn.setRequestProperty("X-Naver-Client-Secret", naver_clientSecret);
			urlConn.setRequestProperty("Content-Type", "application/json");
			urlConn.connect();
			
			//데이터 수신 객체
			InputStream is = urlConn.getInputStream();					//수신스트림 (byte 스트림)
			InputStreamReader isr = new InputStreamReader(is,"utf-8");  // 문자스트림
			BufferedReader br = new BufferedReader(isr);				// line 단위로 수신
			
			StringBuffer sb = new StringBuffer();
			
			while(true) {
				String data = br.readLine();
				// 수신 데이터가 없으면  while문 종료
				if(data==null) break;
				
				//수신데이터가 있으면 누적해라
				sb.append(data);
			}//end: while
			
			// 역순으로 닫기
			br.close();
			isr.close();
			is.close();
			
			// JSON PARSING(데이터 분석)
			JSONObject json = new JSONObject(sb.toString().trim());
			
			JSONArray localArray = json.getJSONArray("items");
			
			for(int i=0; i<localArray.length();i++) {
				JSONObject local = localArray.getJSONObject(i);
				

                String title = local.optString("title", "제목 없음");
                String link = local.optString("link","링크 없음");
                String content = local.optString("description", "내용 없음");
                String date = local.optString("pubDate", "날짜 없음");
				
				//NewsVo 포장
				NewsVo vo =  new NewsVo(title, link, content, date);
				
				list.add(vo);
				
				
			}

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}

		return list;
	}
	
	
}

