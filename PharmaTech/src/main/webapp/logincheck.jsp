<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String username="raghavendra08";
String password="raghav2004";
String name = request.getParameter("username");
String pass = request.getParameter("password");
if(username.equals(name) && password.equals(pass)  ){
	response.sendRedirect("menu.jsp");
}
else{
	response.sendRedirect(
		    "index.jsp?msg=Invalid Username or Password");
}



%>


</body>
</html>