package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import service.CommandProcess;

public class WY_ProductDao{
	
	private static WY_ProductDao instance;
	private WY_ProductDao() {}
	public static WY_ProductDao getInstance() {
		if(instance==null) {
			instance = new WY_ProductDao();
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
	public Product getProductById(int prd_id) throws SQLException {
		String sql = "select prd_id, prd_name, prd_thumbnail,prd_url from product where prd_id = ?";
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
				product.setPrd_id(rs.getInt("prd_id"));
				product.setPrd_name(rs.getString("prd_name"));
				product.setPrd_thumbnail(rs.getString("prd_thumbnail"));
				product.setPrd_url(rs.getString("prd_url"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		} finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
		return product;
	}
}