package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
    private Connection conn;

    private DbConnect() {

        String connectionString = "jdbc:mysql://" + DbConfig.HOSTNAME + ":" + DbConfig.PORT + "/" + DbConfig.DB;

        try (Connection conn = DriverManager.getConnection(connectionString,
                DbConfig.USER,
                DbConfig.PASSWORD)) {
            System.out.println("connection established");

        } catch (Exception e) {

        }

    }

    public Connection getConnection() {
        return conn;
    }

    public static DbConnect instance = new DbConnect();
}