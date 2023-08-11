package models.articles;

import java.sql.Timestamp;

public class Article {

    public int id, userId, likesCount, dislikesCount, views;
    public String slug, content, title, userReactionType, userName, type;

    public Article(
            int id, int user_id, String name, String title, String slug, String content, Timestamp created_at,
            int view_count, String type, int likes, int dislikes, Integer myreaction) {

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

        if (myreaction != null) {
            this.userReactionType = myreaction.equals(0) ? "liked" : "disliked";
        } else {
            this.userReactionType = null;
        }
    }
}
