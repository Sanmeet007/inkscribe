package models.articles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DbConnect;

public class Articles {
    private static Connection conn = DbConnect.instance.getConnection();

    public static Article getArticle(int articleId) throws Exception {
        Article article = null;
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_article_details(?, null)");
        statement.setInt(1, articleId);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            if (resultSet.getString("id") == null) {
                return article;
            }
            article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getString("featured_image_url"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));

            break;
        }
        return article;
    }

    public static Article getArticle(String articleSlug) throws Exception {
        Article article = null;
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_article_details_by_slug(?, null)");
        statement.setString(1, articleSlug);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            if (resultSet.getString("id") == null) {
                return article;
            }
            article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getString("featured_image_url"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));

            break;
        }
        return article;
    }

    public static Article getArticleForUser(int articleId, int userId) throws Exception {
        Article article = null;
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_article_details(?, ?)");
        statement.setInt(1, articleId);
        statement.setInt(2, userId);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            if (resultSet.getString("id") == null) {
                return article;
            }
            article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getString("featured_image_url"),

                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));

            break;
        }
        return article;
    }

    public static Article getArticleForUser(String articleSlug, int userId) throws Exception {
        Article article = null;
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_article_details_by_slug(?, ?)");
        statement.setString(1, articleSlug);
        statement.setInt(2, userId);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            if (resultSet.getString("id") == null) {
                return article;
            }
            article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getString("featured_image_url"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));
            break;
        }
        return article;
    }

    public static ArrayList<Article> getArticles() throws Exception {
        ArrayList<Article> articles = new ArrayList<Article>();
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_articles()");

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            if (resultSet.getString("id") == null) {
                return articles;
            }

            Article article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getString("featured_image_url"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));

            articles.add(article);

        }
        return articles;
    }

    public static ArrayList<Article> getArticlesByUserId(int userId) throws Exception {
        ArrayList<Article> articles = new ArrayList<Article>();
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_articles_by_user_id(?)");

        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            if (resultSet.getString("id") == null) {
                return articles;
            }
            Article article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getString("featured_image_url"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));

            articles.add(article);
        }
        return articles;
    }

    // add comment
    // Increment like and disllike
    // update article view count
    // edit article with user id and article id
    // edit article with article id
    // delete article
    // create article
    // get article types

    public static ArrayList<ArticleResponse> getArticleResponses(String slug) throws Exception {
        ArrayList<ArticleResponse> responses = new ArrayList<ArticleResponse>();
        PreparedStatement statement = conn.prepareStatement("call get_article_comments_by_slug(?)");
        statement.setString(1, slug);

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            if (resultSet.getString("id") == null) {
                return responses;
            }
            ArticleResponse response = new ArticleResponse(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("content"),
                    resultSet.getInt("article_id"),
                    resultSet.getInt("user_id"),
                    resultSet.getTimestamp("created_at"));

            responses.add(response);
        }
        return responses;
    }

    public static ArrayList<ArticleResponse> getArticleResponses(int articlId) throws Exception {
        ArrayList<ArticleResponse> responses = new ArrayList<ArticleResponse>();
        PreparedStatement statement = conn.prepareStatement("call get_article_comments(?)");
        statement.setInt(1, articlId);

        ResultSet resultSet = statement.executeQuery();
        boolean found = false;

        while (resultSet.next()) {
            ArticleResponse response = new ArticleResponse(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("content"),
                    resultSet.getInt("article_id"),
                    resultSet.getInt("user_id"),
                    resultSet.getTimestamp("created_at"));

            responses.add(response);
            found = true;
        }
        if (found) {
            return responses;
        } else {
            return null;
        }

    }

    public static boolean checkSlug(String slug) throws Exception {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM articles WHERE slug = ?");
        ps.setString(1, slug);
        boolean found = false;
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            found = true;
            break;
        }
        return found;
    }
}
