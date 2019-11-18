package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Common;
import dao.JW_StyleInfoDao;



public class JoinFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
		

			
			String strLocCode = request.getParameter("locCode");
			
			
			request.setAttribute("lc", strLocCode);
			
			
			
			request.setAttribute("locMap", Common.getInstance().locationMap());	
          System.out.println("getattribute----->"+request.getAttribute("locMap"));
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "joinForm.jsp";
	}

}
