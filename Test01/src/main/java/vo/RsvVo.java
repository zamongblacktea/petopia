package vo;

import java.util.List;

public class RsvVo {
	
	int rsv_idx;	
	int room_idx;
	int acom_idx;
	int mem_idx;
	String rsv_in;
	String rsv_out;
	int rsv_pet	;
	String rsv_status;
	int rsv_price;
	String rsv_date;
	String rsv_petinfo	;
	int	   	pay_idx;
	int		rsv_chk;
	
	List<RsvVo> rsv_list;
	
	
	public List<RsvVo> getRsv_list() {
		return rsv_list;
	}








	public void setRsv_list(List<RsvVo> rsv_list) {
		this.rsv_list = rsv_list;
	}








	public RsvVo() {
		// TODO Auto-generated constructor stub
	}

	
	





	public int getRsv_chk() {
		return rsv_chk;
	}








	public void setRsv_chk(int rsv_chk) {
		this.rsv_chk = rsv_chk;
	}








	public int getPay_idx() {
		return pay_idx;
	}






	/**
	 * @param room_idx
	 * @param acom_idx
	 * @param mem_idx
	 * @param rsv_in
	 * @param rsv_out
	 * @param rsv_pet
	 * @param rsv_status
	 * @param rsv_price
	 * @param rsv_petinfo
	 * @param pay_idx
	 */
	public RsvVo(int room_idx, int acom_idx, int mem_idx, String rsv_in, String rsv_out, int rsv_pet, String rsv_status,
			int rsv_price, String rsv_petinfo, int pay_idx) {
		super();
		this.room_idx = room_idx;
		this.acom_idx = acom_idx;
		this.mem_idx = mem_idx;
		this.rsv_in = rsv_in;
		this.rsv_out = rsv_out;
		this.rsv_pet = rsv_pet;
		this.rsv_status = rsv_status;
		this.rsv_price = rsv_price;
		this.rsv_petinfo = rsv_petinfo;
		this.pay_idx = pay_idx;
	}








	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}




	public int getRsv_idx() {
		return rsv_idx;
	}




	public void setRsv_idx(int rsv_idx) {
		this.rsv_idx = rsv_idx;
	}




	public int getRoom_idx() {
		return room_idx;
	}




	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
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




	public String getRsv_in() {
		return rsv_in;
	}




	public void setRsv_in(String rsv_in) {
		this.rsv_in = rsv_in;
	}




	public String getRsv_out() {
		return rsv_out;
	}




	public void setRsv_out(String rsv_out) {
		this.rsv_out = rsv_out;
	}






	public int getRsv_pet() {
		return rsv_pet;
	}




	public void setRsv_pet(int rsv_pet) {
		this.rsv_pet = rsv_pet;
	}




	public String getRsv_petinfo() {
		return rsv_petinfo;
	}




	public void setRsv_petinfo(String rsv_petinfo) {
		this.rsv_petinfo = rsv_petinfo;
	}




	public String getRsv_status() {
		return rsv_status;
	}




	public void setRsv_status(String rsv_status) {
		this.rsv_status = rsv_status;
	}




	public int getRsv_price() {
		return rsv_price;
	}




	public void setRsv_price(int rsv_price) {
		this.rsv_price = rsv_price;
	}




	public String getRsv_date() {
		return rsv_date;
	}




	public void setRsv_date(String rsv_date) {
		this.rsv_date = rsv_date;
	}





	
	
	
	
	

}
