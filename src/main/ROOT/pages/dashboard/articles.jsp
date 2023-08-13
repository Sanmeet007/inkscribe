<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="models.users.*" %>
<%@page import="utils.*" %>

<% 
  User user = Auth.getUser(request);
  boolean isAdmin = user.email.equals("admin@inkscribe.com");
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

          <div class="cards">
      
            <div class="card">

              <% if(isAdmin)  {%>
              <div class="card-header">
                <div class="card-user-profile">
                  <div class="user-image">
                    <img src="https://innostudio.de/fileuploader/images/default-avatar.png" alt="" width="30" height="30">
                  </div>
                  <a href="/user-details" class="user-name link" style="color: inherit;">John Doe</a>
                </div>
              </div>

              <% } %>
             
              <div class="card-heading flex gap">
                <a href="/article" class="block link">
                  Lorem ipsum dolor sit amet consectetur
                </a>
                <div class="flex  small-gap">
                  <a  href="/dashboard/edit-article" class="btn icon-btn small" title="Edit">
                    <span class="material-symbols-outlined">
                      edit
                      </span>
                  </a>
                  <a href="/delete-article" class="btn icon-btn small" title="Delete">
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
        
          </div>
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
