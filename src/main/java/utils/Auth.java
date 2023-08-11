package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import models.users.User;
import models.users.Users;

public class Auth {
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
