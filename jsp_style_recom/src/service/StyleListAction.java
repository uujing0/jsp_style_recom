package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JW_StyleInfoDao;
import dao.StyleInfo;
import dao.TagCategory;
import dao.UJ_TagCategoryDao;

public class StyleListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("------------- StyleListAction -------------");
		
		JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();
		UJ_TagCategoryDao tagDao = UJ_TagCategoryDao.getInstance();
		
		try {
			String strPageNum = request.getParameter("pageNum");
			if (strPageNum == null || strPageNum.equals("")) {
				strPageNum = "1";
			}
			
			// TODO: Set Default tagId
			String strTagId = request.getParameter("tagId");
			if (strTagId == null || strTagId.equals("")) {
				strTagId = "1";
			}
			
			// session에서 gender type get
			HttpSession session = request.getSession();
			String strGender = (String)session.getAttribute("gender");
			if (strGender == null || strGender.equals("")) {
				strGender = "1";
			}
			
			int tagId = Integer.parseInt(strTagId);	
			int gender = Integer.parseInt(strGender);
			int totCnt = styleDao.getStyleInfoCntFromTag(tagId, gender);
	
			int currentPage = Integer.parseInt(strPageNum);
			int boardRowSize = 5;
			int startRow = (currentPage - 1) * boardRowSize + 1; 	// 1
			int endRow = startRow + boardRowSize - 1;				// 10
			
			ArrayList<StyleInfo> styleInfos = styleDao.getStyleInfosFromTag(tagId, gender, startRow, endRow);
			int columnSize = 3, rowSize = (int) Math.ceil((double)totCnt / columnSize);
			
			ArrayList<TagCategory> sitTags = new ArrayList<>();
			ArrayList<TagCategory> bodyTags = new ArrayList<>();
			ArrayList<TagCategory> moodTags = new ArrayList<>();
			
			sitTags = tagDao.getCategoryListFromTagType(1);
			bodyTags = tagDao.getCategoryListFromTagType(2);
			moodTags = tagDao.getCategoryListFromTagType(3);
			
			request.setAttribute("styleInfos", styleInfos);
			request.setAttribute("tagId", tagId);
			
			/* table 그려줄 때 필요한 변수 세팅 */
			// totCnt == 0일 경우 emptyView 띄어줌.
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("list", styleInfos);
			
			request.setAttribute("rowSize", rowSize);
			request.setAttribute("columnSize", columnSize);
			
			request.setAttribute("sitTags", sitTags);
			request.setAttribute("bodyTags", bodyTags);
			request.setAttribute("moodTags", moodTags);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "styleList.jsp";
	}

}
