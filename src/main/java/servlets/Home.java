package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Home extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<!Doctype html>");
		out.print("<html lang=\"en\">");
		out.print("\t<head>\n\t<title>Homepage</title>\n\t<link rel='stylesheet' href='/css/style.css'/>\n</head>");
		out.print("\t<body>");
		out.print("\t<h1>Hello world</h1>");
		out.print("\t</>");
		out.print("</html>");
		out.close();
	}

}
