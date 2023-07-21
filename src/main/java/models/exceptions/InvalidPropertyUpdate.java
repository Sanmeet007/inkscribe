package models.exceptions;

public class InvalidPropertyUpdate extends Exception {
    public InvalidPropertyUpdate() {
        super("Property is not allowed to be changed");
    }
}
