package servlets.api;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.ResMethods;

@WebServlet("/api/logout")
public class Logout extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        HttpSession currentSession = req.getSession();
        currentSession.removeAttribute("uid");

        ResMethods.writeJSONResponse(res, 200, "{\n  \"error\" : false,\n \"message\" : \"Logout Sucessfull\"\n}");
    }
}
