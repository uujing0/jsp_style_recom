package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IK_MemberDao;
import dao.Member;
import dao.MemberDao;

public class JoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			member.setMem_id(request.getParameter("mem_id"));
			member.setMem_pw(request.getParameter("mem_pw"));
			member.setMem_name(request.getParameter("mem_name"));
		    member.setMem_phone(request.getParameter("mem_phone"));
			member.setMem_email(request.getParameter("mem_email"));
		    member.setMem_addr(request.getParameter("mem_addr"));
			member.setMem_body_type(Integer.parseInt(request.getParameter("mem_body_type")));
			member.setMem_gender(Integer.parseInt(request.getParameter("mem_gender")));

			String [] arr_mem_fav = request.getParameterValues("mem_fav_loc");
			
			// 예) 전라북도,경상남도,경상북도
			String mem_fav_loc = arr_mem_fav == null ? "" : String.join(",", arr_mem_fav);
			
			IK_MemberDao md = IK_MemberDao.getInstance();
			member.setMem_fav_loc(mem_fav_loc);

			int result = md.insert(member);
		   System.out.println("result---->"+result);
			request.setAttribute("mem_id", member.getMem_id());
       		request.setAttribute("result", result);
			
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "joinPro.jsp";
	}

}
