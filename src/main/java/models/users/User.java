package models.users;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;

public class User {
    public int id;
    public final String name, email, profileImage;
    public final Date dob;
    public Timestamp createdAt, updatedAt;
    public String bio;
    private String password;

    public User(int uid, String name, String email, String password, Date dob, String bio, String profileImage,
            Timestamp createdAt,
            Timestamp updatedAt) {
        this.id = uid;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.profileImage = profileImage;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.bio = bio;
        this.password = password;
    }

    public String getHashedPassword() throws Exception {
        return password;
    }

    public String toJSON() throws Exception {
        Map<String, String> obj = new HashMap<>();

        obj.put("email", email);
        obj.put("name", name);

        obj.put("createdAt", createdAt.toString());
        obj.put("updatedAt", updatedAt.toString());

        if (dob != null) {
            obj.put("dob", dob.toString());
        } else {
            obj.put("dob", "");
        }

        if (bio != null) {
            obj.put("bio", bio);
        } else {
            obj.put("bio", "");
        }

        if (profileImage != null) {
            obj.put("profileImage", profileImage);
        } else {
            obj.put("profileImage", "");
        }

        final String json = new ObjectMapper().writeValueAsString(obj);
        return json;
    }

}
