<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cart</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<%

String cart =
(String)session.getAttribute("cart");

if(cart == null)
{
    cart = "";
}

/* DELETE */

String deleteIndex =
request.getParameter("deleteIndex");

if(deleteIndex != null)
{
    int index =
    Integer.parseInt(deleteIndex);

    String items[] =
    cart.split(";");

    String updatedCart = "";

    for(int i=0;i<items.length;i++)
    {
        if(items[i].trim().equals(""))
        {
            continue;
        }

        if(i != index)
        {
            updatedCart +=
            items[i] + ";";
        }
    }

    cart = updatedCart;

    session.setAttribute(
    "cart",
    cart
    );
}

/* UPDATE */

String updateIndex =
request.getParameter("updateIndex");

if(updateIndex != null)
{
    int index =
    Integer.parseInt(updateIndex);

    String newQty =
    request.getParameter("newQty");

    String items[] =
    cart.split(";");

    String updatedCart = "";

    for(int i=0;i<items.length;i++)
    {
        if(items[i].trim().equals(""))
        {
            continue;
        }

        String data[] =
        items[i].split(",");

        if(i == index)
        {
            updatedCart +=
            data[0] + "," +
            data[1] + "," +
            data[2] + "," +
            newQty + ";";
        }
        else
        {
            updatedCart +=
            items[i] + ";";
        }
    }

    cart = updatedCart;

    session.setAttribute(
    "cart",
    cart
    );
}

/* DISPLAY */

String rows = "";

double subtotal = 0;

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

        int productId =
        Integer.parseInt(data[0]);

        String productName =
        data[1];

        double price =
        Double.parseDouble(data[2]);

        int quantity =
        Integer.parseInt(data[3]);

        double amount =
        price * quantity;

        subtotal += amount;

        rows +=

        "<tr>" +

        "<td>" +
        productId +
        "</td>" +

        "<td>" +
        productName +
        "</td>" +

        "<td>" +

        "<form method='post' style='display:flex;gap:5px'>" +

        "<input type='hidden' name='updateIndex' value='" +
        i +
        "'>" +

        "<input type='number' name='newQty' value='" +
        quantity +
        "' class='form-control' style='width:90px'>" +

        "<button class='btn btn-warning btn-sm'>Update</button>" +

        "</form>" +

        "</td>" +

        "<td>" +
        String.format("%.2f", price) +
        "</td>" +

        "<td>" +
        String.format("%.2f", amount) +
        "</td>" +

        "<td>" +

        "<form method='post'>" +

        "<input type='hidden' name='deleteIndex' value='" +
        i +
        "'>" +

        "<button class='btn btn-danger btn-sm'>Delete</button>" +

        "</form>" +

        "</td>" +

        "</tr>";
    }
}

double gst =
subtotal * 0.18;

double total =
subtotal + gst;

session.setAttribute(
"subtotal",
subtotal
);

session.setAttribute(
"gst",
gst
);

session.setAttribute(
"total",
total
);

%>

<div class="container mt-3">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3>View Cart</h3>

</div>

<div class="card-body">

<table class="table table-bordered">

<thead class="table-dark">

<tr>

<th>Product ID</th>

<th>Product Name</th>

<th>Quantity</th>

<th>Price</th>

<th>Amount</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%= rows %>

</tbody>

</table>

<hr>

<h5>

Subtotal :
<%= String.format("%.2f", subtotal) %>

</h5>

<h5>

GST (18%) :
<%= String.format("%.2f", gst) %>

</h5>

<h4>

Total :
<%= String.format("%.2f", total) %>

</h4>

<br>

<a
href="newbill.jsp"
class="btn btn-primary">
Add More Products
</a>

<a
href="generatebill.jsp"
class="btn btn-success">
Generate Bill
</a>

</div>

</div>

</div>

</body>
</html>