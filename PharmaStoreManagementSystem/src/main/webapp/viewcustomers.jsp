<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Customers</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<%
String message = "";
try
{
    Class.forName("org.postgresql.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:postgresql://localhost:5432/pharmastore",
    "postgres",
    "1234"
    );

    String action = request.getParameter("action");

    if(action != null)
    {
        int customerId = Integer.parseInt( request.getParameter("customerId"));
        if(action.equals("update"))
        {
            PreparedStatement ps = con.prepareStatement("update customers set customer_name=?, mobile=?, age=?, gender=?, address=? where customer_id=?");
            ps.setString(1,request.getParameter("customerName"));
            ps.setString(2,request.getParameter("mobile"));
            ps.setInt(3,Integer.parseInt(request.getParameter("age")));

            ps.setString(4,request.getParameter("gender"));
            ps.setString(5,request.getParameter("address"));
            ps.setInt(6,customerId);
            ps.executeUpdate();

            message ="Customer Updated Successfully";
        }

        if(action.equals("delete"))
        {
            PreparedStatement ps = con.prepareStatement("delete from customers where customer_id=?");
            ps.setInt(1,customerId);
            ps.executeUpdate();

            message = "Customer Deleted Successfully";
        }
    }

    String rows = "";

    PreparedStatement ps = con.prepareStatement("select * from customers order by customer_id");
    ResultSet rs = ps.executeQuery();

    while(rs.next())
    {
        rows += "<tr>" + "<form method='post'>" + "<td>" +
        rs.getInt("customer_id") +

        "<input type='hidden' name='customerId' value='" +

        rs.getInt("customer_id") +

        "'>" +

        "</td>" +

        "<td>" +

        "<input type='text' name='customerName' value='" +

        rs.getString("customer_name") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='text' name='mobile' value='" +

        rs.getString("mobile") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='number' name='age' value='" +

        rs.getInt("age") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='text' name='gender' value='" +

        rs.getString("gender") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='text' name='address' value='" +

        rs.getString("address") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<button name='action' value='update' class='btn btn-warning btn-sm'>" +

        "Save" +

        "</button> " +

        "<button name='action' value='delete' class='btn btn-danger btn-sm'>" +

        "Delete" +

        "</button>" +

        "</td>" +

        "</form>" +

        "</tr>";
    }

%>

<div class="container mt-3">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3>View Customers</h3>

</div>

<div class="card-body">

<h5 class="text-primary">

<%= message %>

</h5>

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>ID</th>

<th>Name</th>

<th>Mobile</th>

<th>Age</th>

<th>Gender</th>

<th>Address</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%= rows %>

</tbody>

</table>

</div>

</div>

</div>

<%

con.close();
}
catch(Exception e)
{
    out.println(
    "<h4 class='text-danger'>Error : " +
    e.getMessage() +
    "</h4>"
    );
}

%>

</body>

</html>