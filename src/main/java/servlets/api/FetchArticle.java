
package servlets.api;

import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Article;
import models.articles.ArticleResponse;
import models.articles.Articles;
import servlets.api.exceptions.InvalidSlug;
import utils.Auth;
import utils.ResMethods;

@WebServlet("/api/articles/get-article")
public class FetchArticle extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {

        try {
            String slug = req.getParameter("slug");
            if (slug == null) {
                throw new InvalidSlug();
            }

            if (Auth.isLoggedIn(req)) {
                Integer userId = Auth.getUserId(req);
                if (Auth.isAdmin(req)) {
                    Article article = Articles.getArticle(slug);
                    if (article == null) {
                        throw new InvalidSlug();
                    }
                    int articleId = article.id;
                    ArrayList<ArticleResponse> commentResponses = Articles.getArticleResponses(articleId);

                    String json = article.toJSON();
                    ResMethods.writeJSONResponse(res, 200,
                            "{\n  \"error\" : false,\n  \"article\" : "
                                    + json + " ,\n \"responses\" : " + commentResponses.toString() + " \n}");
                } else {
                    Article article = Articles.getArticleForUser(slug, userId);
                    if (article == null) {
                        throw new InvalidSlug();
                    }
                    int articleId = article.id;
                    ArrayList<ArticleResponse> commentResponses = Articles.getArticleResponses(articleId);
                    String json = article.toJSON();
                    ResMethods.writeJSONResponse(res, 200,
                            "{\n  \"error\" : false,\n  \"article\" : "
                                    + json + " ,\n \"responses\" : " + commentResponses.toString() + " \n}");
                }
            } else {
                Article article = Articles.getArticle(slug);
                if (article == null) {
                    throw new InvalidSlug();
                }
                int articleId = article.id;
                ArrayList<ArticleResponse> commentResponses = Articles.getArticleResponses(articleId);
                String json = article.toJSON();
                ResMethods.writeJSONResponse(res, 200,
                        "{\n  \"error\" : false,\n  \"article\" : "
                                + json + " ,\n \"responses\" : " + commentResponses.toString() + " \n}");
            }

        } catch (InvalidSlug e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid article slug"));
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
