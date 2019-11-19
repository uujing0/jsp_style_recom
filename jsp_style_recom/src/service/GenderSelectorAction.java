package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GenderSelectorAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String returnPage = request.getParameter("thisPage");
		try {
			HttpSession session = request.getSession();
			if(request.getParameter("select").equals("1")) {
				session.setAttribute("gender", "1");
			}else {
				session.setAttribute("gender", "2");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
		return returnPage;
	}

}
