
package servlets.api;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Article;
import models.articles.Articles;
import servlets.api.exceptions.ArticleNotFound;
import servlets.api.exceptions.BadRequest;
import servlets.api.exceptions.EmptyFieldsNotAllowed;
import servlets.api.exceptions.ForbiddenAccess;
import servlets.api.exceptions.InvalidContentType;
import servlets.api.exceptions.UnauthorizedAcess;
import utils.Auth;
import utils.ReqMethods;
import utils.ResMethods;

class EditArticleParams {
    public Integer article_id;
    public String title;
    public String slug;
    public String content;
    public Integer type;
    public String featured_image_url;
    public String description;
}

@WebServlet("/api/articles/create")
public class UpdateArticleDetails extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {

        try {
            if (req.getContentType().equals("application/json")) {
                if (Auth.isLoggedIn(req)) {

                    EditArticleParams params = ReqMethods.mapper.readValue(ReqMethods.getBody(req),
                            EditArticleParams.class);

                    if (params.article_id == null) {
                        throw new EmptyFieldsNotAllowed();

                    }

                    if (!Articles.checkId(params.article_id)) {
                        throw new ArticleNotFound();
                    }

                    int userId = Auth.getUserId(req);

                    Article article = Articles.getArticle(params.article_id);
                    if (article.authorId != userId) {
                        throw new ForbiddenAccess();
                    }

                    boolean hasProperties = false;

                    Properties props = new Properties();

                    if (params.title != null && !params.title.equals("")) {
                        props.setProperty("title", params.title);
                        hasProperties = true;
                    }
                    if (params.slug != null && !params.slug.equals("")) {
                        props.setProperty("slug", params.slug);
                        hasProperties = true;
                    }
                    if (params.content != null) {
                        props.setProperty("content", params.content);
                        hasProperties = true;
                    }
                    if (params.featured_image_url != null) {
                        props.setProperty("featured_image_url", params.featured_image_url);
                        hasProperties = true;
                    }
                    if (params.type != null) {
                        props.setProperty("type", params.type.toString());
                        hasProperties = true;
                    }
                    if (params.description != null) {
                        props.setProperty("description", params.description);
                        hasProperties = true;
                    }

                    if (hasProperties) {
                        Articles.editArticleDetails(userId, props);
                        ResMethods.writeJSONResponse(res, 200,
                                ResMethods.get200ResJSON("Article details updated successfully"));
                    } else {
                        throw new BadRequest();
                    }

                } else {
                    throw new UnauthorizedAcess();
                }
            } else {
                throw new InvalidContentType();
            }

        } catch (EmptyFieldsNotAllowed e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Article id can't be empty"));
        } catch (ArticleNotFound e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid article id"));
        } catch (BadRequest e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Bad Request"));
        } catch (SQLIntegrityConstraintViolationException e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Slug already registered"));
        } catch (InvalidContentType e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Provided invalid content type"));
        } catch (ForbiddenAccess e) {
            ResMethods.writeJSONResponse(res, 403,
                    ResMethods.get400ResJSON("Access Forbidden ! Can't edit someone else article"));
        } catch (UnauthorizedAcess e) {
            ResMethods.writeJSONResponse(res, 401, ResMethods.get400ResJSON("Unauthorized access"));
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
