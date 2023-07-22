package models.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Properties;

import db.DbConnect;
import models.exceptions.InvalidPassword;
import models.exceptions.InvalidPropertyUpdate;
import models.exceptions.UserAlreadyExists;
import models.exceptions.InvalidEmailId;
import models.exceptions.UserNotFound;
import utils.PasswordHasher;

public class Users {

    private static Connection conn = DbConnect.instance.getConnection();

    public static User createUser(String name, String email, String password, String dob) throws Exception {
        try {
            PreparedStatement ps = conn
                    .prepareStatement("INSERT INTO `users`(name , email , dob , password) VALUES(? , ? , ? , ?)");

            final String hashedPassword = PasswordHasher.generateHash(password);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, dob);
            ps.setString(4, hashedPassword);
            ps.executeUpdate();

            return Users.getUserByEmailAndPassword(email, password);

        } catch (SQLIntegrityConstraintViolationException x) {
            throw new UserAlreadyExists();
        } catch (Exception e) {
            throw e;
        }
    }

    public static boolean userExists(int uid) throws Exception {
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
        stmt.setInt(1, uid);
        ResultSet resultSet = stmt.executeQuery();
        boolean result = false;

        while (resultSet.next()) {
            result = true;
            break;
        }
        return result;
    }

    public static boolean userExists(String emailId) throws Exception {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM `users` WHERE email=?");
        ps.setString(1, emailId);

        ResultSet resultSet = ps.executeQuery();
        boolean result = false;

        while (resultSet.next()) {
            result = true;
            break;
        }
        return result;
    }

    // Returns no of rows updated
    public static int updateUserDetails(int uid, Properties props) throws Exception {

        if (userExists(uid)) {

            String queryString = "UPDATE `users` ";
            boolean isSetUsed = false;

            ArrayList<String> params = new ArrayList<String>();
            ArrayList<String> queryStringParams = new ArrayList<String>();

            if (props.getProperty("email") != null)
                throw new InvalidPropertyUpdate();

            String name = props.getProperty("name"), dob = props.getProperty("dob"),
                    profileImage = props.getProperty("profile_image"), bio = props.getProperty("bio"),
                    password = props.getProperty("password");

            if (password != null) {
                queryStringParams.add("password = ?");
                params.add(password);
            }

            if (name != null) {
                queryStringParams.add("name = ?");
                params.add(name);
            }

            if (dob != null) {
                queryStringParams.add("dob = ?");
                params.add(dob);
            }

            if (bio != null) {
                queryStringParams.add("bio = ?");
                params.add(bio);

            }

            if (profileImage != null) {
                queryStringParams.add("profile_image = ?");
                params.add(profileImage);
            }

            for (String param : queryStringParams) {
                if (isSetUsed) {
                    queryString += " , " + param + " ";
                } else {
                    queryString += "SET ";
                    queryString += " " + param + " ";
                    isSetUsed = true;
                }
            }

            if (isSetUsed) {
                queryString += " , updated_at = current_timestamp()";
            } else {
                queryString += " updated_at = current_timestamp()";
            }

            queryString += " WHERE id = " + uid;
            PreparedStatement stmt = conn.prepareStatement(queryString);

            for (int i = 0; i < params.size(); i++) {
                stmt.setString(i + 1, params.get(i));
            }

            return stmt.executeUpdate();
        } else {
            throw new InvalidEmailId();
        }
    }

    public static ArrayList<User> getAllUsers() throws Exception {
        ArrayList<User> users = new ArrayList<User>();

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM `users`");
        ResultSet resultSet = ps.executeQuery();

        while (resultSet.next()) {

            User user = new User(
                    Integer.parseInt(resultSet.getString("id")),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getDate("dob"),
                    resultSet.getString("bio"),
                    resultSet.getString("profile_image"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getTimestamp("updated_at"));
            users.add(user);
        }

        return users;

    }

    public static User getUserById(int uid) throws Exception {

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM `users` WHERE id=?");
        ps.setString(1, Integer.toString(uid));

        ResultSet resultSet = ps.executeQuery();

        boolean found = false;

        User user = null;

        while (resultSet.next()) {
            user = new User(
                    Integer.parseInt(resultSet.getString("id")),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getDate("dob"),
                    resultSet.getString("bio"),
                    resultSet.getString("profile_image"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getTimestamp("updated_at"));

            found = true;
            break;
        }

        if (found) {
            return user;
        } else {
            throw new UserNotFound();
        }

    }

    public static User getUserByEmailAndPassword(String emailId, String password) throws Exception {

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM `users` WHERE email = ? ");
        ps.setString(1, emailId);

        ResultSet resultSet = ps.executeQuery();

        boolean found = false;

        User user = null;

        while (resultSet.next()) {
            user = new User(
                    Integer.parseInt(resultSet.getString("id")),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getDate("dob"),
                    resultSet.getString("bio"),
                    resultSet.getString("profile_image"),
                    resultSet.getTimestamp("created_at"),
                    resultSet.getTimestamp("updated_at"));

            found = true;
            break;
        }

        if (found) {

            String inputPassword = PasswordHasher.generateHash(password);
            if (user.getHashedPassword().equals(inputPassword)) {

                return user;
            } else {
                throw new InvalidPassword();

            }
        } else {
            throw new InvalidEmailId();
        }

    }

}
