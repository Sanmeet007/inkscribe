<%@page import="utils.*" %>

<% 
  String currentPage = request.getParameter("page");
%>

<header class="<%= currentPage.equals("index") ? "" : "scrolled" %>">
    <nav class="nav desktop container ">
      <div class="logo">
        <a href="/">
          <img
            src="/images/logo-dark.png"
            alt="LOGO"
            width="125"
            height="50"
          />
        </a>
      </div>
      <div class="flex align-center gap">
        <ul class="nav-links">
          <li class="<%= currentPage.equals("index") ? "active" : "" %>">
            <a href="/"> Home </a>
          </li>
          <li class="<%= currentPage.equals("our-story") ? "active" : "" %>">
            <a href="/our-story"> Our Story </a>
          </li>

          <li class="<%= currentPage.equals("search") ? "active" : "" %>">
            <a href="/search"> Search </a>
          </li>
        </ul>
        <div class="nav-extras">

          <% if (Auth.isLoggedIn(request)) { %>
                  
          <a href="/dashboard"
          class="btn pill-shape min-size secondary">
            Dashboard
          </a>

          <%} else {%>
            
          <button
            class="btn pill-shape min-size secondary"
            data-trigger="sign-in-modal"
          >
            Sign in
          </button>
          <button
            class="btn pill-shape outlined secondary min-size"
            data-trigger="sign-up-modal"
          >
            Sign up
          </button>
         <% } %>
        </div>
      </div>
    </nav>
    <nav class="nav mobile" id="mobile-nav">
      <div class="logo">
        <a href="/">
          <img
            src="https://images-platform.99static.com//NRp7o7MhpD-U5tKVb4284Q1Tpvg=/1333x0:2000x667/fit-in/500x500/99designs-contests-attachments/100/100792/attachment_100792419"
            alt="LOGO"
            width="38"
            height="38"
          />
          LOGO
        </a>
      </div>
      <div class="btn outlined icon-btn" id="nav-trigger">
        <span class="material-icons-outlined"> menu </span>
      </div>
      <div class="backdrop"></div>
      <div class="nav-drawer">
        <ul class="nav-links">
          <li class="active">
            <a href="/">
              <span class="material-icons-outlined"> home </span>
              Home
            </a>
          </li>
          <li>
            <a href="/about-us">
              <span class="material-icons-outlined"> info </span>
              About
            </a>
          </li>
          <li>
            <a href="/services">
              <span class="material-icons-outlined"> settings </span>
              Services
            </a>
          </li>
          <li>
            <a href="/support">
              <span class="material-icons-outlined"> support_agent </span>
              Support
            </a>
          </li>
        </ul>
        <div class="spacer"></div>
        <div class="nav-extras">
          <button class="pill-shape btn outlined fullwidth" id="sign-up-btn">
            Sign up
          </button>
          <button class="btn pill-shape fullwidth" id="sign-in-btn">
            Sign in
          </button>
        </div>
      </div>
    </nav>
  </header>

  <% if(currentPage.equals("index")){ %>
    <script>
      window.addEventListener("scroll", e => {
        if (window.scrollY > 100) {
            header.classList.add("scrolled");
        } else {
            header.classList.remove("scrolled");
        }
    });
    </script>
  <% }else{ %>
    <div style="height:70px"></div>
  <% } %>