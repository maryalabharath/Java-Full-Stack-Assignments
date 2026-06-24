<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Generate Bill</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<%

String message = "";

int billId = 0;

double subtotal = 0;
double gst = 0;
double total = 0;

String customerId = "";
String customerName = "";
String cart = "";

String billRows = "";

try
{
    if(session.getAttribute("customerId") != null)
    {
        customerId =
        session.getAttribute("customerId")
        .toString();
    }

    if(session.getAttribute("customerName") != null)
    {
        customerName =
        session.getAttribute("customerName")
        .toString();
    }

    if(session.getAttribute("cart") != null)
    {
        cart =
        session.getAttribute("cart")
        .toString();
    }

    if(session.getAttribute("subtotal") != null)
    {
        subtotal =
        Double.parseDouble(
        session.getAttribute("subtotal")
        .toString()
        );
    }

    if(session.getAttribute("gst") != null)
    {
        gst =
        Double.parseDouble(
        session.getAttribute("gst")
        .toString()
        );
    }

    if(session.getAttribute("total") != null)
    {
        total =
        Double.parseDouble(
        session.getAttribute("total")
        .toString()
        );
    }

    if(cart.equals(""))
    {
        throw new Exception(
        "Cart Is Empty"
        );
    }

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

    "insert into bills(customer_id,bill_date,subtotal,gst,total_amount) values(?,?,?,?,?)",

    Statement.RETURN_GENERATED_KEYS
    );

    ps.setInt(
    1,
    Integer.parseInt(customerId)
    );

    ps.setTimestamp(
    2,
    new Timestamp(
    System.currentTimeMillis()
    )
    );

    ps.setDouble(
    3,
    subtotal
    );

    ps.setDouble(
    4,
    gst
    );

    ps.setDouble(
    5,
    total
    );

    ps.executeUpdate();

    ResultSet generatedKeys =
    ps.getGeneratedKeys();

    if(generatedKeys.next())
    {
        billId =
        generatedKeys.getInt(1);
    }

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

        billRows +=

        "<tr>" +

        "<td>" +
        productId +
        "</td>" +

        "<td>" +
        productName +
        "</td>" +

        "<td>" +
        quantity +
        "</td>" +

        "<td>" +
        String.format("%.2f",price) +
        "</td>" +

        "<td>" +
        String.format("%.2f",amount) +
        "</td>" +

        "</tr>";

        PreparedStatement itemPs =
        con.prepareStatement(
        "insert into bill_items(bill_id,product_id,quantity,amount) values(?,?,?,?)"
        );

        itemPs.setInt(
        1,
        billId
        );

        itemPs.setInt(
        2,
        productId
        );

        itemPs.setInt(
        3,
        quantity
        );

        itemPs.setDouble(
        4,
        amount
        );

        itemPs.executeUpdate();

        PreparedStatement stockPs =
        con.prepareStatement(
        "update products set stock_quantity=stock_quantity-? where product_id=?"
        );

        stockPs.setInt(
        1,
        quantity
        );

        stockPs.setInt(
        2,
        productId
        );

        stockPs.executeUpdate();
    }

    message =
    "Bill Generated Successfully";

    session.removeAttribute("cart");
    session.removeAttribute("subtotal");
    session.removeAttribute("gst");
    session.removeAttribute("total");

    con.close();
}
catch(Exception e)
{
    message =
    "Unable To Generate Bill";
}

%>

<div class="container mt-3">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h2>Pharma Billing System</h2>

</div>

<div class="card-body">

<h3 class="text-success">

<%= message %>

</h3>

<hr>

<h5>

Bill ID :
<%= billId %>

</h5>

<h5>

Customer ID :
<%= customerId %>

</h5>

<h5>

Customer Name :
<%= customerName %>

</h5>

<h5>

Date :
<%= new java.util.Date() %>

</h5>

<hr>

<h4>Purchased Medicines</h4>

<table class="table table-bordered">

<thead class="table-dark">

<tr>

<th>Product ID</th>

<th>Product Name</th>

<th>Quantity</th>

<th>Price</th>

<th>Amount</th>

</tr>

</thead>

<tbody>

<%= billRows %>

</tbody>

</table>

<hr>

<table class="table table-bordered">

<tr>

<th>Subtotal</th>

<td>

<%= String.format("%.2f",subtotal) %>

</td>

</tr>

<tr>

<th>GST (18%)</th>

<td>

<%= String.format("%.2f",gst) %>

</td>

</tr>

<tr>

<th>Total Amount</th>

<td>

<b>

<%= String.format("%.2f",total) %>

</b>

</td>

</tr>

</table>

<div class="alert alert-success">

Thank You For Shopping With Us

</div>

<a
href="customer.jsp"
class="btn btn-primary">

New Billing

</a>

<a
href="viewbills.jsp"
class="btn btn-success">

View Bills

</a>

</div>

</div>

</div>

</body>

</html>