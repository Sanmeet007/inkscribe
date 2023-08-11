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
}
