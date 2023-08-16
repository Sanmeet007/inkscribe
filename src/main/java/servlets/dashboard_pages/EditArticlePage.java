package servlets.dashboard_pages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Article;
import utils.Auth;

@WebServlet("/dashboard/edit-article")
public class EditArticlePage extends HttpServlet {
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        if (Auth.isLoggedIn(request)) {
            try {
                String articleId = request.getParameter("id");

                if (articleId == null) {
                    response.sendRedirect("/dashboard");
                    return;
                }
                if (!Auth.isAdmin(request)) {
                    int x = Integer.parseInt(articleId);
                    Article article = models.articles.Articles.getArticle(x);
                    int userId = Auth.getUserId(request);
                    if (article.authorId == userId) {
                        request.getRequestDispatcher("/pages/dashboard/edit-article.jsp").forward(request, response);
                    } else {
                        response.sendError(403);
                    }
                } else {
                    request.getRequestDispatcher("/pages/dashboard/edit-article.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                response.sendError(400);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(500);
            }
        } else {
            response.sendError(401);
        }
    }
}
