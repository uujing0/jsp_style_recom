package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			
			
			
			request.setAttribute("Product", product);
			

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return "prd_detail.jsp";
		
		
	}		

}
