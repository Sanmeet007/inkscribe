package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Auth {
    public static boolean isLoggedIn(HttpServletRequest req) {
        HttpSession session = req.getSession();
        return session.getAttribute("uid") != null;
    }
}
