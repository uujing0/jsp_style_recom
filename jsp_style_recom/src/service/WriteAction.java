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

import bbs.BbsDAO;

public class WriteAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String fileName = "";
//		File file = null;
//
//		//���� ������ ���
//		String realPath = "C:\\jsp\\borad\\WebContent\\upload";
//		
//		System.out.println(realPath);
//		MultipartRequest multi = new MultipartRequest(request, realPath,
//			1024 * 1024 * 5, "utf-8", new DefaultFileRenamePolicy());
//		Enumeration efiles = multi.getFileNames();
//		
//		while(efiles.hasMoreElements()){
//			String name = (String)efiles.nextElement();                 
//			file = multi.getFile(name);
//			
//			//÷������ ���� ���� Ȯ��
//			if(file != null) {
//				String imgName = file.getName();
//				fileName +=imgName;
//			}
//		}
//		
//		String fullpath = fileName;
//		String mem_id = null;
//		System.out.println("fullpath"+fullpath);
//		if(multi.getParameter("mem_id") != null) //������ �����ϴ� ȸ��
//		{
//			System.out.println("mem_id: "+ mem_id);
//			mem_id = (String) multi.getParameter("mem_id"); //�ش� ������ ���� �ִ´�.
//		}
//
//		if(mem_id == null) //�α����� �Ǿ����� �������(�۾��Ⱑ �ȵǾ���)
//		{
//			System.out.println("mem_id: "+ mem_id);
//			return "main.jsp";
//		}
//		else
//		{
//			if(multi.getParameter("bbsTitle") == null ||
//				multi.getParameter("bbsContent") == null )
//			//�����̳� ������ �Է����� �������� �����߻�
//			{
//				return "main.jsp";
//			}
//			else
//			{
//				System.out.println(4);
//				BbsDAO bbsDAO = new BbsDAO();
//				int Views= 0;
//				int result = bbsDAO.write(multi.getParameter("bbsTitle"), mem_id, multi.getParameter("bbsContent"),fullpath, Views); 
//				
//				System.out.println("result: " + result);
//			}
//		}
//		return "/borad/bbs.do";
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
	
		
		if(mem_id == null) //�α����� �Ǿ����� �������(�۾��Ⱑ �ȵǾ���)
		{
			return "main.jsp";
		}
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.write(request.getParameter("bd_title"), mem_id, request.getParameter("bd_content"), "", 0, request.getParameter("bd_notice"));
		
		return "bbs.do";
	}
}
