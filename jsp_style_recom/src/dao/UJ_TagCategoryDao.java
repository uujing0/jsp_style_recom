package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UJ_TagCategoryDao {
	private static UJ_TagCategoryDao instance;
	private UJ_TagCategoryDao() {}
	
	public static UJ_TagCategoryDao getInstance() {
		if (instance == null) {
			instance = new UJ_TagCategoryDao();
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
	
	public ArrayList<TagCategory> getCategoryListFromTagType(int tagType) throws SQLException {

		Connection conn = null;
		String sql = "SELECT * FROM tag_category WHERE tc_type = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TagCategory> tagCategories = new ArrayList<>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tagType);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TagCategory tc = new TagCategory();
				tc.setTc_id(rs.getInt("tc_id"));
				tc.setTc_type(rs.getInt("tc_type"));
				tc.setTc_name(rs.getString("tc_name"));
				tc.setTc_order(rs.getInt("tc_order"));
				
				tagCategories.add(tc);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return tagCategories;
	}
}
