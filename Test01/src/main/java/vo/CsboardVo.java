package vo;

public class CsboardVo {
	
	int cs_idx;			
	int mem_idx;
	String mem_name;
	String cs_title;	
	String cs_content;	
	String cs_type;
	
	
	
	
	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	//기본 생성자 만들기 
	public CsboardVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	//insert용 생성자 만들기
	public CsboardVo(String cs_title, String cs_content, String cs_type, int mem_idx,String mem_name) {
		super();
		this.cs_title = cs_title;
		this.cs_content = cs_content;
		this.cs_type = cs_type;
		this.mem_idx = mem_idx;
		this.mem_name = mem_name;
	}



	
	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	//getter setter만들기
	public int getCs_idx() {
		return cs_idx;
	}
	

	public void setCs_idx(int cs_idx) {
		this.cs_idx = cs_idx;
	}
	public String getCs_title() {
		return cs_title;
	}
	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	public String getCs_type() {
		return cs_type;
	}
	public void setCs_type(String cs_type) {
		this.cs_type = cs_type;
	}	

}

