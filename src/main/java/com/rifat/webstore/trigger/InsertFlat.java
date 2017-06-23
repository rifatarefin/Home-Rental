package com.rifat.webstore.trigger;

import org.h2.api.Trigger;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Repository
public class InsertFlat implements Trigger {



    @Override
    public void init(Connection connection, String s, String s1, String s2, boolean b, int i) throws SQLException {
        System.out.println("init");

    }

    @Override
    public void fire(Connection conn, Object[] oldRow, Object[] newRow) throws SQLException {
        Object ownerid = newRow[2];
        Object ownername=newRow[3];
        Object proptype=newRow[4];
        Object location= newRow[6];
        Object city=newRow[7];
        Object sqFeet=newRow[10];
        Object bed=newRow[11];
        Object bath=newRow[12];

       // String SQL = "INSERT INTO FLAT VALUES (:fid, :ownerid, :ownername, :proptype, :location, :city, :sq, :bed, :bath)";
        String SQL="INSERT INTO FLAT VALUES (DEFAULT ,?,?,?,?,?,?,?,?)";
        PreparedStatement statement=conn.prepareStatement(SQL);

        statement.setInt(1, (Integer) ownerid);
        statement.setString(2,"Collard");
        statement.setString(3,"Residential");
        statement.setString(4,"ABC");
        statement.setString(5,"Chittagong");
        statement.setInt(6,1560);
        statement.setInt(7,4);
        statement.setInt(8,3);
        statement.executeUpdate();

        System.out.println("fire");



    }


    @Override
    public void close() throws SQLException {

    }

    @Override
    public void remove() throws SQLException {

    }
}