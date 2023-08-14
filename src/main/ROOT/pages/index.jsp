<%@page contentType="text/html; charset=UTF-8"%> 
<%@page  import="java.util.ArrayList" %>
<%@page import="models.articles.Article" %>
<%@page import="models.articles.Articles" %>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/frontend-head.jsp">
    <jsp:param name="title" value="InkScribe" />
  </jsp:include>
  
  <body>
    <!-- Header -->
   <jsp:include page="../includes/header.jsp">
    <jsp:param name="page" value="index" />
   </jsp:include>

    <main>
      <section class="hero-section">
        <div class="container">
          <div class="flex">
            <div>
              <h1>Stay curious.</h1>
              <p>
                Discover stories, thinking, and expertise from writers on any
                topic.
              </p>
              <button class="btn fullwidth pill-shape" style="max-width: 200px">
                Start Reading
              </button>
            </div>
            <div class="flex-grow"></div>
          </div>
        </div>
      </section>

      <section class="divider">
        <div class="container">
          <div class="trending">
            <h2 class="flex gap">
              <span class="material-symbols-outlined"> trending_up </span>

              Trending on InkScribe
            </h2>

            <% ArrayList<Article> articles = Articles.getTopFiveArticles(); %>
               <% if(articles.size() > 0){ %>
                  <div class="cards">
                   <% for (Article article : articles) {   %>
                            <div class="card">
                            <div class="card-header">
                            <div class="card-user-profile">
                                <div class="user-image">
                                <img
                                    src="<%= article.getProfileImage() %>"
                                    alt="Avatar"
                                    width="30"
                                    height="30"
                                />
                                </div>
                                <div class="user-name"><%= article.authorName %></div>
                            </div>
                            </div>
                            <a href="/article/<%= article.slug %>" class="block card-heading link">
                              <%= article.title %>
                            </a>
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
      </section>

      <section class="posts">
        <div class="container posts-layout">
          <div class="discover">
            <div class="discover-content">
              <h2>Discover more of what matters to you</h2>
              <div class="chips">
                <div class="chip">Politics</div>
                <div class="chip">Writing</div>
                <div class="chip">Programming</div>
                <div class="chip">Data Science</div>
                <div class="chip">Technology</div>
                <div class="chip">Machine Learning</div>
                <div class="chip">ChatGPT</div>
                <div class="chip">GPT-4</div>
                <div class="chip">Productivity</div>
              </div>
            </div>
          </div>

          <% ArrayList<Article> nArticles = Articles.getNArticles(10); %>
            <% if(articles.size() > 0){ %>
               <div class="cards">
                <% for (Article article : nArticles) {   %>

                 <div class="card">
                     <div class="card-sides">
                       <div class="card-side">
                         <div class="card-header">
                             <a href="/article/<%= article.slug %>" class="block card-heading link">
                                 <%= article.title %>
                               </a>
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
            <% }else{ %>
                 <div class="empty">No articles to dislay</div>
            <% } %>
        </div>
      </section>

      <section class="subscribe">
        <div class="container">
          <div class="newsletter-layout">
            <div>
              <h3>Join our newsletter</h3>
              <p>
                Don't miss out on the chance to be part of something
                extraordinary.
              </p>
            </div>
            <div>
              <form action="#" class="special-form">
                <div class="wrapper">
                  <input type="text" placeholder="Enter your email" />
                  <button>Join now</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
    </main>
    
    <!-- Footer -->
    <jsp:include page="../includes/footer.jsp" />

    <!-- Modals -->
    <jsp:include page="../includes/modals.jsp" />
    <!-- Snackbars -->
    <jsp:include page="../includes/snackbars.jsp" />


    <script src="/js/script.js"></script>
  </body>
</html>
