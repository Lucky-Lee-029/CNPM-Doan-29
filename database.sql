-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories` (`name`) VALUES
('Web'),
('Android'),
('Hệ Điều Hành');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: student, 1: teacher, 2: admin',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`status`,`name`, `address`, `email`, `avatar`, `password`, `phone`) VALUES
(0,'Hoang', 'HCM', 'hoang@gmail.com', 'images/avatar/hoang.jpg', '1234567', '01234567890'),
(1,'Hai', 'HCM', 'hai@gmail.com', 'images/avatar/hai.jpg', '1234567', '01234567890'),
(0,'Ta', 'HCM', 'ta@gmail.com', 'images/avatar/hoang.jpg', '1234567', '01234567890'),
(0,'Loi', 'HCM', 'loi@gmail.com', 'images/avatar/hai.jpg', '1234567', '01234567890'),
(1,'Chung','Nha Trang','chung@gmail.com', 'images/avatar/chung.jpg', '1234567', '01234567890');


DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT ,
  `teacher` int(10) unsigned NOT NULL,
  `categori` int(10)unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`teacher`) REFERENCES `users`(`id`),
  FOREIGN KEY (`categori`) REFERENCES `categories`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `classes` (`teacher`,`categori`,`name`,`price`,`description`,`created`)
VALUES(2,1,'HTML5','50000','hoc xong khoi code','2019-12-4 03:05:09'),
(3,1,'CSS','505000','hoc xong khoi code','2019-12-4 03:05:09'),
(2,1,'Bootrap 4','502000','hoc xong khoi code','2019-12-4 03:05:09');


DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` int(10) unsigned NOT NULL,
  `link` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`class`) REFERENCES `classes`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `videos` (`class`, `link`)
VALUES
(1,'httpsBzA'),
(1,'httpsBzA'),
(2,'httpsBzA'),
(2,'httpsBzA'),
(2,'httpsBzA'),
(3,'httpsBzA'),
(3,'httpsBzA'),
(3,'httpsBzA')
;

DROP TABLE IF EXISTS `learnings`;
CREATE TABLE `learnings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` int(10) unsigned NOT NULL,
  `student` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`class`) REFERENCES `classes`(`id`),
  FOREIGN KEY (`student`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `learnings` (`class`, `student`) VALUES
(1,1),
(2,1),
(3,1),
(3,4),
(1,4),
(2,5);

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` int(10) unsigned NOT NULL,
  `student` int(10) unsigned NOT NULL,
  `review`  varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`class`) REFERENCES `classes`(`id`),
  FOREIGN KEY (`student`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `reviews` ( `student`,`class`, `review`) VALUES
(2,1,"I Love It"),
(4,2,"So good"),
(4,1,"Bad"),
(5,2,"Wow");

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `admins` (`name`, `address`, `email`, `avatar`,`password`) VALUES
('son', 'HCM', 'son@gmail.com','images/avatar/son.jpg', '123242');


























