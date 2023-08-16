
package servlets.api.articles;

import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Article;
import models.articles.Articles;
import utils.ResMethods;

@WebServlet("/api/articles/search")
public class SearchArticles extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            String query = req.getParameter("q");
            String type = req.getParameter("t");
            if (query == null) {
                ResMethods.writeJSONResponse(res, 200, "{\n  \"error\" : false,\n  \"articles\" : [] \n}");
            } else {
                if (type != null) {
                    try {
                        Integer _type = Integer.parseInt(type);
                        ArrayList<Article> articles = Articles.find(query, _type);
                        ResMethods.writeJSONResponse(res, 200,
                                "{\n  \"error\" : false,\n  \"articles\" : " + articles.toString() + " \n}");

                    } catch (NumberFormatException e) {
                        ArrayList<Article> articles = Articles.find(query);
                        ResMethods.writeJSONResponse(res, 200,
                                "{\n  \"error\" : false,\n  \"articles\" : " + articles.toString() + " \n}");
                    }
                } else {
                    ArrayList<Article> articles = Articles.find(query);
                    ResMethods.writeJSONResponse(res, 200,
                            "{\n  \"error\" : false,\n  \"articles\" : " + articles.toString() + " \n}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
