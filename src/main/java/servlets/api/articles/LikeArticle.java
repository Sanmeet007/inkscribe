package servlets.api.articles;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Article;
import models.articles.Articles;
import servlets.api.exceptions.InvalidContentType;
import servlets.api.exceptions.UnauthorizedAcess;
import utils.Auth;
import utils.ReqMethods;
import utils.ResMethods;

class LikeArticleParameters {
    public String slug;
}

@WebServlet("/api/articles/like-article")
public class LikeArticle extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {

        try {
            if (req.getContentType().equals("application/json")) {
                if (Auth.isLoggedIn(req)) {
                    int userId = Auth.getUserId(req);
                    LikeArticleParameters params = ReqMethods.mapper.readValue(ReqMethods.getBody(req),
                            LikeArticleParameters.class);
                    Article article = Articles.getArticle(params.slug);
                    Articles.likeArticle(article.id, userId);
                    ResMethods.writeJSONResponse(res, 200,
                            ResMethods.get200ResJSON("Article liked successfully"));
                } else {
                    throw new UnauthorizedAcess();
                }
            } else {
                throw new InvalidContentType();
            }
        } catch (InvalidContentType e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid content type"));
        } catch (UnauthorizedAcess e) {
            ResMethods.writeJSONResponse(res, 401, ResMethods.get400ResJSON("Please login to add response"));
        } catch (Exception e) {
            e.printStackTrace();
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
