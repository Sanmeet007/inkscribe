package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
    private Connection conn;

    private DbConnect() {

        try (Connection conn = DriverManager.getConnection(DbConfig.getConnectionString(), DbConfig.getProperties())) {

        } catch (Exception e) {
            if (DbConfig.errorLogging) {
                e.printStackTrace();
            } else {
                System.out.println("Unable to establish connection");
            }
        }

    }

    public Connection getConnection() {
        return conn;
    }

    public static DbConnect instance = new DbConnect();
}