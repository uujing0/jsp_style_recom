package service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Common;
import dao.Member;
import dao.UJ_MemberDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UJ_MemberDao memberDao = UJ_MemberDao.getInstance();

		try {
			String mem_id = request.getParameter("mem_id");
			String mem_pw = request.getParameter("mem_pw");
			
			int result = memberDao.confirmUser(mem_id, mem_pw);
			Member mem = memberDao.getMemberDate(mem_id);
			Map<String, String> locMap = Common.getInstance().locationMap();
			String locCode = null;
			
			if (mem != null) {
				String locName = mem.getMem_addr().split(" ")[0];
				locCode = locMap.get(locName);
				
				System.out.println("locName : " + locName);
			}
			
			if (locCode == null) {
				locCode = locMap.get("서울특별시");
			}
			
			if (result == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("mem_id", mem_id);
				session.setAttribute("loc", locCode);
				session.setAttribute("gender", Integer.toString(mem.getMem_gender()));
			} 
			
			request.setAttribute("result", result);
			request.setAttribute("mem_id", mem_id);
			
			
		} catch (Exception e) { 
			System.out.println(e.getMessage());
		}
		
		return "loginPro.jsp";
	}

}
