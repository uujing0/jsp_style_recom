package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UJ_MemberDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UJ_MemberDao memberDao = UJ_MemberDao.getInstance();
		
		try {
			System.out.println("------------------------");
			String id = request.getParameter("mem_id");
			System.out.println("==> " + id);
			String pw = request.getParameter("mem_pw");
			
			int result = memberDao.confirm(id, pw);
			
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "loginPro.jsp";
	}

}
