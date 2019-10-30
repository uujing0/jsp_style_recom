package service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Calendar;
import dao.TH_CalendarDao;

public class ScheduleFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { 
			request.setCharacterEncoding("utf-8"); 
			String dd=request.getParameter("dd");
			String yy=request.getParameter("yy");
			String mm = request.getParameter("mm");
		
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date cal_date=df.parse(yy+"-"+mm+"-"+dd);
			String cal_id = request.getParameter("cal_id");
	       
	        TH_CalendarDao cd = TH_CalendarDao.getInstance();
	        Calendar cal = cd.select(cal_id);
			
			request.setAttribute("cal_id",cal.getCal_id());
			request.setAttribute("mem_id",cal.getMem_id());
			request.setAttribute("tc_id",cal.getTc_id());
			request.setAttribute("cal_date",cal_date);
			request.setAttribute("cal_contents",cal.getCal_contents());
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "calendar.jsp";
	}

}
