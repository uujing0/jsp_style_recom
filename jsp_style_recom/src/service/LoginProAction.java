package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
try {
			
			request.setCharacterEncoding("utf-8");
			
			String mem_id = request.getParameter("mem_id");
			String mem_pw = request.getParameter("mem_pw");
			
			MemberDao md = MemberDao.getInstance();

			int result = md.check(mem_id , mem_pw);
		
			request.setAttribute("mem_id", mem_id);
       		request.setAttribute("result", result);
			
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "loginPro.jsp";
	}

}
