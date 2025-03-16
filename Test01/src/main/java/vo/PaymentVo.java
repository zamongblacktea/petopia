package vo;

public class PaymentVo {
	
	
	int pay_idx;
	int mem_idx;
	int room_idx;
	int acom_idx;
	String pay_type;
	String pay_status;
	String pay_date;
	String imp_uid;
	String merchant_uid;
	int	   amount;
	
	
	
	
	
	public PaymentVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	/**
	 * @param mem_idx
	 * @param room_idx
	 * @param acom_idx
	 * @param pay_type
	 * @param pay_status
	 * @param imp_uid
	 * @param merchant_uid
	 * @param amount
	 */
	public PaymentVo(int mem_idx, int room_idx, int acom_idx, String pay_type, String pay_status, String imp_uid,
			String merchant_uid, int amount) {
		super();
		this.mem_idx = mem_idx;
		this.room_idx = room_idx;
		this.acom_idx = acom_idx;
		this.pay_type = pay_type;
		this.pay_status = pay_status;
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
		this.amount = amount;
	}






	public int getAmount() {
		return amount;
	}





	public void setAmount(int amount) {
		this.amount = amount;
	}






	
	
	public String getImp_uid() {
		return imp_uid;
	}





	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}





	public String getMerchant_uid() {
		return merchant_uid;
	}





	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}





	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
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
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	
	
	
	
	
	

}
