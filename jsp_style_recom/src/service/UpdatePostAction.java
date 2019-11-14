package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.YJ_BbsDAO;

public class UpdatePostAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");
		
		int bd_id = Integer.parseInt(request.getParameter("bd_id"));
		System.out.println("bd_id->"+bd_id);
		YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
		int result = bbsDAO.update(bd_id, request.getParameter("bd_title"), request.getParameter("bd_notice"),request.getParameter("bd_content"),request.getParameter("bd_file_url"));
		return "bbs.do";

	}

}
