package utils;

import java.nio.file.Path;
import java.nio.file.Paths;

import io.github.cdimascio.dotenv.Dotenv;
import utils.exceptions.AppNameNotDefined;

public class Config {
    final public static String APP_NAME;

    static {
        Dotenv.configure();
        Dotenv envVariables = Dotenv.load();
        APP_NAME = envVariables.get("APP_NAME");
    }

    public static String getAppRootPath() throws Exception {
        Path root = Paths.get(".").normalize().toAbsolutePath();
        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }
        Path path = root.resolve("../webapps/" + APP_NAME);
        return path.normalize().toString();
    }

    public static String resolvePath(String filePath) throws Exception {
        Path root = Paths.get(".").normalize().toAbsolutePath();

        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }

        Path path = root.resolve("../webapps/" + APP_NAME + "/" + filePath);
        return path.normalize().toString();
    }

}
