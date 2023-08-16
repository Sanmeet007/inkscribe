package servlets.api.subscribers;

import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.subcribers.Subscribers;
import servlets.api.exceptions.EmptyFieldsNotAllowed;
import utils.ResMethods;

@WebServlet("/api/subscribers/add")
public class AddSubscriber extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            String email = req.getParameter("email");
            if (email == null) {
                throw new EmptyFieldsNotAllowed();
            }
            Subscribers.insertSubscriber(email);
            ResMethods.writeJSONResponse(res, 200, ResMethods.get200ResJSON("Subscribed successfully"));
        } catch (SQLIntegrityConstraintViolationException e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Email already subscribed"));
        } catch (EmptyFieldsNotAllowed e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Email can't be empty"));
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
