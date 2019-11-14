package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JM_HotTagDao;
import dao.YJ_BbsDAO;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {			
			JM_HotTagDao ht = JM_HotTagDao.getInstance();
			ArrayList<String> list = ht.tagList();
			request.setAttribute("tagList", list);
			YJ_BbsDAO bd = new YJ_BbsDAO();
			request.setAttribute("bbsList", bd.getList());
			YJ_BbsDAO bd1 = new YJ_BbsDAO(); //�ȳ��ϼ��� �ϴ�
			request.setAttribute("bbsList2", bd1.getList2());
		}catch (Exception e) {
			System.out.println("MainAction error : " + e.getMessage());
		}
		
		return "main.jsp";
	}

}
