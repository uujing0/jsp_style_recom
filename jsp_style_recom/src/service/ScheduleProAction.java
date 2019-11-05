package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Calendar;
import dao.TH_CalendarDao;

public class ScheduleProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String dd = request.getParameter("dd");
			String mem_id=request.getParameter("mem_id");
			String yy = request.getParameter("yy");
			String mm = request.getParameter("mm");
			System.out.println("PRO  dd->"+dd+"yy->"+yy+"mm->"+mm);
			String cal_id = yy + mm + dd+mem_id;
			System.out.println("mem_id->"+request.getParameter("mem_id"));
			TH_CalendarDao cd = TH_CalendarDao.getInstance();
			Calendar cal = new Calendar();
			cal.setCal_id(cal_id);
			cal.setMem_id(mem_id);
			cal.setTc_id(Integer.parseInt(request.getParameter("tc_id")));
			cal.setCal_contents(request.getParameter("cal_contents"));
			cal.setCal_title(request.getParameter("cal_title"));
	
		
			int result = cd.update(cal);
			if(result<1) {
			 result = cd.insert(cal);
			 System.out.println("result2");
			}
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println("pro error->"+e.getMessage());
		}
		return "schedulePro.jsp";
	}

}
