package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UJ_MemberDao {
	private static UJ_MemberDao instance;
	private UJ_MemberDao() {}
	
	public static UJ_MemberDao getInstance() {
		if (instance == null) {
			instance = new UJ_MemberDao();
		}
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
	
	public int test() {
		return 0;
	}
}
