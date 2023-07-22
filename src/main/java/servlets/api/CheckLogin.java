package servlets.api;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.ReqMethods;

@WebServlet("/api/checklogin")
public class CheckLogin extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        if (ReqMethods.isLoggedIn(req)) {
            System.out.println("User is logged in");
        } else {
            System.out.println("User is logged out");
        }
    }
}
