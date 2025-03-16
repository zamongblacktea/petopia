package util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class ConnectDb {
	
	public static void main(String[] args) {
		String url = "https://apis.data.go.kr/B551011/KorPetTourService/searchKeyword?serviceKey=4BRrmDNAA70CAM3HoKpMwhdDJWzHAyG6rzb7HTSc%2Bo%2Fb1R22UsbTzsWuNfw%2FlX%2FFSj3Q7pBNV%2FvS87%2FoEr6ITg%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=json&keyword=숙박";

		httpTestByMethod(url, "GET");
		
		httpTestByMethod(url, "POST");
		
		httpTestByMethod(url, "DELETE");
	}
	
	public static void httpTestByMethod(String url, String method) {
		
		HttpUtils htppUtils = new HttpUtils();
		String result = "";
		HttpURLConnection conn = htppUtils.getHttpURLConnection(url, method);;

		if("GET".equalsIgnoreCase(method)){
			
			// conn.setDoInput(true); //URL 연결에서 데이터를 읽을지에 대한 설정 ( defualt true )
			result = htppUtils.getHttpRespons(conn);
		}else if("POST".equalsIgnoreCase(method)) {
			
			conn.setDoOutput(false); //URL 연결시 데이터를 사용할지에 대한 설정 ( defualt false )
			try (DataOutputStream dataOutputStream = new DataOutputStream(conn.getOutputStream());){
				
				String str = "{\"user\" : \"kimchy\",    "
						+ "\"post_date\" : \"2009-11-15T14:12:12\",    "
						+ "\"message\" : \"trying out Elasticsearch\"}";
				
				dataOutputStream.writeBytes(str);
				dataOutputStream.flush();
				
				result = htppUtils.getHttpRespons(conn);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("DELETE".equalsIgnoreCase(method)) {			
			result = htppUtils.getHttpRespons(conn);
		}
		
		System.out.println("Method = " + method + "/ result = " + result);
	}
}


class HttpUtils {
	//conn 객체 생성 메소드
	public HttpURLConnection getHttpURLConnection(String strUrl, String method) {
		URL url;
		HttpURLConnection conn = null;
		try {
			url = new URL("https://apis.data.go.kr/B551011/KorPetTourService/searchKeyword?serviceKey=4BRrmDNAA70CAM3HoKpMwhdDJWzHAyG6rzb7HTSc%2Bo%2Fb1R22UsbTzsWuNfw%2FlX%2FFSj3Q7pBNV%2FvS87%2FoEr6ITg%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=json&keyword=숙박");
			
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET"); //Method 방식 설정. GET/POST/DELETE/PUT/HEAD/OPTIONS/TRACE
			conn.setConnectTimeout(5000); //연결제한 시간 설정. 5초 간 연결시도
			conn.setRequestProperty("Content-Type", "application/json");

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	public String getHttpRespons(HttpURLConnection conn) {
		StringBuilder sb = null;

		try {
			if(conn.getResponseCode() == 200) {
				//정상적으로 데이터를 받았을경우
				sb = readResopnseData(conn.getInputStream());
			}else{
				//정상적으로 데이터를 받지 못한 경우 
				System.out.println(conn.getResponseCode());
				System.out.println(conn.getResponseMessage());
				
				sb = readResopnseData(conn.getErrorStream());
				
				System.out.println("error : " + sb.toString());
				
				return null;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			conn.disconnect(); //연결 해제
		};
		
		if(sb == null) return null;
		
		return sb.toString();
	}
	
	public StringBuilder readResopnseData(InputStream in) {
		
		if(in == null ) return null;

		StringBuilder sb = new StringBuilder();

		String line = "";
		
		try (InputStreamReader ir = new InputStreamReader(in);
				BufferedReader br = new BufferedReader(ir)){
			while( (line = br.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sb;
	}
}