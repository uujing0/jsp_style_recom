package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class IK_MemberDao {
	private static IK_MemberDao instance;
	private IK_MemberDao() {	}
	public static IK_MemberDao getInstance() {
		if (instance == null) {	instance = new IK_MemberDao();	}
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
	
	public int confirm(String mem_id ) throws SQLException {
		int result  = 0;  	Connection conn = null;
		String sql  = "select mem_id , mem_status from member where mem_id=? "; 
		PreparedStatement pstmt = null; ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
		    
			if (rs.next()) {
				/*String dbid = rs.getString("mem_id");*/
				int dbstatus = rs.getInt("mem_status");
			   if(dbstatus==1 /*&& dbid.equals(mem_id)*/) result=1;
			else  result = 0;
			} else result = -1;
			
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	public int insert(Member member) throws SQLException {
		int result = 0;  				Connection conn = null;
		String sql = "insert into member values(?,?,?,?,?,?,?,?,sysdate,1,?)"; 
		PreparedStatement pstmt = null; 
		try { 
			conn  = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_pw());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_phone());
			pstmt.setString(5, member.getMem_email());
			pstmt.setInt(6, member.getMem_body_type());
			pstmt.setString(7, member.getMem_addr());
			pstmt.setInt(8, member.getMem_gender());
		    pstmt.setString(9, member.getMem_fav_loc());
			result = pstmt.executeUpdate();
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	/*
	public int delete(String mem_id, String mem_pw) throws SQLException {
		int result  = 0;  				Connection conn = null;
		result = check(mem_id, mem_pw);
		if (result != 1)  return result;
		String sql  = "delete from member where mem_id=?"; 
		PreparedStatement pstmt = null; 				
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			result = pstmt.executeUpdate();
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}*/
	
	public int check(String mem_id, String mem_pw) throws SQLException {
		int result  = 0;  				Connection conn = null;
		String sql  = "select mem_pw from member where  mem_id=?"; 
		PreparedStatement pstmt = null; ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(mem_pw)) result = 1;
				else result = 0;
			} else   result = -1;
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	/*public int updateMemberOpionalInfo(Member member) throws SQLException {
		int result = 0;  				Connection conn = null;
		String sql = "insert into favmem values(?,?)"; 	// TODP: update
		PreparedStatement pstmt = null; 
		try { 
			conn  = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_id());
		    pstmt.setString(2, member.getMem_fav_loc());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}*/
	
	public int delete(String mem_id , String mem_pw) throws SQLException {
		int result = 0;  				Connection conn = null;
		result = check(mem_id, mem_pw);
		if (result != 1)  return result;
		String sql = "update member set  mem_status=0 where mem_id=?"; 
		PreparedStatement pstmt = null; 
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, mem_id);
			
			result = pstmt.executeUpdate();
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}

	public int update(Member member) throws SQLException {
		int result = 0;  				Connection conn = null;
     	String sql = "update member set mem_pw=?,mem_phone=?,"+
				"mem_email=? ,mem_addr=?,mem_body_type=? ,mem_fav_loc=?, mem_gender=? where mem_id=? "; 
		
		PreparedStatement pstmt = null; 
	    
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, member.getMem_pw());
			/*pstmt.setString(2, member.getMem_name());*/
			pstmt.setString(2, member.getMem_phone());
			pstmt.setString(3, member.getMem_email());
			pstmt.setString(4, member.getMem_addr());
			pstmt.setInt(5, member.getMem_body_type());
			pstmt.setString(6, member.getMem_fav_loc());
			pstmt.setInt(7, member.getMem_gender());
			pstmt.setString(8, member.getMem_id());
			result = pstmt.executeUpdate();
		} catch(Exception e) { 
			System.out.println("update   error --->"+e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		System.out.println("update result-->"+result);
		return result;
	} 
	
}



