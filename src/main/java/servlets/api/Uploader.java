package servlets.api;

import java.io.InputStream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import utils.Config;
import utils.StreamReader;

import java.nio.file.Files;
import java.nio.file.StandardOpenOption;

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
        try {
            Part username = req.getPart("supername");
            Part filePart = req.getPart("file");

            InputStream userContent = username.getInputStream();
            InputStream fileContent = filePart.getInputStream();

            System.out.println(StreamReader.read(userContent));

            if (filePart != null) {
                Files.write(Config.getUploadPath(filePart.getSubmittedFileName()),
                        fileContent.readAllBytes(),
                        StandardOpenOption.CREATE);
            }

            System.out.println("Upload location : " + Config.getUploadPath(filePart.getSubmittedFileName()));
            System.out.println("File uploaded successfully");
            return;
        } catch (

        Exception e) {
            e.printStackTrace();
            return;
        }
    }
}
