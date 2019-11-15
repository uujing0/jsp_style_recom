package service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Calendar;
import dao.TH_CalendarDao;

public class ScheduleAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		request.setCharacterEncoding("utf-8");
		String dd = request.getParameter("dd");
		String yy = request.getParameter("yy");
		String mm = request.getParameter("mm");
		
		String mem_id = request.getParameter("mem_id");
		String cal_id = yy + mm + dd+mem_id;
		System.out.println("mem_id->" + mem_id);

		TH_CalendarDao cd = TH_CalendarDao.getInstance();


		Calendar cal = cd.select(mem_id,cal_id);

		request.setAttribute("cal_title",cal.getCal_title());
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	return "calendar.jsp";
	}

}
