package servlets.api.users;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import models.exceptions.UserAlreadyExists;
import models.users.User;
import models.users.Users;
import servlets.api.exceptions.EmptyFieldsNotAllowed;
import servlets.api.exceptions.InvalidContentType;
import utils.ReqMethods;
import utils.ResMethods;

class SignUpParams {
    public String name, email,
            password, dob;
}

@WebServlet("/api/sign-up")
public class SignUp extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        try {
            if (req.getContentType().equals("application/json")) {

                SignUpParams params = ReqMethods.mapper.readValue(ReqMethods.getBody(req), SignUpParams.class);

                if (params.name == null
                        || params.email == null
                        || params.password == null
                        || params.dob == null
                        || params.name.equals("")
                        || params.email.equals("")
                        || params.password.equals("")
                        || params.dob.equals("")) {
                    throw new EmptyFieldsNotAllowed();
                }

                User user = Users.createUser(params.name, params.email, params.password, params.dob);

                HttpSession currentSession = req.getSession();
                currentSession.setAttribute("uid", user.id);
                ResMethods.writeJSONResponse(res, 200,
                        "{\n  \"error\" : false,\n  \"message\" : \"Login successfull\",\n  \"user\" : "
                                + user.toJSON() + " \n}");
            } else {
                throw new InvalidContentType();
            }

        } catch (UserAlreadyExists e) {
            ResMethods.writeJSONResponse(res, 400,
                    ResMethods.get400ResJSON("Email already registered"));

        } catch (InvalidContentType e) {
            ResMethods.writeJSONResponse(res, 400,
                    ResMethods.get400ResJSON("Invalid request type"));
        } catch (EmptyFieldsNotAllowed e) {
            ResMethods.writeJSONResponse(res, 400,
                    ResMethods.get400ResJSON("Bad request"));
        } catch (JsonProcessingException e) {
            ResMethods.writeJSONResponse(res, 400,
                    ResMethods.get400ResJSON("Bad request"));
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500,
                    ResMethods.get500ResJSON("Something went wrong"));
        }
        return;
    }
}
