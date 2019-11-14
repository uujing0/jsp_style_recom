package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.HJ_Member;
import dao.HJ_MemberDao;

public class PwResetProAction implements CommandProcess {


	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("PwSrhProStart");	
	        request.setCharacterEncoding("utf-8"); 
	        HJ_Member member = new HJ_Member();
			member.setMem_id(request.getParameter("mem_id"));
			System.out.println(member.getMem_id());
			member.setMem_name(request.getParameter("mem_name"));
			System.out.println(member.getMem_name());
	        member.setMem_email(request.getParameter("mem_email"));
	        System.out.println(member.getMem_email());
	        HJ_MemberDao md = HJ_MemberDao.getInstance();//DB 
	        String mem_pw = md.SrhPw(member.getMem_id(), member.getMem_name(), member.getMem_email());
	        request.setAttribute("mem_pw", mem_pw);
	        //request.setAttribute("result", mem_id);
	        System.out.println("PwSrhProAction : "+ mem_pw);
		} catch(Exception e) { System.out.println(e.getMessage()); }
        return "pwResetPro.jsp";
	}
}