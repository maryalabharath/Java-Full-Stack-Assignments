<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Product</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<%

String message = "";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String productId =
    request.getParameter("productId");

    String productName =
    request.getParameter("productName");

    String category =
    request.getParameter("category");

    String price =
    request.getParameter("price");

    String stockQuantity =
    request.getParameter("stockQuantity");

    String expiryDate =
    request.getParameter("expiryDate");

    if(productId == null || productId.trim().equals("") ||
       productName == null || productName.trim().equals("") ||
       category == null || category.trim().equals("") ||
       price == null || price.trim().equals("") ||
       stockQuantity == null || stockQuantity.trim().equals("") ||
       expiryDate == null || expiryDate.trim().equals(""))
    {
        message =
        "Please Fill All Fields";
    }
    else if(Double.parseDouble(price) <= 0)
    {
        message =
        "Price Must Be Greater Than Zero";
    }
    else if(Integer.parseInt(stockQuantity) < 0)
    {
        message =
        "Stock Quantity Cannot Be Negative";
    }
    else
    {
        try
        {
            Class.forName("org.postgresql.Driver");

            Connection con =
            DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/pharmastore",
            "postgres",
            "1234"
            );

            PreparedStatement check =
            con.prepareStatement(
            "select * from products where product_id=?"
            );

            check.setInt(
            1,
            Integer.parseInt(productId)
            );

            ResultSet rs =
            check.executeQuery();

            if(rs.next())
            {
                message =
                "Product ID Already Exists";
            }
            else
            {
                PreparedStatement ps =
                con.prepareStatement(
                "insert into products(product_id,product_name,category,price,stock_quantity,expiry_date) values(?,?,?,?,?,?)"
                );

                ps.setInt(
                1,
                Integer.parseInt(productId)
                );

                ps.setString(
                2,
                productName
                );

                ps.setString(
                3,
                category
                );

                ps.setDouble(
                4,
                Double.parseDouble(price)
                );

                ps.setInt(
                5,
                Integer.parseInt(stockQuantity)
                );

                ps.setDate(
                6,
                java.sql.Date.valueOf(expiryDate)
                );

                ps.executeUpdate();

                message =
                "Product Added Successfully";
            }

            con.close();
        }
        catch(Exception e)
        {
            message =
            "Unable To Save Product";
        }
    }
}

%>

<div class="container mt-3">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3>Add Product</h3>

</div>

<div class="card-body">

<form action="addproduct.jsp" method="post">

<label>Product ID</label>

<input
type="number"
name="productId"
class="form-control"
required>

<br>

<label>Product Name</label>

<input
type="text"
name="productName"
class="form-control"
required>

<br>

<label>Category</label>

<input
type="text"
name="category"
class="form-control"
required>

<br>

<label>Price</label>

<input
type="number"
step="0.01"
name="price"
class="form-control"
required>

<br>

<label>Stock Quantity</label>

<input
type="number"
name="stockQuantity"
class="form-control"
required>

<br>

<label>Expiry Date</label>

<input
type="date"
name="expiryDate"
class="form-control"
required>

<br>

<input
type="submit"
value="Save Product"
class="btn btn-success">

</form>

<br>

<h5 class="text-primary">

<%= message %>

</h5>

</div>

</div>

</div>

</body>

</html>