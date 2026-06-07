<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PharmaTech Home</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container-fluid">

    <div class="row">

        <!-- Sidebar -->
        <div class="col-md-3 bg-dark min-vh-100 p-3">

            <h3 class="text-white text-center mb-4">
                PharmaTech
            </h3>

            <div class="d-grid gap-2">

                <a href="customer.jsp"
                   class="btn btn-primary">
                   Customer Details
                </a>
                <a href="viewcustomers.jsp"
   class="btn btn-info">
   View Customers
</a>

                <a href="medicine.jsp"
                   class="btn btn-success">
                   Register Medicine
                </a>

                <a href="viewmedicine.jsp"
                   class="btn btn-info">
                   View All Medicine
                </a>

                

                <a href="buymedicine.jsp"
                   class="btn btn-secondary">
                   Buy Medicine
                </a>
                <a href="cart.jsp"
   class="btn btn-info">
   Cart
</a>

                <a href="billing.jsp"
                   class="btn btn-light">
                   Billing Details
                </a>

                <a href="index.jsp"
                   class="btn btn-danger">
                   Logout
                </a>

            </div>

        </div>

       
<div class="col-md-9 bg-light p-5">

    <div class="mb-4">

        <h1 class="text-primary">
    Welcome to PharmaTech
</h1>

<p class="lead">
    Smart Pharmacy Management System
</p>

<p class="mt-3">
    Manage customers, medicines, cart items, billing and stock updates
    quickly and efficiently from one dashboard.
</p>

<p>
    Simplify daily pharmacy operations with easy medicine registration,
    customer tracking and billing management.
</p>

    </div>

    <div class="row g-4">

        <div class="col-md-4">

            <div class="card shadow">

                <div class="card-body text-center">

                    <h5 class="card-title text-primary">
                        Customer Details
                    </h5>

                    <p>
                        Search customer using mobile number and register.
                    </p>

                    <a href="customer.jsp"
                       class="btn btn-primary">
                       Open
                    </a>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card shadow">

                <div class="card-body text-center">

                    <h5 class="card-title text-success">
                        Medicines
                    </h5>

                    <p>
                        Add new medicines and view all stock.
                    </p>

                    <a href="medicine.jsp"
                       class="btn btn-success">
                       Open
                    </a>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card shadow">

                <div class="card-body text-center">

                    <h5 class="card-title text-warning">
                        Billing
                    </h5>

                    <p>
                        Buy medicines and generate billing details.
                    </p>

                    <a href="billing.jsp"
                       class="btn btn-warning">
                       Open
                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

    </div>

</div>

</body>
</html>