package utils.exceptions;

public class AppNameNotDefined extends Exception {
    public AppNameNotDefined() {
        super("App name is not defined. Please define APP_NAME env variable");
    }
}
