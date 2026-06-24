<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>View Bills</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<%

String rows = "";

try
{
    Class.forName(
    "org.postgresql.Driver"
    );

    Connection con =
    DriverManager.getConnection(
    "jdbc:postgresql://localhost:5432/pharmastore",
    "postgres",
    "1234"
    );

    PreparedStatement ps =
    con.prepareStatement(

    "select b.bill_id,c.customer_name,b.bill_date,b.total_amount " +
    "from bills b join customers c " +
    "on b.customer_id=c.customer_id " +
    "order by b.bill_id desc"

    );

    ResultSet rs =
    ps.executeQuery();

    while(rs.next())
    {
        rows +=

        "<tr>" +

        "<td>" +
        rs.getInt("bill_id") +
        "</td>" +

        "<td>" +
        rs.getString("customer_name") +
        "</td>" +

        "<td>" +
        rs.getTimestamp("bill_date") +
        "</td>" +

        "<td>" +
        String.format("%.2f",
        rs.getDouble("total_amount")) +
        "</td>" +

        "</tr>";
    }

    con.close();
}
catch(Exception e)
{
    rows =
    "<tr>" +
    "<td colspan='4'>Unable To Load Bills</td>" +
    "</tr>";
}

%>

<div class="container mt-3">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3>View Bills</h3>

</div>

<div class="card-body">

<table class="table table-bordered table-striped">

<thead class="table-dark">

<tr>

<th>Bill ID</th>

<th>Customer Name</th>

<th>Bill Date</th>

<th>Total Amount</th>

</tr>

</thead>

<tbody>

<%= rows %>

</tbody>

</table>

</div>

</div>

</div>

</body>

</html>