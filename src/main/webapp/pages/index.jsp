<%@page contentType="text/html; charset=UTF-8"%> 
<%@page  import="java.util.ArrayList" %>
<%@page import="models.articles.Article" %>
<%@page import="models.articles.Articles" %>
<%@page import="models.articles.ArticleTypes" %>
<%@page import="models.articles.ArticleType" %>
<%@page import="java.util.ArrayList" %>

<% 
  ArrayList<ArticleType> types = ArticleTypes.getTopTypes(7);
%>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/frontend-head.jsp">
    <jsp:param name="title" value="InkScribe" />
    <jsp:param name="desc" value="InkScribe is an open platform where readers find dynamic thinking, and where expert and undiscovered voices can share their writing on any topic." />
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
              <span class="material-icons-outlined"> trending_up </span>

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
                                <a href="/user-details?id=<%= article.authorId %>" class="user-name no-link"><%= article.authorName %></a>
                            </div>
                            </div>
                            <a href="/article/<%= article.slug %>" class="block card-heading link line-clamp-2">
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
                <% for(ArticleType t: types) { %>
                  <a href="/search?t=<%= t.id %>" class="chip block" style="text-decoration:none;"><%= t.type %></a>
                <% } %> 
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
                             <a href="/article/<%= article.slug %>" class="block card-heading link line-clamp-2">
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

      <section class="subscribe mt-1">
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
              <form action="#" class="special-form" id="special-form">
                <div class="wrapper">
                  <input type="text" autocomplete="on" placeholder="Enter your email" name="email"/>
                  <button class="btn" type="submit">Join now</button>
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

    <script>
      const subscriptionForm = document.querySelector("#special-form");
      subscriptionForm.addEventListener("submit" , async e => {
        e.preventDefault();
        const email = subscriptionForm.email.value;
        const submitBtn = subscriptionForm.querySelector("[type='submit']");
        submitBtn.classList.add("loading");
        submitBtn.setAttribute("disabled" , "");
        subscriptionForm.setAttribute("read-only" , "");

        try{
          const res = await fetch(`/api/subscribers/add?email=\${email}`);
          if(res.status === 200){
              subscriptionForm.removeAttribute("read-only");
              submitBtn.classList.remove("loading");
              submitBtn.removeAttribute("disabled");
              showSnackbar("info" , "Subscribed successfully");
              subscriptionForm.reset();
          }else{
            throw new Error();
          }
        }catch(e){
          subscriptionForm.removeAttribute("read-only");
          submitBtn.removeAttribute("disabled");
          showSnackbar("error" , "Something went wrong");
        }
      });
    </script>

    <script src="/js/script.js"></script>
  </body>
</html>
