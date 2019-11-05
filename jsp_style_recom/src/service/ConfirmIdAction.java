package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class ConfirmIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			request.setCharacterEncoding("utf-8");
			String mem_id = request.getParameter("mem_id");
			
			
			MemberDao md = MemberDao.getInstance();
            
			int result = md.confirm(mem_id);
	System.out.println("result------->"+result);		
  			request.setAttribute("result", result);
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "confirmId.jsp";
	}

}
