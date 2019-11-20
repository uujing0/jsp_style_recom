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
		YJ_BbsDAO bd = new YJ_BbsDAO(); //bbsdao에서 인스턴스값을 받아온다
		request.setAttribute("boardgetList", bd.boardgetList()); //bd의 boardgetlist를 setattribute 한다
		YJ_BbsDAO bd1 = new YJ_BbsDAO(); //bbsdao에서 인스턴스값을 받아온다
		
		request.setAttribute("noticelist", bd1.noticelist());  //bd의 noticelist를 setattribute 한다

		YJ_BbsDAO bd2 = new YJ_BbsDAO();//bbsdao에서 인스턴스값을 받아온다
		request.setAttribute("beststylelist", bd2.beststylelist()); //bd의 beststylelist를 setattribute 한다
		return "bbs.jsp";
	}
}

	


