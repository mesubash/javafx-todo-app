# ToDo Desktop App

A desktop to-do list app built with JavaFX and MySQL, with user accounts and email verification.

## Features

- **Register** with email verification (6-digit code sent via Gmail)
- **Login** with BCrypt-hashed passwords
- **Forgot password** with an emailed reset code (valid for 5 minutes)
- **Tasks**: add, edit, delete, mark as completed, mark as important

## Tech Stack

Java 21 · JavaFX 21 · FXML (Scene Builder) · MySQL 8 · Maven · JavaMail · jBCrypt

## Getting Started

### Prerequisites

- JDK 21+
- MySQL 8 running locally
- A Gmail account with an [App Password](https://support.google.com/accounts/answer/185833) (needed to send verification emails)

### Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/mesubash/ToDo_Desktop_App.git
   cd ToDo_Desktop_App
   ```
2. Create the database and tables:
   ```bash
   mysql -u root -p < db/schema.sql
   ```
3. Set environment variables:
   ```bash
   export DB_PASSWORD=your_mysql_password
   export TODO_GMAIL_PASSWORD=your_gmail_app_password
   # Optional (defaults shown):
   # export DB_URL=jdbc:mysql://localhost:3306/todo_desktop_app
   # export DB_USER=root
   ```
4. Run:
   ```bash
   ./mvnw javafx:run
   ```

## Project Structure

```
db/schema.sql                      MySQL schema
src/main/java/todoapp/todo/        Controllers, DB access, validation
  MailSender/                      Gmail SMTP sending + verification codes
src/main/resources/todoapp/todo/   FXML views, icons, CSS
```

## Known Limitations

- Layout isn't responsive. It was designed for a 14" screen.
- No "remember me" or persistent session.
- Registration only accepts `@gmail.com` addresses.
- Sender account (`tododesktopapp`) is hardcoded in `GmailSender.java`.

## About

Built as an early-semester college project to learn JavaFX and desktop app development. Suggestions and PRs welcome.

## License

[MIT](LICENSE)
