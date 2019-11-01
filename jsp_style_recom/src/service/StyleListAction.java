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
	
		JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();
		
		try {
			String strTagId = request.getParameter("tagId");
			
			// TODO: Set Default tagId
			int tagId = strTagId == null ? 1 : Integer.parseInt(strTagId);
			
			// session에서 gender type get
			HttpSession session = request.getSession();
			String strGender = (String)session.getAttribute("gender");
			int gender = strGender == null ? 2 : Integer.parseInt(strGender);
			
			ArrayList<StyleInfo> styleInfos = styleDao.getStyleInfosFromTag(tagId, gender);			
			
			request.setAttribute("styleInfos", styleInfos);
			request.setAttribute("tagId", tagId);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "styleList.jsp";
	}

}
