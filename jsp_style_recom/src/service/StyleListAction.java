package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JW_StyleInfoDao;
import dao.StyleInfo;

public class StyleListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("------------- StyleListAction -------------");
		
		JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();
		
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
			
			System.out.println("=> " + totCnt);
			
			int currentPage = Integer.parseInt(strPageNum);
			int pageSize = 5, blockSize = 5;
			int startRow = (currentPage - 1) * pageSize + 1; 	// 1
			int endRow = startRow + pageSize - 1;				// 10
			int startNum = totCnt - startRow + 1;				// 38 - 1 + 1
			
			ArrayList<StyleInfo> styleInfos = styleDao.getStyleInfosFromTag(tagId, gender, startRow, endRow);
			int pageCnt = (int) Math.ceil((double)totCnt / pageSize);				// ceil(38/10) = 4
			int startPage = (int)(currentPage - 1) / blockSize * blockSize + 1;		// 1
			int endPage = startPage + blockSize - 1;			// 10
			
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			request.setAttribute("styleInfos", styleInfos);
			request.setAttribute("tagId", tagId);
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", strPageNum);		// ?
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", styleInfos);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);

			System.out.println("---------------------------------");
			System.out.println("startNum --> " + startNum);
			System.out.println("totCnt --> " + totCnt);
			System.out.println("currentPage --> " + currentPage);
			System.out.println("blockSize --> " + blockSize);
			System.out.println("pageSize --> " + pageSize);
			System.out.println("startPage --> " + startPage);
			System.out.println("endPage --> " + endPage);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "styleList.jsp";
	}

}
