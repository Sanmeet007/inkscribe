<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@page import="db.*"  %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Not first jsp</title>
  </head>

  <body>

    <% 
        try {
            Connection conn =  DbConnect.instance.getConnection();
            System.out.println("Working correct");
        } catch (Exception error) {   
            System.out.println("An error occured");
        }
    %>

    <% double num = Math.random(); if (num > 0.95) { %>
    <h2>You'll have a luck day!</h2>
    <p>(<%= num %>)</p>
    <% } else { %>
    <h2>Well, life goes on ...</h2>
    <p>(<%= num %>)</p>
    <% } %>
    <a href="<%= request.getRequestURI() %>"><h3>Try Again</h3></a>
  </body>
</html>
