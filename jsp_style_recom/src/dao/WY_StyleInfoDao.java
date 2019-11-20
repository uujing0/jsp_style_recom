package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class WY_StyleInfoDao {private static WY_StyleInfoDao instance;
private WY_StyleInfoDao() {}

public static WY_StyleInfoDao getInstance() {
	if (instance == null) {
		instance = new WY_StyleInfoDao();
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
	public String styleFind(int stl_id) throws SQLException{
		Connection conn = null;
		String sql = "select stl_pic_url from STYLE_INFO where stl_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String msi = null;
		StyleInfo styleinfo = new StyleInfo();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  stl_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {			
				msi = rs.getString(1);

			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return msi;
	}
	
	

}
