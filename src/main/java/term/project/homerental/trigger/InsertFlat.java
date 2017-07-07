package term.project.homerental.trigger;

import org.h2.api.Trigger;
import org.springframework.stereotype.Repository;

import java.io.InputStream;
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
        Object flatid = newRow[2];
        Object ownerid = newRow[3];
        Object ownername=newRow[4];
        Object proptype=newRow[5];
        Object location= newRow[7];
        Object city=newRow[8];
        Object sqFeet=newRow[11];
        Object bed=newRow[12];
        Object bath=newRow[13];
        Object image=newRow[14];

       // String SQL = "INSERT INTO FLAT VALUES (:fid, :ownerid, :ownername, :proptype, :location, :city, :sq, :bed, :bath)";
        String SQL="INSERT INTO FLAT VALUES (? ,?,?,?,?,?,?,?,?,?)";
        PreparedStatement statement=conn.prepareStatement(SQL);

        statement.setInt(1, (Integer) flatid);
        statement.setInt(2, (Integer) ownerid);
        statement.setString(3, (String) ownername);
        statement.setString(4, (String) proptype);
        statement.setString(5, (String) location);
        statement.setString(6, (String) city);
        statement.setInt(7, (Integer) sqFeet);
        statement.setInt(8, (Integer) bed);
        statement.setInt(9, (Integer) bath);
        statement.setBlob(10, (InputStream) image);
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