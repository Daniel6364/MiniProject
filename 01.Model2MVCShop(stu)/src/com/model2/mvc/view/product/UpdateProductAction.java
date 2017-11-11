package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.dao.ProductDAO;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class UpdateProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("UpdateProductAction.java �����");
		String productNo = (String) request.getParameter("prodNo");
		
		Product product = new Product();
		product.setProdNo(Integer.parseInt(productNo));
		product.setProdName(request.getParameter("prodName"));
		product.setProdDetail(request.getParameter("prodDetail"));
		product.setManuDate(request.getParameter("manuDate").replace("-", ""));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setFileName(request.getParameter("fileName"));

		ProductService service = new ProductServiceImpl();
		service.updateProduct(product);
		request.setAttribute("product", product);
		
		System.out.println("UpdateProductAction.java �����");
		return "forward:/product/updateProduct.jsp";
	}
}