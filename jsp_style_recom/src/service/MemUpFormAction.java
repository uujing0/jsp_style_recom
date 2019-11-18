package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.UJ_MemberDao;

public class MemUpFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	try {
		/*String mem_addr = request.getParameter("mem_addr");
		String mem_add_addr =request.getParameter("mem_add_addr");
		String modifiedAddr = mem_addr + " " + mem_add_addr;*/
		//String mem_id = request.getParameter("mem_id");
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		UJ_MemberDao mDao = UJ_MemberDao.getInstance();
		
		Member curMember = mDao.getMemberDate(mem_id);
		
		System.out.println("MemUpFormAction mem_id--->"+mem_id);
		
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("mem_name", curMember.getMem_name());
		request.setAttribute("mem_phone", curMember.getMem_phone());
		request.setAttribute("mem_email", curMember.getMem_email());
		/*request.setAttribute("mem_addr", mem_add_addr);*/
	    
	  /*  System.out.println("mem_addr " + mem_addr);*/
		
		
		
		
	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "memUpForm.jsp";
	}
	
}