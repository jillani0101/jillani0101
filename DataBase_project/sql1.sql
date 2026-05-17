CREATE DATABASE IF NOT EXISTS skillcollab;
USE skillcollab;

CREATE TABLE SKILL (
    skill_id   INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100) NOT NULL
);

CREATE TABLE USER (
    user_id    INT PRIMARY KEY AUTO_INCREMENT,
    username   VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL,
    password   VARCHAR(255) NOT NULL,
    bio        TEXT,
    status     VARCHAR(20)  NOT NULL,
    created_at DATETIME     NOT NULL
);

CREATE TABLE PROJECT (
    project_id   INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(150) NOT NULL,
    description  TEXT,
    owner_id     INT NOT NULL,
    status       VARCHAR(20) NOT NULL,
    created_at   DATETIME NOT NULL,
    updated_at   DATETIME NOT NULL,
    max_members  INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES USER(user_id)
);

CREATE TABLE USER_SKILL (
    user_id  INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (user_id, skill_id),
    FOREIGN KEY (user_id)  REFERENCES USER(user_id),
    FOREIGN KEY (skill_id) REFERENCES SKILL(skill_id)
);

CREATE TABLE PROJECT_SKILL (
    project_id INT NOT NULL,
    skill_id   INT NOT NULL,
    PRIMARY KEY (project_id, skill_id),
    FOREIGN KEY (project_id) REFERENCES PROJECT(project_id),
    FOREIGN KEY (skill_id)   REFERENCES SKILL(skill_id)
);

CREATE TABLE APPLICATION (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id        INT NOT NULL,
    project_id     INT NOT NULL,
    status         VARCHAR(20) NOT NULL,
    note           TEXT,
    applied_at     DATETIME NOT NULL,
    FOREIGN KEY (user_id)    REFERENCES USER(user_id),
    FOREIGN KEY (project_id) REFERENCES PROJECT(project_id)
);

CREATE TABLE MESSAGES (
    message_id  INT PRIMARY KEY AUTO_INCREMENT,
    sender_id   INT NOT NULL,
    receiver_id INT NOT NULL,
    content     TEXT NOT NULL,
    sent_at     DATETIME NOT NULL,
    is_read     INT NOT NULL DEFAULT 0,
    FOREIGN KEY (sender_id)   REFERENCES USER(user_id),
    FOREIGN KEY (receiver_id) REFERENCES USER(user_id)
);