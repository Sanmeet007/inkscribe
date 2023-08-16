package servlets.api.exceptions;

public class ForbiddenAccess extends Exception {
    public ForbiddenAccess() {
        super("Forbidden access");
    }

}
