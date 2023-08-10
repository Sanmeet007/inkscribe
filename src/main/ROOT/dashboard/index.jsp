<%@ page contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../includes/head.jsp">
    <jsp:param name="title" value="Dashboard" />
  </jsp:include>
  <body>
    <!-- Main -->

    <div class="dashboard-container">
      <div class="dashboard-content">

        <jsp:include page="../includes/dash-nav.jsp" >
          <jsp:param name="page" value="dashboard" />
        </jsp:include>
        
        <!-- Data route  -->
        <div class="main">
          <h1>Dashboard</h1>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum unde
            accusantium aspernatur, dolorem velit atque corporis magni pariatur
            rerum id maiores. Repellat impedit et cum ad quam, voluptate
            sapiente neque!
          </p>
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
