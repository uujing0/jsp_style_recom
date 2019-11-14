package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.YJ_BbsDAO;

	public class CommentAction implements CommandProcess{

		public String requestPro(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String cm_contents = request.getParameter("content2");
			int cm_id = Integer.parseInt(request.getParameter("cm_id"));
			
			YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
			bbsDAO.update_comment(cm_contents, cm_id);
			return "/view.jsp";
		}

	}
