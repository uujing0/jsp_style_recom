package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.YJ_BbsDAO;

public class MyBoardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			YJ_BbsDAO bd = new YJ_BbsDAO(); 
			request.setAttribute("myList", bd.myList(mem_id));
		}catch (Exception e) {
			System.out.println("MainAction error : " + e.getMessage());
		}
		// TODO Auto-generated method stub
		return "myboard.jsp";
	}

}
