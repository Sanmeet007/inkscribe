package models.articles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DbConnect;

public class Articles {
    private static Connection conn = DbConnect.instance.getConnection();

    public static Article getArticle(int articleId) throws Exception {
        Article article = null;
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_article_details(?, null)");
        statement.setInt(1, articleId);

        ResultSet resultSet = statement.executeQuery();
        boolean found = false;

        while (resultSet.next()) {
            article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));

            found = true;
            break;
        }
        if (found) {
            return article;
        } else {
            return null;
        }
    }

    public static Article getArticle(String articleSlug) throws Exception {
        Article article = null;
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_article_details_by_slug(?, null)");
        statement.setString(1, articleSlug);

        ResultSet resultSet = statement.executeQuery();
        boolean found = false;

        while (resultSet.next()) {
            article = new Article(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("name"),
                    resultSet.getString("title"),
                    resultSet.getString("slug"),
                    resultSet.getString("content"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getInt("view_count"),
                    resultSet.getString("type"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getInt("myreaction"));

            found = true;
            break;
        }
        if (found) {
            return article;
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
