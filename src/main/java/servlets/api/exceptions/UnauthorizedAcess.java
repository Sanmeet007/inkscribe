package servlets.api.exceptions;

public class UnauthorizedAcess extends Exception {
    public UnauthorizedAcess() {
        super("Unauthorized user trying to access protected resource");
    }
}
