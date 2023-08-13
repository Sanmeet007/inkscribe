<%@ page contentType="text/html; charset=UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
  <jsp:include page="../../includes/backend-head.jsp">
    <jsp:param name="title" value="Edit Article" />
  </jsp:include>
  <body>
    <!-- Main -->

    <div class="dashboard-container">
      <div class="dashboard-content">
        
        <jsp:include page="../../includes/dash-nav.jsp" >
          <jsp:param name="page" value="edit-article" />
        </jsp:include>
        
        <div class="main">
          <h1 class="mb-1">Edit Article</h1>
          <p>This is my new article page</p>
          <form action="#" class="flex gap flex-column mt-1">
            <div class="form-element fullwidth">
              <select name="" id="">
                <option selected disabled>Select a topic</option>
                <option value="Programming">Programming</option>
              </select>
            </div>
            <div class="form-element fullwidth">
                <label for="article_slug"
                  >Slug <span class="red">*</span></label
                >
                <fieldset>
                  <legend>Slug*</legend>
                  <input
                    type="text"
                    id="article_slug"
                    name="slug"
                    placeholder="my-cool-article"
                  />
                </fieldset>
              </div>
            <div class="form-element fullwidth">
              <label for="article_title"
                >Title <span class="red">*</span></label
              >
              <fieldset>
                <legend>Title*</legend>
                <input
                  type="text"
                  id="article_title"
                  name="title"
                  placeholder="My new Article"
                />
              </fieldset>
            </div>
            <div class="form-element fullwidth rows-2">
              <label for="article_content"
                >Description
                <span class="red">*</span>
              </label>
              <fieldset>
                <legend>Content*</legend>
                <textarea
                  type="text"
                  id="article_content"
                  name="content"
                  placeholder="I am feeling lucky"
                ></textarea>
              </fieldset>
            </div>
            <div class="form-element fullwidth">
              <label for="article_content"
                >Content
                <span class="red">*</span>
              </label>
              <fieldset>
                <legend>Content*</legend>
                <textarea
                  type="text"
                  id="article_content"
                  name="content"
                  placeholder="I am feeling lucky"
                ></textarea>
              </fieldset>
            </div>

            <div class="flex fullwidth justify-left">
              <button class="btn">Publish</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Modals -->
    <jsp:include page="../../includes/modals.jsp" />
    <!-- Snackbars -->
    <jsp:include page="../../includes/snackbars.jsp" />
 

    <script src="/js/script.js"></script>
  </body>
</html>
