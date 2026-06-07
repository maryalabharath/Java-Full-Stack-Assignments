<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Medicines</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<h2 class="text-center text-primary mb-4">
View All Medicines
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
    "select * from medicine order by id");

    ResultSet rs=ps.executeQuery();

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
                <strong>Company:</strong>
                <%=rs.getString("company")%>
            </p>

            <p>
                <strong>Price:</strong>
                ₹<%=rs.getDouble("price")%>
            </p>

            <p>
                <strong>Quantity:</strong>
                <%=rs.getInt("qty")%>
            </p>

            <div class="d-grid gap-2">

                <a href="update.jsp?id=<%=rs.getInt("id")%>"
   class="btn btn-warning">
   Update
</a>

                <a href="deletemedicine.jsp?id=<%=rs.getInt("id")%>"
                   class="btn btn-danger">
                   Delete
                </a>

            </div>

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