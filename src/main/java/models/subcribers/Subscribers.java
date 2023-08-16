package models.subcribers;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.DbConnect;

public class Subscribers {
    private static Connection conn = DbConnect.instance.getConnection();

    public static void insertSubscriber(String email) throws Exception {
        PreparedStatement ps = conn.prepareStatement("INSERT INTO subscribers(email) VALUES(?)");
        ps.setString(1, email);
        ps.executeUpdate();
    }
}
