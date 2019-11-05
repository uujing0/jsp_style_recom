package service;

import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.accessibility.internal.resources.accessibility_ko;

import dao.JW_StyleInfoDao;
import dao.StyleInfo;
import dao.ClothesCategory;
import dao.JW_ClothesCategoryDao;

public class StyleDetailAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			JW_StyleInfoDao siDao = JW_StyleInfoDao.getInstance();
			JW_ClothesCategoryDao ccDao = JW_ClothesCategoryDao.getInstance();
			ArrayList<String> al = new ArrayList<String>();
			
			int stl_id = Integer.parseInt(request.getParameter("stl_id"));
			al = siDao.styleFind(stl_id);
			
			al.set(1, ccDao.clothesCategoryFind(al.get(1)));   //outer
			al.set(2, ccDao.clothesCategoryFind(al.get(2)));   //top
			al.set(3, ccDao.clothesCategoryFind(al.get(3)));    //bottom
			al.set(4,  ccDao.clothesCategoryFind(al.get(4)));  //acc

			System.out.println("styleDetailAction.java");
			System.out.println(al.get(0));
			System.out.println(al.get(1));
			System.out.println(al.get(2));
			System.out.println(al.get(3));

			String img_path = request.getSession().getServletContext().getRealPath("/");
			System.out.println(img_path);
			request.setAttribute("img_path", img_path);
			request.setAttribute("al", al);
			
		} catch(Exception e){
			System.out.println("Style_Detail Error : "+e.getMessage());
		}
		
		return "styleDetail.jsp";
	}

}
