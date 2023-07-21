package models.exceptions;

public class UserAlreadyExists extends Exception {
    public UserAlreadyExists() {
        super("User already exists");
    }
}
