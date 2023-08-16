package db;

import java.util.Properties;

import io.github.cdimascio.dotenv.Dotenv;

public class DbConfig {
    public static boolean errorLogging = false;
    private final static String USER, PASSWORD, HOSTNAME, PORT, DB_NAME, SALT_STRING, ADMIN_EMAIL, URI;

    static public String getConnectionString() {
        return "jdbc:mysql://" + HOSTNAME + ":" + PORT + "/" + DB_NAME + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    public static String getURI() {
        return URI;
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

    public static String getAdminEmail() {
        return ADMIN_EMAIL;
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
        ADMIN_EMAIL = envVariables.get("ADMIN_EMAIL");
        URI = envVariables.get("URI");
    }
}
