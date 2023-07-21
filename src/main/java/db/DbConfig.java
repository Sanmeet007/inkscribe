package db;

import io.github.cdimascio.dotenv.Dotenv;

public class DbConfig {
    public final static String USER, PASSWORD, HOSTNAME, PORT, DB;

    static {
        Dotenv.configure();
        Dotenv envVariables = Dotenv.load();
        USER = envVariables.get("USER");
        PASSWORD = envVariables.get("PASSWORD");
        DB = envVariables.get("DB");
        HOSTNAME = envVariables.get("DB_HOST");
        PORT = envVariables.get("DB_PORT");
    }
}
