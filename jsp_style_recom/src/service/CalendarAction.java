package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TH_CalendarDao;

public class CalendarAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		try {

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
				String mem_id = "aaa";
				System.out.println("mem_id->"+mem_id);
				System.out.println("lastday->" + lastday);
				int cal_id = 0;
				for (int i = 1; i <= lastday; i++) {
					if (i < 10) {
						cal_id = Integer.parseInt("" + yy + "" + mm + "0" + i);
					} else {
						cal_id = Integer.parseInt("" + yy + "" + mm + i);
					}
					System.out.println("cal_id---->" + cal_id);
					TH_CalendarDao cd = TH_CalendarDao.getInstance();
					dao.Calendar cal1 = cd.select(mem_id, cal_id);
					request.setAttribute("cal_title" + i, cal1.getCal_title());
					System.out.println("제목들어갔냐" + cal1.getCal_title());
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
