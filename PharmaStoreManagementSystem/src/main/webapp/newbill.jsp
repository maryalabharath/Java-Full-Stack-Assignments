<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Products To Cart</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<%

String message = "";

String customerId =
String.valueOf(
session.getAttribute("customerId")
);

String customerName =
String.valueOf(
session.getAttribute("customerName")
);

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String productId =
    request.getParameter("productId");

    String quantity =
    request.getParameter("quantity");

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
        "select * from products where product_id=?"
        );

        ps.setInt(
        1,
        Integer.parseInt(productId)
        );

        ResultSet rs =
        ps.executeQuery();

        if(rs.next())
        {
            int newQty =
            Integer.parseInt(quantity);

            String cart = "";

            if(session.getAttribute("cart") != null)
            {
                cart =
                session.getAttribute("cart")
                .toString();
            }

            String updatedCart = "";

            boolean productFound = false;

            if(!cart.equals(""))
            {
                String items[] =
                cart.split(";");

                for(int i=0;i<items.length;i++)
                {
                    if(items[i].trim().equals(""))
                    {
                        continue;
                    }

                    String data[] =
                    items[i].split(",");

                    int existingProductId =
                    Integer.parseInt(data[0]);

                    String productName =
                    data[1];

                    double price =
                    Double.parseDouble(data[2]);

                    int existingQty =
                    Integer.parseInt(data[3]);

                    if(existingProductId ==
                       Integer.parseInt(productId))
                    {
                        existingQty =
                        existingQty + newQty;

                        productFound = true;
                    }

                    updatedCart +=
                    existingProductId + "," +
                    productName + "," +
                    price + "," +
                    existingQty + ";";
                }
            }

            if(!productFound)
            {
                updatedCart +=
                rs.getInt("product_id") + "," +
                rs.getString("product_name") + "," +
                rs.getDouble("price") + "," +
                newQty + ";";
            }

            session.setAttribute(
            "cart",
            updatedCart
            );

            message =
            "Product Added To Cart";
        }
        else
        {
            message =
            "Invalid Product ID";
        }

        con.close();
    }
    catch(Exception e)
    {
        message =
        "Unable To Add Product";
    }
}

%>

<div class="container mt-3">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3>Add Products To Cart</h3>

</div>

<div class="card-body">

<h5>

Customer ID :
<%= customerId %>

</h5>

<h5>

Customer Name :
<%= customerName %>

</h5>

<hr>

<form action="newbill.jsp" method="post">

<label>

Product ID

</label>

<input
type="number"
name="productId"
class="form-control"
required>

<br>

<label>

Quantity

</label>

<input
type="number"
name="quantity"
class="form-control"
required>

<br>

<input
type="submit"
value="Add To Cart"
class="btn btn-success">

<a
href="viewcart.jsp"
class="btn btn-primary">
View Cart
</a>

</form>

<br>

<h5 class="text-success">

<%= message %>

</h5>

</div>

</div>

</div>

</body>

</html>