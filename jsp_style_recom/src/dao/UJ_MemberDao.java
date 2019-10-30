package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public int confirm(String id, String pw) throws SQLException {
		System.out.println("---------- UJ_MemberDao - confirm ----------");
		int result = 0;
		Connection conn = null;
		String sql = "SELECT id FROM member WHERE mem_id = ? and mem_pw = ? and mem_status = 1";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			result = rs.next() ? 1 : 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
}
