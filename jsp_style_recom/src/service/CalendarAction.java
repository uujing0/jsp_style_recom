package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.TH_CalendarDao;

public class CalendarAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		try {
			HttpSession session = request.getSession();

			String mem_id = (String)session.getAttribute("mem_id");
			System.out.println("mem_id->"+mem_id);
			if (request.getParameter("yy") == null) {

				int yy = cal.get(Calendar.YEAR);
				int mm = cal.get(Calendar.MONTH) + 1;
				try {
					yy = Integer.parseInt(request.getParameter("yy"));
				} catch (Exception e) {
					yy = cal.get(Calendar.YEAR);
				}
				try {
					mm = Integer.parseInt(request.getParameter("mm"));
				} catch (Exception e) {
					mm = cal.get(Calendar.MONTH) + 1;
				}
				if (mm == 13) {
					yy++;
					mm = 1;
				}
				if (mm == 0) {
					yy--;
					mm = 12;
				}
				if (yy <= 0 || mm < 1 || mm > 12) {
					yy = cal.get(Calendar.YEAR);
					mm = cal.get(Calendar.MONTH) + 1;
				}

				cal.set(yy, mm - 1, 1);// 날짜를 1로 바꿈
				int w = cal.get(Calendar.DAY_OF_WEEK);// 요일을 1~7로 설정 1:일요일 7:토요일
				int lastday = cal.getActualMaximum(Calendar.DATE);// 그달의 마지막날 알아내기
				//String mem_id = request.getParameter("mem_id");
				
				System.out.println("lastday->" + lastday);
				String cal_id = "";
				for (int i = 1; i <= lastday; i++) {
					if (i < 10) {
						cal_id = "" + yy + "" + mm + "0" + i+mem_id;
					} else {
						cal_id ="" + yy + "" + mm + i+mem_id;
					}
					
					TH_CalendarDao cd = TH_CalendarDao.getInstance();
					dao.Calendar cal1 = cd.select(mem_id, cal_id);
					request.setAttribute("cal_title" + i, cal1.getCal_title());
				//	System.out.println("제목인데->"+cal1.getCal_title());
				}
				request.setAttribute("yy", yy);
				request.setAttribute("mm", mm);
				request.setAttribute("w", w);
				request.setAttribute("lastday", lastday);
			} else {

				int yy = Integer.parseInt(request.getParameter("yy"));
				int mm = Integer.parseInt(request.getParameter("mm"));
				if (mm == 13) {
					yy++;
					mm = 1;
				}
				if (mm == 0) {
					yy--;
					mm = 12;
				}
				if (yy <= 0 || mm < 1 || mm > 12) {
					yy = cal.get(Calendar.YEAR);
					mm = cal.get(Calendar.MONTH) + 1;
				}

				cal.set(yy, mm - 1, 1);// 날짜를 1로 바꿈
				int w = cal.get(Calendar.DAY_OF_WEEK);// 요일을 1~7로 설정 1:일요일 7:토요일
				int lastday = cal.getActualMaximum(Calendar.DATE);// 그달의 마지막날 알아내기
				
				System.out.println("lastday->" + lastday);
				String cal_id = "";
				for (int i = 1; i <= lastday; i++) {
					if (i < 10) {
						cal_id = "" + yy + "" + mm + "0" + i+mem_id;
					} else {
						cal_id ="" + yy + "" + mm + i+mem_id;
					}
					
					TH_CalendarDao cd = TH_CalendarDao.getInstance();
					dao.Calendar cal1 = cd.select(mem_id, cal_id);
					request.setAttribute("cal_title" + i, cal1.getCal_title());
				}
				
				request.setAttribute("w", w);
				request.setAttribute("yy", yy);
				request.setAttribute("mm", mm);
				request.setAttribute("lastday", lastday);
			}

		} catch (Exception e) {
			System.out.println("err->" + e.getMessage());
		}
		// TODO Auto-generated method stub
		return "calendar.jsp";
	}

}
