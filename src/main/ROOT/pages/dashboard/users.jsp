<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="java.util.ArrayList" %>
<%@page import="models.users.Users" %>
<%@page import="models.users.User" %>
<%@page import="utils.*" %>

<% 
  User admin = Auth.getUser(request);
  ArrayList<User> users = Users.getAllUsers();
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

          <% if(users.size() > 1) {%>
            <div class="cards">
                <% for(User user : users) { %>
                  <% if(user.id == admin.id) continue ;%>
                    <div class="card" data-uid="<%= user.id %>">
                        <div class="card-header">
                            <div class="card-user-profile">
                            <div class="user-image">
                                <img src="<%= user.getProfileImage() %>" alt="avatar" width="30" height="30">
                            </div>
                            <div class="user-name flex fullwidth">
                                <div class="name"><%= user.name %></div>
                                <div class="spacer"></div>
                                <div class="btns flex small-gap">
                                <a href="/user-details?id=<%= user.id %>" class="btn icon-btn small" title="view">
                                    <span class="material-icons-outlined">
                                    visibility
                                    </span>
                                </a>
                                <button class="btn icon-btn small" title="delete" data-delete-btn>
                                    <span class="material-icons-outlined">
                                    delete
                                    </span>
                                </button>
                                </div>
                            </div>
                            </div>
                        </div>
            
                        <div class="card-content"><%= user.bio == null ? "I'am feeling lucky" : user.bio %></div>
            
                        <div class="card-footer">
                            <div><%= user.getCleanDate() %></div>
                        </div>
                        </div>
                <% } %>
            </div>
        <% }else{ %>    
            <div class="empty">No user found</div>
        <% } %>    

        </div>
      </div>
    </div>

    <!-- Modals -->
    <jsp:include page="../../includes/modals.jsp" />
    <!-- Snackbars -->
    <jsp:include page="../../includes/snackbars.jsp" />
    
    <script src="/js/script.js"></script>
    <script>

      const cardsDiv = document.querySelectorAll("[data-uid]");
      const searchEl = document.querySelector("#search_users");

      searchEl.addEventListener("input" , (e) =>{
        const value = searchEl.value;
        cardsDiv.forEach(cardDiv =>{
          const userName = cardDiv.querySelector(".name").textContent.trim();
          if(value === "") {
            cardDiv.removeAttribute("hidden");
            return;
          }
          if(userName.toLowerCase().includes(value.toLowerCase())){
            cardDiv.removeAttribute("hidden");
          }else{
            cardDiv.setAttribute("hidden" , "");
          }
        });
      });

      cardsDiv.forEach(articleDiv =>{
          const deleteBtn = articleDiv.querySelector("[data-delete-btn]");
          deleteBtn.addEventListener("click" , async (e) =>{
            const x = confirm("Are you sure ? This action is irreverisble !");
            if(!x) return;
            
            try{
              deleteBtn.setAttribute("disabled" , "");
              deleteBtn.classList.add("loading");
              
              const userId = parseInt(articleDiv.getAttribute("data-uid"));
              if(!userId) throw new Error();

              const res = await fetch(`/api/users/delete-user?user_id=\${userId}`);
              if(res.status === 200){
                deleteBtn.classList.remove("loading");
                showSnackbar("success" , "User deleted successfully");

                setTimeout(()=>{
                  articleDiv.setAttribute("hidden" , "");
                  articleDiv.style.display = "none";
                } , 200);
              }else{
                throw new Error();
              }
            }catch(e){
              console.log(e)
              deleteBtn.removeAttribute("disabled");
              deleteBtn.classList.remove("loading");
              
              showSnackbar("error" , "Something went wrong");
            }
          })
        });
    </script>
  </body>
</html>
