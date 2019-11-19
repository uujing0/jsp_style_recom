package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dao.Board;


public class YJ_BbsDAO {
	private Connection conn;
	private ResultSet rs;

	public YJ_BbsDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@211.183.2.63:1521:xe";
			String dbID = "J20191001";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getNext() {
		String SQL = "SELECT bd_id FROM board ORDER BY bd_id DESC"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next())
				return rs.getInt(1) + 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return -1;
		}
		return 1;
	}
	
	public int getCommentNext() {
		String SQL = "SELECT cm_id FROM board_comment ORDER BY cm_id DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next())
				return rs.getInt(1) + 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return -1;
		}
		return 1;
	}

	public int write(String bd_title, String mem_id, String bd_content, String bd_file_url, int bd_readcount, String bd_notice) {
		String SQL = "INSERT INTO BOARD(bd_id, bd_date, bd_title, "
				+ "bd_notice, mem_id, bd_content,bd_file_url, bd_readcount)"
				+ " VALUES (?, SYSDATE, ?, ?, ? , ?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bd_title);
			if (bd_notice==null) { pstmt.setString(3, "0");}
			else {pstmt.setString(3, bd_notice);};
			pstmt.setString(4, mem_id);
			pstmt.setString(5, bd_content);
			pstmt.setString(6, bd_file_url);
			pstmt.setInt(7, bd_readcount);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

			System.out.println(e.getMessage());
		}
		return -1;
	}
	
	public int write_comment(String bd_id, String mem_id, String content,int star) {
		String SQL = "INSERT INTO BOARD_COMMENT(mem_id, bd_id, cm_contents, cm_id,star,cm_date)"
				+ "VALUES (?, ?, ?, ?,?,SYSDATE)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, bd_id);
			pstmt.setString(3, content);
			pstmt.setInt(4, getCommentNext());
			pstmt.setInt(5, star);
			return pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		return -1;}

	public ArrayList<Board> boardgetList() {
		String SQL = "SELECT ROWNUM AS bbsNO     , b.bd_id , b.bd_Title     , b.mem_id    , to_char(b.bd_date,'yyyy-mm-dd') as bd_date     , b.bd_readcount, (select count(*) from board_comment bc where b.bd_id = bc.bd_id) as commentCount    ,(select round(avg(star),0) as staravg from board_comment bc where b.bd_id = bc.bd_id) as staravg,(select '<img' || regexp_replace(bd_file_url, '(.*)<img(.*)style=(.*)', '\\2')||'style=' || replace( replace( translate( regexp_replace(bd_file_url, '(.*)style=(.*)/>(.*)', '\\2') , '#0123456789', '#') || '/>' , 'height:', 'height:300'), 'width:', 'width:400')from board d where d.bd_id = b.bd_id) as bd_file_url from board b    where b.BD_NOTICE = 0     ORDER BY bd_id DESC";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			Board board;

			while (rs.next()) {
				board = new Board();
				board.setBbsNO(rs.getInt(1));
				board.setBd_id(rs.getInt(2));
				board.setBd_title(rs.getString(3));
				board.setMem_id(rs.getString(4));
				board.setBd_date(rs.getString(5));
				board.setBd_readcount(rs.getInt(6));
				board.setCommentCount(rs.getInt(7));
				board.setStaravg(rs.getInt(8));
				board.setPopup(rs.getString(9));
				list.add(board);
				

			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return list;
	}
	
	public ArrayList<Board> noticelist() {
		String SQL = "SELECT ROWNUM AS bbsNO"
				   + "     , b.bd_id"
				   + "     , b.bd_Title"
				   + "     , b.mem_id"
				   + "     , to_char(b.bd_date,'yyyy-mm-dd') as bd_date "
				   + "     , b.bd_readcount"
				   + "     , (select count(*) from board_comment bc where b.bd_id = bc.bd_id) as commentCount"
				   + "     from board b"
				   + "     where b.BD_NOTICE = 1"
					+ "     ORDER BY bd_id DESC";
				   
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			Board board;

			while (rs.next()) {
				board = new Board();
				board.setBbsNO(rs.getInt(1));
				board.setBd_id(rs.getInt(2));
				board.setBd_title(rs.getString(3));
				board.setMem_id(rs.getString(4));
				board.setBd_date(rs.getString(5));
				board.setBd_readcount(rs.getInt(6));
				board.setCommentCount(rs.getInt(7));
				list.add(board);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<Board> beststylelist() {
		String SQL = "SELECT ROWNUM AS bbsNO,d.bd_id,d.bd_Title, d.mem_id , to_char(d.bd_date,'yyyy-mm-dd') as bd_date,d.bd_readcount,(select count(*) from board_comment bc where d.bd_id = bc.bd_id) as commentCount,(select round(avg(star),0) as staravg from board_comment bc where d.bd_id = bc.bd_id) as staravg,star as star1 ,(select '<img' || regexp_replace(bd_file_url, '(.*)<img(.*)style=(.*)', '\\2')||'style=' || replace( replace( translate( regexp_replace(bd_file_url, '(.*)style=(.*)/>(.*)', '\\2') , '#0123456789', '#') || '/>' , 'height:', 'height:300'), 'width:', 'width:400')from board b where d.bd_id = b.bd_id) as popup FROM (select c.bd_id , avg(star) as star from board_comment c  group by c.bd_id order by star desc) c, board d  where c.bd_id = d.bd_id and  d.bd_notice=0 and ROWNUM <= 1 order by star desc ,d.bd_readcount desc";
				   
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			Board board;

			while (rs.next()) {
				board = new Board();
				board.setBbsNO(rs.getInt(1));
				board.setBd_id(rs.getInt(2));
				board.setBd_title(rs.getString(3));
				board.setMem_id(rs.getString(4));
				board.setBd_date(rs.getString(5));
				board.setBd_readcount(rs.getInt(6));
				board.setCommentCount(rs.getInt(7));
				board.setStaravg(rs.getInt(8));
				board.setStar1(rs.getInt(9));
				board.setPopup(rs.getString(10));
				list.add(board);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<BoardComment> getCommentsList(int bd_id) {
		String SQL = "SELECT cm_contents, mem_id, cm_id,cm_date,star "
				+ "FROM Board_comment "
				+ "WHERE bd_id = ?";

		ArrayList<BoardComment> list = new ArrayList<BoardComment>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bd_id);
			rs = pstmt.executeQuery();		
			BoardComment boardcomment;

			while (rs.next()) {
				boardcomment = new BoardComment();
				boardcomment.setCm_contents(rs.getString(1));
				boardcomment.setMem_id(rs.getString(2));
				boardcomment.setCm_id(rs.getInt(3));
				boardcomment.setCm_date(rs.getString(4));
				boardcomment.setStar(rs.getInt(5));
				list.add(boardcomment);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Board getBbs(int bd_id) {
		String SQL = "SELECT bd_id"
				   + "     , bd_Title"
				   + "     , mem_id"
				   + "     , to_char(bd_date,'yyyy-mm-dd hh:MM:ss') as bd_Date "
				   + "     , bd_Content"
				   + "     , bd_notice"
				   + "     , bd_readcount"
				   + "     ,(select round(avg(star),0) as staravg from board_comment where bd_id = ?) as staravg"
				   + " FROM board "
				   + "WHERE 1=1"
				   + "  AND bd_id = ? "
				   + "ORDER BY bd_ID ASC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bd_id);
			pstmt.setInt(2, bd_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board board = new Board();
				board.setBd_id(rs.getInt(1));
				board.setBd_title(rs.getString(2));
				board.setMem_id(rs.getString(3));
				board.setBd_date(rs.getString(4));
				board.setBd_content(rs.getString(5));
				board.setBd_notice(rs.getString(6));
				board.setBd_readcount(rs.getInt(7));
				board.setStaravg(rs.getInt(8));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(int bd_id, String bd_title, String bd_notice,String bd_content,String bd_file_url) {
		String SQL = "UPDATE Board "
				    + "  SET bd_Title = ?"
				    + "    , bd_Content = ?"
				    + "    , bd_file_url = ?"
				    + "    , bd_notice = ?"
				    + "WHERE 1=1"
				    + "  AND bd_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bd_title);
			pstmt.setString(2, bd_content);
			pstmt.setString(3, bd_file_url);
			if (bd_notice==null) { pstmt.setString(4, "0");}
			else {pstmt.setString(4, "1");};
			pstmt.setInt(5, bd_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	


	public int delete(int bd_id) {
		String SQL = "delete from board "
				   + " WHERE 1=1"
				   + "   AND bd_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bd_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteComment(int cm_id) {
		String SQL = "delete from board_comment "
				   + " WHERE cm_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cm_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int Views(int bd_id)	{
		String SQL = "UPDATE board "
			   + "   SET bd_readcount=bd_readcount+1 where bd_id =? "
			   ;
	try {
		
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, bd_id);
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bd_id;
	
}
	public int update_comment( String cm_contents ,int cm_id) {
		String SQL = "UPDATE Board_comment "
			    + "  SET "
				+ " cm_contents = ?"
			    + "WHERE cm_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cm_contents);
			pstmt.setInt(2, cm_id);
			return pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		return -1;
	}
	
	public ArrayList<Board> myList(String mem_id) {
	String SQL = "SELECT ROWNUM AS bbsNO"
			   + "     , b.bd_id"
			   + "     , b.bd_Title"
			   + "     , b.mem_id"
			   + "     , to_char(b.bd_date,'yyyy-mm-dd') as bd_date "
			   + "     , b.bd_readcount"
			   + "     , (select count(*) from board_comment bc where b.bd_id = bc.bd_id) as commentCount"
			   + "     ,(select round(avg(star),0) as staravg from board_comment bc where b.bd_id = bc.bd_id) as staravg"
			   + "     from board b"
			   + "     where b.BD_NOTICE = 0 and b.mem_id=?"
			   + "     ORDER BY bd_id DESC";
	ArrayList<Board> list = new ArrayList<Board>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();
		Board board;
		
		while (rs.next()) {
			board = new Board();
			board.setBbsNO(rs.getInt(1));
			board.setBd_id(rs.getInt(2));
			board.setBd_title(rs.getString(3));
			board.setMem_id(rs.getString(4));
			board.setBd_date(rs.getString(5));
			board.setBd_readcount(rs.getInt(6));
			board.setCommentCount(rs.getInt(7));
			board.setStaravg(rs.getInt(8));

			list.add(board);
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}
}
