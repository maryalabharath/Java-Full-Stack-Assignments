<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>View Products</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<%

String message = "";

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

    String action =
    request.getParameter("action");

    if(action != null)
    {
        int productId =
        Integer.parseInt(
        request.getParameter("productId")
        );

        if(action.equals("update"))
        {
            PreparedStatement ps =
            con.prepareStatement(

            "update products set product_name=?, category=?, price=?, stock_quantity=?, expiry_date=? where product_id=?"

            );

            ps.setString(
            1,
            request.getParameter("productName")
            );

            ps.setString(
            2,
            request.getParameter("category")
            );

            ps.setDouble(
            3,
            Double.parseDouble(
            request.getParameter("price")
            )
            );

            ps.setInt(
            4,
            Integer.parseInt(
            request.getParameter("stock")
            )
            );

            ps.setDate(
            5,
            java.sql.Date.valueOf(
            request.getParameter("expiryDate")
            )
            );

            ps.setInt(
            6,
            productId
            );

            ps.executeUpdate();

            message =
            "Product Updated Successfully";
        }

        if(action.equals("delete"))
        {
            PreparedStatement check =
            con.prepareStatement(

            "select stock_quantity from products where product_id=?"

            );

            check.setInt(
            1,
            productId
            );

            ResultSet rs =
            check.executeQuery();

            if(rs.next())
            {
                int stock =
                rs.getInt(
                "stock_quantity"
                );

                if(stock > 0)
                {
                    message =
                    "Cannot Delete Product With Available Stock";
                }
                else
                {
                    PreparedStatement deletePs =
                    con.prepareStatement(

                    "delete from products where product_id=?"

                    );

                    deletePs.setInt(
                    1,
                    productId
                    );

                    deletePs.executeUpdate();

                    message =
                    "Product Deleted Successfully";
                }
            }
        }
    }

    String rows = "";

    PreparedStatement ps =
    con.prepareStatement(

    "select * from products order by product_id"

    );

    ResultSet rs =
    ps.executeQuery();

    while(rs.next())
    {
        rows +=

        "<tr>" +

        "<form method='post'>" +

        "<td>" +

        rs.getInt("product_id") +

        "<input type='hidden' name='productId' value='" +

        rs.getInt("product_id") +

        "'>" +

        "</td>" +

        "<td>" +

        "<input type='text' " +
        "name='productName' " +
        "value='" +

        rs.getString("product_name") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='text' " +
        "name='category' " +
        "value='" +

        rs.getString("category") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='number' " +
        "step='0.01' " +
        "name='price' " +
        "value='" +

        rs.getDouble("price") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='number' " +
        "name='stock' " +
        "value='" +

        rs.getInt("stock_quantity") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<input type='date' " +
        "name='expiryDate' " +
        "value='" +

        rs.getDate("expiry_date") +

        "' class='form-control'>" +

        "</td>" +

        "<td>" +

        "<button " +
        "name='action' " +
        "value='update' " +
        "class='btn btn-warning btn-sm'>" +

        "Save" +

        "</button> " +

        "<button " +
        "name='action' " +
        "value='delete' " +
        "class='btn btn-danger btn-sm'>" +

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

<h3>View Products</h3>

</div>

<div class="card-body">

<h5 class="text-primary">

<%= message %>

</h5>

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>Product ID</th>

<th>Product Name</th>

<th>Category</th>

<th>Price</th>

<th>Stock</th>

<th>Expiry Date</th>

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
    "<h3 class='text-danger'>Error : " +
    e.getMessage() +
    "</h3>"
    );
}

%>

</body>

</html>