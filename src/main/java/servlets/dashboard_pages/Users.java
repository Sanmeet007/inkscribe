package servlets.dashboard_pages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Auth;

@WebServlet("/dashboard/users")
public class Users extends HttpServlet {
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        if (Auth.isLoggedIn(request)) {
            try {
                if (Auth.isAdmin(request)) {
                    request.getRequestDispatcher("/pages/dashboard/users.jsp").forward(request, response);
                } else {
                    response.sendError(403);
                }
            } catch (Exception e) {
                response.sendError(500);
            }
        } else {
            response.sendError(401);
        }
    }
}
