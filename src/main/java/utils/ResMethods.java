package utils;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

public class ResMethods {

    public static void writeResponse(HttpServletResponse res, int status, String content, String contentType) {
        try {
            res.setStatus(status);
            res.setContentType(contentType);
            PrintWriter writer = res.getWriter();
            writer.write(content);
            return;
        } catch (Exception e) {
            res.setStatus(500);
            return;
        }
    }

    public static void writeJSONResponse(HttpServletResponse res, int status, String content) {
        try {
            res.setStatus(status);
            res.setContentType("application/json");
            PrintWriter writer = res.getWriter();
            writer.write(content);
            return;
        } catch (Exception e) {
            res.setStatus(500);
            return;
        }
    }

    public static void writeHTMLResponse(HttpServletResponse res, int status, String content) {
        try {
            res.setStatus(status);
            res.setContentType("application/json");
            PrintWriter writer = res.getWriter();
            writer.write(content);
            return;
        } catch (Exception e) {
            res.setStatus(500);
            return;
        }
    }

    public static String get400ResJSON(String message) {
        StringBuilder str = new StringBuilder();
        str.append("{\n  \"error\" : true,\n  \"message\" : \"" + message + "\"\n}");

        return str.toString();
    }

    public static String get200ResJSON(String message) {
        StringBuilder str = new StringBuilder();
        str.append("{\n  \"error\" : false,\n  \"message\" : \"" + message + "\"\n}");

        return str.toString();
    }

    public static String get500ResJSON() {
        StringBuilder str = new StringBuilder();
        str.append("{\n  \"error\" : true,\n  \"message\" : \"Something went wrong\"\n}");
        return str.toString();
    }

    public static String get500ResJSON(String message) {
        StringBuilder str = new StringBuilder();
        str.append("{\n  \"error\" : true,\n  \"message\" : \"" + message + "\"\n}");
        return str.toString();
    }
}
