package models.articles;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ArticleResponse {

    public int id, articleId, userId;
    public String userName, content;
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

    @Override
    public String toString() {
        try {
            return this.toJSON();
        } catch (Exception e) {
            return "ERROR";
        }
    }

    public String toJSON() throws Exception {
        Map<String, Object> obj = new HashMap<>();

        obj.put("id", id);
        obj.put("user_name", userName);
        obj.put("user_id", userId);
        obj.put("content", content);
        obj.put("article_id", articleId);
        obj.put("created_at", createdAt.toString());

        final String json = new ObjectMapper().writeValueAsString(obj);
        return json;
    }

}
