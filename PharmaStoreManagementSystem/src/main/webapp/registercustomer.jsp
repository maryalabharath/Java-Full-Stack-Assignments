<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Register Customer</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
String message = "";
String mobile = request.getParameter("mobile");

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String customerName = request.getParameter("customerName");
    mobile = request.getParameter("mobile");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");

    String address = request.getParameter("address");

    if(customerName.equals("") || mobile.equals("") || age.equals("") || address.equals(""))
    {
        message = "Please Fill All Fields";
    }
    else if(!customerName.matches("[a-zA-Z ]+"))
    {
        message = "Customer Name Must Contain Only Letters";
    }
    else if(!mobile.matches("[0-9]{10}"))
    {
        message = "Mobile Number Must Be 10 Digits";
    }
    else if(Integer.parseInt(age) <= 0 || Integer.parseInt(age) > 120)
    {
        message = "Enter Valid Age";
    }
    else
    {
        try
        {
            Class.forName("org.postgresql.Driver");

            Connection con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/pharmastore",
            "postgres",
            "1234"
            );

            PreparedStatement check = con.prepareStatement(
            "select * from customers where mobile=?"
            );

            check.setString(1, mobile);

            ResultSet checkRs = check.executeQuery();

            if(checkRs.next())
            {
                message = "Customer Already Exists";
            }
            else
            {
                PreparedStatement ps = con.prepareStatement(
                "insert into customers(customer_name,mobile,age,gender,address) values(?,?,?,?,?)"
                );

                ps.setString(1, customerName);
                ps.setString(2, mobile);
                ps.setInt(3, Integer.parseInt(age));
                ps.setString(4, gender);
                ps.setString(5, address);

                ps.executeUpdate();

                PreparedStatement ps2 = con.prepareStatement(
                "select * from customers where mobile=?"
                );

                ps2.setString(1, mobile);

                ResultSet rs = ps2.executeQuery();

                if(rs.next())
                {
                    session.setAttribute("customerId", rs.getInt("customer_id"));
                    session.setAttribute("customerName", rs.getString("customer_name"));
                    response.sendRedirect("newbill.jsp");
                }
            }

            con.close();
        }
        catch(Exception e)
        {
            message ="Unable To Save Customer";
        }
    }
}
%>

<div class="container mt-5">
<div class="card shadow">
<div class="card-header bg-success text-white">

<h3>Register Customer</h3>

</div>
<div class="card-body">

<form action="registercustomer.jsp" method="post">

<label>Customer Name</label>

<input
type="text"
name="customerName"
class="form-control">

<br>

<label>Mobile Number</label>

<input
type="text"
name="mobile"
value="<%= mobile %>"
class="form-control">

<br>

<label>Age</label>

<input
type="number"
name="age"
class="form-control">

<br>

<label>Gender</label>

<select
name="gender"
class="form-control">

<option>Male</option>
<option>Female</option>
<option>Other</option>

</select>

<br>

<label>Address</label>

<textarea
name="address"
class="form-control">
</textarea>

<br>

<input
type="submit"
value="Save Customer"
class="btn btn-success">

</form>

<br>

<p class="text-danger">
<%= message %>
</p>

</div>
</div>
</div>
<div class="container mt-3">

</div>
</body>
</html>