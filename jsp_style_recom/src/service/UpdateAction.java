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
			// mem_id가 널이 아니면 mem_id를 가져와 입력한다.
			
		if(mem_id == null){
		} //mem_id가 널이면 아무것도 안한다.
		int bd_id = 0; //bd_id 0으로 초기화
		if(request.getParameter("bd_id") != null){
			bd_id = Integer.parseInt(request.getParameter("bd_id"));
			//bd_id가 널이아니면 bd_id를 인테저로 바꾼다
		}
			
		if(bd_id == 0){ //bd_id가 0일땐 아무것도 안한다.
		}
		
		YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
		//bbsDAO 인스턴스를 생성한다.
		
		Board board = bbsDAO.getBbs(bd_id); //bd_id를 입력받아 getbbs 함수를 호출한다
		request.setAttribute("board", board); //board 리스트를 넘긴다.
		return "update.jsp";
	}

}
