package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.YJ_BbsDAO;
import dao.Board;

public class DeleteAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
		HttpSession httpSession = request.getSession(true);
		
		String mem_id = (String) httpSession.getAttribute("mem_id"); //mem_ID를 받아온다.

		if (mem_id == null) //mem_id가 null이면 아무것도 하지 않는다.
		{

		}
		int bd_id = 0;
		if (request.getParameter("bd_id") != null) {
			bd_id = Integer.parseInt(request.getParameter("bd_id"));
			//bd_id가 null이 아닐때 bd_id를 INT로 바꿔준다
		}

		if (bd_id == 0) {

		}

		Board board = bbsDAO.getBbs(bd_id); //getbbs 함수를 호출해 Bd_id를 입력해준다.
		
		/*if (!mem_id.equals(board.getMem_id())) {
			//mem_id가 getMem_id와 매칭하여 같지않으면 아무것도 하지 않고
		}
*/
/*		else { *///그렇지 않으면 bd_id를 받아와 delete 한다.
			int result = bbsDAO.delete(bd_id);

			if (result == -1) { //만약 실패하면 bbs.do로 돌아간다.
				return "bbs.do";
			}

			else {
				return "bbs.do"; //그렇지 않아도 bbs.do로 돌아간다.
			}
		/*}*/
	/*	return "bbs.do";*/
	}

}
