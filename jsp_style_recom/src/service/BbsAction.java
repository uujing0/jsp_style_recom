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
		request.setAttribute("boardgetList", bd.boardgetList());
		YJ_BbsDAO bd1 = new YJ_BbsDAO(); //�ȳ��ϼ��� �ϴ�
		
		request.setAttribute("noticelist", bd1.noticelist()); 

		YJ_BbsDAO bd2 = new YJ_BbsDAO(); //�ȳ��ϼ��� �ϴ�
		request.setAttribute("beststylelist", bd2.beststylelist()); 
		return "bbs.jsp";
	}
}

	


