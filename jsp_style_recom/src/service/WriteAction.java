package service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Objects;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.YJ_BbsDAO;

public class WriteAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
	
		
		if(mem_id == null) //�α����� �Ǿ����� �������(�۾��Ⱑ �ȵǾ���)
		{
			return "main.jsp";
		}
		YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
		int result = bbsDAO.write(request.getParameter("bd_title"), mem_id, 
				                  request.getParameter("bd_content"),request.getParameter("bd_file_url"), 0,
				                  request.getParameter("bd_notice"));
		
		return "bbs.do";
	}
}
