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
	
	public int confirmUser(String id, String pw) throws SQLException {
		System.out.println("---------- UJ_MemberDao - confirmUser ----------");
		int result = 0;
		Connection conn = null;
		String sql = "SELECT mem_id FROM member WHERE mem_id = ? and mem_pw = ? and mem_status = 1";
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
	
	public Member getMemberDate(String id) throws SQLException {
		System.out.println("---------- UJ_MemberDao - confirmUser ----------");
	
		Connection conn = null;
		String sql = "SELECT * FROM member WHERE mem_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member mem = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mem = new Member();
				
				mem.setMem_id(rs.getString("mem_id"));
				mem.setMem_pw(rs.getString("mem_pw"));
				mem.setMem_name(rs.getString("mem_name"));
				mem.setMem_phone(rs.getString("mem_phone"));
				mem.setMem_email(rs.getString("mem_email"));
				mem.setMem_body_type(rs.getInt("mem_body_type"));
				mem.setMem_addr(rs.getString("mem_addr"));
				mem.setMem_gender(rs.getInt("mem_gender"));
				mem.setMem_join_date(rs.getDate("mem_join_date"));
				mem.setMem_status(rs.getInt("mem_status"));
				mem.setMem_fav_loc(rs.getString("mem_fav_loc"));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return mem;
	}

}



