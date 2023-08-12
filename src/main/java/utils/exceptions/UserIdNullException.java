package utils.exceptions;

public class UserIdNullException extends Exception {
    public UserIdNullException() {
        super("Got null for user id");
    }
}
