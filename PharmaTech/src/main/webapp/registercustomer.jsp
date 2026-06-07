<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
String msg="";

String name=
request.getParameter("name");

String mobile=
request.getParameter("mobile");

if(name!=null && mobile!=null)
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
        "insert into customer(name,mobile) values(?,?)");

        ps.setString(1,name);
        ps.setString(2,mobile);

        ps.executeUpdate();

        msg="Customer Registered Successfully";
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Customer</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow p-4">

<h2 class="text-center text-success mb-4">
Register Customer
</h2>

<%
if(msg.equals("Customer Registered Successfully"))
{
%>

<div class="alert alert-success">
<%=msg%>
</div>

<%
}
%>

<form action="registercustomer.jsp">

<div class="mb-3">

<label class="form-label">
Customer Name
</label>

<input type="text"
name="name"
class="form-control"
required>

</div>

<div class="mb-3">

<label class="form-label">
Mobile Number
</label>

<input type="text"
name="mobile"
value="<%=mobile!=null?mobile:""%>"
class="form-control"
required>

</div>

<button class="btn btn-success w-100">
Register
</button>

</form>

<a href="customer.jsp"
class="btn btn-secondary mt-3 w-100">
Back
</a>

</div>

</div>

</div>

</div>

</body>
</html>