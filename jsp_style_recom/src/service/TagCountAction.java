package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotTag;
import dao.HotTagDao;

public class TagCountAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String returnPage = "main.do";
		String search_word = request.getParameter("search_word");
		String search_target = request.getParameter("search_target");
		
		//검색시 선택한 항목에따라 리턴하는 페이지가 달라진다. 0:스타일 검색 1:게시글 검색
		if(search_target.equals("0")) {
			//returnPage = "style.jsp";
			System.out.println("스타일 검색");
		}else {
			//returnPage = "board.jsp";
			System.out.println("게시판 검색");
		}
		
		try {
			
			HotTagDao ht = HotTagDao.getInstance();
			int result = ht.count(search_word);
			if(result > 0 ) {
				System.out.println("HotTagDao.count success");
			}else {
				System.out.println("HotTagDao.count failed");
			}
		} catch (Exception e) {
			System.out.println("HotTagDao.count error : "+e.getMessage());
		}
		
		//검색 결과 페이지로 검색 단어를 get방식으로 전송한다.
		return returnPage+"?search_word="+search_word;
	}

}
