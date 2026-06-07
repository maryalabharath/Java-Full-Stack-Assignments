package com.servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CartDao {

    public static int save(CartDetails c){

        int status = 0;

        try{

            Connection con =
                ProductDao.getConnection();

            PreparedStatement ps =
                con.prepareStatement(

                "insert into cart(pid,pname,price,qty,total) values(?,?,?,?,?)"

                );

            ps.setInt(1, c.getPid());

            ps.setString(2, c.getPname());

            ps.setDouble(3, c.getPrice());

            ps.setInt(4, c.getQty());

            ps.setDouble(5, c.getTotal());

            status = ps.executeUpdate();

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return status;
    }
}