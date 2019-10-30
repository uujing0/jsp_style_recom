package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDao {
	private static MemberDao instance;
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
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
	public Member SrhId(String mem_phone, String mem_name) throws SQLException {
		Member member = new Member();	Connection conn = null;
		String sql  = "select * from style_mem where mem_phone"; 
		PreparedStatement pstmt = null; ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_phone);
			pstmt.setString(2, mem_name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setMem_id(rs.getString(1));
				member.setMem_pw(rs.getString(2));
				member.setMem_name(rs.getString(3));
				member.setMem_email(rs.getString(4));
				member.setMem_phone(rs.getString(5));
			} 
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return member;
	}
	public Member SrhPw(String Mem_id) throws SQLException {
		Member member = new Member();	Connection conn = null;
		String sql  = "select * from style_mem where mem_id=?"; 
		PreparedStatement pstmt = null; ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setMem_id(rs.getString(1));
				member.setMem_pw(rs.getString(2));
				member.setMem_name(rs.getString(3));
				member.setMem_email(rs.getString(4));
				member.setMem_phone(rs.getString(5));
			} 
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return member;
	}

}