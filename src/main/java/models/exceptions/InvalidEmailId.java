package models.exceptions;

public class InvalidEmailId extends Exception {
    public InvalidEmailId() {
        super("User with specified email doesn't exists");
    }
}
