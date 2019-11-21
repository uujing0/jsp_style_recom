package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.BookMark;
import dao.JW_BookMarkDao;
import dao.JW_StyleInfoDao;
import dao.TH_CalendarDao;

public class CalendarAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		try {
			HttpSession session = request.getSession();
			Map<String, String> Cmap = new HashMap<String, String>();
			Map<String, String> Emap = new HashMap<String, String>();
			Map<String, String> Bmap = new HashMap<String, String>();
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
				String event=null;
				for (int i = 1; i <= lastday; i++) {
					if (i < 10) {
						cal_id = "" + yy + "" + mm + "0" + i+mem_id;
					} else {
						cal_id ="" + yy + "" + mm + i+mem_id;
					}
					System.out.println("cal_id------->"+cal_id);
					TH_CalendarDao cd = TH_CalendarDao.getInstance();
					dao.Calendar cal1 = cd.select(mem_id, cal_id);
					switch(cal1.getTc_id()){
					case(0): {event="";break;}
					case(1): {event="오피스";break;}
					case(2): {event="웨딩하객/셀럽";break;}
					case(3): {event="캠퍼스개강";break;}
					case(4): {event="집근처마실";break;}
					case(5): {event="피크닉";break;}
				}
				Cmap.put(""+i, cal1.getCal_title());
				Emap.put(""+i, event);
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
				String event=null;
				for (int i = 1; i <= lastday; i++) {
					if (i < 10) {
						cal_id = "" + yy + "" + mm + "0" + i+mem_id;
					} else {
						cal_id ="" + yy + "" + mm + i+mem_id;
					}
					
					TH_CalendarDao cd = TH_CalendarDao.getInstance();
					dao.Calendar cal1 = cd.select(mem_id, cal_id);
					
					switch(cal1.getTc_id()){
						case(0): {event="";break;}
						case(1): {event="오피스";break;}
						case(2): {event="웨딩하객/셀럽";break;}
						case(3): {event="캠퍼스개강";break;}
						case(4): {event="집근처마실";break;}
						case(5): {event="피크닉";break;}
					}
					Cmap.put(""+i, cal1.getCal_title());
					Emap.put(""+i, event);
				}
				
				request.setAttribute("w", w);
				request.setAttribute("yy", yy);
				request.setAttribute("mm", mm);
				request.setAttribute("lastday", lastday);
			}
			JW_BookMarkDao bd = JW_BookMarkDao.getInstance();
			ArrayList<Integer> stl_id=bd.select(mem_id);
			request.setAttribute("mem_id", mem_id);
			JW_StyleInfoDao sl = JW_StyleInfoDao.getInstance();
			request.setAttribute("CalMap", Cmap);
			request.setAttribute("EventMap", Emap);
			System.out.println("-------------event->"+Emap);
			int count = 0;
			for(int a : stl_id) {
				String stl_pic_url=sl.pic_url(a);
				Bmap.put(""+a, stl_pic_url);
				count++;
				if(count>5)
					break;
				/*System.out.println("--------------------------------------------------------map실험->"+Bmap);*/
			}
			request.setAttribute("count", count);
			request.setAttribute("BookMap", Bmap);
		} catch (Exception e) {
			System.out.println("err->" + e.getMessage());
		}
		// TODO Auto-generated method stub
		return "calendar.jsp";
	}

}