<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error | 404</title>
    <link rel="shortcut icon" href="/images/favicon.png" type="image/png">
  </head>
  <body>
    <style>
      html {
        color-scheme: dark;
        scroll-behavior: smooth;
        min-height: 100svh;
      }

      * {
        box-sizing: border-box;
      }

      h1,
      h2,
      h4 {
        color: rgb(217, 217, 217);
      }
      p {
        color: rgb(209, 208, 208);
      }
      body {
        font-size: 1rem;
        margin: 0;
        padding: 0;
        font-family: "Robotto", sans-serif;
      }
      h4 {
        font-size: 1.2rem;
        margin: 0;
      }
      p {
        font-size: 1rem;
      }
      .error-page {
        height: 100svh;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        gap: 1rem;
      }
      
      a{
        background-color: rgba(0, 128, 128, 0.772);
        color: white;
        text-decoration: none;
        padding: 1rem;
        border-radius: 100px;
      }
      .error-page{
        padding: 1rem;
      }
    </style>
    <div class="error-page">
      <h4>404 | ERROR</h4>
      <p>The page you are looking for doesn't exsits</p>
      <a class="btn waves-effect waves-ripple" href="/">Go to Homepage </a>
    </div>
  </body>
</html>
