<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Customers</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<h2 class="text-center text-primary mb-4">
View Customers
</h2>

<div class="row">

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
    "select * from customer order by id");

    ResultSet rs=
    ps.executeQuery();

    while(rs.next())
    {
%>

<div class="col-md-4 mb-4">

<div class="card shadow h-100">

<div class="card-body">

<h4 class="text-success">
<%=rs.getString("name")%>
</h4>

<p>
<strong>ID:</strong>
<%=rs.getInt("id")%>
</p>

<p>
<strong>Mobile:</strong>
<%=rs.getString("mobile")%>
</p>

</div>

</div>

</div>

<%
    }
}
catch(Exception e)
{
    out.println(e);
}
%>

</div>

<a href="menu.jsp"
class="btn btn-secondary w-100">
Back To Menu
</a>

</div>

</body>
</html>