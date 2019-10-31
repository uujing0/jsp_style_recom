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
			String dd = request.getParameter("dd");
			if(Integer.parseInt(dd)<10)
				dd="0"+dd;
			String yy = request.getParameter("yy");
			String mm = request.getParameter("mm");
			int cal_id = Integer.parseInt(yy + mm + dd);
			System.out.println("yy->" + yy + "mm->" + mm + "dd->" + dd);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String day = yy + "-" + mm + "-" + dd;
			Date cal_date = df.parse(yy + "-" + mm + "-" + dd);
			String mem_id = request.getParameter("mem_id");

			System.out.println("mem_id->" + mem_id);

			TH_CalendarDao cd = TH_CalendarDao.getInstance();

			System.out.println("start1");
			Calendar cal = cd.select(mem_id,cal_id);
			System.out.println("start2");
			request.setAttribute("dd", dd);
			request.setAttribute("yy", yy);
			request.setAttribute("mm", mm);
			request.setAttribute("day", day);
			request.setAttribute("cal_id", day);
			request.setAttribute("mem_id", mem_id);
			request.setAttribute("tc_id", cal.getTc_id());
			request.setAttribute("cal_date", cal_date);
			request.setAttribute("cal_contents", cal.getCal_contents());
			request.setAttribute("cal_title",cal.getCal_title());
			
			System.out.println("last mem_id->"+mem_id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "scheduleForm.jsp";
	}

}
