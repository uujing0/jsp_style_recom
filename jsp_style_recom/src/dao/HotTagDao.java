package dao;

import java.sql.Connection;

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
	//검색단어와 관련된 태그의 카운트를 늘리는 메소드
	public static void count(String search_word) {
		
		String[] word_de = search_word.split(" ");
		String tag_search = "%"+search_word+"%";
		
		
	}
	
	
}
