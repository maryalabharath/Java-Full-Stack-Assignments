<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
int id=
Integer.parseInt(
request.getParameter("id"));

String name=
request.getParameter("name");

double price=
Double.parseDouble(
request.getParameter("price"));

int buyqty=
Integer.parseInt(
request.getParameter("buyqty"));

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
    "insert into cart(id,name,price,qty) values(?,?,?,?)");

    ps.setInt(1,id);
    ps.setString(2,name);
    ps.setDouble(3,price);
    ps.setInt(4,buyqty);

    ps.executeUpdate();

    PreparedStatement ps2=
    con.prepareStatement(
    "update medicine set qty=qty-? where id=?");

    ps2.setInt(1,buyqty);
    ps2.setInt(2,id);

    ps2.executeUpdate();

    response.sendRedirect("buymedicine.jsp");
}
catch(Exception e)
{
    out.println(e);
}
%>