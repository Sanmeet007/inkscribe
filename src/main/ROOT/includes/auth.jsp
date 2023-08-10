
<%@page import="utils.*" %>

<% 
    final boolean isLoggedIn = Auth.isLoggedIn(request);    
    if(!isLoggedIn){
        %>
        <jsp:forward page="/" />
<%
    }
%>