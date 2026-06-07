package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddToCartServlet
 */
//@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
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
		   response.setContentType("text/html");

	        PrintWriter out = response.getWriter();

	        int pid = Integer.parseInt(
	                request.getParameter("pid")
	        );

	        String pname =
	                request.getParameter("pname");

	        double price = Double.parseDouble(
	                request.getParameter("price")
	        );

	        int qty = Integer.parseInt(
	                request.getParameter("qty")
	        );

	        double total = price * qty;
	        CartDetails c = new CartDetails();

	        c.setPid(pid);
	        c.setPname(pname);
	        c.setPrice(price);
	        c.setQty(qty);
	        c.setTotal(total);

	        int status = CartDao.save(c);

	        if(status > 0){

	            out.println("<h2>Added To Cart</h2>");

	            out.println(
	                "<a href='viewproducts'>"
	                + "Continue Shopping"
	                + "</a>"
	            );

	            out.println("<br><br>");

	            out.println(
	                "<a href='billing'>"
	                + "Go To Billing"
	                + "</a>"
	            );
	}

}
}
