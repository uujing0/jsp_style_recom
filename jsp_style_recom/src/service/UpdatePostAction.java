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
		
//		RequestDispatcher rd = null;
//		String fileName = "";
//		File file = null;
//		int bbsID=0;
//		
//		         try {
//		   String uploadPath = "C:\\jsp\\borad\\WebContent\\upload";
//		   MultipartRequest multi = new MultipartRequest(request,
//		   uploadPath, 1024 * 1024 * 5, "utf-8", new DefaultFileRenamePolicy());
//		   Enumeration efiles = multi.getFileNames();
//		   String formName=(String)efiles.nextElement();
//		   String fileName2 =multi.getFilesystemName(formName);
//		   
//		   System.out.println(request.getContextPath());
//		   
//		   //���ϻ���
//		   File del_file = new File(uploadPath+multi.getParameter("oldFile"));
//		   System.out.println(multi.getParameter("oldFile"));
//		   del_file.delete();
//		   
//					if(fileName2 != null){
//		             while( efiles.hasMoreElements()){
//		                 String name = (String)efiles.nextElement();                 
//		                file = multi.getFile(name);                       
//		                String imgName = file.getName();
//		                fileName +=imgName;
//		  			}
//					}
//
//		             String fullpath = fileName;
//
//				String mem_id = null;
//				if(session.getAttribute("mem_id") != null) //������ �����ϴ� ȸ��
//				{
//					mem_id = (String) session.getAttribute("mem_id"); //�ش� ������ ���� �ִ´�.
//				}
//
//				if(mem_id == null) //�α����� �Ǿ����� �������(�۾��Ⱑ �ȵǾ���)
//				{
//				}
//				bbsID = 0;
//				if(multi.getParameter("bbsID") != null){
//					bbsID = Integer.parseInt(multi.getParameter("bbsID"));
//					//bbsID�� null���� �ƴѰ��, bbsID�� �о�� ���� �����Ѵ�.
//				}
//					
//				if(bbsID == 0){
//				}
//				
//				BbsDAO bbsDAO = new BbsDAO();
//				
//				Bbs bbs = bbsDAO.getBbs(bbsID);
//				if(!mem_id.equals(bbs.getmem_id())){
//				}
//				
//				
//				
//				else{
//					if(multi.getParameter("bbsTitle") == null || multi.getParameter("bbsContent") == null
//							|| multi.getParameter("bbsTitle").equals("") || multi.getParameter("bbsContent").equals("")) //�����̳� ������ �Է����� �������� �����߻�
//							{
//							}
//							else{
//								
//								int result = -1;
//								
//								if(fileName2 == null){
//									result = bbsDAO.update(bbsID, multi.getParameter("bbsTitle"), multi.getParameter("bbsContent"));
//								}else{
//									result = bbsDAO.update2(bbsID, multi.getParameter("bbsTitle"), multi.getParameter("bbsContent"), fileName2);
//								}
//							
//							 if(result == -1)
//							 {
//							 }
//							//DB�� �����Ҷ� PRIMARY������ mem_id�� �־��� ������, ������ ���̵ڴ� �����Ұ�
//							 
//							 else 
//							 {
//							 }
//							}
//				}
//				
//			
//				}catch (Exception e) {
//		                System.out.print("���� �߻� : �Ф�" + e);
//		            }  
//		        
//
//		         return "/borad/view.do";
		
		int bd_id = Integer.parseInt(request.getParameter("bd_id"));
		System.out.println("bd_id->"+bd_id);
		YJ_BbsDAO bbsDAO = new YJ_BbsDAO();
		int result = bbsDAO.update(bd_id, request.getParameter("bd_title"), request.getParameter("bd_notice"),request.getParameter("bd_content"));
		return "bbs.do";

	}

}
