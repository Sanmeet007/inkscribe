package servlets.dashboard_pages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Auth;

@WebServlet("/dashboard/articles")
public class Articles extends HttpServlet {
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        if (Auth.isLoggedIn(request)) {
            request.getRequestDispatcher("/pages/dashboard/articles.jsp").forward(request, response);
        } else {
            response.sendError(401);
        }
    }
}
