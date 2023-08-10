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