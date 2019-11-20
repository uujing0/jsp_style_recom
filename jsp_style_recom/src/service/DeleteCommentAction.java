package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.YJ_BbsDAO;

public class DeleteCommentAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cm_id = Integer.parseInt(request.getParameter("cm_id"));
		//cm_id를 받아온다
		
		YJ_BbsDAO bbsDAO = new YJ_BbsDAO(); //bbsDAO 인스턴스를 생성한다.
		bbsDAO.deleteComment(cm_id); //cm_id를 입력받아 deleteComment 함수를 실행한다.
		return "";
	}

}
