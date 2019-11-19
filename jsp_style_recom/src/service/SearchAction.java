package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotTag;
import dao.JM_HotTagDao;
import dao.JM_SearchStyleDao;
import dao.StyleInfo;
import dao.YJ_BbsDAO;

public class SearchAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String returnPage = "main.do";
		String search_word = request.getParameter("search_word");
		String search_target = request.getParameter("search_target");
		
		try {//검색한 단어의 카운트를 하나 늘린다.
			
			JM_HotTagDao ht = JM_HotTagDao.getInstance();
			int result = ht.count(search_word);
			if(result > 0 ) {
				System.out.println("search count success");
			}else {
				System.out.println("search count failed");
			}
		} catch (Exception e) {
			System.out.println("search count error : "+e.getMessage());
		}
		
		//검색시 선택한 항목에따라 리턴하는 페이지와 액션이 달라진다. 0:스타일 검색 1:게시글 검색
		if(search_target.equals("0")) {
			returnPage = "styleList.do";
			System.out.println("스타일 검색");
			
			try {
				System.out.println("styleSearch.search_word->"+search_word);
				JM_SearchStyleDao ss = JM_SearchStyleDao.getInstance();				
				
				//검색어에 맞는 스타일들을 모두 가져오는 메소드
				ArrayList<StyleInfo> style_info = ss.searchStyle(search_word);
				
				request.setAttribute("list", style_info);
				request.setAttribute("tc_id", ss.searchStyleTag(search_word));
				
			}catch (Exception e) {
				System.out.println("StyleSearch error : " + e.getMessage());
			}
			
		}else {
			returnPage = "bbs.do";
			System.out.println("게시판 검색");
			
			YJ_BbsDAO bd = new YJ_BbsDAO();
			request.setAttribute("bbsList", bd.boardgetList());
			YJ_BbsDAO bd1 = new YJ_BbsDAO();
			request.setAttribute("bbsList2", bd1.noticelist());
		}
		
		//검색 결과 페이지로 검색 단어를 get방식으로 전송한다.
		return returnPage+"?search_word="+search_word;
	}

}
