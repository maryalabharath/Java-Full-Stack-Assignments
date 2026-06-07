package com.servlets;


import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.annotation.WebServlet;



/**
 * Servlet implementation class ProductServlet
 */
//@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("service method");
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String id = request.getParameter("id");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		String brand = request.getParameter("brand");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		String manufactureDate = request.getParameter("manufactureDate");
		String expiryDate = request.getParameter("expiryDate");
		ProductDetails products =new ProductDetails();
		
		products.setId(Integer.parseInt(id));
		products.setProductName(productName);
		products.setDescription(description);
		products.setBrand(brand);
		products.setCategory(category);
		products.setPrice(Double.parseDouble(price));
		products.setQuantity(Integer.parseInt(quantity));
		products.setManufactureDate(manufactureDate);
		products.setExpiryDate(expiryDate);
		int insertstatus=ProductDao.save(products);
		if(insertstatus > 0) {
		    response.getWriter().println(
		        "Product Registered Successfully"
		    );
		}
		else {
		    response.getWriter().println(
		        "Failed to Register Product"
		    );
		}
		
	}

}
