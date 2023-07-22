package utils;

import java.io.BufferedReader;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ReqMethods {

    public static String getBody(HttpServletRequest req) throws Exception {

        BufferedReader bufferedReader;
        bufferedReader = req.getReader();
        StringBuilder body = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            body.append(line);
        }
        return body.toString();
    }

    public static void parseQuery(HttpServletRequest req) {

    }

    public static boolean isLoggedIn(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Object uid = session.getAttribute("uid");
        if (uid != null) {
            return true;
        } else {
            return false;
        }
    }

    public static ObjectMapper mapper = new ObjectMapper();

}
