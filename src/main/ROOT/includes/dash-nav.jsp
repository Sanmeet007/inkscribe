<%@page import="models.users.*" %>
<%@page import="utils.*" %>

<% 
  String currentPage = request.getParameter("page");
  User user = Auth.getUser(request);
  boolean isAdmin = user.email.equals("admin@inkscribe.com");
%>

<div class="sidebar">
    <a href="/" class="block logo">
      <img src="/images/logo-dark.png" alt="logo" width="100" />
  </a>

    <div class="user-details">
      <div class="user-profile-image">
        <img src="/images/avatar.svg" alt="Avatar" width="80" />
      </div>
      <div class="user-name">
        <h3><%= user.name %></h3>
      </div>
      <div class="action">
        <button
          data-trigger="edit-user-details"
          class="btn outlined pill-shape tightly-packed no-text-transform secondary"
        >
          <span> Edit </span>
        </button>
      </div>
    </div>

    <div class="menu">



      <% if (isAdmin) { %>
        
      <a href="/dashboard" class="menu-item <%= currentPage.equals("dashboard") ? "active" : "" %>">
        <span class="material-icons-outlined"> dashboard </span>
        <span> Dashboard </span>
      </a>
      <a href="/dashboard/articles" class="menu-item <%= currentPage.equals("articles") ? "active" : "" %>">
        <span class="material-icons-outlined"> news </span>
        <span>Articles </span>
      </a>
      <a href="/dashboard/users" class="menu-item <%= currentPage.equals("users") ? "active" : "" %>">
        <span class="material-icons-outlined">
          group
          </span>
        <span>Users </span>
      </a>

        <% } else { %>
          
      <a href="/dashboard" class="menu-item <%= currentPage.equals("dashboard") ? "active" : "" %>">
        <span class="material-icons-outlined"> dashboard </span>
        <span> Dashboard </span>
      </a>
      <a href="/dashboard/articles" class="menu-item <%= currentPage.equals("articles") ? "active" : "" %>">
        <span class="material-icons-outlined"> article </span>
        <span> My Articles </span>
      </a>
      <a href="/dashboard/new-article" class="menu-item <%= currentPage.equals("new-article")  ? "active" : ""%>">
        <span class="material-icons-outlined"> add_circle </span>
        <span>New Aritcle</span>
      </a>

        <% } %>

    </div>
    <div class="flex-grow"></div>
    <div class="extras">
      <button class="btn fullwidth outlined" id="logout">Logout</button>
    </div>
  </div>

  <script>
    const logoutBtn = document?.querySelector("#logout");
    logoutBtn?.addEventListener("click"  ,async  (e) =>{

      logoutBtn.classList.add("loading")
      logoutBtn.setAttribute("disabled" , "");
      try{
        const response = await fetch("/api/logout");
        if(response.status === 200){
          setTimeout(() =>{
            logoutBtn.classList.remove("loading")
            logoutBtn.removeAttribute("disabled");
            showSnackbar("success"  , "Logout successfull");
            localStorage.removeItem("user");
            window.location  = "/";
          } , 500);
        }else{
          throw new Error("Something went wrong");
        }
      }catch(e) {
        logoutBtn.classList.remove("loading")
        logoutBtn.removeAttribute("disabled");
        showSnackbar("error"  , "Something went wrong");
      }
    });
  </script>