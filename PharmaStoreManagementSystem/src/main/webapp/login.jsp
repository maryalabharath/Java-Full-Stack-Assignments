<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Cashier Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
String message = "";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try
    {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/pharmastore",
            "postgres",
            "1234"
        );

        PreparedStatement ps = con.prepareStatement(
            "select * from cashier where username=? and password=?"
        );

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next())
        {
            response.sendRedirect("dashboard.jsp");
        }
        else
        {
            message = "Invalid Username or Password";
        }
        con.close();
    }
    catch(Exception e)
    {
        message = e.toString();
    }
}
%>
<div class="container">
<div class="row justify-content-center mt-5">
<div class="col-md-4">
<div class="card shadow">
<div class="card-header text-center">

<h3>Cashier Login</h3>

<p class="text-danger text-center">
<%= message %>
</p>

</div>
<div class="card-body">
<form action="login.jsp" method="post">
<div class="mb-3">

<label class="form-label">Username</label>

<input type="text" name="username" class="form-control">

</div>
<div class="mb-3">

<label class="form-label">Password</label>
<input type="password" name="password" class="form-control">

</div>

<input type="submit" value="Login" class="btn btn-primary w-100">

</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>