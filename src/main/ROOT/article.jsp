<%@ page contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="./includes/frontend-head.jsp">
    <jsp:param name="title" value="Article" />
    <jsp:param name="desc" value="InkScribe is an open platform where readers find dynamic thinking, and where expert and undiscovered voices can share their writing on any topic." />
  </jsp:include>
  <body>
    <!-- Header -->
   <jsp:include page="./includes/header.jsp">
    <jsp:param name="page" value="article" />
   </jsp:include>
   
   <!-- Main -->
   <main class="container extra-tight">
     <h1 class="mt-2">Plan Your Medium Day Lineup</h1>
     <h2 class="sub-heading">Announcing the schedule of 200+ sessions for our community-led conference on August 12</h2>


     <div class="publisher-profile">
        <div>
          <img src="/images/avatar.svg" alt="Avatar" width="40">
        </div>
        <div>
          <div class="name">John Doe</div>
          <div class="article-meta">
            <div class="read-time">
              14 min read 
            </div>
            <div class="date-published">
              Aug 3
            </div>
          </div>
        </div>
     </div>

     <div class="actionbar">
       <div class="action">
        <button class="text-btn icon-btn">
        <span class="material-symbols-outlined">
          thumb_up
          </span>
          </button>
          1
       </div>
       <div class="action">
        <button class="text-btn icon-btn">
        <span class="material-symbols-outlined">
          thumb_down
          </span>
          </button>
          1
       </div>
       <div class="spacer"></div>
       <div class="action">
        <button class="text-btn icon-btn">
          <span class="material-symbols-outlined">
            chat
            </span>
        </button>
        38
       </div>
     </div>

     <div class="featured-image">
      <img src="https://miro.medium.com/v2/resize:fit:1100/0*0Ideh5f5QQUsfohN" alt="featured-image" width="900">
     </div>

     <article class="mb-2 mt-2">
      Lorem ipsum dolor sit, amet consectetur adipisicing elit. Natus laudantium sit iste iure quia sed velit repellat nesciunt, totam eius. Ut amet omnis earum obcaecati veniam, possimus voluptatem porro eligendi?
     </article>
     <div class="related-articles">
      <h3 class="mb-2">Recommended from InkScribe</h3>
      <div class="cards mb-2">
        <div class="card">
         
          <a href="/article.jsp" class="block no-link card-heading">
            Lorem ipsum dolor sit amet consectetur
          </a>
          <div class="card-content">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum corrupti voluptatibus veniam deserunt architecto! Repel
          </div>
          <div class="card-footer">
            <div>Aug 15</div>
            <div>Two</div>
            <div class="chip">Politics</div>
          </div>
        </div>
        <div class="card">
         
          <a href="/article.jsp" class="block no-link card-heading">
            Lorem ipsum dolor sit amet consectetur
          </a>
          <div class="card-content">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum corrupti voluptatibus veniam deserunt architecto! Repel
          </div>
          <div class="card-footer">
            <div>Aug 15</div>
            <div>Two</div>
            <div class="chip">Politics</div>
          </div>
        </div>
        <div class="card">
         
          <a href="/article.jsp" class="block no-link card-heading">
            Lorem ipsum dolor sit amet consectetur
          </a>
          <div class="card-content">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum corrupti voluptatibus veniam deserunt architecto! Repel
          </div>
          <div class="card-footer">
            <div>Aug 15</div>
            <div>Two</div>
            <div class="chip">Politics</div>
          </div>
        </div>
      </div>
     </div>
    </main>

    <div class="comments-sidebar open">
     <div class="comment-sidebar-backdrop"></div>
     <div class="comment-block">
      <h3>Responses (0)</h3>
      <input type="text">
      <button>Post</button>
     </div>
    </div>
  
  
  <!-- Footer -->
  <jsp:include page="./includes/footer.jsp" />

    <!-- Modals -->
   <jsp:include page="./includes/modals.jsp" />
   <!-- Snackbars -->
   <jsp:include page="./includes/snackbars.jsp" />

    <script src="/js/script.js"></script>
  </body>
</html>
