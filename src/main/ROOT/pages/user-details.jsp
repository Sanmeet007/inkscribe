<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="utils.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="models.articles.Articles" %>
<%@page import="models.articles.Article" %>
<%@page import="db.DbConfig" %>
<%@page import="models.users.*" %>

<%
  String uri = DbConfig.getURI();
  int id = (int) request.getAttribute("id");
  User user = Users.getUserById(id);
  String currentURL =  uri +"/user-details?id="+ user.id;
  ArrayList<Article> articles = Articles.getDisplayArticlesByUserId(id);
%>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/frontend-head.jsp">
    <jsp:param name="title" value="Article" />
    <jsp:param name="desc" value="InkScribe is an open platform where readers find dynamic thinking, and where expert and undiscovered voices can share their writing on any topic." />
  </jsp:include>
  <body>
    <!-- Header -->
   <jsp:include page="../includes/header.jsp">
    <jsp:param name="page" value="article" />
   </jsp:include>
   
   <!-- Main -->
   <div>
       <div class="base-bg"></div>
       <main class="container extra-tight">

        <div class="user-profile lifted flex gap">
            <div class="profile-image">
                <img src="<%= user.getProfileImage() %>" alt="Avatar" width="45" height="45">
            </div>
            <div class="details flex-grow">
                <div>
                    <div class="name"><%= user.name %></div>
                    <div class="memebership small-text">Joined on <%= user.getCleanDate() %></div>
                </div>
                <div class="spacer"></div>
                <a href="mailto:example@example.com" class="btn outlined secondary tightly-packed">
                    <span class="material-icons-outlined">
                        mail
                    </span>
                    <span>
                        Email
                    </span>
                </a>
                <button class="btn icon-btn share" data-popup-trigger="share-popup">
                  <span class="material-icons">
                    share
                  </span>
                </button>
            </div>
        </div>

        <div class="about-me">
            <h2>About me</h2>
            <p>
                <%= user.bio == null ? "I am feeling lucky" : user.bio %>
            </p>
        </div>

        <div class="line mb-2 mt-2"></div>

        <div class="articles">
            <h2 class="mb-1">My Articles (<%= articles.size() %>)</h2>
              <div class="cards mb-1">
              <% if(articles.size() > 0) { %>
                <% for(Article article : articles) { %>
                   <div class="card">
                      <div class="card-sides">
                        <div class="card-side">
                          <div class="card-header">
                            <a href="/article/<%= article.slug %>" class="card-heading link block"><%= article.title %></a>
                          </div>
                          <div class="card-content">
                           <%= article.description %>
                          </div>
                          <div class="card-footer">
                            <div><%= article.getCleanDate() %></div>
                            <div class="chip"><%= article.type %></div>
                          </div>
                        </div>
                        <div class="card-side">
                          <img
                          style="background-color: #222;"
                            src="<%= article.featuredImageUrl %>"
                            alt=""
                            width="150"
                            height="100"
                          />
                        </div>
                       </div>
                    </div>
                <% } %>   
              </div>
              <% }else { %>
                  <div class="empty">Nothing to display</div>
                <% } %>
              </div>
        </div>
       </main>
    </div>

    <div class="popup" id="share-popup">
      <div class="popup-backdrop"></div>
      <div class="popup-content">
          <a class="link" href="https://twitter.com/share?url=/user-details?id=<%= currentURL %>">
              <img src="/images/twitter.svg" alt="" height="20" width="20"> Twitter
          </a>

          <a class="link" href="whatsapp://send?text=<%= currentURL %>">
            <img src="/images/whatsapp.svg" alt="" height="20" width="20"> Whatsapp
          </a>

          <!-- Facebook (url) -->
          <a class="link" href="https://www.facebook.com/sharer/sharer.php?u=<%= currentURL %>">
            <img src="/images/facebook.svg" alt="" height="20" width="20"> Facebook
          </a>
          
          <!-- LinkedIn (url, title, summary, source url) -->
          <a class="link" href="https://www.linkedin.com/shareArticle?url=<%=currentURL %>">
            <img src="/images/linkedin.svg" alt="" height="20" width="20">
              LinkedIn
          </a>
          
      </div>
    </div>

    <!-- Modals -->
   <jsp:include page="../includes/modals.jsp" />
   <!-- Snackbars -->
   <jsp:include page="../includes/snackbars.jsp" />

    <script src="/js/script.js"></script>
  </body>
</html>
