<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="utils.*" %>
<%@page import="models.articles.Article" %>
<%@page import="models.articles.Articles" %>
<%@page import="models.articles.ArticleResponse" %>
<%@page import="java.util.ArrayList" %>

<%  
  boolean isLoggedIn = Auth.isLoggedIn(request);
  String articleSlug = (String) request.getAttribute("slug");
  Article article;
  if(isLoggedIn){
   article =  Articles.getArticleForUser(articleSlug , Auth.getUserId(request));
  }else{
    article =  Articles.getArticle(articleSlug);
  }
  
  ArrayList<ArticleResponse> articleResponses = Articles.getArticleResponses(article.id);
  Articles.incrementArticleViewCount(article.id);
  boolean myReaction = false;
  boolean likedByMe = false;
  if(article.userReactionType != null){
    likedByMe = article.userReactionType.equals("liked");
    myReaction = true;
  }
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
          <a href="/user-details?id=<%= article.authorId %>" class="link"><%= article.authorName %></a>
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
        <button class="text-btn icon-btn"  id="article_thumb_up" <%= isLoggedIn ? "":"disabled"%><%= isLoggedIn ? myReaction ? likedByMe ? "data-selected" :"" : "" :""%>>
        <span class="material-icons-outlined">
          thumb_up
          </span>
        <span class="material-icons">
          thumb_up
          </span>
          </button>
          <div id="like-count">
            <%=article.likesCount %>
          </div>
        </div>
        <div class="action">
          <button class="text-btn icon-btn"  id="article_thumb_down" <%= isLoggedIn ? "":"disabled"%> <%= isLoggedIn ? myReaction ? likedByMe ? "" : "data-selected" : "" :""%>>
            <span class="material-icons-outlined">
              thumb_down
            </span>

            <span class="material-icons">
              thumb_down
              </span>
          </button>

          <div id="dislike-count">
            <%=article.dislikesCount %>
          </div>
       </div>
       <div class="spacer"></div>
       <div class="action">
        <button class="text-btn icon-btn" id="comment-opener">
          <span class="material-icons-outlined">
            chat
            </span>
        </button>
        <span id="responses-count-1">
          <%= articleResponses.size() %>
        </span>
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
      <h3 class="mb-1">Responses <span id="responses-count">(<%= articleResponses.size() %>)</span></h3>
        <% if (isLoggedIn) { %>
          <form action="#" class="mb-1" id="response-form">
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
            <button class="btn" type="submit">Post</button>
          </form>
          <script>
            const responseForm = document.querySelector("#response-form");
            responseForm.addEventListener("submit" , async(e) =>{
              e.preventDefault();
              const reponsesDiv = document.querySelector("#response_cards");
              const submitBtn = responseForm.querySelector("[type='submit']");
              const responseCountDiv = document.querySelector("#responses-count");
              const responseCountDiv1 = document.querySelector("#responses-count-1");
              submitBtn.classList.add("loading");
              submitBtn.setAttribute("disabled" , "");
              const content = responseForm.response.value.trim();
              try{
                const res = await fetch("/api/articles/add-response" , {
                  method : "POST", 
                  headers : {
                    "Content-Type" : "application/json"
                  },
                  body : JSON.stringify({
                    slug,
                    content : content
                  })
                });
                if(res.status === 200){
                  const json = await res.json();
                  const data = json.response;
                  responseCountDiv.textContent = parseInt(responseCountDiv1.textContent) + 1;
                  responseCountDiv1.textContent = parseInt(responseCountDiv1.textContent) + 1;

                  if(reponsesDiv?.querySelector(".empty") != null){

                  reponsesDiv.innerHTML = `
                      <div class="card">
                          <div class="card-header">
                            <div class="card-user-profile">
                              <div class="user-image">
                                <img src="\${data.user_profile_image}" alt="" width="30" height="30">
                              </div>
                              <div class="user-name flex flex-column flex-no-center">
                                <a href="/user-details?id=\${data.user_id}" class="link">\${data.user_name}</a>
                                <div class="small-text mt-small">\${data.created_at}</div>
                              </div>
                            </div>
                          </div>
                          <div class="card-content">
                            \${data.content.trim()}
                          </div>
                        </div>
                  `;
                }else{
                  
                                    reponsesDiv.innerHTML = `
                                        <div class="card">
                                            <div class="card-header">
                                              <div class="card-user-profile">
                                                <div class="user-image">
                                                  <img src="\${data.user_profile_image}" alt="" width="30" height="30">
                                                </div>
                                                <div class="user-name flex flex-column flex-no-center">
                                                  <a href="/user-details?id=\${data.user_id}" class="link">\${data.user_name}</a>
                                                  <div class="small-text mt-small">\${data.created_at}</div>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="card-content">
                                              \${data.content.trim()}
                                            </div>
                                          </div>
                                    ` + reponsesDiv.innerHTML;

                }

                  showSnackbar("success" , "Response added to article");
                  submitBtn.classList.remove("loading");
                  submitBtn.removeAttribute("disabled");
                  responseForm.reset();
                }else{
                  throw new Error();
                }
              }catch(e){
                console.log(e)
                submitBtn.classList.remove("loading");
                submitBtn.removeAttribute("disabled");
                showSnackbar("error" , "Something went wrong !");
              }
            })
          </script>
          
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
        
        <div class="cards"  id="response_cards">
        <% if(articleResponses.size() > 0){ %>
           <% for (ArticleResponse articleResponse: articleResponses ) {   %>

             <div class="card">
               <div class="card-header">
                 <div class="card-user-profile">
                   <div class="user-image">
                     <img src="<%= articleResponse.getProfileImage() %>" alt="" width="30" height="30">
                   </div>
                   <div class="user-name flex flex-column flex-no-center">
                     <a href="/user-details?id=<%= articleResponse.userId %>" class="link"><%= articleResponse.userName %></a>
                     <div class="small-text mt-small"><%= articleResponse.getCleanDate() %></div>
                   </div>
                 </div>
               </div>
               <div class="card-content">
                <%= articleResponse.content %>
               </div>
             </div>

           <% } %>
           <% }else{ %>
            <div class="empty">No responses be the first one to comment</div>
            <% } %>
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

      const slug = "<%= article.slug %>";
      let likeCount = parseInt("<%= article.likesCount %>");
      let dislikeCount = parseInt("<%= article.dislikesCount %>");
  
      const likeCountDiv = document.querySelector("#like-count");
      const dislikeCountDiv = document.querySelector("#dislike-count");

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
      });
      
      document.addEventListener("login" , e=>{
        window.location.reload();
      });

      articleThumbUpBtn.addEventListener("click"  , async (e) =>{
        articleThumbUpBtn.setAttribute("disabled" ,"");
        articleThumbDownBtn.setAttribute("disabled" ,"");

          if(!articleThumbUpBtn.hasAttribute("data-selected")){
           
            try{
              const res = await fetch("/api/articles/like-article" , {
                method : "POST" , 
                headers :{
                  "Content-Type" : "application/json"
                },
                body: JSON.stringify({ 
                    slug
                })
              });
              if(res.status === 200){
                likeCount += 1;
                if(articleThumbDownBtn.hasAttribute("data-selected")){
                  dislikeCount -= 1;
                }
                likeCountDiv.textContent = likeCount;
                dislikeCountDiv.textContent = dislikeCount;
                articleThumbUpBtn.setAttribute("data-selected" , "");
                articleThumbDownBtn.removeAttribute("data-selected");
              }else{
                throw new Error();
              }
            }catch(e){
              showSnackbar("error" , "Something went wrong");
            }
          }else{
            try{
              const res = await fetch("/api/articles/remove-article-reaction" , {
                method : "POST" , 
                headers :{
                  "Content-Type" : "application/json"
                },
                body: JSON.stringify({ 
                    slug
                })
              });
              if(res.status === 200){
                console.log(likeCount);
                likeCount -= 1;
                likeCountDiv.textContent = likeCount;
                dislikeCountDiv.textContent = dislikeCount;
                articleThumbUpBtn.removeAttribute("data-selected");
                articleThumbDownBtn.removeAttribute("data-selected");
              }else{
                throw new Error();
              }
            }catch(e){
              showSnackbar("error" , "Something went wrong");
            }
          }
          articleThumbUpBtn.removeAttribute("disabled");
          articleThumbDownBtn.removeAttribute("disabled");
      });
      
      articleThumbDownBtn.addEventListener("click"  , async (e) =>{
        articleThumbUpBtn.setAttribute("disabled" ,"");
        articleThumbDownBtn.setAttribute("disabled" ,"");

          if(!articleThumbDownBtn.hasAttribute("data-selected")){
            try{
              const res = await fetch("/api/articles/dislike-article" , {
                method : "POST" , 
                headers :{
                  "Content-Type" : "application/json"
                },
                body: JSON.stringify({ 
                    slug
                })
              });
              if(res.status === 200){
                dislikeCount += 1;
                if(articleThumbUpBtn.hasAttribute("data-selected")){
                  likeCount -= 1;
                }
                likeCountDiv.textContent = likeCount;
                dislikeCountDiv.textContent = dislikeCount;
                articleThumbUpBtn.removeAttribute("data-selected");
                articleThumbDownBtn.setAttribute("data-selected" , "");
              }else{
                throw new Error();
              }
            }catch(e){
              showSnackbar("error" , "Something went wrong");
            }
          }else{
            try{
              const res = await fetch("/api/articles/remove-article-reaction" , {
                method : "POST" , 
                headers :{
                  "Content-Type" : "application/json"
                },
                body: JSON.stringify({ 
                    slug
                })
              });
              if(res.status === 200){
                dislikeCount -= 1;
                likeCountDiv.textContent = likeCount;
                dislikeCountDiv.textContent = dislikeCount;
                articleThumbUpBtn.removeAttribute("data-selected");
                articleThumbDownBtn.removeAttribute("data-selected");
              }else{
                throw new Error();
              }
            }catch(e){
              showSnackbar("error" , "Something went wrong");
            }
          }
          articleThumbUpBtn.removeAttribute("disabled");
          articleThumbDownBtn.removeAttribute("disabled");
      });
      
    </script>
    <script src="/js/script.js"></script>
  </body>
</html>
