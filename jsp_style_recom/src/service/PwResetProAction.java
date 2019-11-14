package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.HJ_Member;
import dao.HJ_MemberDao;
import dao.IK_MemberDao;
import dao.Member;

public class PwResetProAction implements CommandProcess {


	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { 
		    request.setCharacterEncoding("utf-8");
			Member member = new Member();
			member.setMem_id(request.getParameter("mem_id"));
			member.setMem_pw(request.getParameter("mem_pw"));
			HJ_MemberDao md = HJ_MemberDao.getInstance();
			int result = md.RsPw(member);
			System.out.println("rs->"+result);
		
			request.setAttribute("result", result);

		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "pwResetPro.jsp";
	}
}