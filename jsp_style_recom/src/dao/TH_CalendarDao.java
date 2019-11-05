package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
	public Calendar select(String mem_id,int cal_id) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; ResultSet rs = null;
		
		String sql = "select * from calendar where mem_id=? and cal_id=?";
		Calendar cal = new Calendar();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, cal_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				cal.setCal_id(cal_id);
				cal.setMem_id(mem_id);
				cal.setTc_id(rs.getInt("tc_id"));
				cal.setCal_date(rs.getDate("cal_date"));
				cal.setCal_contents(rs.getString("cal_contents"));
				cal.setCal_title(rs.getString("cal_title"));
			}
		} catch(Exception e) {	System.out.println("dao error"+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return cal;
	}
	public int update(Calendar cal) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update calendar set mem_id=? , tc_id=? , cal_date=sysdate , cal_contents=? , cal_title=? where cal_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, cal.getMem_id());
			pstmt.setInt(2, cal.getTc_id());
			pstmt.setString(3, cal.getCal_contents());
			pstmt.setString(4, cal.getCal_title());
			pstmt.setInt(5, cal.getCal_id());
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println("update error->"+e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	public int insert(Calendar cal) throws SQLException {
		Connection conn = null;	PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="insert into calendar values(?,?,?,sysdate,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cal.getCal_id());
			pstmt.setString(2, cal.getMem_id());
			pstmt.setInt(3, cal.getTc_id());
			pstmt.setString(4, cal.getCal_contents());
			pstmt.setString(5, cal.getCal_title());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println("insert error->"+e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
}
