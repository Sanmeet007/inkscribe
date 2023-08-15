<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page  import="java.util.ArrayList" %>
<%@page import="models.articles.Article" %>
<%@page import="models.articles.Articles" %>
<%@page import="models.users.*" %>
<%@page import="utils.*" %>

<% 
  User user = Auth.getUser(request);
  boolean isAdmin = Auth.isAdmin(request);
%>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../../includes/backend-head.jsp">
    <jsp:param name="title" value="My Articles" />
  </jsp:include>
  <body>
    <!-- Main -->
    <div class="dashboard-container">
      <div class="dashboard-content">
        <jsp:include page="../../includes/dash-nav.jsp" >
          <jsp:param name="page" value="articles" />
        </jsp:include>
        <div class="main">
          <div class="flex">
            <div>
              <h1>
                <%= isAdmin ? "Articles" : "My Articles" %>
              </h1>
            </div>
              <div class="spacer"></div>
            <div class="form-element mt-1 mb-1">
              <label for="search_in_articles">Search Articles</label>
              <fieldset>
                <legend>Search Articles</legend>
                <input
                  type="text"
                  id="search_in_articles"
                  name="name"
                  placeholder="Serch article"
                />
              </fieldset>
            </div>
          </div>

          
          <% ArrayList<Article> articles = Articles.getDisplayArticlesByUserId(user.id); %>
            <% if(articles.size() > 0){ %>
               <div class="cards">
                <% for (Article article : articles) {   %>
                     <div class="card">
                       <% if(isAdmin)  {%>
                         <div class="card-header">
                             <div class="card-user-profile">
                             <div class="user-image">
                                 <img src="<%= article.getProfileImage() %>" alt="" width="30" height="30">
                             </div>
                             <a href="/user-details?id=<%= article.authorId %>" class="user-name link" style="color: inherit;"><%= article.authorName %></a>
                             </div>
                       </div>
                       <% } %>
                       <div class="card-heading flex gap">
                         <a href="/article/<%= article.slug %>" class="block link">
                           <%= article.title %>
                         </a>
                         <div class="flex  small-gap">
                           <a  href="/dashboard/edit-article?id=<%= article.id %>" class="btn icon-btn small" title="Edit">
                             <span class="material-icons-outlined">
                               edit
                               </span>
                           </a>
                           <a href="/delete-article" class="btn icon-btn small" title="Delete">
                             <span class="material-icons-outlined">
                               delete
                               </span>
                           </a>
                          </div> 
                       </div>
                       <div class="card-content">
                         <%= article.description %>
                       </div>
                       <div class="card-footer">
                         <div><%= article.getCleanDate() %></div>
                         <div class="chip"><%= article.type %></div>
                       </div>
                     </div>
                 
                <% } %>
               </div>
            <% }else{ %>
                 <div class="empty">No articles to dislay</div>
            <% } %>
        </div>
      </div>
    </div>

    <!-- Modals -->
    <jsp:include page="../../includes/modals.jsp" />
    <!-- Snackbars -->
    <jsp:include page="../../includes/snackbars.jsp" />

    <script src="/js/script.js"></script>
  </body>
</html>
