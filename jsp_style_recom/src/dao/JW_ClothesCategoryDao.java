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

public class JW_ClothesCategoryDao{
	private static JW_ClothesCategoryDao instance;
	private JW_ClothesCategoryDao() {}
	
	public static JW_ClothesCategoryDao getInstance() {
		if (instance == null) {
			instance = new JW_ClothesCategoryDao();
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
	public String clothesCategoryFind(String clothes_id) throws SQLException{
		
		Connection conn = null;
		String sql = "select cc_pic_url, cc_desc from clothes_category where cc_id= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClothesCategory clothescategory = new ClothesCategory();
		String pic_url = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  clothes_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pic_url = rs.getString(1);
				System.out.println(rs.getString(1));
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return pic_url;
	}
	public String clothesCategoryDescFind(String clothes_id) throws SQLException{
		
		Connection conn = null;
		String sql = "select cc_desc from clothes_category where cc_id= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClothesCategory clothescategory = new ClothesCategory();
		String acc_desc = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  clothes_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				acc_desc = rs.getString(1);
				System.out.println(rs.getString(1));
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return acc_desc;
	}
	

}
