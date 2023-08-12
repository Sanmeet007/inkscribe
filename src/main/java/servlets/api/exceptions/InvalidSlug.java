package servlets.api.exceptions;

public class InvalidSlug extends Exception {
    public InvalidSlug() {
        super("Invalid slug provided");
    }

}
