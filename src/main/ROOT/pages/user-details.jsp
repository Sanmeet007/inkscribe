<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="utils.*" %>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/frontend-head.jsp">
    <jsp:param name="title" value="Article" />
    <jsp:param name="desc" value="InkScribe is an open platform where readers find dynamic thinking, and where expert and undiscovered voices can share their writing on any topic." />
  </jsp:include>
  <body>
    <!-- Header -->
   <jsp:include page="../includes/header.jsp">
    <jsp:param name="page" value="article" />
   </jsp:include>
   
   <!-- Main -->
   <div>
       <div class="base-bg"></div>
       <main class="container extra-tight">

        <div class="user-profile lifted flex gap">
            <div class="profile-image">
                <img src="/images/avatar.svg" alt="Avatar" width="45" height="45">
            </div>
            <div class="details flex-grow">
                <div>
                    <div class="name">John Doe</div>
                    <div class="memebership small-text">Member since 2023</div>
                </div>
                <div class="spacer"></div>
                <a href="mailto:example@example.com" class="btn outlined secondary tightly-packed">
                    <span class="material-icons-outlined">
                        mail
                    </span>
                    <span>
                        Email
                    </span>
                </a>
            </div>
        </div>

        <div class="about-me">
            <h2>About me</h2>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel non iste dolores nam, praesentium maiores dolor excepturi possimus temporibus itaque quod porro dolorum et alias provident nesciunt sit animi doloribus.
            </p>
        </div>

        <div class="line mb-2 mt-2"></div>

        <div class="articles">
            <h2 class="mb-1">My Articles ( 25 )</h2>
            <div class="cards mb-1">
                <div class="card">
                  <div class="card-sides">
                    <div class="card-side">
                      <div class="card-header">
                        <div class="card-heading">Card Heading</div>
                      </div>
                      <div class="card-content">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel
                        expedita
                      </div>
                      <div class="card-footer">
                        <div>Aug 15</div>
                        <div class="chip">Programming</div>
                      </div>
                    </div>
                    <div class="card-side">
                      <img
                        src="https://miro.medium.com/v2/resize:fill:225:150/1*OHk6mYj1wpcSfJT01rOxiQ.png"
                        alt=""
                        width="150"
                        height="100"
                      />
                    </div>
                  </div>
                </div>
              </div>
        </div>
       </main>
    </div>
  
    <!-- Modals -->
   <jsp:include page="../includes/modals.jsp" />
   <!-- Snackbars -->
   <jsp:include page="../includes/snackbars.jsp" />

    <script src="/js/script.js"></script>
  </body>
</html>
