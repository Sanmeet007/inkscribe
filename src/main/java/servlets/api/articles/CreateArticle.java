
package servlets.api.articles;

import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Articles;
import servlets.api.exceptions.EmptyFieldsNotAllowed;
import servlets.api.exceptions.InvalidContentType;
import servlets.api.exceptions.UnauthorizedAcess;
import utils.Auth;
import utils.ReqMethods;
import utils.ResMethods;

class CreateArticleParams {
    public String title;
    public String slug;
    public String content;
    public Integer type;
    public String featured_image_url;
    public String description;
}

@WebServlet("/api/articles/create")
public class CreateArticle extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {

        try {
            if (req.getContentType().equals("application/json")) {

                if (Auth.isLoggedIn(req)) {
                    CreateArticleParams params = ReqMethods.mapper.readValue(ReqMethods.getBody(req),
                            CreateArticleParams.class);

                    if (params.title == null || params.title.equals("") || params.content == null
                            || params.description == null
                            || params.type == null || params.slug == null || params.slug.equals("")) {
                        throw new EmptyFieldsNotAllowed();
                    }

                    int userId = Auth.getUserId(req);

                    Articles.createArticle(userId, params.title, params.slug, params.content, params.type,
                            params.featured_image_url, params.description);

                    ResMethods.writeJSONResponse(res, 200, ResMethods.get200ResJSON("Article created successfully"));
                } else {
                    throw new UnauthorizedAcess();
                }
            } else {
                throw new InvalidContentType();
            }

        } catch (SQLIntegrityConstraintViolationException e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Slug already registered"));
        } catch (EmptyFieldsNotAllowed e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Required Fields can't be empty"));
        } catch (InvalidContentType e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Provided invalid content type"));
        } catch (UnauthorizedAcess e) {
            ResMethods.writeJSONResponse(res, 401, ResMethods.get400ResJSON("Unauthorized access"));
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
