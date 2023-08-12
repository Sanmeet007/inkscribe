
package servlets.api;

import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.articles.Article;
import models.articles.Articles;
import servlets.api.exceptions.InvalidContentType;
import utils.Auth;
import utils.ReqMethods;
import utils.ResMethods;

@WebServlet("/api/articles/get-articles")
public class FetchAllArticles extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {

            String userId = req.getParameter("uid");
            if (userId == null) {
                ArrayList<Article> articles = Articles.getDisplayArticles();
                String json = articles.toString();
                ResMethods.writeJSONResponse(res, 200,
                        "{\n  \"error\" : false,\n  \"articles\" : "
                                + json + " \n}");
            } else {
                ArrayList<Article> articles = Articles.getDisplayArticlesByUserId(Integer.parseInt(userId));
                String json = articles.toString();
                ResMethods.writeJSONResponse(res, 200,
                        "{\n  \"error\" : false,\n  \"articles\" : "
                                + json + " \n}");
            }
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
