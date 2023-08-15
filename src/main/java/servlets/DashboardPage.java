package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Auth;

@WebServlet("/dashboard")
public class DashboardPage extends HttpServlet {
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        if (Auth.isLoggedIn(request)) {

            request.getRequestDispatcher("/pages/dashboard/index.jsp").forward(request, response);
        } else {
            response.sendError(401);
        }
    }
}
