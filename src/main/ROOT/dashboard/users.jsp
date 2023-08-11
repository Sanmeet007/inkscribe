<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="models.users.*" %>
<%@page import="utils.*" %>

<% 
  User user = Auth.getUser(request);
  boolean isAdmin = user.email.equals("admin@inkscribe.com");
%>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/backend-head.jsp">
    <jsp:param name="title" value="My Articles" />
  </jsp:include>
  <body>
    <!-- Main -->

    <div class="dashboard-container">
      <div class="dashboard-content">
        <jsp:include page="../includes/dash-nav.jsp" >
          <jsp:param name="page" value="users" />
        </jsp:include>
        <div class="main">
          <div class="flex">
            <div>
              <h1>
                Users
              </h1>
            </div>
              <div class="spacer"></div>
            <div class="form-element mt-1 mb-1">
              <label for="search_users">Search User</label>
              <fieldset>
                <legend>Search User</legend>
                <input
                  type="text"
                  id="search_users"
                  name="name"
                  placeholder="Serch article"
                />
              </fieldset>
            </div>
          </div>


          <div class="cards">

            <div class="card">
              <div class="card-header">
                <div class="card-user-profile">
                  <div class="user-image">
                    <img src="https://innostudio.de/fileuploader/images/default-avatar.png" alt="" width="30" height="30">
                  </div>
                  <div class="user-name flex fullwidth">
                    <div class="name">John Doe</div>
                    <div class="spacer"></div>
                    <div class="btns flex small-gap">
                      <a href="/user-details.jsp" class="btn icon-btn small" title="view">
                        <span class="material-symbols-outlined">
                          visibility
                          </span>
                      </a>
                      <button class="btn icon-btn small" title="delete">
                        <span class="material-symbols-outlined">
                          delete
                          </span>
                      </button>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card-content">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Placeat, eum?</div>

              <div class="card-footer">
                <div>Created on : Aug 10,2023</div>
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
