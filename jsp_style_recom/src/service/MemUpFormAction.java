package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemUpFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	try {
		String mem_addr = request.getParameter("mem_addr");
		String mem_add_addr =request.getParameter("mem_add_addr");
		String modifiedAddr = mem_addr + " " + mem_add_addr;
		String mem_id = request.getParameter("${mem_id}");
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("mem_addr", mem_add_addr);
	    
	    System.out.println("mem_addr " + mem_addr);
		System.out.println("UpdateFormAction mem_id--->"+mem_id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "memUpForm.jsp";
	}
	
}