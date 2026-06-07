<%@ page import="java.sql.*" %>

<%
String sid=request.getParameter("id");
String name=request.getParameter("name");
String company=request.getParameter("company");
String sprice=request.getParameter("price");
String sqty=request.getParameter("qty");

if(sid!=null && name!=null &&
   company!=null &&
   sprice!=null &&
   sqty!=null)
{
    int id=Integer.parseInt(sid);
    double price=Double.parseDouble(sprice);
    int qty=Integer.parseInt(sqty);

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
        "update medicine set name=?,company=?,price=?,qty=? where id=?");

        ps.setString(1,name);
        ps.setString(2,company);
        ps.setDouble(3,price);
        ps.setInt(4,qty);
        ps.setInt(5,id);

        ps.executeUpdate();

        response.sendRedirect("viewmedicine.jsp");
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
else
{
    response.sendRedirect("viewmedicine.jsp");
}
%>