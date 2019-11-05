package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.YJ_BbsDAO;
import dao.Board;

public class UpdateAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mem_id = null;
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("mem_id") != null)
		{
			mem_id = (String) session.getAttribute("mem_id");
		}
			//�α����� �� ȸ���� �α����� ������ ������ �ֵ��� ����  
			
		if(mem_id == null){
		}
		int bd_id = 0;
		if(request.getParameter("bd_id") != null){
			bd_id = Integer.parseInt(request.getParameter("bd_id"));
			//bbsID�� null���� �ƴѰ��, bbsID�� �о�� ���� �����Ѵ�.
		}
			
		if(bd_id == 0){
		}
		
		YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
		
		Board board = bbsDAO.getBbs(bd_id);
		System.out.println("bd_id->"+bd_id);
		request.setAttribute("board", board);
		System.out.println("board - > "+ board.getBd_notice());
		return "update.jsp";
	}

}
