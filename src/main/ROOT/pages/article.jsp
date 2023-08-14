<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="utils.*" %>
<%@page import="models.articles.Article" %>
<%@page import="models.articles.Articles" %>
<%@page import="models.articles.ArticleResponse" %>
<%@page import="java.util.ArrayList" %>

<%  
  String articleSlug = (String) request.getAttribute("slug");
  Article article = Articles.getArticle(articleSlug);
  ArrayList<ArticleResponse> articleResponses = Articles.getArticleResponses(article.id);
%>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/frontend-head.jsp">
    <jsp:param name="title" value="<%= article.title %>" />
    <jsp:param name="desc" value="InkScribe is an open platform where readers find dynamic thinking, and where expert and undiscovered voices can share their writing on any topic." />
  </jsp:include>
  <body>
    <!-- Header -->
   <jsp:include page="../includes/header.jsp">
    <jsp:param name="page" value="article" />
   </jsp:include>
   
   <!-- Main -->
   <main class="container extra-tight">
     <h1 class="mt-2"><%= article.title %></h1>
     <h2 class="sub-heading"><%= article.description %></h2>


     <div class="publisher-profile">
        <div>
          <img src="<%= article.getProfileImage() %>" alt="Avatar" width="40">
        </div>
        <div>
          <a href="/user-details?id=<%= article.authorId %>" class="link">John Doe</a>
          <div class="article-meta">
            <div class="read-time">
              <%= article.type %>
            </div>
            <div class="date-published">
              <%= article.getCleanDate() %>
            </div>
          </div>
        </div>
     </div>

     <div class="actionbar">
       <div class="action">
        <button class="text-btn icon-btn"  id="article_thumb_up">
        <span class="material-symbols-outlined">
          thumb_up
          </span>
          </button>
          <%=article.likesCount %>
        </div>
        <div class="action">
          <button class="text-btn icon-btn"  id="article_thumb_down">
            <span class="material-symbols-outlined">
              thumb_down
            </span>
          </button>
          <%=article.dislikesCount %>
       </div>
       <div class="spacer"></div>
       <div class="action">
        <button class="text-btn icon-btn" id="comment-opener">
          <span class="material-symbols-outlined">
            chat
            </span>
        </button>
        38
       </div>
     </div>
     <div class="featured-image">
      <img src="<%= article.featuredImageUrl %>" alt="featured-image" width="900">
     </div>

     <article class="mb-2 mt-2" id="article-content">
      <%= MarkdownConverter.markdownToHtml(article.content) %>
     </article>
   
      <% ArrayList<Article> articles = Articles.getRecommendationsForType(article.type); %>
        <% if(articles.size() > 1){ %>
          <div class="related-articles">
            <h3 class="mb-2">Recommended from InkScribe</h3>
           <div class="cards mb-2">
            <% for (Article currentArticle : articles) {   %>
             <% if (currentArticle.id == article.id ) continue ; %>
             <div class="card">
  
                 <a href="/article/<%= currentArticle.slug %>" class="block card-heading link">
                     <%= currentArticle.title %>
                   </a>
                 <div class="card-content">
                   <%= currentArticle.description %>
                 </div>
                 <div class="card-footer">
                     <div><%= currentArticle.getCleanDate() %></div>
                 </div>
               </div>
               
            <% } %>
           </div>
          </div>
        <% } %>

    </main>

    <div class="comments-sidebar" id="side-panel">
     <div class="comment-sidebar-backdrop"></div>
     <div class="comment-block">
      <h3 class="mb-1">Responses (1)</h3>
        <% if (Auth.isLoggedIn(request)) { %>
          <form action="#" class="mb-1">
            <div class="form-element fullwidth rows-2 mb-1">
              <label for="response"
                >Response <span class="red">*</span></label
              >
              <fieldset>
                <legend>Response*</legend>
                <textarea
                  type="text"
                  id="response"
                  name="response"
                  placeholder="Awesome article !"
                ></textarea>
              </fieldset>
            </div>
            <button type="reset" class="btn">Post</button>
          </form>
        <% }else { %>
          <div class="shadow-block" id="bummer">
            <p>What are your thoughts ?</p>
          </div>

          <script>
             const bummer = document?.querySelector("#bummer");
             if(bummer){
              bummer.addEventListener("click" , e =>{
                const sidePanel = document.querySelector("#side-panel");
                const signUpModal = document?.querySelector("#sign-up-modal");
                if(signUpModal){
                  sidePanel.classList.remove("open");
                  signUpModal.classList.add("open");
                }
              })
             }
          </script>
        <% } %>
      <div class="cards">
        <div class="card">
          <div class="card-header">
            <div class="card-user-profile">
              <div class="user-image">
                <img src="https://innostudio.de/fileuploader/images/default-avatar.png" alt="" width="30" height="30">
              </div>
              <div class="user-name flex flex-column flex-no-center">
                <a href="/user-details" class="link">John Doe</a>
                <div class="small-text mt-small">Aug 10,2023</div>
              </div>
            </div>
          </div>
          <div class="card-content">
            Lorem ipsum dolor sit amet, consectetur adipisicing .
          </div>
        </div>
        <div class="card">
          <div class="card-header">
            <div class="card-user-profile">
              <div class="user-image">
                <img src="https://innostudio.de/fileuploader/images/default-avatar.png" alt="" width="30" height="30">
              </div>
              <div class="user-name flex flex-column flex-no-center">
                <div>John Doe</div>
                <div class="small-text mt-small">Aug 10,2023</div>
              </div>
            </div>
          </div>
          <div class="card-content">
            Lorem ipsum dolor sit amet, consectetur adipisicing .
          </div>
        </div>
      </div>
     </div>
    </div>
  
  
  <!-- Footer -->
  <jsp:include page="../includes/footer.jsp" />

    <!-- Modals -->
   <jsp:include page="../includes/modals.jsp" />
   <!-- Snackbars -->
   <jsp:include page="../includes/snackbars.jsp" />



    <script>
      const commentsOpenerBtn = document?.querySelector("#comment-opener");
      const articleThumbDownBtn = document?.querySelector("#article_thumb_down");
      const articleThumbUpBtn = document?.querySelector("#article_thumb_up");
      const sidePanel = document?.querySelector("#side-panel");
      const sidePanelBackdrop = document?.querySelector("#side-panel > .comment-sidebar-backdrop");

      commentsOpenerBtn?.addEventListener("click" , (e) =>{
        sidePanel?.classList.add("open");
      });
      sidePanelBackdrop?.addEventListener("click"  , (e) =>{
        sidePanel?.classList.remove("open");
      })
      window.addEventListener("keyup" , (e) =>{
        if(e.key === "Escape"){
          sidePanel?.classList.remove("open");
        }
      })


    </script>
    <script src="/js/script.js"></script>
  </body>
</html>
