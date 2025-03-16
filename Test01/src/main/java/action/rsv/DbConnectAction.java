package action.rsv;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.AcomDao;

/**
 * Servlet implementation class DbConnectAction
 */


@WebServlet("/rsv/connect.do")
public class DbConnectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String keyword = URLEncoder.encode("민박", StandardCharsets.UTF_8.toString());
		//String contentid = URLEncoder.encode("게스트하우스", StandardCharsets.UTF_8.toString());
		String key = URLEncoder.encode("4BRrmDNAA70CAM3HoKpMwhdDJWzHAyG6rzb7HTSc+o/b1R22UsbTzsWuNfw/lX/FSj3Q7pBNV/vS87/oEr6ITg==", StandardCharsets.UTF_8.toString());
		System.out.println("입력값:"+keyword);
		
		//String IMP_KEY = "6343605177606552"; // API 키
	    //String IMP_SECRET = "252MbgAI2dPpGMtlaTJABHBHytbloi6qatJymz3wwrK8CXHc4KNLtOeC3lFRwDpty5yEdt5j0uJteGCa"; // 포트원 REST API Secret
		
		URL url = new URL("https://apis.data.go.kr/B551011/KorPetTourService/searchKeyword?serviceKey="+key+"&MobileOS=ETC&MobileApp=AppTest&_type=json&keyword="+ keyword);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-Type", "text/html");
        //conn.setDoOutput(true);
        
      
//        JSONObject requestJson = new JSONObject();
//        requestJson.put("imp_key", IMP_KEY);
//        requestJson.put("imp_secret", IMP_SECRET);
//        
//        System.out.println("결과:"+ requestJson);
//        
        
//        try (OutputStream os = conn.getOutputStream()) {
//            os.write(requestJson.toString().getBytes());
//        }catch (Exception e) {
//			// TODO: handle exception
//        	System.out.println("테스트");
//        	e.printStackTrace();
//		}
        JSONObject json = new JSONObject();
        JSONArray array = new JSONArray();
        if (conn.getResponseCode() == 200) {
           //return new JSONObject(readResponse(conn)).getJSONObject("response").getString("access_token");
        	System.out.println("1");
        	//array.put(new JSONObject(readResponse(conn)).getJSONObject("response").getJSONObject("body").getJSONObject("items").get("item"));
        	array = new JSONObject(readResponse(conn)).getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
        	
        	System.out.println("2");
        	
           //System.out.println("결과2:"+ new JSONObject(readResponse(conn)).getJSONObject("response").getJSONObject("body"));
        	System.out.println("정상"+readResponse(conn));
        } else {
        	System.out.println("API 요청 실패. 응답 코드: " + conn.getResponseCode());
            //throw new Exception("토큰 발급 실패");
        }
        List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map1 = new HashMap<>();
		for(int i = 0 ; i < array.length(); i++) {

			map1.put("addr1", array.getJSONObject(i).get("addr1"));
			map1.put("addr2", array.getJSONObject(i).get("addr2"));
			map1.put("areacode", array.getJSONObject(i).get("areacode"));
			map1.put("contentid", array.getJSONObject(i).get("contentid"));
			map1.put("title", array.getJSONObject(i).get("title"));
			map1.put("tel", array.getJSONObject(i).get("tel"));
			map1.put("firstimage", array.getJSONObject(i).get("firstimage"));
			map1.put("mapx", array.getJSONObject(i).get("mapx"));
			map1.put("mapy", array.getJSONObject(i).get("mapy"));


			System.out.println("결과:"+ map1 );
			
			
			AcomDao.getInstance().InsertAcomMap(map1);
			
		}
		
		
        

		//Dispatcher
		String forward_page = "../member/main.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}
	
	
    //HTTP 응답 읽기
    private static String readResponse(HttpURLConnection conn) throws IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = new BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        return sb.toString();
    }

}