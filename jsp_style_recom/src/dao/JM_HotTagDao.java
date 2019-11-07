package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JM_HotTagDao {
	private static JM_HotTagDao instance;
	private JM_HotTagDao() {}
	
	public static JM_HotTagDao getInstance() {
		if (instance == null) {
			instance = new JM_HotTagDao();
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
	//검색단어와 관련된 태그의 카운트를 늘리는 메소드
	public static int count(String search_word) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String select_sql = "SELECT ht_count FROM hot_tag WHERE ht_keyword=?";
		String update_sql = "UPDATE hot_tag SET ht_count=? WHERE ht_keyword=?";
		String insert_sql = "INSERT INTO hot_tag VALUES(?,1,0)";
		ResultSet rs = null;
		
		search_word = search_word.replace(" ", "");//검색어의 공백을 없앤다.
		
		System.out.println("search_word->"+search_word);
		
		try {//검색결과 검색한 단어가 있을 경우 있는 태그의 카운트를 증가시킨다.
			conn = getConnection();
			pstmt = conn.prepareStatement(select_sql);//기존 검색어의 카운트 값을 받아온다.
			pstmt.setString(1, search_word);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//결과값이 있으면 실행한다.
				int new_count = Integer.parseInt(rs.getString(1)) + 1;//기존 검색어의 카운트 값에 +1한다.
				pstmt.close();//기존의 pstmt를 닫아 새로운 pstmt를 만들 준비를 한다.
				rs.close();//기존의 rs를 닫아 새로운 ResultSet을 받아올 준비를 한다.
				pstmt = conn.prepareStatement(update_sql);//새로운 카운트 값으로 업데이트한다.
				pstmt.setInt(1, new_count);
				pstmt.setString(2, search_word);
				//pstmt.setInt(1, 2);
				result = pstmt.executeUpdate();
				
				if(result > 0) {
					System.out.println("검색어 카운트업 성공");
				}else {
					System.out.println("검색어 카운트 실패");
				}
			}else {//결과값이 없을 경우 실행한다.
				System.out.println("검색한 단어가 없습니다.");
				System.out.println("새로운 검색 태그를 만듭니다.");
				pstmt.close();
				rs.close();
				pstmt = conn.prepareStatement(insert_sql);
				pstmt.setString(1, search_word);
				result = pstmt.executeUpdate();
				if(result > 0) {
					System.out.println("새로운 검색 태그 생성 성공");
				}else {
					System.out.println("새로운 검색 태그 생성에 실패했습니다.");
				}
			}
			
		}catch (Exception e) {	System.out.println("JM_HotTagDao.count error\nerror : " + e.getMessage());	
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	
	public static ArrayList<String> tagList() throws SQLException {
		
		ArrayList<String> tagList = new ArrayList<String>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT ht_keyword FROM hot_tag ORDER BY ht_count desc, ht_gender_type";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);//기존 검색어의 카운트 값을 받아온다.
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				for(int i = 1 ; i <= 10 ; i++) {
					tagList.add(rs.getString(1));
					rs.next();
				}
			}else {
				System.out.println("검색어 리스트를 찾을 수 없음");
			}
			
		} catch (Exception e) {	System.out.println(e.getMessage()); }
		finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return tagList;
	}
	
}
