package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.BbsDAO;

public class ViewAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BbsDAO bbsDAO = new BbsDAO();
		
		int bd_id = Integer.parseInt(request.getParameter("bd_id"));
		bbsDAO.Views(bd_id);
		
		request.setAttribute("board", bbsDAO.getBbs(bd_id));
		request.setAttribute("comments", bbsDAO.getCommentsList(bd_id));
	
		return "/view.jsp";
	}

}
