<%@page import="utils.*" %>
<%@page import="io.github.cdimascio.dotenv.Dotenv" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="models.users.Users" %>
<%@page import="models.users.User" %>

  <% if(Auth.isLoggedIn(request)) { %>
    <% User user = Auth.getUser(request); %>
    <% 
            SimpleDateFormat  pattern = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = pattern.format(user.createdAt);
    %>
    <!-- User Details Modal -->
    <div class="modal with-mins" id="edit-user-details" >
        <div class="modal-backdrop"></div>
        <div class="modal-content">
          <h1 class="mb-1 mt-1">Edit Details</h1>
          <form action="#" id="user-update-detials-form">
            <div class="form-element fullwidth">
              <label for="user_name"
                >Name <span class="red">*</span></label
              >
              <fieldset>
                <legend>Name*</legend>
                <input
                  required
                  autocomplete="on"
                  maxlength="120"
                  type="text"
                  id="user_name"
                  name="name"
                  placeholder="John Doe"
                  value="<%= user.name %>"
                />
              </fieldset>
            </div>      

            <div class="fullwidth mb-1 mt-1">
              <label for="profile_image">Profile image (<small>Optional</small>)
              </label>
              <input class="block mt-1" name="profile_image" type="file" accept=".jpg, .jpeg, .png" id="profile_image"/>
            </div> 
            <div class="form-element focused mb-1">
              <label for="user_dob">D.O.B <span class="red">*</span></label>
              <fieldset>
                <legend>D.O.B*</legend>
                <input
                  type="date"
                  id="user_dob"
                  name="dob"
                  autocomplete="on"
                  placeholder="hunter@hunter.com"
                  value="<%= formattedDate %>"
                />
              </fieldset>
            </div>


            <div class="form-element fullwidth rows-2">
              <label for="user_bio"
                >About me <span class="red">*</span>
              </label>
              <fieldset>
                <legend>About me</legend>
                <textarea
                required 
                maxlength="255"
                  type="text"
                  id="user_bio"
                  name="bio"
                  autocomplete="on"
                  placeholder="I am feeling lucky"
                ><%= user.bio == null ? "I am feeling lucky" : user.bio %></textarea>
              </fieldset>
            </div>

            <button type="submit" class="btn mt-1">Update</button>
          </form>
        </div>
      </div>

      <script>
        const editUserForm = document.querySelector("#user-update-detials-form");
        editUserForm.addEventListener("submit"  ,async e=>{
          e.preventDefault();
          const submitBtn = editUserForm.querySelector("[type='submit']")
          const bio =  editUserForm.bio.value;
          const name =  editUserForm.name.value;
          const dob =  editUserForm.dob.value;
          const files_field =  editUserForm.profile_image;

          const formData = new FormData();
          const maxSize = 5 * 1024 * 1024; // 5MB in bytes
          
          if(files_field.files.length > 0 ){
            const file = files_field.files[0];
              const fileSize = file.size;
              if (fileSize > maxSize) {
                alert('File size is too large. Please choose an image smaller than 5MB.');
                return;
              }else{
                formData.append("profile_image"  , file);
              }
          }

          formData.append("name" , name.trim());
          formData.append("bio" , bio.trim());
          formData.append("dob" , dob);

          submitBtn.classList.add("loading");
          submitBtn.setAttribute("disabled" , "");
          editUserForm.setAttribute("read-only"  ,"");

          try{
            const res = await fetch("/api/users/update-details" , {
              method :"POST", 
              body : formData
            });
            if(res.status === 200){
              submitBtn.classList.remove("loading");
              submitBtn.removeAttribute("disabled");
              showSnackbar("success" , "User details updated successfully");
              setTimeout(() =>{
                window.location.reload();
              } , 500);
            }else{
              throw new Error();
            }
          }catch(e){
            showSnackbar("error" , "Something went wrong");
            submitBtn.classList.remove("loading");
            submitBtn.removeAttribute("disabled");
            editUserForm.removeAttribute("read-only");
          }
        });
      </script>
  <% } %>

   <!-- Auth Modals -->
   <div class="modal" id="sign-up-modal">
    <div class="modal-backdrop"></div>
    <div class="modal-content">
      <h1>Sign up</h1>
      <form action="#" id="sign-up-form">
        <div class="form-element mt-1 mb-1">
          <label for="name_inp">Name <span class="red">*</span></label>
          <fieldset>
            <legend>Name*</legend>
            <input
              type="text"
              id="name_inp"
              autocomplete="on"
              name="name"
              placeholder="hunter@hunter.com"
            />
          </fieldset>
        </div>
        <div class="form-element mb-1">
          <label for="s_email_inp">Email <span class="red">*</span></label>
          <fieldset>
            <legend>Email*</legend>
            <input
              type="email"
              id="s_email_inp"
              autocomplete="on"
              name="email"
              placeholder="hunter@hunter.com"
            />
          </fieldset>
        </div>
        <div class="form-element focused mb-1">
          <label for="dob_inp">D.O.B <span class="red">*</span></label>
          <fieldset>
            <legend>D.O.B*</legend>
            <input
              type="date"
              id="dob_inp"
              autocomplete="on"
              name="dob"
              placeholder="hunter@hunter.com"
            />
          </fieldset>
        </div>
        <div class="form-element mb-1">
          <label for="s_password_inp"
            >Password <span class="red">*</span></label
          >
          <fieldset>
            <legend>Password*</legend>
            <input
              type="password"
              autocomplet="on"
              id="s_password_inp"
              name="password"
              placeholder="hunter@hunter.com"
            />
          </fieldset>
        </div>

        <button class="btn" type="submit">
          Submit
        </button>
      </form>
    </div>
  </div>

  <div class="modal" id="sign-in-modal">
    <div class="modal-backdrop"></div>
    <div class="modal-content">
      <h1>Sign In</h1>
      <form action="#" id="sign-in-form">
        <div class="form-element mb-1 mt-1">
          <label for="email_inp">Email <span class="red">*</span></label>
          <fieldset>
            <legend>Email*</legend>
            <input
              type="email"
              autocomplete="on"
              id="email_inp"
              name="email"
              placeholder="hunter@hunter.com"
            />
          </fieldset>
        </div>
        <div class="form-element mb-1">
          <label for="password_inp"
            >Password <span class="red">*</span></label
          >
          <fieldset>
            <legend>Password*</legend>
            <input
              type="password"
              autocomplete="on"
              id="password_inp"
              name="password"
              placeholder="hunter@hunter.com"
            />
          </fieldset>
        </div>

        <button class="btn" type="submit">
          Submit
        </button>
      </form>
    </div>
  </div>

  <script>
    const loginEvent = new Event("login");
    const signUpForm = document?.querySelector("#sign-up-form");
    const signInForm = document?.querySelector("#sign-in-form");
    signUpForm?.addEventListener("submit" , async e=>{
      e.preventDefault();
      const submitBtn = signUpForm?.querySelector("[type='submit']");
      const navExtraDiv = document?.querySelectorAll(".nav-extras");
      const signUpModal = document?.querySelector("#sign-up-modal");
      
      const name = signUpForm.name.value;
      const dob = signUpForm.dob.value;
      const email = signUpForm.email.value;
      const password = signUpForm.password.value;
  
      submitBtn?.classList.add("loading");
      submitBtn?.setAttribute("disabled", "");
  
      try{
        const response = await fetch("/api/sign-up" , {
          method:"POST",
          headers: {
            "Content-Type" : "application/json"
          },
          body :JSON.stringify({
            name , 
            dob , 
            email , 
            password
          }),
        });
  
        if(response.status === 200){
              const user = await response.json();
              localStorage.setItem("user"  , JSON.stringify(user.user));
              
              submitBtn?.classList.remove("loading");
              submitBtn?.removeAttribute("disabled");
              showSnackbar("success" , "Sign up successfull");
              if(navExtraDiv) {
                navExtraDiv.forEach(d =>{
                  d.innerHTML = `
                  <a href="/dashboard"
                  class="btn pill-shape min-size secondary">
                  Dashboard
                  </a>`;
                })
                document.dispatchEvent(loginEvent);
              }
              signUpModal?.classList.remove("open");
              signUpForm?.reset();
          }else{
            const json = await response.json();
            throw new Error(json.message);
          }
      }catch(e){
          submitBtn?.classList.remove("loading");
          submitBtn?.removeAttribute("disabled");
          showSnackbar("error" , e.message);
      };
  
    });
    signInForm?.addEventListener("submit" , async e=>{
      e.preventDefault();
      const submitBtn = signInForm?.querySelector("[type='submit']");
      const navExtraDiv = document?.querySelectorAll(".nav-extras");
      const signInModal = document?.querySelector("#sign-in-modal");
      
      const email = signInForm.email.value;
      const password = signInForm.password.value;
  
      submitBtn?.classList.add("loading");
      submitBtn?.setAttribute("disabled", "");
      
      try{
        const response = await fetch("/api/login" , {
          method:"POST",
          headers: {
            "Content-Type" : "application/json"
          },
          body :JSON.stringify({
            email , 
            password
          }),
        });
  
        if(response.status === 200){
            const user = await response.json();
            localStorage.setItem("user"  , JSON.stringify(user));
            
            submitBtn?.classList.remove("loading");
            submitBtn?.removeAttribute("disabled");
            showSnackbar("success" , "Login successfull");
            if(navExtraDiv) {
              navExtraDiv.forEach(d =>{
                  d.innerHTML = `
                  <a href="/dashboard"
                  class="btn pill-shape min-size secondary">
                  Dashboard
                  </a>`;
                })
                document.dispatchEvent(loginEvent);
              }
            signInModal?.classList.remove("open");
            signInForm?.reset();
        }else{
          const json = await response.json();
          throw new Error(json.message);
        }
      }catch(e){
          submitBtn?.classList.remove("loading");
          submitBtn?.removeAttribute("disabled");
          showSnackbar("error" , e.message);
      };
  
    });

  </script>
