package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotTagDao;

public class TagCountAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String returnPage = "main.jsp";
		String search_word = request.getParameter("search_word");
		
		//검색시 선택한 항목에따라 리턴하는 페이지가 달라진다. 0:스타일 검색 1:게시글 검색
		if(Integer.parseInt(request.getParameter("search_target")) == 0) {
			//returnPage = "style.jsp";
			System.out.println("스타일 검색");
		}else {
			//returnPage = "board.jsp";
			System.out.println("게시판 검색");
		}
		
		//검색단어와 연관된 태그의 카운터를 증가시키는 함수
		HotTagDao.count(search_word);
		
		//검색 결과 페이지로 검색 단어를 get방식으로 전송한다.
		return returnPage+"?search_word="+search_word;
	}

}
