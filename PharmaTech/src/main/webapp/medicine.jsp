<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
String msg="";

String name=request.getParameter("name");
String company=request.getParameter("company");
String price=request.getParameter("price");
String qty=request.getParameter("qty");

if(name!=null && company!=null && price!=null && qty!=null)
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
        "insert into medicine(name,company,price,qty) values(?,?,?,?)");

        ps.setString(1,name);
        ps.setString(2,company);
        ps.setDouble(3,Double.parseDouble(price));
        ps.setInt(4,Integer.parseInt(qty));

        ps.executeUpdate();

        msg="Medicine Registered Successfully";

    }
    catch(Exception e)
    {
        msg=e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Medicine</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow p-4">

<h2 class="text-center text-success mb-4">
Register Medicine
</h2>

<%
if(msg.equals("Medicine Registered Successfully"))
{
%>

<div class="alert alert-success">
    <%=msg%>
</div>

<%
}
%>

<form action="medicine.jsp">

<div class="mb-3">

<label class="form-label">
Medicine Name
</label>

<input type="text"
name="name"
class="form-control"
required>

</div>

<div class="mb-3">

<label class="form-label">
Company Name
</label>

<input type="text"
name="company"
class="form-control"
required>

</div>

<div class="mb-3">

<label class="form-label">
Price
</label>

<input type="number"
name="price"
class="form-control"
required>

</div>

<div class="mb-3">

<label class="form-label">
Quantity
</label>

<input type="number"
name="qty"
class="form-control"
required>

</div>

<button class="btn btn-success w-100">
Save Medicine
</button>

</form>

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