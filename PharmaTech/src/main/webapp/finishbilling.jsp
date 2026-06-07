<%@ page import="java.sql.*" %>

<%
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
    "delete from cart");

    ps.executeUpdate();

    response.sendRedirect("menu.jsp");
}
catch(Exception e)
{
    out.println(e);
}
%>