package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JW_StyleInfoDao {
	private static JW_StyleInfoDao instance;
	private JW_StyleInfoDao() {}
	
	public static JW_StyleInfoDao getInstance() {
		if (instance == null) {
			instance = new JW_StyleInfoDao();
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
	
	//사용자가 클릭한 스타일의 id를 받아서 pic, desc, outer, top, bottom 정보를 불러옴
	public ArrayList<String> styleFind(int stl_id) throws SQLException{
		Connection conn = null;
		String sql = "select stl_pic_url, cc_id_outer, cc_id_top, cc_id_bottom, cc_id_acc from STYLE_INFO where stl_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> al = new ArrayList<String>();
		StyleInfo styleinfo = new StyleInfo();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  stl_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				al.add(rs.getString(1));
				al.add(rs.getString(2));
				al.add(rs.getString(3));
				al.add(rs.getString(4));
				al.add(rs.getString(5));
				System.out.println("JW_styleInfoDao");
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println(rs.getString(5));
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
