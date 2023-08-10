<%@ page contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/head.jsp">
    <jsp:param name="title" value="My Articles" />
  </jsp:include>
  <body>
    <!-- Main -->

    <div class="dashboard-container">
      <div class="dashboard-content">
        <jsp:include page="../includes/dash-nav.jsp" >
          <jsp:param name="page" value="myarticles" />
        </jsp:include>
        <div class="main">
          <h1 class="mb-1">My Articles</h1>

          <div class="cards">
            <div class="card">
             
              <div class="card-heading">
                Lorem ipsum dolor sit amet consectetur
              </div>
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
             
              <div class="card-heading flex gap">
                <div>
                  Lorem ipsum dolor sit amet consectetur
                </div>
                <div class="flex  small-gap">
                  <a  href="/edit-article.jsp" class="btn icon-btn small">
                    <span class="material-symbols-outlined">
                      edit
                      </span>
                  </a>
                  <a href="/delete-article.jsp" class="btn icon-btn small">
                    <span class="material-symbols-outlined">
                      delete
                      </span>
                  </a>
                 </div> 
              </div>
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
             
              <div class="card-heading">
                <div class="flex">
                 <div>
                   Lorem ipsum dolor sit amet consectetur
                 </div> 
                
                </div>
              </div>
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
             
              <div class="card-heading">
                Lorem ipsum dolor sit amet consectetur
              </div>
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
      </div>
    </div>

    <!-- Modals -->
    <jsp:include page="../includes/modals.jsp" />
    <!-- Snackbars -->
    <jsp:include page="../includes/snackbars.jsp" />

    <script src="/js/script.js"></script>
  </body>
</html>
