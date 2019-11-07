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
	public String styleDesc(int stl_id) throws SQLException{
		Connection conn = null;
		String sql = "select stl_desc from STYLE_INFO where stl_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String std_desc = null;
		StyleInfo styleinfo = new StyleInfo();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  stl_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				std_desc = rs.getString(1);
				System.out.println(rs.getString(1));
			}
		} catch(Exception e) {
			System.out.println(e.getMessage()+"헐에러야?");
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return std_desc;
	}
	
	public int getStyleInfoCntFromTag(int tagId, int gender) throws SQLException {
		System.out.println("[JW_StyleInfoDao - getStyleInfoCntFromTag]");
		
		
		int total = 0;
		Connection conn = null;
		String sql = 	" SELECT count(*) FROM style_info " +
						" WHERE stl_id in ( SELECT stl_id FROM style_tag_mapping " +  
						"                   WHERE tc_id = ?) " +
						" AND stl_gender = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tagId);
			pstmt.setInt(2, gender);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				total = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}  finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return total;
	}
	
	// TAG에 따른 styleInfo list 받아오는 메소드
	public ArrayList<StyleInfo> getStyleInfosFromTag(int tagId, int gender, int startRow, int endRow) throws SQLException {
		System.out.println("[JW_StyleInfoDao - getStyleInfosFromTag]");
		
		
		Connection conn = null;
		String sql = 	
				"SELECT * " +
				"FROM ( " +
				"      SELECT rownum rn, a.* "  +
				"      FROM ( SELECT *  "  +
				"             FROM STYLE_INFO "  +
				"             WHERE stl_id in ( SELECT stl_id "  +
				"                               FROM style_tag_mapping "  +
				"                               WHERE tc_id = ?) " +
				"             AND stl_gender = ? "  +
				"            ) a) "  +
				"WHERE rn BETWEEN ? and ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StyleInfo> styleInfos = new ArrayList<>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tagId);
			pstmt.setInt(2, gender);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StyleInfo styleInfo = new StyleInfo();
				styleInfo.setStl_id(rs.getInt("stl_id"));
				styleInfo.setCc_id_outer(rs.getInt("cc_id_outer"));
				styleInfo.setCc_id_top(rs.getInt("cc_id_top"));
				styleInfo.setCc_id_bottom(rs.getInt("cc_id_bottom"));
				styleInfo.setCc_id_acc(rs.getInt("cc_id_acc"));
				styleInfo.setStl_pic_url(rs.getString("stl_pic_url"));
				styleInfo.setStl_desc(rs.getString("stl_desc"));
				styleInfo.setStl_gender(rs.getInt("stl_gender"));
				
				styleInfos.add(styleInfo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}  finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return styleInfos;
	}

}
