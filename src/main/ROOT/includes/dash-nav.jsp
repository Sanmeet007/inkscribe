<% 
  String currentPage = request.getParameter("page");
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
        <h3>John Doe</h3>
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
      <a href="/dashboard/index.jsp" class="menu-item <%= currentPage.equals("dashboard") ? "active" : "" %>">
        <span class="material-symbols-outlined"> dashboard </span>
        <span> Dashboard </span>
      </a>
      <a href="/dashboard/articles.jsp" class="menu-item <%= currentPage.equals("articles") ? "active" : "" %>">
        <span class="material-symbols-outlined"> news </span>
        <span> My Articles </span>
      </a>
      <a href="/dashboard/new-article.jsp" class="menu-item <%= currentPage.equals("new-article")  ? "active" : ""%>">
        <span class="material-symbols-outlined"> add_circle </span>
        <span>New Aritcle</span>
      </a>
    </div>
    <div class="flex-grow"></div>
    <div class="extras">
      <button class="btn fullwidth outlined">Logout</button>
    </div>
  </div>