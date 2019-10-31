package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

	public ArrayList<StyleInfo> searchStyle(String search_word) {
		
		ArrayList<StyleInfo> style_info_list = new ArrayList<StyleInfo>();
		ArrayList<String> cc_id_list = new ArrayList<String>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String replaced_word = search_word.replace(" ", "");

		String cc_id_search_sql = "SELECT cc_id FROM CLOTHES_CATEGORY WHERE cc_name LIKE ? ";//받은 검색어를 통해 그에 맞는 cc_id를 모두 찾아오는 sql문 
		String style_search_sql = "SELECT * FROM style_info WHERE cc_id_outer = ? OR cc_id_top = ? OR cc_id_bottom = ? OR cc_id_acc = ?";//찾은 cc_id를 통해 cc_id를 포함하는 style_list를 받아온다.
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(cc_id_search_sql);//기존 검색어의 카운트 값을 받아온다.
			System.out.println("after setString");
			pstmt.setString(1, "%"+replaced_word+"%");
			System.out.println("execute 전");
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				cc_id_list.add(rs.getString(1));//여기가 문제
			}
			
			try {
				for( int i = 0 ; i < cc_id_list.size() ; i++) {//받은 cc_id에 해당하는 스타일이 있을 경우 전부 가져온다.
					pstmt.close();
					rs.close();
					pstmt = conn.prepareStatement(style_search_sql);
					pstmt.setString(1, cc_id_list.get(i));
					pstmt.setString(2, cc_id_list.get(i));
					pstmt.setString(3, cc_id_list.get(i));
					pstmt.setString(4, cc_id_list.get(i));
					rs = pstmt.executeQuery();
					
					while(rs.next()) {//받은 style_info를 전부 style_list에 넣는다.
						StyleInfo si = new StyleInfo();
						si.setStl_id(rs.getInt("stl_id"));
						si.setStl_pic_url(rs.getString("stl_pic_url"));
						style_info_list.add(si);
					}
					
				}
				
			}catch (Exception e) {
				if(e.getMessage() == null) {
					System.out.println("style_info select error");
				}else {
					System.out.println("error : " + e.getMessage());
				}
			}
			
			
		}catch (Exception e) {
			if(e.getMessage() == null) {
				System.out.println("cc_id select error");
			}else {
				System.out.println("error : " + e.getMessage());
			}
		}
		
		
		return style_info_list;
	}
}
