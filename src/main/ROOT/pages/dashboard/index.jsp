<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utils.*" %>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../../includes/backend-head.jsp">
    <jsp:param name="title" value="Dashboard" />
  </jsp:include>
  <body>
    <!-- Main -->

    <div class="dashboard-container">
      <div class="dashboard-content">

        <jsp:include page="../../includes/dash-nav.jsp" >
          <jsp:param name="page" value="dashboard" />
        </jsp:include>
        
        <!-- Data route  -->
        <div class="main">
          <h1>Dashboard</h1>
          <div class="welcome">
              <div class="cards">

                <% if(Auth.isAdmin(request)) { %>
                  <div class="card">
                    <h3>Profile Settings</h3>
                    <p>Edit your profile information and preferences.</p>
                  </div>
                  <div class="card">
                    <h3>Editing Articles</h3>
                    <p>Easily edit any article</p>
                  </div>
                  <div class="card">
                    <h3>Deleting Users</h3>
                    <p>You can view or delete users but can't edit their profiles.</p>
                  </div>
                  <% } else { %>
                  <div class="card">
                    <h3>Manage Your Articles</h3>
                    <p>View and manage your published articles.</p>
                  </div>
                  <div class="card">
                    <h3>Create New Article</h3>
                    <p>Start writing a new article to share your insights.</p>
                  </div>
                  <div class="card">
                    <h3>Profile Settings</h3>
                    <p>Edit your profile information and preferences.</p>
                  </div>
                  <div class="card">
                    <h3>Community Discussions</h3>
                    <p>Engage in discussions with fellow writers and readers.</p>
                  </div>
                <% } %>
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
