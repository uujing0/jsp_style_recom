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

public class JW_ProductDao{
	
	private static JW_ProductDao instance;
	private JW_ProductDao() {}
	public static JW_ProductDao getInstance() {
		if(instance==null) {
			instance = new JW_ProductDao();
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
	public String productFind(String product_id) throws SQLException {
		Connection conn = null;
		String sql ="select prd_thumbnail from product where prd_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String product_image = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
		    pstmt.setString(1, product_id);
			rs = pstmt.executeQuery();
			System.out.println(product_id);
		
			while(rs.next()) {
				product_image = rs.getString(1);
				System.out.println("productDao: "+ rs.getString(1));

			}
		}  catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return product_image;
	
	}
	

}
