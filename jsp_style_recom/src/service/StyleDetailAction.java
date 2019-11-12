package service;

import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

			// product_image
			ArrayList<String> p_cc1 = new ArrayList<String>();
			ArrayList<String> p_cc2 = new ArrayList<String>();
			ArrayList<String> p_cc3 = new ArrayList<String>();

			ArrayList<String> p_cc1_id = new ArrayList<String>();
			ArrayList<String> p_cc2_id = new ArrayList<String>();
			ArrayList<String> p_cc3_id = new ArrayList<String>();

			HttpSession session = request.getSession();
			String mem_id = (String) session.getAttribute("mem_id");
			System.out.println("memid->" + mem_id);
			String strGender = (String) session.getAttribute("strGender");
			if (strGender == null || strGender.equals("")) {
				strGender = "1";
			}
			int gender = Integer.parseInt(strGender);
			System.out.println("gender->" + gender);
			// style
			int stl_id = Integer.parseInt(request.getParameter("stl_id"));
			System.out.println("stl_id->" + stl_id);
			// bookmark
			JW_BookMarkDao bmDao = JW_BookMarkDao.getInstance();

			int onoff = Integer.parseInt(request.getParameter("onoff"));

			System.out.println("onoff->" + onoff);
			if (onoff == 1) {
				bmDao.insert(mem_id, stl_id);
			}
			if (onoff == 2) {
				bmDao.delete(mem_id, stl_id);
			}
			int status = bmDao.check(mem_id, stl_id);
			al = siDao.styleFind(stl_id);
			String std_desc = siDao.styleDesc(stl_id);
			System.out.println("std_desc->" + std_desc);
			System.out.println("al.size()->" + al.size());

			for(int i=0; i<al.size(); i++) {
				System.out.println("al->"+al.get(i));
			}
			// product id
			// outer
			
			if (al.get(1) != null) {
				p_cc1 = cpmDao.styleIdFind(Integer.parseInt(al.get(1)), gender);
				for (int i = 0; i < p_cc1.size(); i++) {
					p_cc1_id.add(p_cc1.get(i));
					p_cc1.set(i, pDao.productFind(p_cc1.get(i)));
				}
			}

			
			if (al.get(2) != null) {
				p_cc2 = cpmDao.styleIdFind(Integer.parseInt(al.get(2)), gender);
				for (int i = 0; i < p_cc2.size(); i++) {
					p_cc2_id.add(p_cc2.get(i));
					p_cc2.set(i, pDao.productFind(p_cc2.get(i)));
				}
			}

			if (al.get(3) != null) {
				p_cc3 = cpmDao.styleIdFind(Integer.parseInt(al.get(3)), gender);
				for (int i = 0; i < p_cc3.size(); i++) {
					p_cc3_id.add(p_cc3.get(i));
					p_cc3.set(i, pDao.productFind(p_cc3.get(i)));
				}
			}

			al.set(1, ccDao.clothesCategoryFind(al.get(1))); // outer
			al.set(2, ccDao.clothesCategoryFind(al.get(2))); // top
			al.set(3, ccDao.clothesCategoryFind(al.get(3))); // bottom
			al.set(4, ccDao.clothesCategoryFind(al.get(4))); // acc

			System.out.println(al.get(0));
			System.out.println(al.get(1));
			System.out.println(al.get(2));
			System.out.println(al.get(3));

			request.setAttribute("stl_id", stl_id);
			request.setAttribute("al", al);
			request.setAttribute("std_desc", std_desc);
			request.setAttribute("p_cc1", p_cc1);
			request.setAttribute("p_cc2", p_cc2);
			request.setAttribute("p_cc3", p_cc3);

			request.setAttribute("p_cc1_id", p_cc1_id);
			request.setAttribute("p_cc2_id", p_cc2_id);
			request.setAttribute("p_cc3_id", p_cc3_id);
			request.setAttribute("p_cc1.size", p_cc1.size());

			request.setAttribute("gender", gender);
			request.setAttribute("mem_id", mem_id);
			request.setAttribute("status", status);
			System.out.println("StyleDetailAction end...");

		} catch (Exception e) {
			System.out.println("Style_Detail Error : " + e.getMessage());
		}

		return "styleDetail.jsp";
		
	}

}
