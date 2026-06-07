<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
int id=
Integer.parseInt(
request.getParameter("id"));

try
{
    Class.forName("org.postgresql.Driver");

    Connection con=
    DriverManager.getConnection(
    "jdbc:postgresql://localhost:5432/PharmaTech",
    "postgres",
    "ragava@2244");

    PreparedStatement ps=
    con.prepareStatement(
    "delete from cart where id=?");

    ps.setInt(1,id);

    ps.executeUpdate();

    response.sendRedirect("cart.jsp");
}
catch(Exception e)
{
    out.println(e);
}
%>