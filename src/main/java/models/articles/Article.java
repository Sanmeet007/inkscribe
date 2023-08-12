package models.articles;

import java.sql.Timestamp;

public class Article {

    public int id, userId, likesCount, dislikesCount, views;
    public String slug, content, title, userReactionType, userName, type, featuredImageUrl, description;

    public Article(
            int id, int user_id, String name, String title, String slug, String content, String featured_image_url,
            Timestamp created_at,
            int view_count, String type, int likes, int dislikes, Integer myreaction, String description) {

        this.id = id;
        this.userId = user_id;
        this.likesCount = likes;
        this.dislikesCount = dislikes;
        this.views = view_count;

        this.userName = name;
        this.content = content;
        this.title = title;
        this.slug = slug;
        this.type = type;
        this.featuredImageUrl = featured_image_url;
        this.description = description;

        if (myreaction != null) {
            this.userReactionType = myreaction.equals(0) ? "liked" : "disliked";
        } else {
            this.userReactionType = null;
        }
    }

    public String toJSON() {
        return "JOS";
    }
}
