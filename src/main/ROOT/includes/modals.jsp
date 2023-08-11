<div class="modal" id="edit-user-details">
    <div class="modal-backdrop"></div>
    <div class="modal-content">
      <h1>This is modal </h1>
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


   <!-- Modals -->
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
              autocomplete
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
              type="text"
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
            <legend>Email*</legend>
            <input
              type="password"
              autocomplete
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
    const signUpForm = document?.querySelector("#sign-up-form");
    const signInForm = document?.querySelector("#sign-in-form");
    signUpForm?.addEventListener("submit" , async e=>{
      e.preventDefault();
      const submitBtn = signUpForm?.querySelector("[type='submit']");
      const navExtraDiv = document?.querySelector(".nav-extras");
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
              localStorage.setItem("user"  , JSON.stringify(user));
              
              submitBtn?.classList.remove("loading");
              submitBtn?.removeAttribute("disabled");
              showSnackbar("success" , "Sign up successfull");
              if(navExtraDiv) {
                navExtraDiv.innerHTML = `
                <a href="/dashboard/index.jsp"
                class="btn pill-shape min-size secondary">
                Dashboard
                </a>`;
              }
              signUpModal?.classList.remove("open");
          }else{
            const json = await response.json();
            throw new Error(json.message);
          }
      }catch(e){
          submitBtn?.classList.remove("loading");
          submitBtn?.removeAttribute("disabled");
          console.log(e);
          showSnackbar("error" , e.message);
      };
  
    });
    signInForm?.addEventListener("submit" , async e=>{
      e.preventDefault();
      const submitBtn = signInForm?.querySelector("[type='submit']");
      const navExtraDiv = document?.querySelector(".nav-extras");
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
                navExtraDiv.innerHTML = `
                <a href="/dashboard/index.jsp"
                class="btn pill-shape min-size secondary">
                Dashboard
                </a>`;
              }
            signInModal?.classList.remove("open");
        }else{
          const json = await response.json();
          throw new Error(json.message);
        }
      }catch(e){
          submitBtn?.classList.remove("loading");
          submitBtn?.removeAttribute("disabled");
          console.log(e);
          showSnackbar("error" , e.message);
      };
  
    });
  
  </script>
