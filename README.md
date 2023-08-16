# Welcome to InkScribe

InkScribe provides an open platform where readers can explore dynamic thinking, and both experienced experts and undiscovered voices can share their writings on any topic.

## Project Description: InkScribe - Your Creative Platform

**Project Name:** InkScribe

**Project Overview:**
InkScribe is a dynamic web application that draws inspiration from the popular blogging platform Medium. This innovative platform aims to empower both readers and writers by providing a space where creativity thrives. With user-friendly features and a focus on seamless content sharing, InkScribe offers an experience that fosters engagement, interaction, and the exploration of diverse ideas.

**Key Features:**

- **User Management:** InkScribe boasts a comprehensive user management system that distinguishes between two main roles: administrators and writers. This hierarchical approach ensures a smooth user experience tailored to different needs.

- **Admin and Writer Roles:** Administrators hold the reins, overseeing the platform's operations and content. Writers, on the other hand, enjoy the privilege of creating and publishing their written pieces.

- **User Profiles:** Users have the freedom to create and personalize their profiles. This helps build a sense of community and connection among readers and writers.

- **Engagement Through Comments:** InkScribe's comment system promotes interaction among readers and writers. Users can express their thoughts, share insights, and engage in meaningful discussions on published articles.

- **Article Creation and Publishing:** Writers can unleash their creativity by crafting articles in the markdown format. This format allows for clear and structured content presentation, ensuring a rich reading experience for the audience.

**Technology Stack:**
InkScribe has been meticulously developed using a range of technologies to ensure optimal performance and user satisfaction. The core technologies used in building the platform include:

- **JSP (JavaServer Pages):** Providing dynamic content rendering and seamless integration with Java backend logic.
- **HTML and CSS:** Crafting visually appealing and responsive user interfaces that enhance the overall experience.
- **Vanilla JavaScript:** Enabling interactive features that engage users and enhance usability.

**Why InkScribe?**
InkScribe stands out as a creative haven where the art of storytelling and idea-sharing flourishes. With a user-centric approach, robust user management, and an intuitive interface, InkScribe promises an environment where readers can immerse themselves in captivating articles, and writers can channel their creativity into expressive content.

Whether you're passionate about reading, writing, or both, InkScribe invites you to explore a world of thoughts, discussions, and narratives that resonate with your interests. Join us on this journey to unleash the power of the written word.

## How to Get Started ( Without docker)

To get started with InkScribe, follow these steps:

1. **Download or Clone the Repository**: Begin by downloading or cloning the repository to your local machine.

2. **Build the Project**: Open your terminal and navigate to the project's root directory. Run the following command to build the project using Maven:

    ```bash
    mvn package
    ```

3. **Copy Required Folders**: After building the project, you'll find an *app* directory inside the `target` folder. Copy the `lib` and `classes` folders from this *app* directory.

4. **Configure Environment Variables**: Create a file named `.env` and place it in the `WEB_INF/classes` folder. Open the `.env` file in a text editor and add the following information, replacing placeholders with actual values:

    ```env
    DB_USER=<DB_USER>
    DB_PASSWORD=<DB_PASSWORD>
    DB_NAME=<DATABASE_NAME>
    DB_HOST=<DATABASE_HOST>
    DB_PORT=<DATABASE_PORT>
    SECURITY_STRING=<SECURITY_STRING>
    APP_NAME=<WEBAPP_FOLDER_NAME>
    ADMIN_EMAIL=<ADMIN_EMAIL>
    URI=<WEBSITE_ADDR_WITH_PORT>
    ```

    Replace `<DB_USER>`, `<DB_PASSWORD>`, `<DATABASE_NAME>`, and so on with your actual database credentials and configuration.

5. **Start Using InkScribe**: Once you've completed the above steps, your environment will be set up for using InkScribe. You can now start exploring the platform and sharing your writings with the world.

## How to Get Started ( Using docker)

To get started with InkScribe, follow these steps:

1. **Download or Clone the Repository**: Begin by downloading or cloning the repository to your local machine.

2. **Build the Project**: Open your terminal and navigate to the project's root directory. Run the following command to build the project using Maven:

    ```bash
    mvn package
    ```

3. **Build the docker images**: After packaging using maven run the following docker commands

    ```bash
    docker-compose build 
    ```

4. **Start the server**: After builing the image you need to run container.

    ```bash
    docker-compose up -d 
    ```

5. **Start Using InkScribe**: Once you've completed the above steps, your environment will be set up for using InkScribe. You can now start exploring the platform and sharing your writings with the world.

6. **Terminate the server**: If you want to quit or terminate the server then run the following command.

    ```bash
    docker-compose down
    ```

If you have any questions or need further assistance, don't hesitate to reach out!

> Developer contact : <ssanmeet123@gmail.com>
