package vo;

public class NewsVo {

	String title;
	String link;
	String content;
	String date;
	
	public NewsVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	public NewsVo(String title, String link, String content, String date) {
		super();
		this.title = title;
		this.link = link;
		this.content = content;
		this.date = date;
	}
	
	


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
