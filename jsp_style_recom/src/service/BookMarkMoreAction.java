package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JW_BookMarkDao;
import dao.JW_StyleInfoDao;

public class BookMarkMoreAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			JW_BookMarkDao bookMarkDao = JW_BookMarkDao.getInstance();
			JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();
			ArrayList<Integer> bookmark = new ArrayList<Integer>(); //id
			ArrayList<String> stylePicture = new ArrayList<String>(); //pic
			

			HttpSession session = request.getSession();
			String mem_id = (String) session.getAttribute("mem_id");
			int onoff = Integer.parseInt(request.getParameter("onoff"));
			System.out.println("mem_id->"+mem_id);
			System.out.println("onoff->"+onoff);
			
		
			bookmark = bookMarkDao.select(mem_id);
			for(int i=0; i<bookmark.size(); i++) {
				System.out.println("--"+bookmark.get(i));
				stylePicture.add(styleDao.pic_url(bookmark.get(i)));
				System.out.println("--"+stylePicture.get(i));

			}
			
			request.setAttribute("bookmark", bookmark);
			request.setAttribute("stylePicture", stylePicture);

			request.setAttribute("mem_id", mem_id);
			
			
			System.out.println("BookMarkMoreAction End");
		} catch(Exception e) {
			System.out.println("BookMarkMore Error: "+e.getMessage());
		}
		
		return "bookmark.jsp";
	}

}
