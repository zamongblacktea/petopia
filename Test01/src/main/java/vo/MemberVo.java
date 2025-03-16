package vo;

public class MemberVo {
	
	int mem_idx;
	String mem_name;
	String mem_id;
	String mem_pwd;
	String mem_email;
	String mem_phone;
	String mem_zipcode;
	String mem_addr;
	String mem_ip;
	String mem_grade;
	String mem_business;
	
	//기본생성자만들기
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	//update를 위한 생성자 만들기 ip, grade, business제외
	public MemberVo(int mem_idx, String mem_name, String mem_id, String mem_pwd, String mem_email, String mem_phone,
			String mem_zipcode, String mem_addr) {
		super();
		this.mem_idx = mem_idx;
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_addr = mem_addr;
	}
	
	//모든 요소들어간 생성자
	public MemberVo(int mem_idx, String mem_name, String mem_id, String mem_pwd, String mem_email, String mem_phone,
			String mem_zipcode, String mem_addr, String mem_ip, String mem_grade, String mem_business) {
		super();
		this.mem_idx = mem_idx;
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_addr = mem_addr;
		this.mem_ip = mem_ip;
		this.mem_grade = mem_grade;
		this.mem_business = mem_business;
	}
	

		//idx빼고 grade뺀 생성자


	//idx제외한 business를제외한 생성자
	public MemberVo(String mem_name, String mem_id, String mem_pwd, String mem_email, String mem_phone, String mem_addr,
			String mem_zipcode, String mem_ip, String mem_grade) {
		super();
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_addr = mem_addr;
		this.mem_ip = mem_ip;
		this.mem_grade = mem_grade;
	}



	//getter setter만들기
	
	public int getMem_idx() {
		return mem_idx;
	}



	public String getMem_business() {
		return mem_business;
	}

	public void setMem_business(String mem_business) {
		this.mem_business = mem_business;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_ip() {
		return mem_ip;
	}
	public void setMem_ip(String mem_ip) {
		this.mem_ip = mem_ip;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}

	//getter setter null이 들어가 있었음 ->오류ㅠㅠ
	public String getMem_zipcode() {
		// TODO Auto-generated method stub
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

}


