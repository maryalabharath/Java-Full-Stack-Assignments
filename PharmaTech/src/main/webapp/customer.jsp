<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Details</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow p-4">

<h2 class="text-center text-primary mb-4">
Customer Details
</h2>

<form action="customer.jsp">

<div class="mb-3">

<label class="form-label">
Mobile Number
</label>

<input type="text"
name="mobile"
class="form-control"
placeholder="Enter mobile number"
required>

</div>

<button class="btn btn-primary w-100">
Search
</button>

</form>

<%
String mobile=
request.getParameter("mobile");

if(mobile!=null)
{
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
        "select * from customer where mobile=?");

        ps.setString(1,mobile);

        ResultSet rs=
        ps.executeQuery();

        if(rs.next())
        {
%>

<hr>

<div class="alert alert-success">

<p>
<strong>Name:</strong>
<%=rs.getString("name")%>
</p>

<p>
<strong>Mobile:</strong>
<%=rs.getString("mobile")%>
</p>

</div>

<%
        }
        else
        {
            response.sendRedirect(
            "registercustomer.jsp?mobile="+mobile);
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>

<a href="menu.jsp"
class="btn btn-secondary mt-3 w-100">
Back To Menu
</a>

</div>

</div>

</div>

</div>

</body>
</html>