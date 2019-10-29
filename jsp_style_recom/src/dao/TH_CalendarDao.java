package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TH_CalendarDao {
	private static TH_CalendarDao instance;
	private TH_CalendarDao() {}
	public static TH_CalendarDao getInstance() {
		if (instance == null) {	instance = new TH_CalendarDao();		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
}
