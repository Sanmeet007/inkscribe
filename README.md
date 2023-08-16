# Welcome to InkScribe

InkScribe provides an open platform where readers can explore dynamic thinking, and both experienced experts and undiscovered voices can share their writings on any topic.

## How to Get Started

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

If you have any questions or need further assistance, don't hesitate to reach out!

> Developer contact : <ssanmeet123@gmail.com>
