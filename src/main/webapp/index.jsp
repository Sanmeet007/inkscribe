<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>First JSP</title>
</head>
   
<body>
   <% 
   double num = Math.random();
   if (num > 0.95) {
   %>
      <h2>You'll have a luck day!</h2><p>(<%= num %>)</p>
   <%
   } else {
   %>
      <h2>Well, life goes on ... </h2><p>(<%= num %>)</p>
   <%
   }
   %>
   <a href="<%= request.getRequestURI() %>"><h3>Try Again</h3></a>
</body>
</html>