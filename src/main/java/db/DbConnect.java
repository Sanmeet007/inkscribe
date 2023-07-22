package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
    private Connection conn;

    private DbConnect() {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            Connection conn = DriverManager.getConnection(DbConfig.getConnectionString(),
                    DbConfig.getProperties());
            this.conn = conn;
        } catch (Exception e) {
            if (DbConfig.errorLogging) {
                e.printStackTrace();
            } else {
                System.out.println("Unable to establish connection");
            }
        }

    }

    public void close() throws SQLException {
        conn.close();
    }

    public Connection getConnection() {
        return conn;
    }

    public static DbConnect instance = new DbConnect();
}