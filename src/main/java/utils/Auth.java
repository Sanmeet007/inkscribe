package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import db.DbConfig;
import models.users.User;
import models.users.Users;
import utils.exceptions.UserIdNullException;

public class Auth {
    public static Integer getUserId(HttpServletRequest req) throws Exception {
        HttpSession session = req.getSession();
        Object id = session.getAttribute("uid");
        if (id != null) {
            return (Integer) id;
        } else {
            throw new UserIdNullException();
        }
    }

    public static boolean isAdmin(HttpServletRequest req) throws Exception {
        Integer userId = getUserId(req);
        User user = Users.getUserById(userId);
        return user.email.equals(DbConfig.getAdminEmail());
    }

    public static boolean isLoggedIn(HttpServletRequest req) {
        HttpSession session = req.getSession();
        return session.getAttribute("uid") != null;
    }

    public static User getUser(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Integer id = (int) session.getAttribute("uid");

        try {
            return Users.getUserById(id);
        } catch (Exception e) {
            return null;
        }
    }
}
