package servlets.api;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        System.out.println("recieved requst");

    }
}
