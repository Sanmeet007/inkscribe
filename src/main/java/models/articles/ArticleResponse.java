package models.articles;

import java.sql.Timestamp;

public class ArticleResponse {

    public int id, articleId, userId;
    public String userName, content, featuredImageUrl;
    public Timestamp createdAt;

    public ArticleResponse(
            int id,
            String name,
            String content,
            int article_id,
            int user_id,
            Timestamp created_at) {
        this.id = id;
        this.articleId = article_id;
        this.content = content;
        this.createdAt = created_at;
        this.userId = user_id;
        this.userName = name;

    }
}
