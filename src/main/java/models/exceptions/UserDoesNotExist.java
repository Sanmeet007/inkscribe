package models.exceptions;

public class UserDoesNotExist extends Exception {
    public UserDoesNotExist() {
        super("User doesn't exists");
    }
}
