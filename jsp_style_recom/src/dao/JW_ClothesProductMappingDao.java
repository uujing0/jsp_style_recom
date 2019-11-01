package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JW_ClothesProductMappingDao {
	private static JW_ClothesProductMappingDao instance;
	private JW_ClothesProductMappingDao() {}
	
	public static JW_ClothesProductMappingDao getInstance() {
		if (instance == null) {
			instance = new JW_ClothesProductMappingDao();
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
	
	public ArrayList<String> styleIdFind(String cc_id) throws SQLException{
		Connection conn = null;
		String sql = "select prd_id from clothes_product_mapping where cc_id=?	";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String product_id = null;
		ArrayList<String> p_cc1 = new ArrayList<String>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  cc_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				p_cc1.add(rs.getString(1));
				//product_id = rs.getString(1);
				System.out.println(rs.getString(1));
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {  
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return p_cc1;
	}
	

}
