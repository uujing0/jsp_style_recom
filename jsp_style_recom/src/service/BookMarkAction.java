package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookMark;
import dao.JW_BookMarkDao;

public class BookMarkAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		try {
			
			//bookmark
			JW_BookMarkDao bm = JW_BookMarkDao.getInstance();
			BookMark bookmark = new BookMark();
			int result = bm.insert(bookmark);
			//request.setAttribute("bookmark", bookmark);
			
		} catch(Exception e){
			System.out.println("Style_Detail Error : "+e.getMessage());
		}
		
		return "styleDetail.jsp";
	}

}
