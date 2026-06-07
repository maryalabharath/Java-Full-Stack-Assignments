package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BillingServlet
 */
//@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillingServlet() {
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

	        double grandTotal = 0;

	        try{

	            Connection con =
	                ProductDao.getConnection();

	            PreparedStatement ps =
	                con.prepareStatement(
	                    "select * from cart"
	                );

	            ResultSet rs =
	                ps.executeQuery();
	          

	            out.println("<h2>Billing</h2>");
	           

	            out.println("<table border='1'>");

	            out.println(
	                "<tr>"
	                + "<th>Product</th>"
	                + "<th>Price</th>"
	                + "<th>Qty</th>"
	                + "<th>Total</th>"
	                + "</tr>"
	               );

	            while(rs.next()){

	                out.println("<tr>");

	                out.println(
	                    "<td>"+rs.getString(2)+"</td>"
	                );

	                out.println(
	                    "<td>"+rs.getDouble(3)+"</td>"
	                );

	                out.println(
	                    "<td>"+rs.getInt(4)+"</td>"
	                );

	                out.println(
	                    "<td>"+rs.getDouble(5)+"</td>"
	                );

	                out.println("</tr>");

	                grandTotal =
	                    grandTotal +
	                    rs.getDouble(5);
	            }

	            out.println("</table>");

	            out.println(
	                "<h3>Your total Bill is : "
	                + grandTotal
	                + "</h3>"
	            );

	            con.close();

	        }
	        catch(Exception e){

	            e.printStackTrace();
	        }
	}

}
