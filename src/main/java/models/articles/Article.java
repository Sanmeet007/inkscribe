package models.articles;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Article {

    final public int id, authorId, likesCount, dislikesCount, views;
    final public String slug, content, title, userReactionType, authorName, type, featuredImageUrl, description,
            authorProfileImage;

    final public Timestamp createdAt;

    public Article(
            int id, int user_id, String name, String title, String slug, String content, String featured_image_url,
            Timestamp created_at,
            int view_count, String type, int likes, int dislikes, Object myreaction, String description,
            String profile_image) {

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
        this.authorProfileImage = profile_image;

        if (myreaction != null) {
            Integer m = (int) myreaction;
            this.userReactionType = m == 0 ? "disliked" : "liked";
        } else {
            this.userReactionType = null;
        }
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
        obj.put("author_id", authorId);
        obj.put("likes_count", likesCount);
        obj.put("dislikes_count", dislikesCount);
        obj.put("view_count", views);
        obj.put("slug", slug);
        obj.put("content", content);
        obj.put("title", title);
        obj.put("user_reaction_type", userReactionType);
        obj.put("author_name", authorName);
        obj.put("author_image", authorProfileImage);
        obj.put("article_type", type);
        obj.put("featured_image_url", featuredImageUrl);
        obj.put("description", description);
        obj.put("created_at", createdAt.toString());

        final String json = new ObjectMapper().writeValueAsString(obj);
        return json;
    }

    public String getCleanDate() {
        String dateString = new SimpleDateFormat("MMM,d yyyy").format(this.createdAt);
        return dateString;
    }

    public String getProfileImage() {
        if (authorProfileImage != null) {
            return authorProfileImage;
        } else {
            return "/images/avatar.svg";
        }
    }
}
