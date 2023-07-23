package db;

import java.util.Properties;

import io.github.cdimascio.dotenv.Dotenv;

public class DbConfig {
    public static boolean errorLogging = false;
    private final static String USER, PASSWORD, HOSTNAME, PORT, DB_NAME, SALT_STRING;

    static public String getConnectionString() {
        return "jdbc:mysql://" + HOSTNAME + ":" + PORT + "/" + DB_NAME + "?useSSL=false&allowPublicKeyRetrieval=true";
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
        USER = envVariables.get("DB_USER");
        PASSWORD = envVariables.get("DB_PASSWORD");
        DB_NAME = envVariables.get("DB_NAME");
        HOSTNAME = envVariables.get("DB_HOST");
        PORT = envVariables.get("DB_PORT");
        SALT_STRING = envVariables.get("SECURITY_STRING");
    }
}
