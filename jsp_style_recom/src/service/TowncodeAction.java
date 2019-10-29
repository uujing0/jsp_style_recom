package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TH_TownDao;

public class TowncodeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
		String addr = request.getParameter("sido");
		
		TH_TownDao TD = TH_TownDao.getInstance();
		String city = TD.citycode(addr);
		
		
		
		request.setAttribute("city", city);
		}catch(Exception e) {System.out.println(e.getMessage());}
		return "weather.jsp";
	}

}
