package com.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CustomerDao {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("org.postgresql.Driver");

            con = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/productdb",
                "postgres",
                "ragava@2244"
            );

        } 
        catch(Exception e) {

            e.printStackTrace();

        }

        return con;
    }

    public static int save(CustomerDetails c) {

        int status = 0;

        try {

            Connection con = CustomerDao.getConnection();

            System.out.println("Customer Connection Success");

            PreparedStatement ps = con.prepareStatement(

                "INSERT INTO customerdetails(customerid, customername, phone) VALUES (?, ?, ?)"

            );

            ps.setInt(1, c.getCustomerId());
            ps.setString(2, c.getCustomerName());
            ps.setString(3, c.getPhone());
           

            status = ps.executeUpdate();

            System.out.println("Customer Insert Success");

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return status;
    }
}