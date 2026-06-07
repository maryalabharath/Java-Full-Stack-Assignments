<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%
String sid=request.getParameter("id");

if(sid==null)
{
    response.sendRedirect("viewmedicine.jsp");
    return;
}

int id=Integer.parseInt(sid);

String name="";
String company="";
double price=0;
int qty=0;

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
    "select * from medicine where id=?");

    ps.setInt(1,id);

    ResultSet rs=ps.executeQuery();

    if(rs.next())
    {
        name=rs.getString("name");
        company=rs.getString("company");
        price=rs.getDouble("price");
        qty=rs.getInt("qty");
    }
}
catch(Exception e)
{
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Medicine</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow p-4">

<h2 class="text-center text-warning mb-4">
Update Medicine
</h2>

<form action="updatemedicine.jsp">

<input type="hidden"
name="id"
value="<%=id%>">

<div class="mb-3">

<label class="form-label">
Medicine Name
</label>

<input type="text"
name="name"
value="<%=name%>"
class="form-control"required>

</div>

<div class="mb-3">

<label class="form-label">
Company Name
</label>

<input type="text"
name="company"
value="<%=company%>"
class="form-control" required>

</div>

<div class="mb-3">

<label class="form-label">
Price
</label>

<input type="number"
name="price"
step="0.01"
value="<%=price%>"
class="form-control">

</div>

<div class="mb-3">

<label class="form-label">
Quantity
</label>

<input type="number"
name="qty"
value="<%=qty%>"
class="form-control"required>

</div>

<button class="btn btn-warning w-100">
Update
</button>

</form>

<a href="viewmedicine.jsp"
class="btn btn-secondary mt-3 w-100">
Back
</a>

</div>

</div>

</div>

</div>

</body>
</html>