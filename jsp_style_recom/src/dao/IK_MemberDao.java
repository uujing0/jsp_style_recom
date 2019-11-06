package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class IK_MemberDao {
	private static IK_MemberDao instance;
	private IK_MemberDao() {}
	public static IK_MemberDao getInstance() {
		if (instance == null) {	instance = new IK_MemberDao();		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage());	}
		return conn;
	}
	
public int update(Member member) throws SQLException {
		int result = 0;  				Connection conn = null;
		String sql = "update member set mem_pw=?,mem_name=?,mem_phone=?,"+
			"mem_email=? ,mem_addr=?,mem_body_type=? ,mem_fav_loc=?, mem_gender=? where mem_id=?"; 
		PreparedStatement pstmt = null; 
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, member.getMem_pw());
			pstmt.setString(2, member.getMem_name());
			pstmt.setString(3, member.getMem_phone());
			pstmt.setString(4, member.getMem_email());
			pstmt.setString(5, member.getMem_addr());
			pstmt.setInt(6, member.getMem_body_type());
			pstmt.setString(7, member.getMem_fav_loc());
			pstmt.setInt(8, member.getMem_gender());
			pstmt.setString(9, member.getMem_id());
			result = pstmt.executeUpdate();
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
}
	
	
	
	