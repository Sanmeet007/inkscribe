<%@ page contentType="text/html; charset=UTF-8"%> 


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>InkScribe - Where good ideas find you.</title>
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
    <!-- Header -->
    <header>
      <nav class="nav desktop container">
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
            <li class="active">
              <a href="/"> Home </a>
            </li>
            <li>
              <a href="/our-story"> Our Story </a>
            </li>

            <li>
              <a href="/write"> Write </a>
            </li>
          </ul>
          <div class="nav-extras">
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
          <span class="material-symbols-outlined"> menu </span>
        </div>
        <div class="backdrop"></div>
        <div class="nav-drawer">
          <ul class="nav-links">
            <li class="active">
              <a href="/">
                <span class="material-symbols-outlined"> home </span>
                Home
              </a>
            </li>
            <li>
              <a href="/about-us">
                <span class="material-symbols-outlined"> info </span>
                About
              </a>
            </li>
            <li>
              <a href="/services">
                <span class="material-symbols-outlined"> settings </span>
                Services
              </a>
            </li>
            <li>
              <a href="/support">
                <span class="material-symbols-outlined"> support_agent </span>
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

    <div data-route="/">
      <section class="hero-section">
        <div class="container">
          <div class="flex">
            <div>
              <h1>Stay curious.</h1>
              <p>
                Discover stories, thinking, and expertise from writers on any
                topic.
              </p>
              <button class="btn fullwidth pill-shape" style="max-width: 200px">
                Start Reading
              </button>
            </div>
            <div class="flex-grow"></div>
          </div>
        </div>
      </section>

      <section class="divider">
        <div class="container">
          <div class="trending">
            <h2 class="flex gap">
              <span class="material-symbols-outlined"> trending_up </span>

              Trending on InkScribe
            </h2>

            <div class="cards">
              <div class="card">
                <div class="card-header">
                  <div class="card-user-profile">
                    <div class="user-image">
                      <img
                        src="https://innostudio.de/fileuploader/images/default-avatar.png"
                        alt=""
                        width="30"
                        height="30"
                      />
                    </div>
                    <div class="user-name">John Doe</div>
                  </div>
                </div>
                <div class="card-heading">
                  Lorem ipsum dolor sit amet consectetur
                </div>
                <div class="card-footer">
                  <div>Aug 15</div>
                  <div>Two</div>
                  <div>Three</div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <div class="card-user-profile">
                    <div class="user-image">
                      <img
                        src="https://innostudio.de/fileuploader/images/default-avatar.png"
                        alt=""
                        width="30"
                        height="30"
                      />
                    </div>
                    <div class="user-name">John Doe</div>
                  </div>
                </div>
                <div class="card-heading">
                  Lorem ipsum dolor sit amet consectetur
                </div>
                <div class="card-footer">
                  <div>Aug 15</div>
                  <div>Two</div>
                  <div>Three</div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <div class="card-user-profile">
                    <div class="user-image">
                      <img
                        src="https://innostudio.de/fileuploader/images/default-avatar.png"
                        alt=""
                        width="30"
                        height="30"
                      />
                    </div>
                    <div class="user-name">John Doe</div>
                  </div>
                </div>
                <div class="card-heading">
                  Lorem ipsum dolor sit amet consectetur
                </div>
                <div class="card-footer">
                  <div>Aug 15</div>
                  <div>Two</div>
                  <div>Three</div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <div class="card-user-profile">
                    <div class="user-image">
                      <img
                        src="https://innostudio.de/fileuploader/images/default-avatar.png"
                        alt=""
                        width="30"
                        height="30"
                      />
                    </div>
                    <div class="user-name">John Doe</div>
                  </div>
                </div>
                <div class="card-heading">
                  Lorem ipsum dolor sit amet consectetur
                </div>
                <div class="card-footer">
                  <div>Aug 15</div>
                  <div>Two</div>
                  <div>Three</div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <div class="card-user-profile">
                    <div class="user-image">
                      <img
                        src="https://innostudio.de/fileuploader/images/default-avatar.png"
                        alt=""
                        width="30"
                        height="30"
                      />
                    </div>
                    <div class="user-name">John Doe</div>
                  </div>
                </div>
                <div class="card-heading">
                  Lorem ipsum dolor sit amet consectetur
                </div>
                <div class="card-footer">
                  <div>Aug 15</div>
                  <div>Two</div>
                  <div>Three</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section class="posts">
        <div class="container posts-layout">
          <div class="discover">
            <div class="discover-content">
              <h2>Discover more of what matters to you</h2>
              <div class="chips">
                <div class="chip">Politics</div>
                <div class="chip">Writing</div>
                <div class="chip">Programming</div>
                <div class="chip">Data Science</div>
                <div class="chip">Technology</div>
                <div class="chip">Machine Learning</div>
                <div class="chip">ChatGPT</div>
                <div class="chip">GPT-4</div>
                <div class="chip">Productivity</div>
              </div>
            </div>
          </div>

          <div class="cards">
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
                    <div>Two</div>
                    <div>Three</div>
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
                    <div>Two</div>
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
                    <div>Aug 15</div>
                    <div>Two</div>
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
                    <div>Aug 15</div>
                    <div>Two</div>
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
                    <div>Aug 15</div>
                    <div>Two</div>
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
                    <div>Aug 15</div>
                    <div>Two</div>
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
        </div>
      </section>

      <section class="subscribe">
        <div class="container">
          <div class="newsletter-layout">
            <div>
              <h3>Join our newsletter</h3>
              <p>
                Don't miss out on the chance to be part of something
                extraordinary.
              </p>
            </div>
            <div>
              <form action="#" class="special-form">
                <div class="wrapper">
                  <input type="text" placeholder="Enter your email" />
                  <button>Join now</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>

    <!-- Footer -->
    <footer>
      <div class="container flex gap">
        <div>
          <p>&copy; 2023 InkScribe. All rights reserved.</p>
        </div>
        <div class="spacer"></div>
        <div class="links">
          <a href="#">Privacy Policy</a>
        </div>
      </div>
    </footer>

    <!-- Modals -->
    <div class="modal" id="sign-up-modal">
      <div class="modal-backdrop"></div>
      <div class="modal-content">
        <h1>Sign up</h1>
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
    <div class="modal" id="sign-in-modal">
      <div class="modal-backdrop"></div>
      <div class="modal-content">
        <h1>Sign In</h1>
        <form action="#">
          <div class="form-element">
            <label for="email_inp">Email <span class="red">*</span></label>
            <fieldset>
              <legend>Email*</legend>
              <input
                type="text"
                id="email_inp"
                name="email"
                placeholder="hunter@hunter.com"
              />
            </fieldset>
          </div>
          <div class="form-element">
            <label for="password_inp"
              >Password <span class="red">*</span></label
            >
            <fieldset>
              <legend>Email*</legend>
              <input
                type="password"
                id="password_inp"
                name="password"
                placeholder="hunter@hunter.com"
              />
            </fieldset>
          </div>

          <button class="btn" onclick="showSnackbar('success' , 'blah blah')">
            Submit
          </button>
        </form>
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
