
package servlets.api;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlets.api.exceptions.InvalidContentType;
import utils.Auth;
import utils.ResMethods;

@WebServlet("/api/articles/get-articles")
public class FetchAllArticles extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {

        try {

            if (req.getContentType().equals("application/json")) {
                if (Auth.isLoggedIn(req)) {
                    if (Auth.isAdmin(req)) {
                        ResMethods.writeJSONResponse(res, 200,
                                "");
                    } else {
                        ResMethods.writeJSONResponse(res, 200,
                                "");
                    }
                } else {
                    ResMethods.writeJSONResponse(res, 200, "");
                }
            } else {
                throw new InvalidContentType();
            }
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
