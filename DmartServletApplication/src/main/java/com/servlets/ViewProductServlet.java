package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class ViewProductServlet
 */
//@WebServlet("/ViewProductServlet")
public class ViewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewProductServlet() {
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
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 response.setContentType("text/html");
		 PrintWriter out = response.getWriter();
		List<ProductDetails> list = ProductDao.getAllProducts();
		
		  out.println("<html>");
	        out.println("<head>");

	        out.println("<style>");

	        out.println("body{");
	        out.println("font-family:Arial;");
	        out.println("background:#f2f2f2;");
	        out.println("}");

	        out.println(".box{");
	        out.println("width:300px;");
	        out.println("border:2px solid black;");
	        out.println("padding:15px;");
	        out.println("margin:20px;");
	        out.println("background:white;");
	        out.println("border-radius:10px;");
	        out.println("box-shadow:2px 2px 10px gray;");
	        out.println("}");

	        out.println("</style>");

	        out.println("</head>");
	        out.println("<body>");

	        out.println("<h2>All Products</h2>");

	        for(ProductDetails p:list){

	        	out.println("<div class='box'>");

	        	out.println("<h3>"+p.getProductName()+"</h3>");

	        	out.println("<p><b>Id :</b>"+p.getId()+"</p>");

	        	out.println("<p><b>Brand :</b>"+p.getBrand()+"</p>");

	        	out.println("<p><b>Category :</b>"+p.getCategory()+"</p>");

	        	out.println("<p><b>Price :</b>"+p.getPrice()+"</p>");

	        	out.println("<p><b>Quantity Available :</b>"+p.getQuantity()+"</p>");

	        	out.println("<form action='addcart' method='post'>");

	        	out.println("<input type='hidden' name='pid' value='"+p.getId()+"'>");

	        	out.println("<input type='hidden' name='pname' value='"+p.getProductName()+"'>");

	        	out.println("<input type='hidden' name='price' value='"+p.getPrice()+"'>");

	        	out.println("Buy Quantity : ");

	        	out.println("<input type='number' name='qty' value='1' min='1'>");

	        	out.println("<br><br>");

	        	out.println("<input type='submit' value='Add To Cart'>");

	        	out.println("</form>");

	        	out.println("</div>");

	        	}
	        out.println("</body>");
	        out.println("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
