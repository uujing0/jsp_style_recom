package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JW_ProductDao;
import dao.Product;
import dao.WY_ProductDao;

public class PrdDetailAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int prd_id = Integer.parseInt(request.getParameter("prd_id"));
		
		try {
			WY_ProductDao wy_productDao = WY_ProductDao.getInstance();
			Product product = new Product();
			product = wy_productDao.getProductById(prd_id);
		
			
			System.out.println(product.getPrd_thumbnail());
			
			
			// detailed product 
			JW_ProductDao dpDao = JW_ProductDao.getInstance();
			ArrayList<String> dp= new ArrayList<String>(); //id
			ArrayList<String> dp2= new ArrayList<String>();  //image
			
			HttpSession session = request.getSession();

			String strGender = (String) session.getAttribute("strGender");
			if (strGender == null || strGender.equals("")) {
				strGender = "1";
			}
			int gender = Integer.parseInt(strGender);
			System.out.println("gender->" + gender);
			
			dp = dpDao.Detail_prd(prd_id, gender);
			
			
			System.out.println("dp.size()->" + dp.size());

			for(int i=0; i<dp.size(); i++) {
				dp2.add(dpDao.productFind(dp.get(i)));
				System.out.println("dp->"+dp.get(i));
				System.out.println("dp2->"+dp2.get(i));

			}
			
			
			
			request.setAttribute("Product", product);
			request.setAttribute("dp", dp);  //id  //이후에또상품상세로연결
			request.setAttribute("dp2", dp2);  //image

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return "prd_detail.jsp";
		
		
	}		

}
