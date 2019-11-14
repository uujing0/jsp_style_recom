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
		String mem_id = request.getParameter("${mem_id}");
		System.out.println("UpdateFormAction mem_id--->"+mem_id);
		request.setAttribute("mem_id", mem_id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "memUpForm.jsp";
	}

}