package models.articles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import db.DbConnect;

public class Articles {
    private static Connection conn = DbConnect.instance.getConnection();

    public static ArrayList<Article> getRecommendationsForType(String type) throws Exception {
        ArrayList<Article> articles = new ArrayList<Article>();
        PreparedStatement statement;
        statement = conn.prepareStatement("call fetch_recommendations(?)");
        statement.setString(1, type);

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

            articles.add(article);

        }
        return articles;
    }

    public static ArrayList<Article> getTopFiveArticles() throws Exception {
        ArrayList<Article> articles = new ArrayList<Article>();
        PreparedStatement statement;
        statement = conn.prepareStatement("call fetch_trending_articles(5)");

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

            articles.add(article);

        }
        return articles;
    }

    public static ArrayList<Article> getNArticles(int n) throws Exception {
        ArrayList<Article> articles = new ArrayList<Article>();
        PreparedStatement statement;
        statement = conn.prepareStatement("call get_n_articles(?)");
        statement.setInt(1, n);

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

            articles.add(article);

        }
        return articles;
    }

    public static ArrayList<Article> find(String articleTitle, int type) throws Exception {
        ArrayList<Article> articles = new ArrayList<Article>();
        PreparedStatement statement;
        statement = conn.prepareStatement("call find_articles(? , ?)");
        statement.setString(1, articleTitle);
        statement.setInt(2, type);

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image"));

            articles.add(article);

        }
        return articles;
    }

    public static ArrayList<Article> find(String articleTitle) throws Exception {
        ArrayList<Article> articles = new ArrayList<Article>();
        PreparedStatement statement;
        statement = conn.prepareStatement("call find_articles(? , null)");
        statement.setString(1, articleTitle);

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

            articles.add(article);

        }
        return articles;
    }

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

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
                    resultSet.getObject("myreaction"), resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );
            break;
        }
        return article;
    }

    public static ArrayList<Article> getDisplayArticles() throws Exception {
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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

            articles.add(article);

        }
        return articles;
    }

    public static ArrayList<Article> getDisplayArticlesByUserId(int userId) throws Exception {
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
                    resultSet.getObject("myreaction"),
                    resultSet.getString("description"),
                    resultSet.getString("profile_image")

            );

            articles.add(article);
        }
        return articles;
    }

    public static void createArticle(
            int userId,
            String title,
            String slug,
            String content,
            int type,
            String featuredImageUrl,
            String description) throws Exception {
        PreparedStatement ps = conn.prepareStatement(
                "call create_article(? , ?, ? , ?, ? , ? , ?)");
        ps.setInt(1, userId);
        ps.setString(2, title);
        ps.setString(3, slug);
        ps.setString(4, content);
        ps.setInt(5, type);
        ps.setString(6, featuredImageUrl);
        ps.setString(7, description);

        ps.execute();
    }

    @Deprecated
    public static void deleteArticle(String slug) throws Exception {
        PreparedStatement ps = conn.prepareStatement("DELETE FROM articles WHERE slug = ?");
        ps.setString(1, slug);
        ps.execute();
    }

    public static void deleteArticle(int articleId) throws Exception {
        PreparedStatement ps = conn.prepareStatement("DELETE FROM articles WHERE id = ?");
        ps.setInt(1, articleId);
        ps.execute();
    }

    public static void editArticleDetails(int articleId, Properties props) throws Exception {
        String title = props.getProperty("title");
        String slug = props.getProperty("slug");
        String content = props.getProperty("content");
        String type = props.getProperty("type");
        String featuredImageURL = props.getProperty("featured_image_url");
        String description = props.getProperty("description");

        String query = "UPDATE articles ";
        boolean isSetUsed = false;

        ArrayList<String> propsArr = new ArrayList<String>();
        ArrayList<String> queryArr = new ArrayList<String>();

        if (title != null) {
            queryArr.add("title");
            propsArr.add(title);
        }
        if (slug != null) {
            queryArr.add("slug");
            propsArr.add(slug);
        }
        if (content != null) {
            queryArr.add("content");
            propsArr.add(content);
        }
        if (featuredImageURL != null) {
            queryArr.add("featured_image_url");
            propsArr.add(featuredImageURL);
        }
        if (description != null) {
            queryArr.add("description");
            propsArr.add(description);
        }
        if (type != null) {
            queryArr.add("type");
            propsArr.add(type);
        }

        for (String q : queryArr) {
            if (isSetUsed) {
                query += " , " + q + " = ? ";
            } else {
                query += "SET ";
                query += " " + q + " = ?";
                isSetUsed = true;
            }
        }
        query += " WHERE id = " + articleId;

        PreparedStatement stmt = conn.prepareStatement(query);

        int i = 1;
        for (String p : propsArr) {
            try {
                Integer k = Integer.parseInt(p);
                stmt.setInt(i, k);
            } catch (NumberFormatException e) {
                stmt.setString(i, p);
            }
            i++;
        }

        stmt.executeUpdate();
    }

    public static void incrementArticleViewCount(int articleId) throws Exception {
        PreparedStatement stmt = conn.prepareStatement("call increment_article_vc(?)");
        stmt.setInt(1, articleId);
        stmt.execute();
    }

    public static void likeArticle(int articleId, int userId) throws Exception {
        PreparedStatement stmt = conn.prepareStatement("call like_article(? , ?)");
        stmt.setInt(1, articleId);
        stmt.setInt(2, userId);
        stmt.execute();
    }

    public static void dislikeArticle(int articleId, int userId) throws Exception {
        PreparedStatement stmt = conn.prepareStatement("call dislike_article(? , ?)");
        stmt.setInt(1, articleId);
        stmt.setInt(2, userId);
        stmt.execute();
    }

    public static void removeReaction(int articleId, int userId) throws Exception {
        PreparedStatement stmt = conn.prepareStatement("DELETE FROM reactions WHERE user_id = ? AND article_id = ?");
        stmt.setInt(1, userId);
        stmt.setInt(2, articleId);
        stmt.execute();
    }

    public static void addComment(int articleId, int userId, String content) throws Exception {
        String query = "insert into responses ( article_id ,user_id ,content) values( ?,?,?)";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setInt(1, articleId);
        statement.setInt(2, userId);
        statement.setString(3, content);
        statement.executeUpdate();
    }

    public static void addComment(String slug, int userId, String content) throws Exception {
        String query = "insert into responses ( `article_id` ,user_id ,content) values( (select `id` from articles where `slug` = ?),?,?)";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, slug);
        statement.setInt(2, userId);
        statement.setString(3, content);
        statement.execute();
    }

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
                    resultSet.getString("profile_image"),
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

        while (resultSet.next()) {
            if (resultSet.getInt("id") == 0) {
                continue;
            }
            ArticleResponse response = new ArticleResponse(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("content"),
                    resultSet.getInt("article_id"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("profile_image"),
                    resultSet.getTimestamp("created_at"));

            responses.add(response);
        }
        return responses;
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

    public static boolean checkId(int articleId) throws Exception {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM articles WHERE id = ?");
        ps.setInt(1, articleId);
        boolean found = false;
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            found = true;
            break;
        }
        return found;
    }
}
