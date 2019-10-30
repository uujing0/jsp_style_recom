package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.HJ_Member;
import dao.HJ_MemberDao;

public class IdSrhProAction implements CommandProcess {


	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("IdSrhProStart");
	        request.setCharacterEncoding("utf-8"); 
	        HJ_Member member = new HJ_Member();
			member.setMem_name(request.getParameter("mem_name"));
			System.out.println(member.getMem_name());
			member.setMem_email(request.getParameter("mem_email"));
			System.out.println(member.getMem_email());
	        member.setMem_phone(request.getParameter("mem_phone"));
	        System.out.println(member.getMem_phone());
	        HJ_MemberDao md = HJ_MemberDao.getInstance();//DB 
	        String mem_id = md.SrhId(member.getMem_phone(), member.getMem_email(), member.getMem_name());
	        request.setAttribute("mem_id", mem_id);
	        //request.setAttribute("result", mem_id);
	        System.out.println("IdSrhProAction : "+ mem_id);
		} catch(Exception e) { System.out.println(e.getMessage()); }
        return "HJ_idSrhPro.jsp";
	}
}