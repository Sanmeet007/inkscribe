package models.exceptions;

public class UserNotFound extends Exception {
    public UserNotFound() {
        super("User not found");
    }
}
