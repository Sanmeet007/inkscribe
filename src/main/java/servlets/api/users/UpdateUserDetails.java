package servlets.api.users;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Properties;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.users.User;
import models.users.Users;
import servlets.api.exceptions.UnauthorizedAcess;
import utils.Auth;
import utils.Config;
import utils.ResMethods;
import utils.StreamReader;

@WebServlet("/api/users/update-details")
@MultipartConfig(
        // Params
        fileSizeThreshold = 1024 * 1, // 1 KB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 1 MB
)
public class UpdateUserDetails extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        try {
            if (Auth.isLoggedIn(req)) {

                Properties props = new Properties();

                Part name = req.getPart("name");
                Part dob = req.getPart("dob");
                Part bio = req.getPart("bio");
                Part password = req.getPart("password");

                InputStream content;

                if (name != null) {
                    content = name.getInputStream();
                    props.setProperty("name", StreamReader.read(content));
                }
                if (dob != null) {
                    content = dob.getInputStream();
                    props.setProperty("dob", StreamReader.read(content));

                }
                if (password != null) {
                    content = password.getInputStream();
                    props.setProperty("password", StreamReader.read(content));

                }

                if (bio != null) {
                    content = bio.getInputStream();
                    props.setProperty("bio", StreamReader.read(content));
                }

                int uid = Auth.getUserId(req);
                User user = Users.getUserById(uid);

                Part filePart = req.getPart("profile_image");

                if (filePart != null) {
                    Path uploadPath = Config.getUploadPath(filePart.getSubmittedFileName());
                    String uploadedFileUrl = Config.getUploadFileUrlFromRoot(filePart.getSubmittedFileName());
                    InputStream fileContent = filePart.getInputStream();

                    Files.write(uploadPath,
                            fileContent.readAllBytes(),
                            StandardOpenOption.CREATE);

                    props.setProperty("profile_image", uploadedFileUrl);
                    Users.updateUserDetails(user.id, props);
                    ResMethods.writeJSONResponse(res, 200,
                            "{\n \"error\" : false,\n \"message\" : \"User details updated successfully\"\n}");
                } else {
                    Users.updateUserDetails(user.id, props);
                    ResMethods.writeJSONResponse(res, 200,
                            "{\n \"error\" : false,\n \"message\" : \"User details updated successfully\"\n}");
                }
            } else {
                throw new UnauthorizedAcess();
            }
        } catch (IOException e) {
            e.printStackTrace();
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON("Unable to upload profile image file"));
        } catch (UnauthorizedAcess e) {
            ResMethods.writeJSONResponse(res, 401,
                    "{\n  \"error\" : true,\n \"message\" : \"Unauthorized Access\"\n}");
        } catch (Exception e) {
            e.printStackTrace();
            ResMethods.writeJSONResponse(res, 500, ResMethods.get500ResJSON());
        }
    }
}
