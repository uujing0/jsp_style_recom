package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IK_MemberDao;
import dao.Member;
import dao.MemberDao;

public class DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
try {
			
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			System.out.println("--------->");
			String mem_id = request.getParameter("mem_id");
			System.out.println("mem_id--------->"+mem_id);
			String mem_pw = request.getParameter("mem_pw");
			System.out.println("mem_pw--------->"+mem_pw);
			

			IK_MemberDao md = IK_MemberDao.getInstance();

			int result = md.delete(mem_id , mem_pw);
			System.out.println("result----------->"+result);
         
			request.setAttribute("result", result);
			
			HttpSession session = request.getSession();
			session.invalidate();
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "deletePro.jsp";
	}

}

