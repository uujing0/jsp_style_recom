package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JW_BookMarkDao {
	private static JW_BookMarkDao instance;
	private JW_BookMarkDao() {}
	public static JW_BookMarkDao getInstance() {
		if(instance == null) {
			instance = new JW_BookMarkDao();
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	
	public int insert(String mem_id, int stl_id) throws SQLException {
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into bookmark values(?,?,sysdate)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, stl_id);
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	
	
	public int delete(String mem_id, int stl_id) throws SQLException {
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from bookmark where mem_id=? and stl_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, stl_id);
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	public int check(String mem_id, int stl_id) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bookmark where mem_id = ? and stl_id =?";
		int status = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, stl_id);
			rs = pstmt.executeQuery();
			if(rs.next())
				status = 1;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return status;
	}

	public ArrayList<Integer> select(String mem_id) throws SQLException {
		Connection conn = null;
		String sql = "select * from bookmark where mem_id = ? order by bm_date";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> al = new ArrayList<Integer>();		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				al.add(rs.getInt("stl_id"));
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}		
		return al;
}
}
