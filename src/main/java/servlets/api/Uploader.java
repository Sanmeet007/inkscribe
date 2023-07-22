package servlets.api;

import java.io.File;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import utils.Config;

import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.annotation.*;

@WebServlet("/api/upload")
@MultipartConfig(
        // Params
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class Uploader extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        // System.out.println("recieved requst");
        try {
            Part filePart = req.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            for (Part part : req.getParts()) {
                part.write(Config.resolvePath(fileName));
            }

            System.out.println("File uploaded successfully");
            return;
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }
}
