package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.YJ_BbsDAO;
import dao.Board;

public class BbsAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		YJ_BbsDAO bd = new YJ_BbsDAO();
		request.setAttribute("bbsList", bd.getList());
		YJ_BbsDAO bd1 = new YJ_BbsDAO(); //�ȳ��ϼ��� �ϴ�
		
		request.setAttribute("bbsList2", bd1.getList2()); 

		YJ_BbsDAO bd2 = new YJ_BbsDAO(); //�ȳ��ϼ��� �ϴ�
		request.setAttribute("bbsList3", bd2.getList3()); 
		return "bbs.jsp";
	}
}

	


