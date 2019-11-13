package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookMark;
import dao.JW_BookMarkDao;
import dao.JW_StyleInfoDao;
import dao.YJ_BbsDAO;

public class MyBoardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			YJ_BbsDAO bd = new YJ_BbsDAO(); 
			request.setAttribute("myList", bd.myList(mem_id));
			
			JW_BookMarkDao bmd = JW_BookMarkDao.getInstance();
			ArrayList<Integer> stl_id=bmd.select(mem_id);
			request.setAttribute("mem_id", mem_id);
			JW_StyleInfoDao sl = JW_StyleInfoDao.getInstance();
			
			int i = 1;
			for(int a : stl_id) {
				String stl_pic_url=sl.pic_url(a);	
				 request.setAttribute("stl_id"+i, a);
				 request.setAttribute("stl_pic_url"+i, stl_pic_url);
				 i++;
			}
		}catch (Exception e) {
			System.out.println("MainAction error : " + e.getMessage());
		}
		// TODO Auto-generated method stub
		return "myboard.jsp";
	}

}
