package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WY_ProductDao {
	private WY_ProductDao() {
		// TODO Auto-generated constructor stub
	}
	
	private static WY_ProductDao instance = new WY_ProductDao();
	
	public static WY_ProductDao getInstance() {
		return instance;
	}
	
	public Product getProductByCode(int prd_id) throws SQLException {
		String sql = "select * from Product where prd_id=?";
		Product product = null;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prd_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				product = new Product();
				product.getPrd_id();
				product.setPrd_name(rs.getString("prd_name"));
				product.setPrd_thumbnail(rs.getString("prd_thumbnail"));
			}
		}catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
		return product;
	}

	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
}	