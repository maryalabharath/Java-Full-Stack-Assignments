package com.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("org.postgresql.Driver");

            con = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/productdb",
                "postgres",
                "ragava@2244"
            );

        } catch(Exception e) {
            System.out.println(e);
        }

        return con;
    }

    public static int save(ProductDetails p) {

        int status = 0;

        try {

            Connection con = ProductDao.getConnection();

            System.out.println("Connection Success");

            PreparedStatement ps = con.prepareStatement(

            "INSERT INTO productdetails(productId, productname, description, brand, category, price, quantity, manufacturedate, expirydate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"

            );

            ps.setInt(1, p.getId());
            ps.setString(2, p.getProductName());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getBrand());
            ps.setString(5, p.getCategory());
            ps.setDouble(6, p.getPrice());
            ps.setInt(7, p.getQuantity());
            ps.setString(8, p.getManufactureDate());
            ps.setString(9, p.getExpiryDate());

            status = ps.executeUpdate();

            //System.out.println("Insert Success");

            con.close();

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public static List<ProductDetails> getAllProducts() {

        List<ProductDetails> listproducts = new ArrayList<>();

        try {

            Connection con = ProductDao.getConnection();

            PreparedStatement ps = con.prepareStatement(

                "select * from productdetails"

            );

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                ProductDetails p = new ProductDetails();

                p.setId(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setBrand(rs.getString(4));
                p.setCategory(rs.getString(5));
                p.setPrice(rs.getDouble(6));
                p.setQuantity(rs.getInt(7));
                p.setManufactureDate(rs.getString(8));
                p.setExpiryDate(rs.getString(9));
                listproducts.add(p);
            }
            con.close();

        }
        catch(Exception ex) {

            ex.printStackTrace();

        }

        return listproducts;
    }
}