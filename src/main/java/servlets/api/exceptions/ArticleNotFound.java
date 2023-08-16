package servlets.api.exceptions;

public class ArticleNotFound extends Exception {
    public ArticleNotFound() {
        super("Article not found");
    }
}
