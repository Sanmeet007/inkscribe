<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page import="utils.*" %>

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="./includes/frontend-head.jsp">
    <jsp:param name="title" value="Search" />
    <jsp:param name="desc" value="InkScribe is an open platform where readers find dynamic thinking, and where expert and undiscovered voices can share their writing on any topic." />
  </jsp:include>
  <body>
    <!-- Header -->
   <jsp:include page="./includes/header.jsp">
    <jsp:param name="page" value="search" />
   </jsp:include>
   
   <!-- Main -->
   <div class="featured-bg">
            <form action="#" class="searchbar">
                <input type="search" placeholder="Search articles"/>
                <div class="select">
                    <select name="select">
                        <option selected default value="Any">Any</option>
                        <option value="Programming">Programming</option>
                    </select>
                </div>
                <button class="btn secondary">
                    <span class="material-symbols-outlined">
                        search
                        </span>
                </button>
            </form>
    </div>

  

    <main class="container">
        <div class="cards mt-4">
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
                      <div>Three</div>
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
                      <div>Three</div>
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
                      <div>Three</div>
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
                      <div>Three</div>
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
            <div class="card">
                <div class="card-sides">
                  <div class="card-side">
                    <a href="/article.jsp" class="card-header link">
                      <div class="card-heading">Card Heading</div>
                    </a>
                    <div class="card-content">
                      Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel
                      expedita
                    </div>
                    <div class="card-footer">
                      <div class="chip">Politics</div>
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
                      <div>Three</div>
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

    </main>
  <!-- Footer -->

    <!-- Modals -->
   <jsp:include page="./includes/modals.jsp" />
   <!-- Snackbars -->
   <jsp:include page="./includes/snackbars.jsp" />


    <script src="/js/script.js"></script>
  </body>
</html>
