package models.articles;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Article {

    final public int id, authorId, likesCount, dislikesCount, views;
    final public String slug, content, title, userReactionType, authorName, type, featuredImageUrl, description;
    final Timestamp createdAt;

    public Article(
            int id, int user_id, String name, String title, String slug, String content, String featured_image_url,
            Timestamp created_at,
            int view_count, String type, int likes, int dislikes, Integer myreaction, String description) {

        this.id = id;
        this.authorId = user_id;
        this.likesCount = likes;
        this.dislikesCount = dislikes;
        this.views = view_count;

        this.authorName = name;
        this.content = content;
        this.title = title;
        this.slug = slug;
        this.createdAt = created_at;
        this.type = type;
        this.featuredImageUrl = featured_image_url;
        this.description = description;

        if (myreaction != null) {
            this.userReactionType = myreaction.equals(0) ? "liked" : "disliked";
        } else {
            this.userReactionType = null;
        }
    }

    public String toJSON() throws Exception {
        Map<String, Object> obj = new HashMap<>();

        obj.put("id", id);
        obj.put("author_id", authorId);
        obj.put("likes_count", likesCount);
        obj.put("dislikes_count", dislikesCount);
        obj.put("view_count", views);
        obj.put("slug", slug);
        obj.put("content", content);
        obj.put("title", title);
        obj.put("user_reaction_type", userReactionType);
        obj.put("authorName", authorName);
        obj.put("article_type", type);
        obj.put("featured_image_url", featuredImageUrl);
        obj.put("description", description);
        obj.put("created_at", createdAt.toString());

        final String json = new ObjectMapper().writeValueAsString(obj);
        return json;
    }

}
