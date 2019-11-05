package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	public int insert(BookMark bookmark) throws SQLException {
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into bookmark values(?,?);";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  bookmark.getStl_id());
			pstmt.setString(2,  bookmark.getMem_id());
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

}
