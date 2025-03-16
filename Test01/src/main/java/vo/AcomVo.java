package vo;

import java.util.List;

public class AcomVo {
	
	
	int acom_idx;
	int mem_idx;
	String acom_name;
	String acom_desc;
	String acom_addr;
	String acom_zipcode;
	String acom_date;
	String acom_img;  
	String tel;
	int areacode; 
	int contentid;
	String mapx;
	String mapy;
	int room_price;
	
	//객실 정보 DB list 불러오기
	List<RoomVo> room_list;
	
	
	
	


	public List<RoomVo> getRoom_list() {
		return room_list;
	}

	public void setRoom_list(List<RoomVo> room_list) {
		this.room_list = room_list;
	}

	public AcomVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public String getMapx() {
		return mapx;
	}

	public void setMapx(String mapx) {
		this.mapx = mapx;
	}

	public String getMapy() {
		return mapy;
	}

	public void setMapy(String mapy) {
		this.mapy = mapy;
	}

	public int getAcom_idx() {
		return acom_idx;
	}

	public void setAcom_idx(int acom_idx) {
		this.acom_idx = acom_idx;
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getAcom_name() {
		return acom_name;
	}

	public void setAcom_name(String acom_name) {
		this.acom_name = acom_name;
	}

	public String getAcom_desc() {
		return acom_desc;
	}

	public void setAcom_desc(String acom_desc) {
		this.acom_desc = acom_desc;
	}

	public String getAcom_addr() {
		return acom_addr;
	}

	public void setAcom_addr(String acom_addr) {
		this.acom_addr = acom_addr;
	}

	public String getAcom_zipcode() {
		return acom_zipcode;
	}

	public void setAcom_zipcode(String acom_zipcode) {
		this.acom_zipcode = acom_zipcode;
	}

	public String getAcom_date() {
		return acom_date;
	}

	public void setAcom_date(String acom_date) {
		this.acom_date = acom_date;
	}




	public String getAcom_img() {
		return acom_img;
	}

	public void setAcom_img(String acom_img) {
		this.acom_img = acom_img;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}

	
	
	
	
	

}
