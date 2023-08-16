<%@ page contentType="text/html; charset=UTF-8"%> 
<%@page  import="java.util.ArrayList" %>
<%@page import="models.articles.Article" %>
<%@page import="models.articles.Articles" %>
<%@page import="models.articles.ArticleTypes" %>
<%@page import="models.articles.ArticleType" %>

<% 
  String _id = request.getParameter("id");
  int articleId = Integer.parseInt(_id);
  Article article = Articles.getArticle(articleId);
%>
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
          <p>Kindly compose a well-crafted article.</p>
          <form action="#" class="flex gap flex-column mt-1" id="edit_form">
            <div class="form-element fullwidth">
              <select name="article_types" id="article_types" required>
                <option disabled >Select a topic</option><%= article.type == null ? "selected" :"" %>
                <% ArrayList<ArticleType> types = ArticleTypes.getTypes(); %>
                  <% for(ArticleType t : types) { %>
                      <option value="<%= t.id %>" <%= article.type.equals(t.type) ? "selected": "" %>><%= t.type %></option>
                  <% } %>
              </select>
            </div>
            <div class="form-element fullwidth">
                <label for="featured_image_url"
                  >Featured Image URL<span class="red">*</span></label
                >
                <fieldset>
                  <legend>Featured Image u*</legend>
                  <input
                    required 
                    maxlength="255"
                    type="text"
                    id="featured_image_url"
                    name="featured_image_url"
                    placeholder="my-cool-article"
                    value="<%= article.featuredImageUrl %>"
                  />
                </fieldset>
              </div>
            <div class="form-element fullwidth">
                <label for="featured_image_url"
                  >Slug <span class="red">*</span></label
                >
                <fieldset>
                  <legend>Slug*</legend>
                  <input
                    required 
                    maxlength="100"
                    type="text"
                    id="slug"
                    name="slug"
                    oninput="toSlug(this)"
                    placeholder="http://example.com/images/image.jpg"
                    value="<%= article.slug %>"
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
                  required
                  maxlength="120"
                  type="text"
                  id="article_title"
                  name="title"
                  placeholder="My new Article"
                  value="<%= article.title %>"
                />
              </fieldset>
            </div>
            <div class="form-element fullwidth rows-2">
              <label for="article_desc"
                >Description <span class="red">*</span>
              </label>
              <fieldset>
                <legend>Description</legend>
                <textarea
                required 
                maxlength="255"
                  type="text"
                  id="article_desc"
                  name="desc"
                  placeholder="I am feeling lucky"
                ><%= article.description %></textarea>
              </fieldset>
            </div>
            <div class="form-element fullwidth">
              <label for="article_content"
                >Content <span class="red">*</span>
              </label>
              <fieldset>
                <legend>Content*</legend>
                <textarea
                  required
                  maxlength="5000"
                  type="text"
                  id="article_content"
                  name="content"
                  placeholder="I am feeling lucky"
                ><%= article.content %></textarea>
              </fieldset>
            </div>

            <div class="flex fullwidth justify-left gap">
              <button type="submit" class="btn">Update</button>
              <button type="button" id="build_preview" class="btn" data-trigger="article_preview">Preview</button>
              <a href="/article/<%= article.slug %>" target="_blank" type="button" class="btn" id="article_view">View</a>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Modals -->
    <jsp:include page="../../includes/modals.jsp" />
    <!-- Snackbars -->
    <jsp:include page="../../includes/snackbars.jsp" />

    <div class="modal" id="article_preview">
      <div class="modal-backdrop"></div>
      <div class="modal-content"></div>
</div>
 
  <script src="/js/script.js"></script>
  <script src="/js/showdown.min.js"></script>
  <script>
    const converter = new showdown.Converter();
    const editForm = document.querySelector("#edit_form");
    const buildPreviewBtn = document.querySelector("#build_preview");
    const articleViewBtn = document.querySelector("#article_view");

     buildPreviewBtn.addEventListener("click", () =>{
       const articlePreviewDiv = document.querySelector("#article_preview .modal-content")
      articlePreviewDiv.innerHTML = "LOADING";
      const articleContent = editForm.content.value;
      const html = converter.makeHtml(articleContent);
      articlePreviewDiv.innerHTML = html;
    });

    editForm.addEventListener("submit"  , async (e) =>{
      e.preventDefault();
      const submitBtn = editForm.querySelector("[type='submit']");
      const content = editForm.content.value;
      const featured_image_url = editForm.featured_image_url.value;
      const slug = editForm.slug.value;
      const description = editForm.desc.value;
      const title = editForm.title.value;
      const type = editForm.article_types.value;
      const article_id = "<%= article.id %>";

      submitBtn.classList.add("loading");
      submitBtn.setAttribute("disabled" ,"");
      editForm.setAttribute("read-only" , "");
      
      try{

        const res = await fetch("/api/articles/update-details" ,{
          method: "POST",
        headers:{
          "Content-Type" : "application/json"
        },
        body : JSON.stringify({
          content,
          article_id , 
          slug , 
          title , 
          featured_image_url , 
          type , 
          description
        })
      });
      if(res.status === 200){
        articleViewBtn.href = "/article/" + slug;
        editForm.removeAttribute("read-only");
        submitBtn.classList.remove("loading");
        submitBtn.removeAttribute("disabled");
        showSnackbar("success"  , "Article updated successfully")
      }else{
        throw new Error("");
      }
    }catch(e){
        editForm.removeAttribute("read-only");
        submitBtn.classList.remove("loading");
        submitBtn.removeAttribute("disabled");
        showSnackbar("error"  , "Something went wrong")
      }
    });
    
  </script>
  </body>
</html>
