package utils;

import java.io.File;
import java.io.IOException;
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
        String appName = APP_NAME;

        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }
        if (APP_NAME == "ROOT") {
            appName = "";
        }
        Path path = root.resolve("../webapps/" + appName);
        return path.normalize().toString();
    }

    public static String resolvePath(String filePath) throws Exception {
        Path root = Paths.get(".").normalize().toAbsolutePath();
        String appName = APP_NAME;

        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }
        if (APP_NAME == "ROOT") {
            appName = "";
        }

        Path path = root.resolve("../webapps/" + appName + "/" + filePath);
        return path.normalize().toString();
    }

    public static Path getPath(String filePath) throws Exception {
        Path root = Paths.get(".").normalize().toAbsolutePath();
        String appName = APP_NAME;
        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }
        if (APP_NAME == "ROOT") {
            appName = "";
        }

        Path path = root.resolve("../webapps/" + appName + "/" + filePath);
        return path.normalize();
    }

    public static Path getUploadPath(String filePath) throws Exception {
        Path root = Paths.get(".").normalize().toAbsolutePath();
        String appName = APP_NAME;
        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }
        if (APP_NAME == "ROOT") {
            appName = "";
        }

        File dir = new File(root.resolve("../webapps/" + appName + "/uploads/").normalize().toString());
        boolean dirMade = false;

        if (!dir.exists()) {
            dirMade = dir.mkdir();
        } else {
            dirMade = true;
        }

        if (dirMade) {
            Path path = root.resolve("../webapps/" + appName + "/uploads/" + filePath);
            return path.normalize();
        } else {
            throw new IOException("Upload dir cannot be created");
        }

    }

    public static String getUploadFileUrl(String fileName) {
        return "http://localhost:8080/app/uploads/" + fileName;
    }

}
