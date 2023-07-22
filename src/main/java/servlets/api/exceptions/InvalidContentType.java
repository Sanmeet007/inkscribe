package servlets.api.exceptions;

public class InvalidContentType extends Exception {
    public InvalidContentType() {
        super("Invalid content type");
    }
}
