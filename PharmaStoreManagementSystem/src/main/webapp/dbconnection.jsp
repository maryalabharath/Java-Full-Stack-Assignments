<%@ page import="java.sql.*" %>

<%
Connection con = null;
try
{
    Class.forName("org.postgresql.Driver");

    con = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/pharmastore",
        "postgres",
        "1234"
    );
}
catch(Exception e)
{
    out.println(e);
}
%>