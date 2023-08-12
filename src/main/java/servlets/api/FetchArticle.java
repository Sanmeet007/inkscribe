
package servlets.api;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.ResMethods;

@WebServlet("/api/articles/get-article")
public class FetchArticle extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {

        try {

            if (req.getContentType().equals("application/json")) {
            } else {
            }
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
