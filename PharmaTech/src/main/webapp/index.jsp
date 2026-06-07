<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PharmaTech Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">
<%
String msg=
request.getParameter("msg");

if(msg!=null)
{
%>

<div class="alert alert-danger">
    <%=msg%>
</div>

<%
}
%>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-4">

            <div class="card shadow p-4">

                <h2 class="text-center text-primary mb-4">
                    PharmaTech Login
                </h2>

                <!-- directly opens menu.jsp -->
                <form action="logincheck.jsp" method="post">

                    <div class="mb-3">

                        <label class="form-label">
                            Username
                        </label>

                        <input type="text"
                               name="username"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">
                            Password
                        </label>

                        <input type="password"
                               name="password"
                               class="form-control"
                               required>

                    </div>

                    <button class="btn btn-primary w-100">
                        Login
                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

</body>
</html>