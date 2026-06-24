<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Customer Search</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
String output = "";
String button = "";
String enteredMobile = "";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    enteredMobile = request.getParameter("mobile");
    try
    {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/pharmastore",
            "postgres",
            "1234"
        );

        PreparedStatement ps = con.prepareStatement( "select * from customers where mobile=?");

        ps.setString(1, enteredMobile);
        ResultSet rs = ps.executeQuery();

        if(rs.next())
        {
            String customerId = String.valueOf(rs.getInt("customer_id"));
            String customerName = rs.getString("customer_name");
            String mobile = rs.getString("mobile");
            String age = String.valueOf(rs.getInt("age"));
            String gender = rs.getString("gender");
            String address = rs.getString("address");
            
            session.setAttribute( "customerId", customerId);
            session.setAttribute( "customerName", customerName);

            output =
            "Customer ID : " + customerId + "<br><br>" +
            "Customer Name : " + customerName + "<br><br>" +
            "Mobile Number : " + mobile + "<br><br>" +
            "Age : " + age + "<br><br>" +
            "Gender : " + gender + "<br><br>" +
            "Address : " + address;

            button = "<a href='newbill.jsp'>" + "<button>Continue Billing</button>" + "</a>";
        }
        else
        {
            output = "Customer Not Found";
            button = "<a href='registercustomer.jsp?mobile=" + enteredMobile + "'>" + "<button>Register Customer</button>" + "</a>";
        }

        con.close();
    }
    catch(Exception e)
    {
        output = e.toString();
    }
}
%>

<div class="container mt-5">
<h1>Customer Search</h1>

<form action="customer.jsp" method="post">

<label> Enter Mobile Number </label>

<input
type="text"
name="mobile"
class="form-control">
<br>

<input
type="submit"
value="Search Customer"
class="btn btn-success">

</form>

<br><br>

<p><%= output %></p>

<%= button %>

</div>
</body>
</html>