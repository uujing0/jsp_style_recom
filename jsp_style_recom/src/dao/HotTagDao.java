package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HotTagDao {
	private static HotTagDao instance;
	private HotTagDao() {}
	
	public static HotTagDao getInstance() {
		if (instance == null) {
			instance = new HotTagDao();
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
	public static void count(String search_word) throws SQLException {
		
		String[] word_de = search_word.split(" ");
		
		for(int i=0 ; i<word_de.length ; i++) {
			
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String select_sql = "SELECT ht_count FROM hot_tag WHERE ht_keyword=?";
		String update_sql = "UPDATE hot_tag SET ht_count=? WHERE ht_keyword=?";
		String insert_sql = "INSERT INTO hot_tag VALUES(?,1,0)";
		ResultSet rs = null;
		
		try {//검색결과 검색한 단어가 있을 경우 있는 태그의 카운트를 증가시킨다.
			conn = getConnection();
			pstmt = conn.prepareStatement(select_sql);//기존 검색어의 카운트 값을 받아온다.
			pstmt.setString(1, search_word);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int new_count = Integer.parseInt(rs.getString(1)) + 1;//기존 검색어의 카운트 값에 +1한다.
				pstmt.close();
				rs.close();
				pstmt = conn.prepareStatement(update_sql);//새로운 카운트 값으로 업데이트한다.
				pstmt.setInt(1, new_count);
				int result = pstmt.executeUpdate();
				
				if(result > 0) {
					System.out.println("검색어 카운트업 성공");
				}else {
					System.out.println("검색어 카운트 실패");
				}
				
			}
		}catch (Exception e) {
			try {//검색결과 검색한 단어가 없을 경우 새로운 검색 태그를 만든다. 새로운 태그의 카운트는 1로 시작
				pstmt.close();
			}catch (Exception e2) {
				System.out.println("HotTagDao.count error\nerror1 : " + e.getMessage() + "\nerror2 : " + e2.getMessage());
			}
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		
		String tag_search = "%"+search_word+"%";
		
		
	}
	
	
}
