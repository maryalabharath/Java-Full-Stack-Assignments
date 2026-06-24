<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<%
int totalCustomers = 0;
int totalProducts = 0;
int totalBills = 0;
double revenue = 0;

try
{
    Class.forName("org.postgresql.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:postgresql://localhost:5432/pharmastore",
    "postgres",
    "1234"
    );

    PreparedStatement ps1 = con.prepareStatement(
    "select count(*) from customers"
    );

    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next())
    {
        totalCustomers = rs1.getInt(1);
    }

    PreparedStatement ps2 = con.prepareStatement(
    "select count(*) from products"
    );

    ResultSet rs2 = ps2.executeQuery();

    if(rs2.next())
    {
        totalProducts = rs2.getInt(1);
    }

    PreparedStatement ps3 = con.prepareStatement(
    "select count(*) from bills"
    );

    ResultSet rs3 = ps3.executeQuery();

    if(rs3.next())
    {
        totalBills = rs3.getInt(1);
    }

    PreparedStatement ps4 = con.prepareStatement(
    "select coalesce(sum(total_amount),0) from bills"
    );

    ResultSet rs4 = ps4.executeQuery();

    if(rs4.next())
    {
        revenue = rs4.getDouble(1);
    }

    con.close();
}
catch(Exception e)
{
}

%>

<div class="container-fluid p-4">
<h2>
Welcome Admin
</h2>

<hr>

<div class="row">
<div class="col-md-3">
<div class="card shadow p-3 text-center">

<h5>Total Customers</h5>

<h3> <%= totalCustomers %> </h3>

</div>
</div>
<div class="col-md-3">
<div class="card shadow p-3 text-center">

<h5>Total Products</h5>

<h3> <%= totalProducts %> </h3>

</div>
</div>

<div class="col-md-3">
<div class="card shadow p-3 text-center">

<h5>Total Bills</h5>
<h3>

<%= totalBills %>

</h3>
</div>
</div>

<div class="col-md-3">
<div class="card shadow p-3 text-center">

<h5>Revenue</h5>

<h3> INR <%= String.format("%.2f", revenue) %> </h3>

</div>
</div>
</div>

<br>

<div class="card shadow p-4">

<h4> Dashboard Overview </h4>

<p>

Welcome to Pharma Store Management And Billing System.

Use the menu on the left side to manage customers,
products and billing.

</p>

</div>
</div>
</body>
</html>