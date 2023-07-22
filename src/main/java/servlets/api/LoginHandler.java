package servlets.api;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.users.User;
import models.users.Users;
import servlets.api.exceptions.EmptyFieldsNotAllowed;
import utils.ReqMethods;

class LoginRequestParams {
    public String email;
    public String password;
}

@WebServlet("/api/login")
public class LoginHandler extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        try {

            if (req.getContentType().equals("application/json")) {

                LoginRequestParams params = ReqMethods.mapper.readValue(ReqMethods.getBody(req),
                        LoginRequestParams.class);

                if (params.email != null && params.password != null) {
                    User user = Users.getUserByEmailAndPassword(params.email, params.password);
                    String userName = user.name;
                    System.out.println(userName + " Logged in successfully");
                } else {
                    throw new EmptyFieldsNotAllowed();
                }

                return;
            } else {
                res.setStatus(400);
                return;
            }

        } catch (IOException x) {
            // System.out.println("Invalid params");
            res.setStatus(400);
            return;
        } catch (Exception e) {
            res.setStatus(400);
            e.printStackTrace();
            return;
        }

    }

}
