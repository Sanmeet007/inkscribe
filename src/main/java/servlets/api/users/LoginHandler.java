package servlets.api.users;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

                    HttpSession session = req.getSession();
                    session.setAttribute("uid", user.id);
                    session.setMaxInactiveInterval(60 * 60); // 1 Hour

                    ResMethods.writeJSONResponse(res, 200,
                            "{\n  \"error\" : false,\n  \"message\" : \"Login successfull\",\n  \"user\" : "
                                    + user.toJSON() + " \n}");
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
