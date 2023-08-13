package servlets.api.users;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.exceptions.UserNotFound;
import models.users.Users;
import servlets.api.exceptions.ForbiddenAccess;
import servlets.api.exceptions.InvalidContentType;
import servlets.api.exceptions.UnauthorizedAcess;
import utils.Auth;
import utils.ResMethods;

@WebServlet("/api/users/delete-user")
public class DeleteUser extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {

        try {
            if (Auth.isLoggedIn(req)) {
                if (Auth.isAdmin(req)) {
                    int userId = Integer.parseInt(req.getParameter("user_id"));
                    if (Users.userExists(userId)) {
                        Users.deleteUser(userId);
                        ResMethods.writeJSONResponse(res, 200,
                                ResMethods.get200ResJSON("User deleted successfully"));
                    } else {
                        throw new UserNotFound();
                    }

                } else {
                    throw new ForbiddenAccess();
                }
            } else {
                throw new UnauthorizedAcess();
            }
        } catch (UserNotFound e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid user id"));
        } catch (ForbiddenAccess e) {
            ResMethods.writeJSONResponse(res, 403, ResMethods.get400ResJSON("Access Denied !"));
        } catch (UnauthorizedAcess e) {
            ResMethods.writeJSONResponse(res, 401, ResMethods.get400ResJSON("Please login first"));
        } catch (Exception e) {
            e.printStackTrace();
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
