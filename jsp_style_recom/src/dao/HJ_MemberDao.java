package dao;

import java.sql.*;


import javax.sql.*;
import javax.naming.*;

public class HJ_MemberDao {
	private static HJ_MemberDao instance;
	private HJ_MemberDao() {}
	public static HJ_MemberDao getInstance() {
		if (instance == null) {	instance = new HJ_MemberDao();		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage());	}
		return conn;
	}

	public String SrhId(String mem_phone, String mem_email, String mem_name) throws SQLException {				
		Connection conn = null;			
		String mem_id = null;
		String sql  = "select mem_id from member where mem_phone=? and mem_name=? and mem_email=?"; 
		PreparedStatement pstmt = null; 	
		ResultSet rs = null;
		
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_phone);
			pstmt.setString(2, mem_name);
			pstmt.setString(3, mem_email);
			
			rs = pstmt.executeQuery();
			System.out.println("=====>");
			System.out.println("SrhId mem_phone=====>"+mem_phone);
			System.out.println("SrhId mem_name=====>"+mem_name);
			System.out.println("SrhId mem_email=====>"+mem_email);
			if(rs.next()) {
				System.out.println("SrhId end...");
				//mem_id=rs.getString(mem_id);
				mem_id=rs.getString(1);
			}
			
			System.out.println("=====2>" + mem_id );
			System.out.println("=====2>" + rs );
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return mem_id ;
	}

	public String SrhPw(String mem_id, String mem_name, String mem_email) throws SQLException {				
		Connection conn = null;			
		String mem_pw = null;
		String sql  = "select mem_pw from member where mem_id=? and mem_name=? and mem_email=?"; 
		PreparedStatement pstmt = null; 	
		ResultSet rs = null;
		
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_name);
			pstmt.setString(3, mem_email);
			
			rs = pstmt.executeQuery();
			System.out.println("=====>");
			System.out.println("SrhPw mem_id=====>"+mem_id);
			System.out.println("SrhPw mem_name=====>"+mem_name);
			System.out.println("SrhPw mem_email=====>"+mem_email);
			if(rs.next()) {
				System.out.println("SrhId end...");
				//mem_id=rs.getString(mem_id);
				mem_pw=rs.getString(1);
			}
			
			System.out.println("=====2>" + mem_pw );
			System.out.println("=====2>" + rs );
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return mem_pw ;
	}
	public String Update(String mem_id, String mem_name, String mem_email) throws SQLException {				
		Connection conn = null;			
		String mem_pw = null;
		String sql  = "update mem_pw from member where mem_id=? and mem_name=? and mem_email=?"; 
		PreparedStatement pstmt = null; 	
		ResultSet rs = null;
		
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_name);
			pstmt.setString(3, mem_email);
			
			rs = pstmt.executeQuery();
			System.out.println("=====>");
			System.out.println("SrhPw mem_id=====>"+mem_id);
			System.out.println("SrhPw mem_name=====>"+mem_name);
			System.out.println("SrhPw mem_email=====>"+mem_email);
			if(rs.next()) {
				System.out.println("SrhId end...");
				//mem_id=rs.getString(mem_id);
				mem_pw=rs.getString(1);
			}
			
			System.out.println("=====2>" + mem_pw );
			System.out.println("=====2>" + rs );
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return mem_pw ;
	}
}