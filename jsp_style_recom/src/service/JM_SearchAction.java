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

public class JM_SearchAction implements CommandProcess{

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
			returnPage = "styleSearch.jsp";
			System.out.println("스타일 검색");
			
			try {
				System.out.println("styleSearch.search_word->"+search_word);
				JM_SearchStyleDao ss = JM_SearchStyleDao.getInstance();
				//ArrayList<StyleInfo> style_info = new ArrayList<StyleInfo>();
				
				ArrayList<Integer> id_list = new ArrayList<Integer>();
				ArrayList<String> pic_list = new ArrayList<String>();
				//검색어에 맞는 스타일들을 모두 가져오는 메소드
				
				ArrayList<StyleInfo> style_info = ss.searchStyle(search_word);
				
				//각 배열리스트에 id와 사진주소를 저장한다.
				for(int i = 0 ; i < style_info.size() ; i++) {
					id_list.add(i, style_info.get(i).getStl_id());
					pic_list.add(i, style_info.get(i).getStl_pic_url());
				}
				//id와 사진주소 리스트를 넘긴다.
				request.setAttribute("id_list", id_list);
				request.setAttribute("pic_list", pic_list);
				
			}catch (Exception e) {
				System.out.println("StyleSearch error : " + e.getMessage());
			}
			
		}else {
			//returnPage = "board.jsp";
			System.out.println("게시판 검색");
		}
		
		//검색 결과 페이지로 검색 단어를 get방식으로 전송한다.
		return returnPage+"?search_word="+search_word;
	}

}
