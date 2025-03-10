CREATE DATABASE `linkedin`;
USE `linkedin`;

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(24) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year` DATE NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `Companies`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `industry` VARCHAR(20) NOT NULL,
    `location`VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `user_connections`(
    `id` INT AUTO_INCREMENT,
    'user_first_id' INT NOT NULL,
    `user_second_id` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_first_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`user_second_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `school_connections`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `begin_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `type` VARCHAR(16) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `Schools`(`id`)
);

CREATE TABLE `company_connections`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `begin_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `Companies`(`id`)
);
