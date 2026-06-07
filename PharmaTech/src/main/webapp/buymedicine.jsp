<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Medicine</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow p-4">

<h2 class="text-center text-primary mb-4">
Buy Medicine
</h2>



<form action="buymedicine.jsp">

<div class="mb-3">

<label class="form-label">
Medicine Name
</label>

<input type="text"
name="name"
class="form-control"
placeholder="Enter medicine name"
required>

</div>

<button class="btn btn-primary w-100">
Search
</button>

</form>

<%
String name=request.getParameter("name");

if(name!=null)
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
        "select * from medicine where name=?");

        ps.setString(1,name);

        ResultSet rs=ps.executeQuery();

        if(rs.next())
        {
%>

<hr>

<form action="addtocart.jsp">

<input type="hidden"
name="id"
value="<%=rs.getInt("id")%>">

<input type="hidden"
name="name"
value="<%=rs.getString("name")%>">

<input type="hidden"
name="price"
value="<%=rs.getDouble("price")%>">

<p>
<strong>Medicine:</strong>
<%=rs.getString("name")%>
</p>

<p>
<strong>Company:</strong>
<%=rs.getString("company")%>
</p>

<p>
<strong>Price:</strong>
₹<%=rs.getDouble("price")%>
</p>

<p>
<strong>Available Qty:</strong>
<%=rs.getInt("qty")%>
</p>

<div class="mb-3">

<label class="form-label">
Quantity
</label>

<input type="number"
name="buyqty"
class="form-control"
required>

</div>

<button class="btn btn-success w-100">
Add To Cart
</button>

</form>

<%
        }
        else
        {
%>

<div class="alert alert-danger mt-3">
Medicine Not Found
</div>

<%
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