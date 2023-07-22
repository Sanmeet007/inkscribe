package servlets.api.exceptions;

public class EmptyFieldsNotAllowed extends Exception {
    public EmptyFieldsNotAllowed() {
        super("One or more fields can't be null or empty");
    }
}
