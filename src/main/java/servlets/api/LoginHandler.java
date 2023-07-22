package servlets.api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.exceptions.InvalidEmailId;
import models.exceptions.InvalidPassword;
import models.users.User;
import models.users.Users;
import servlets.api.exceptions.EmptyFieldsNotAllowed;
import servlets.api.exceptions.InvalidContentType;
import utils.ReqMethods;
import utils.ResMethods;

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
            } else {
                throw new InvalidContentType();
            }

        } catch (InvalidPassword x) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid Credentials"));
        } catch (InvalidEmailId x) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid Credentials"));
        } catch (InvalidContentType x) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid Request"));
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
