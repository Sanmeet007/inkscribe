package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user-details")
public class UserDetails extends HttpServlet {
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String _uid = request.getParameter("id");
        try {
            if (_uid == null) {
                response.sendRedirect("/");
            } else {
                int id = Integer.parseInt(_uid);
                request.setAttribute("id", id);
                request.getRequestDispatcher("/pages/user-details.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(400);
        }
    }

}
