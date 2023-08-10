<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Dashboard</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="color-scheme" content="dark" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="shortcut icon" href="/images/favicon.png" type="image/png" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
  </head>
  <body>
    <!-- Main -->

    <div class="dashboard-container">
      <div class="dashboard-content">
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
            <a href="/dashboard.jsp" class="menu-item active">
              <span class="material-symbols-outlined"> dashboard </span>
              <span> Dashboard </span>
            </a>
            <a href="/myarticles.jsp" class="menu-item ">
              <span class="material-symbols-outlined"> news </span>
              <span> My Articles </span>
            </a>
            <a href="/new-article.jsp" class="menu-item">
              <span class="material-symbols-outlined"> add_circle </span>
              <span>New Aritcle</span>
            </a>
          </div>
          <div class="flex-grow"></div>
          <div class="extras">
            <button class="btn fullwidth outlined">Logout</button>
          </div>
        </div>
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
    <div class="modal" id="edit-user-details">
      <div class="modal-backdrop"></div>
      <div class="modal-content">
        <h1>This is modal heading</h1>
        <p>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nihil
          maiores deleniti labore, beatae dicta praesentium porro est nemo,
          voluptatem harum amet dolore natus omnis ullam tempora ratione illo
          perferendis magnam?
        </p>
        <button class="btn" onclick="showSnackbar('success' , 'blah blah')">
          Submit
        </button>
      </div>
    </div>

    <!-- Snackbars -->
    <div class="snackbar warning">
      <div class="flex">
        <span class="material-symbols-outlined"> error </span>
      </div>
      <div class="snackbar-content"></div>
      <button class="snackbar-dismiss btn icon-btn">
        <span class="material-symbols-outlined"> close </span>
      </button>
    </div>
    <div class="snackbar error">
      <div class="flex">
        <span class="material-symbols-outlined"> error </span>
      </div>
      <div class="snackbar-content"></div>
      <button class="snackbar-dismiss btn icon-btn">
        <span class="material-symbols-outlined"> close </span>
      </button>
    </div>
    <div class="snackbar success">
      <div class="flex">
        <span class="material-symbols-outlined"> error </span>
      </div>
      <div class="snackbar-content"></div>
      <button class="snackbar-dismiss btn icon-btn">
        <span class="material-symbols-outlined"> close </span>
      </button>
    </div>
    <div class="snackbar info">
      <div class="flex">
        <span class="material-symbols-outlined"> error </span>
      </div>
      <div class="snackbar-content"></div>
      <button class="snackbar-dismiss btn icon-btn">
        <span class="material-symbols-outlined"> close </span>
      </button>
    </div>

    <script src="/js/script.js"></script>
  </body>
</html>
