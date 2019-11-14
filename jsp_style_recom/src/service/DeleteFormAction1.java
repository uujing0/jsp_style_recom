package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormAction1 implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
try {
	String mem_id = request.getParameter("mem_id");
	System.out.println("DeleteFormAction mem_id--->"+mem_id);
	request.setAttribute("mem_id", mem_id);
	
		System.out.println("--------------");	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "deleteform.jsp";
	}

}





