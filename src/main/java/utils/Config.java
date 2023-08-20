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

    public static Path getPath(String filePath) throws Exception {
        Path root = Paths.get(".").normalize().toAbsolutePath();
        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }
        Path path = root.resolve("../webapps/" + APP_NAME + "/" + filePath);
        return path.normalize();
    }

    public static Path getUploadPath(String filePath) throws Exception {
        Path root = Paths.get(".").normalize().toAbsolutePath();
        if (APP_NAME == null) {
            throw new AppNameNotDefined();
        }
        File dir = new File(root.resolve("../webapps/" + APP_NAME + "/uploads/").normalize().toString());

        boolean dirMade = false;

        if (!dir.exists()) {
            dirMade = dir.mkdirs();
        } else {
            dirMade = true;
        }

        if (dirMade) {
            Path path = root.resolve("../webapps/" + APP_NAME + "/uploads/" + filePath);
            return path.normalize();
        } else {
            throw new IOException("Upload dir cannot be created");
        }

    }

    public static String getUploadFileUrl(String fileName) {
        if (APP_NAME.equals("ROOT")) {
            return "/" + APP_NAME + "/uploads/" + fileName;
        } else {
            return "/uploads/" + fileName;
        }
    }

    public static String getUploadFileUrlFromRoot(String fileName) {
        return "/uploads/" + fileName;
    }
}
