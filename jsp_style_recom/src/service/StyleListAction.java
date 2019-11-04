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
	
			int currentPage = Integer.parseInt(strPageNum);
			int boardRowSize = 5, pageBlockSize = 5;		// blockSize
			int startRow = (currentPage - 1) * boardRowSize + 1; 	// 1
			int endRow = startRow + boardRowSize - 1;				// 10
			
			ArrayList<StyleInfo> styleInfos = styleDao.getStyleInfosFromTag(tagId, gender, startRow, endRow);
			int pageCnt = (int) Math.ceil((double)totCnt / boardRowSize);				// ceil(38/10) = 4
			int startPage = (int)(currentPage - 1) / pageBlockSize * pageBlockSize + 1;		// 1
			int endPage = startPage + pageBlockSize - 1;			// 10
			
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			int columnSize = 3, rowSize = (int) Math.ceil((double)totCnt / columnSize);
			
			request.setAttribute("styleInfos", styleInfos);
			request.setAttribute("tagId", tagId);
			
			/* table 그려줄 때 필요한 변수 세팅 */
			// totCnt == 0일 경우 emptyView 띄어줌.
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("list", styleInfos);
			
			request.setAttribute("rowSize", rowSize);
			request.setAttribute("columnSize", columnSize);
			
			/* 페이지 이동 영역 관련 변수 세팅 */
			// ex) [이전] 5,6,7,8,9 [다음] 을 계산하기 위해 view로 보냄
 			request.setAttribute("pageBlockSize", pageBlockSize);
			// 현재 페이지 활성화를 위한 변수
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			// ?
			request.setAttribute("pageCnt", pageCnt); 
			
			System.out.println("---------------------------------");
			System.out.println("totCnt --> " + totCnt);
			System.out.println("currentPage --> " + currentPage);
			System.out.println("startPage --> " + startPage);
			System.out.println("endPage --> " + endPage);
			System.out.println("rowSize --> " + rowSize);
			System.out.println("columnSize --> " + columnSize);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "styleList.jsp";
	}

}
