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
import vo.Conn_AcomVo;

/**
 * Servlet implementation class DbConnectAction
 */

@WebServlet("/rsv/connect2.do")
public class DbConnectAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Conn_AcomVo> list2 = new ArrayList<Conn_AcomVo>();
		Map<String, String> map2 = new HashMap<String, String>();
		list2 = AcomDao.getInstance().selectListContentId(map2);
		
		for (int i = 0; i < list2.size(); i++) {
			System.out.println("입력값:" + list2.get(i).getContentid());
			String strid	 = Integer.toString(list2.get(i).getContentid());
			String contentid = URLEncoder.encode(strid , StandardCharsets.UTF_8.toString());
			String contentTypeId = URLEncoder.encode("32", StandardCharsets.UTF_8.toString());
			String key = URLEncoder.encode(
					"4BRrmDNAA70CAM3HoKpMwhdDJWzHAyG6rzb7HTSc+o/b1R22UsbTzsWuNfw/lX/FSj3Q7pBNV/vS87/oEr6ITg==",
					StandardCharsets.UTF_8.toString());

			// String IMP_KEY = "6343605177606552"; // API 키
			// String IMP_SECRET =
			// "252MbgAI2dPpGMtlaTJABHBHytbloi6qatJymz3wwrK8CXHc4KNLtOeC3lFRwDpty5yEdt5j0uJteGCa";
			// // 포트원 REST API Secret

			URL url = new URL("https://apis.data.go.kr/B551011/KorPetTourService/detailInfo?serviceKey=" + key
					+ "&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=" + contentid + "&contentTypeId="
					+ contentTypeId);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "text/html");
			// conn.setDoOutput(true);

//	        JSONObject requestJson = new JSONObject();
//	        requestJson.put("imp_key", IMP_KEY);
//	        requestJson.put("imp_secret", IMP_SECRET);
//	        
//	        System.out.println("결과:"+ requestJson);
//	        

//	        try (OutputStream os = conn.getOutputStream()) {
//	            os.write(requestJson.toString().getBytes());
//	        }catch (Exception e) {
//				// TODO: handle exception
//	        	System.out.println("테스트");
//	        	e.printStackTrace();
//			}
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
			if (conn.getResponseCode() == 200) { //연결하기
				
				String conn_Trim = readResponse(conn).trim();//공백제거
				
				
				if(new JSONObject(conn_Trim).getJSONObject("response").getJSONObject("body").getInt("numOfRows") > 0 ) {
					//nunOfRows => 데이터가 없으면 쳐내는 if문 로직
					
					// return new
					// JSONObject(readResponse(conn)).getJSONObject("response").getString("access_token");
					System.out.println("1");
					// array.put(new
					// JSONObject(readResponse(conn)).getJSONObject("response").getJSONObject("body").getJSONObject("items").get("item"));
					//JSON 구조대로 가져오기
					array = new JSONObject(conn_Trim).getJSONObject("response").
																getJSONObject("body").															
																		getJSONObject("items")
																				.getJSONArray("item");
					System.out.println(new JSONObject(conn_Trim).getJSONObject("response").getJSONObject("body").toString());
					System.out.println("2");

					System.out.println("결과2:"+ new JSONObject(conn_Trim).getJSONObject("response").getJSONObject("body"));
					
					System.out.println("정상" + conn_Trim);
					
					
					
				}

			} else {
				System.out.println("API 요청 실패. 응답 코드: " + conn.getResponseCode());
				// throw new Exception("토큰 발급 실패");
			}
			
			
			List<Map<String, Object>> list = new ArrayList<>();
			Map<String, Object> map1 = new HashMap<>();
			for (int k = 0; k < array.length(); k++) {
						
				map1.put("contentid", array.getJSONObject(k).get("contentid"));							//콘텐츠ID
				map1.put("contenttypeid", array.getJSONObject(k).get("contenttypeid"));					//콘텐츠타입ID
				map1.put("roomtitle", array.getJSONObject(k).get("roomtitle"));							//객실명칭
				map1.put("roompeakseasonminfee1", array.getJSONObject(k).get("roompeakseasonminfee1"));	//성수기주중최소
				map1.put("roomintro", array.getJSONObject(k).get("roomintro"));							//객실소개
				map1.put("roomcount", array.getJSONObject(k).get("roomcount"));							//객실 수
				map1.put("roombathfacility", array.getJSONObject(k).get("roombathfacility"));			//목욕시설 여부
				map1.put("roombath", array.getJSONObject(k).get("roombath"));							//욕조 여부
				map1.put("roomhometheater", array.getJSONObject(k).get("roomhometheater"));				//홈시어터 여부
				map1.put("roomaircondition", array.getJSONObject(k).get("roomaircondition"));			//에어컨 여부
				map1.put("roomtv", array.getJSONObject(k).get("roomtv"));								//TV 여부
				map1.put("roompc", array.getJSONObject(k).get("roompc"));								//PC 여부
				map1.put("roomcable", array.getJSONObject(k).get("roomcable"));							//케이블설치 여부
				map1.put("roominternet", array.getJSONObject(k).get("roominternet"));					//인터넷 여부
				map1.put("roomrefrigerator", array.getJSONObject(k).get("roomrefrigerator"));			//냉장고 여부
				map1.put("roomtoiletries", array.getJSONObject(k).get("roomtoiletries"));				//세면도구 여부
				map1.put("roomsofa", array.getJSONObject(k).get("roomsofa"));							//소파 여부
				map1.put("roomcook", array.getJSONObject(k).get("roomcook"));							//취사용품 여부
				map1.put("roomtable", array.getJSONObject(k).get("roomtable"));							//테이블 여부
				map1.put("roomhairdryer", array.getJSONObject(k).get("roomhairdryer"));					//드라이기 여부
				map1.put("roomimg1", array.getJSONObject(k).get("roomimg1"));							//객실사진1
				map1.put("roomimg1alt", array.getJSONObject(k).get("roomimg1alt"));						//객실사진1 설명
				map1.put("roomimg2", array.getJSONObject(k).get("roomimg2"));							//객실사진2
				map1.put("roomimg2alt", array.getJSONObject(k).get("roomimg2alt"));						//객실사진2 설명
				map1.put("roomimg3", array.getJSONObject(k).get("roomimg3"));							//객실사진3
				map1.put("roomimg3alt", array.getJSONObject(k).get("roomimg3alt"));						//객실사진3 설명
				map1.put("roomimg4", array.getJSONObject(k).get("roomimg4"));							//객실사진4
				map1.put("roomimg4alt", array.getJSONObject(k).get("roomimg4alt"));						//객실사진4 설명
				map1.put("roomimg5", array.getJSONObject(k).get("roomimg5"));							//객실사진5
				map1.put("roomimg5alt", array.getJSONObject(k).get("roomimg5alt"));						//객실사진5 설명


				System.out.println("결과:" + map1);

				AcomDao.getInstance().InsertRoomMap(map1);

			}

		}

		// Dispatcher
		String forward_page = "../member/main.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

	// HTTP 응답 읽기
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