-- ToDo Desktop App database schema
-- Usage: mysql -u root -p < db/schema.sql

CREATE DATABASE IF NOT EXISTS todo_desktop_app;
USE todo_desktop_app;

CREATE TABLE IF NOT EXISTS users (
    u_id       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    username   VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(250) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    phone      VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tasks (
    task_id          INT AUTO_INCREMENT PRIMARY KEY,
    u_id             INT,
    task_description VARCHAR(255) NOT NULL,
    important        BOOLEAN DEFAULT FALSE,
    completed        BOOLEAN DEFAULT FALSE,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id FOREIGN KEY (u_id) REFERENCES users(u_id)
);

-- One active verification code per email (used for registration and password reset)
CREATE TABLE IF NOT EXISTS validation_keys (
    email             VARCHAR(255) NOT NULL UNIQUE,
    validation_code   VARCHAR(6) NOT NULL,
    timestamp_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- To delete a user, remove their tasks first:
--   DELETE FROM tasks WHERE u_id = (SELECT u_id FROM users WHERE email = 'example@gmail.com');
--   DELETE FROM users WHERE email = 'example@gmail.com';
