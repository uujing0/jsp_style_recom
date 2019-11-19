package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.YJ_BbsDAO;

	public class CommentAction implements CommandProcess{

		public String requestPro(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String cm_contents = request.getParameter("content2"); // content2 값을 받아온다
			int cm_id = Integer.parseInt(request.getParameter("cm_id")); // cm_id 값을 받아온다
			YJ_BbsDAO bbsDAO = new YJ_BbsDAO(); //bbsDAO 인스턴스 생성
			bbsDAO.update_comment(cm_contents, cm_id); //update_comment 메소드를 불러 cm_contents,cm_id를 입력
			return "/view.jsp";
		}

	}
