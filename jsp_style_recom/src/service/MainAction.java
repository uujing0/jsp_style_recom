package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JM_HotTagDao;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {			
			JM_HotTagDao ht = JM_HotTagDao.getInstance();
			ArrayList<String> list = ht.tagList();
			request.setAttribute("tagList", list);
		}catch (Exception e) {
			System.out.println("MainAction error : " + e.getMessage());
		}
		
		return "main.jsp";
	}

}
