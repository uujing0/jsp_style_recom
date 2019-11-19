package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
			Map<String, String> Bmap = new HashMap<String, String>();
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			YJ_BbsDAO bd = new YJ_BbsDAO(); 
			request.setAttribute("myList", bd.myList(mem_id));
			
			JW_BookMarkDao bmd = JW_BookMarkDao.getInstance();
			ArrayList<Integer> stl_id=bmd.select(mem_id);
			request.setAttribute("mem_id", mem_id);
			JW_StyleInfoDao sl = JW_StyleInfoDao.getInstance();
			
			int count = 0;
			for(int a : stl_id) {
				String stl_pic_url=sl.pic_url(a);
				Bmap.put(""+a, stl_pic_url);
				count++;
				if(count>4)
					break;
				/*System.out.println("--------------------------------------------------------map실험->"+Bmap);*/
			}
			request.setAttribute("count", count);
			request.setAttribute("BookMap", Bmap);
		}catch (Exception e) {
			System.out.println("MainAction error : " + e.getMessage());
		}
		// TODO Auto-generated method stub
		return "myboard.jsp";
	}

}
