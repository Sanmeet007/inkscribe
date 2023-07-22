package servlets.api;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.ReqMethods;

class LoginRequestParams {
    public String email;
    public String password;
}

public class LoginHandler extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        System.out.println(req.getQueryString()); // returns query -> ?
        System.out.println(req.getRequestURI());
        try {

            LoginRequestParams params = ReqMethods.mapper.readValue(ReqMethods.getBody(req), LoginRequestParams.class);

            return;

        } catch (IOException x) {
            System.out.println("Invalid params");
            res.setStatus(400);
            return;
        } catch (Exception e) {
            res.setStatus(400);
            e.printStackTrace();
            return;
        }
    }

}
