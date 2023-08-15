<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="utils.*" %>
<%@page import="models.articles.*" %>
<%@page import="java.util.ArrayList" %>
<% 

  ArrayList<Article> articles = new ArrayList<Article>();
  ArrayList<ArticleType> articleTypes = ArticleTypes.getTypes();

  String query = request.getParameter("q");
  
  String _t = request.getParameter("t");
  Integer type;

  if( _t != null) {
    try{
      type = Integer.parseInt(_t);
    }catch(Exception e){
      type = null;
    }
  }else{
    type = null;
  }

  if(query == null) {
    if(type == null){
      articles = Articles.getNArticles(10);
    }else{
      articles = Articles.find("" , type);
    }
  }else{
    if(type == null){
      articles = Articles.find(query);
    }else{
      articles = Articles.find(query , type);
    }
  }

%>
<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/frontend-head.jsp">
    <jsp:param name="title" value="Search | InkScribe" />
    <jsp:param name="desc" value="Explore articles at inkscribe" />
  </jsp:include>
  <body>
    <!-- Header -->
   <jsp:include page="../includes/header.jsp">
    <jsp:param name="page" value="search" />
   </jsp:include>
   
   <!-- Main -->
   <div class="featured-bg">
            <form class="searchbar" method="get">
                <input type="search" name="q" placeholder="Search articles"/>
                <div class="select">
                    <select name="t">
                        <option <%= type == null ?"selected" : "" %> default value="Any">Any</option>

                        <% for(ArticleType t : articleTypes ){ %>
                          <option value="<%= t.id %>" <%= type == null ? "" : t.id == type ? "selected" : "" %>><%= t.type %></option>
                        <% } %>
                    </select>
                </div>
                <button class="btn secondary">
                    <span class="material-icons-outlined">
                        search
                        </span>
                </button>
            </form>
    </div>

  

    <main class="container">
        <div class="cards mt-4">
          <% if(articles.size() > 0) { %>    
            <% for(Article article : articles) { %>
              <div class="card">
                  <div class="card-sides">
                    <div class="card-side">
                      <a href="/article/<%= article.slug %>" class="card-header link">
                        <div class="card-heading"><%= article.title %></div>
                      </a>
                      <div class="card-content">
                        <%= article.description %>
                      </div>
                      <div class="card-footer">
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
          <% } else { %>
            <div class="empty">No Article found</div>
          <% } %>
          </div>

    </main>
  <!-- Footer -->

    <!-- Modals -->
   <jsp:include page="../includes/modals.jsp" />
   <!-- Snackbars -->
   <jsp:include page="../includes/snackbars.jsp" />


    <script src="/js/script.js"></script>
  </body>
</html>
