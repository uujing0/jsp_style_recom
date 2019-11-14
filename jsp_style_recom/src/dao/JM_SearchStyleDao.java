package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JM_SearchStyleDao {
	private static JM_SearchStyleDao instance;
	private JM_SearchStyleDao() {}
	
	public static JM_SearchStyleDao getInstance() {
		if (instance == null) {
			instance = new JM_SearchStyleDao();
		}
		return instance;
	}
	
	private static Connection getConnection() {
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
	
	public String searchStyleTag(String search_word) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;
		
		String[] search_word_list = search_word.split(" ");
		
		String tc_search_sql = "SELECT tc_id FROM tag_category WHERE tc_name like ?";
		
		try {
			
			for(String str : search_word_list) {
				conn = getConnection();
				pstmt = conn.prepareStatement(tc_search_sql);
				pstmt.setString(1, "%"+str+"%");
				rs = pstmt.executeQuery();
			
				if(rs.next()) {
					System.out.println("Tag 검색 결과 : "+rs.getString(1));
					
					result = rs.getString(1);
				}
				//루프 돌기전 종료
				pstmt.close();
				rs.close();
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		
		return result;
	}

	public ArrayList<StyleInfo> searchStyle(String search_word) throws SQLException {
		
		ArrayList<StyleInfo> style_info_list = new ArrayList<StyleInfo>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String[] search_word_list = search_word.split(" ");
		
		//cc_id를 통한 style_info 검색 sql
		String cc_search_sql = "SELECT * FROM style_info\r\n" + 
								  "WHERE cc_id_outer IN (SELECT cc_id FROM CLOTHES_CATEGORY WHERE cc_name LIKE ?)\r\n" + 
								  "OR cc_id_top IN (SELECT cc_id FROM CLOTHES_CATEGORY WHERE cc_name LIKE ?)\r\n" + 
								  "OR cc_id_bottom IN (SELECT cc_id FROM CLOTHES_CATEGORY WHERE cc_name LIKE ?)\r\n" + 
								  "OR cc_id_acc IN (SELECT cc_id FROM CLOTHES_CATEGORY WHERE cc_name LIKE ?)";
		//tc_id를 통한 style_info 검색 sql
		String tc_search_sql = "SELECT * FROM style_info\r\n" + 
							   "WHERE stl_id IN(SELECT stl_id\r\n" + 
							   "                FROM style_tag_mapping\r\n" + 
							   "                WHERE TC_ID IN(\r\n" + 
							   "                    SELECT tc_id\r\n" + 
							   "                    FROM tag_category\r\n" + 
							   "                    WHERE tc_name like ?\r\n" + 
							   "))";
		
		try {
			//옷 종류로 검색
			for(String str : search_word_list) {
				conn = getConnection();
				pstmt = conn.prepareStatement(cc_search_sql);
				pstmt.setString(1, "%"+str+"%");
				pstmt.setString(2, "%"+str+"%");
				pstmt.setString(3, "%"+str+"%");
				pstmt.setString(4, "%"+str+"%");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					StyleInfo si = new StyleInfo();
					si.setStl_id(rs.getInt("stl_id"));
					si.setCc_id_outer(rs.getInt("cc_id_outer"));
					si.setCc_id_top(rs.getInt("cc_id_top"));
					si.setCc_id_bottom(rs.getInt("cc_id_bottom"));
					si.setCc_id_acc(rs.getInt("cc_id_acc"));
					si.setStl_pic_url(rs.getString("stl_pic_url"));
					si.setStl_desc(rs.getString("stl_desc"));
					si.setStl_gender(rs.getInt("stl_gender"));
					System.out.println("검색된 stl_id :"+si.getStl_id());
					style_info_list.add(si);
				}
				
				//옷을 태그로 검색
				pstmt.close();
				rs.close();
				pstmt = conn.prepareStatement(tc_search_sql);
				pstmt.setString(1, "%"+str+"%");
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					StyleInfo si = new StyleInfo();
					si.setStl_id(rs.getInt("stl_id"));
					si.setCc_id_outer(rs.getInt("cc_id_outer"));
					si.setCc_id_top(rs.getInt("cc_id_top"));
					si.setCc_id_bottom(rs.getInt("cc_id_bottom"));
					si.setCc_id_acc(rs.getInt("cc_id_acc"));
					si.setStl_pic_url(rs.getString("stl_pic_url"));
					si.setStl_desc(rs.getString("stl_desc"));
					si.setStl_gender(rs.getInt("stl_gender"));
					System.out.println("검색된 stl_id :"+si.getStl_id());
					style_info_list.add(si);
				}
				//루프 돌기전 종료
				pstmt.close();
				rs.close();
			}
			
		}catch (Exception e) {
			if(e.getMessage() == null) {
				System.out.println("cc_id select error");
			}else {
				System.out.println("error : " + e.getMessage());
			}
		}finally{
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		
		return style_info_list;
	}
}
