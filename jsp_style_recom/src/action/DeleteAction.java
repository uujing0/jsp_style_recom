package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.BbsDAO;
import bbs.Board;

public class DeleteAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BbsDAO bbsDAO = new BbsDAO();
		HttpSession httpSession = request.getSession(true);
		
		String mem_id = (String) httpSession.getAttribute("mem_id"); //�ش� ������ ���� �ִ´�.

		if (mem_id == null) //�α����� �Ǿ����� �������(�۾��Ⱑ �ȵǾ���)
		{

		}
		int bd_id = 0;
		if (request.getParameter("bd_id") != null) {
			bd_id = Integer.parseInt(request.getParameter("bd_id"));
			//bbsID�� null���� �ƴѰ��, bbsID�� �о�� ���� �����Ѵ�.
		}

		if (bd_id == 0) {

		}

		Board board = bbsDAO.getBbs(bd_id);
		System.out.println("mem_id: " + mem_id);
		
		if (!mem_id.equals(board.getMem_id())) {

		}

		else {
			int result = bbsDAO.delete(bd_id);

			if (result == -1) {
				return "/borad/bbs.do";
			}
			//DB�� �����Ҷ� PRIMARY������ mem_id�� �־��� ������, ������ ���̵ڴ� �����Ұ�

			else {
				return "/borad/bbs.do";
			}
		}
		return "/borad/bbs.do";
	}

}
