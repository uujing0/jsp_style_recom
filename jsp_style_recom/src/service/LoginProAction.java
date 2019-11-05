package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UJ_MemberDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UJ_MemberDao memberDao = UJ_MemberDao.getInstance();

		try {
			String mem_id = request.getParameter("mem_id");
			String mem_pw = request.getParameter("mem_pw");
			
			int result = memberDao.confirmUser(mem_id, mem_pw);
			
			if (result == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("mem_id", mem_id);
			} 
			
			request.setAttribute("result", result);
			request.setAttribute("mem_id", mem_id);
			
			
		} catch (Exception e) { 
			System.out.println(e.getMessage());
		}
		
		return "loginPro.jsp";
	}

}