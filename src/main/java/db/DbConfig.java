package db;

import java.util.Properties;

import io.github.cdimascio.dotenv.Dotenv;

public class DbConfig {
    public static boolean errorLogging = false;
    private final static String USER, PASSWORD, HOSTNAME, PORT, DB, SALT_STRING;

    static public String getConnectionString() {
        return "jdbc:mysql://" + HOSTNAME + ":" + PORT + "/" + DB;
    }

    public static Properties getProperties() {
        Properties props = new Properties(2);
        props.put("user", DbConfig.USER);
        props.put("password", DbConfig.PASSWORD);

        return props;
    }

    public static String getSalt() {
        return SALT_STRING;
    }

    static {
        Dotenv.configure();
        Dotenv envVariables = Dotenv.load();
        USER = envVariables.get("USER");
        PASSWORD = envVariables.get("PASSWORD");
        DB = envVariables.get("DB");
        HOSTNAME = envVariables.get("DB_HOST");
        PORT = envVariables.get("DB_PORT");
        SALT_STRING = envVariables.get("SECURITY_STRING");
    }
}
