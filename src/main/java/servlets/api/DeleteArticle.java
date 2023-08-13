
package servlets.api;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.articles.Articles;
import servlets.api.exceptions.ArticleNotFound;
import servlets.api.exceptions.ForbiddenAccess;
import servlets.api.exceptions.UnauthorizedAcess;
import utils.Auth;
import utils.ResMethods;

@WebServlet("/api/articles/delete")
public class DeleteArticle extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            if (Auth.isLoggedIn(req)) {
                if (Auth.isAdmin(req)) {
                    int articleId = Integer.parseInt(req.getParameter("id"));
                    if (!Articles.checkId(articleId)) {
                        throw new ArticleNotFound();
                    }
                    Articles.deleteArticle(articleId);
                    ResMethods.writeJSONResponse(res, 200, ResMethods.get200ResJSON(
                            "Article with id " + articleId + " was deleted successfully"));
                } else {
                    throw new ForbiddenAccess();
                }
            } else {
                throw new UnauthorizedAcess();
            }
        } catch (ArticleNotFound e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Invalid article id"));
        } catch (NumberFormatException e) {
            ResMethods.writeJSONResponse(res, 400, ResMethods.get400ResJSON("Bad request"));
        } catch (UnauthorizedAcess e) {
            ResMethods.writeJSONResponse(res, 401, ResMethods.get400ResJSON("Please login to access"));
        } catch (ForbiddenAccess e) {
            ResMethods.writeJSONResponse(res, 403,
                    ResMethods.get400ResJSON("Access to the resource is available to specific users only"));
        } catch (Exception e) {
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }

        return;
    }

}
