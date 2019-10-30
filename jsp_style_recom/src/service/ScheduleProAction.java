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
			String cal_id = request.getParameter("cal_id");
	       
			  Calendar cal = new Calendar();
				cal.setCal_id(Integer.parseInt(request.getParameter("cal_id")));
				cal.setMem_id(request.getParameter("mem_id"));
				cal.setTc_id(Integer.parseInt(request.getParameter("tc_id")));
				cal.setCal_contents(request.getParameter("cal_contents"));
				
				TH_CalendarDao cd=TH_CalendarDao.getInstance();
				int result = cd.update(cal);
				request.setAttribute("result", result);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "schedulePro.jsp";
	}

}
