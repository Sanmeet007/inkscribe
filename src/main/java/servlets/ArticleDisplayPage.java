package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Articles;

@WebServlet("/article/*")
public class ArticleDisplayPage extends HttpServlet {
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();
        String[] arr = path.split("/");
        String slug = null;

        ArrayList<String> processedArr = new ArrayList<String>();
        for (String string : arr) {
            if (string.equals("")) {
                continue;
            } else {
                processedArr.add(string);
            }
        }

        if (processedArr.size() == 1) {
            slug = processedArr.get(0);
        }

        if (slug == null) {
            response.sendError(404);
            return;
        } else {
            try {
                if (Articles.checkSlug(slug)) {
                    request.setAttribute("slug", slug);
                    request.getRequestDispatcher("/pages/article.jsp").forward(request, response);
                } else {
                    response.sendError(404);
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(500, "Something went wrong");
                return;
            }
        }
    }
}
