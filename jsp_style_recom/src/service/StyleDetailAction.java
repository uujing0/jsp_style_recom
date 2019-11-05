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
import dao.BookMark;
import dao.ClothesCategory;
import dao.JW_BookMarkDao;
import dao.JW_ClothesCategoryDao;
import dao.JW_ClothesProductMappingDao;
import dao.JW_ProductDao;

public class StyleDetailAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			JW_StyleInfoDao siDao = JW_StyleInfoDao.getInstance();
			JW_ClothesCategoryDao ccDao = JW_ClothesCategoryDao.getInstance();
			ArrayList<String> al = new ArrayList<String>();
			
			JW_ClothesProductMappingDao cpmDao = JW_ClothesProductMappingDao.getInstance();
			JW_ProductDao pDao = JW_ProductDao.getInstance();
			
			ArrayList<String> p_cc1 = new ArrayList<String>();
			ArrayList<String> p_cc2 = new ArrayList<String>();
			ArrayList<String> p_cc3 = new ArrayList<String>();
			
			//style
			int stl_id = Integer.parseInt(request.getParameter("stl_id"));
			al = siDao.styleFind(stl_id);

			
			//product id
			//outer
			p_cc1 = cpmDao.styleIdFind(al.get(1));
			System.out.println("p_cc1->"+p_cc1.get(0));
			System.out.println(p_cc1.get(1));
			System.out.println(p_cc1.get(2));
			System.out.println(p_cc1.get(3));
			for(int i=0; i<p_cc1.size(); i++) {

				p_cc1.set(i, pDao.productFind(p_cc1.get(i)));	
			}
			
			System.out.println("al : "+al.get(2));
			p_cc2 = cpmDao.styleIdFind(al.get(2));
			System.out.println("p_cc2->"+p_cc2.get(0));
			System.out.println(p_cc2.get(1));
			System.out.println(p_cc2.get(2));
			System.out.println(p_cc2.get(3));
			
			for(int i=0; i<p_cc2.size(); i++) {

				p_cc2.set(i, pDao.productFind(p_cc2.get(i)));	
			}
			
			
			p_cc3 = cpmDao.styleIdFind(al.get(3));
			System.out.println("p_cc3->"+p_cc3.get(0));
			System.out.println(p_cc3.get(1));
			System.out.println(p_cc3.get(2));
			System.out.println(p_cc3.get(3));
			for(int i=0; i<p_cc3.size(); i++) {

				p_cc3.set(i, pDao.productFind(p_cc3.get(i)));	
			}

			
			
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
			request.setAttribute("stl_id", stl_id);

			request.setAttribute("img_path", img_path);
			request.setAttribute("al", al);
			request.setAttribute("p_cc1", p_cc1);
			request.setAttribute("p_cc2", p_cc2);
			request.setAttribute("p_cc3", p_cc3);

			request.setAttribute("p_cc1.size", p_cc1.size());
			
			
			
		} catch(Exception e){
			System.out.println("Style_Detail Error : "+e.getMessage());
		}
		
		return "styleDetail.jsp";
	}

}
