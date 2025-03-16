package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	  
	DataSource ds;
	//singleton : 1개의 객체로 서비스하자

	static DBService single = null;

	public static DBService getInstance() {
		if (single == null)
			single = new DBService();

		return single;

	}

	//현재 이 객체는 DBService.getIntstance()를 통해서만 객체를 참조해라
	//new DBService() ->이렇게 만드는것 금지
	private DBService() {
		// TODO Auto-generated constructor stub
		
		//JNDI(Java Naming Directory(탐색) Interface)
		
		//JNDI처리하는 객체
		try {
			InitialContext ic = new InitialContext();
			//자원이 있는 Context위치 탐색
			Context context = (Context) ic.lookup("java:comp/env");
			//Context내의 Resource탐색
			ds = (DataSource) context.lookup("jdbc/oracle_admin");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//end:DBService()
	
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
}