<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Database Test</title>
</head>
<body>
<%
Connection con = null;
String message = "";
try
{
    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/pharmastore",
        "postgres",
        "1234"
    );
    message = "Database Connected Successfully";
}
catch(Exception e)
{
    message = e.getMessage();
}
%>

<h1><%= message %></h1>
</body>
</html>