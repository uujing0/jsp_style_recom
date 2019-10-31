package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.YJ_BbsDAO;

	public class WriteCommentAction implements CommandProcess{

		public String requestPro(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String mem_id = request.getParameter("mem_id");
			String content = request.getParameter("content");
			String bd_id = request.getParameter("bd_id");
			String star = request.getParameter("star");
			YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
			bbsDAO.write_comment(bd_id, mem_id, content,star);
			System.out.println("bd_id->"+bd_id);
			return "/view.jsp";
		}

	}
