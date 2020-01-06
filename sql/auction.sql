-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auction
-- ------------------------------------------------------
-- Server version	5.7.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET latin1 DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `username` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','tranthituyetchung@gmail.com','0123456789','1999-06-24','admin','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biddinglist`
--

DROP TABLE IF EXISTS `biddinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biddinglist` (
  `id_product` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `bid_price` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  KEY `fk_biddinglist_product_idx` (`id_product`),
  KEY `fk_biddinglist_user_idx` (`id_user`),
  CONSTRAINT `fk_biddinglist_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_biddinglist_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biddinglist`
--

LOCK TABLES `biddinglist` WRITE;
/*!40000 ALTER TABLE `biddinglist` DISABLE KEYS */;
INSERT INTO `biddinglist` VALUES (1,3,2000000,'2020-01-01'),(2,1,2000000,'2020-01-01'),(3,2,2000000,'2020-01-01'),(4,9,1800000,'2019-12-29'),(4,8,1900000,'2019-12-30'),(4,3,2000000,'2020-01-01'),(5,4,1800000,'2019-12-29'),(5,8,1900000,'2019-12-30'),(5,4,2000000,'2020-01-01'),(6,4,1800000,'2019-12-29'),(6,8,1900000,'2019-12-30'),(6,5,2000000,'2020-01-01'),(7,4,1600000,'2019-12-25'),(7,8,1700000,'2019-12-27'),(7,4,1800000,'2019-12-29'),(7,8,1900000,'2019-12-30'),(7,3,2000000,'2020-01-01'),(8,4,1800000,'2019-12-29'),(8,10,1900000,'2019-12-30'),(8,8,2000000,'2020-01-01'),(9,4,1900000,'2019-12-29'),(9,9,2000000,'2019-12-30'),(10,11,1700000,'2019-12-21'),(10,12,1800000,'2019-12-27'),(10,8,1900000,'2019-12-29'),(10,10,2000000,'2019-12-30'),(11,11,1700000,'2019-12-21'),(11,12,1800000,'2019-12-27'),(11,8,1900000,'2019-12-29'),(11,20,2000000,'2019-12-30'),(12,8,1900000,'2019-12-29'),(12,21,2000000,'2019-12-30'),(13,12,1800000,'2019-12-27'),(13,8,1900000,'2019-12-29'),(13,29,2000000,'2019-12-30'),(14,12,1800000,'2019-12-27'),(14,8,1900000,'2019-12-29'),(14,30,2000000,'2019-12-30'),(15,8,1900000,'2019-12-29'),(15,29,2000000,'2019-12-30'),(16,11,1700000,'2019-12-21'),(16,12,1800000,'2019-12-27'),(16,8,1900000,'2019-12-29'),(16,30,2000000,'2019-12-30'),(17,12,1800000,'2019-12-27'),(17,8,1900000,'2019-12-29'),(17,30,2000000,'2019-12-30'),(18,8,1900000,'2019-12-29'),(18,29,2000000,'2019-12-30'),(19,11,1700000,'2019-12-21'),(19,12,1800000,'2019-12-27'),(19,8,1900000,'2019-12-29'),(19,30,2000000,'2019-12-30'),(20,11,1700000,'2019-12-21'),(20,12,1800000,'2019-12-27'),(20,8,1900000,'2019-12-29'),(20,30,2000000,'2019-12-30'),(21,8,1900000,'2019-12-29'),(21,3,2000000,'2019-12-30'),(22,12,1800000,'2019-12-27'),(22,8,1900000,'2019-12-29'),(22,1,2000000,'2019-12-30'),(23,4,1900000,'2019-12-29'),(23,2,2000000,'2019-12-30'),(24,19,1700000,'2019-12-21'),(24,21,1800000,'2019-12-27'),(24,8,1900000,'2019-12-29'),(24,3,2000000,'2019-12-30'),(25,15,1600000,'2019-12-20'),(25,19,1700000,'2019-12-21'),(25,21,1800000,'2019-12-27'),(25,8,1900000,'2019-12-29'),(25,4,2000000,'2019-12-30'),(26,10,1900000,'2019-12-29'),(26,5,2000000,'2019-12-30'),(27,19,1700000,'2019-12-21'),(27,21,1800000,'2019-12-27'),(27,8,1900000,'2019-12-29'),(27,3,2000000,'2019-12-30'),(28,8,1400000,'2019-12-18'),(28,5,1500000,'2019-12-19'),(28,1,1600000,'2019-12-20'),(28,19,1700000,'2019-12-21'),(28,21,1800000,'2019-12-27'),(28,1,1900000,'2019-12-29'),(28,8,2000000,'2019-12-30'),(29,21,1800000,'2019-12-27'),(29,1,1900000,'2019-12-29'),(29,9,2000000,'2019-12-30'),(30,21,1800000,'2019-12-27'),(30,1,1900000,'2019-12-29'),(30,10,2000000,'2019-12-30'),(31,1,1900000,'2019-12-29'),(31,20,2000000,'2019-12-30'),(32,21,1800000,'2019-12-27'),(32,1,1900000,'2019-12-29'),(32,21,2000000,'2019-12-30'),(33,8,1400000,'2019-12-18'),(33,5,1500000,'2019-12-19'),(33,1,1600000,'2019-12-20'),(33,19,1700000,'2019-12-21'),(33,21,1800000,'2019-12-27'),(33,1,1900000,'2019-12-29'),(33,29,2000000,'2019-12-30'),(34,1,1900000,'2019-12-29'),(34,30,2000000,'2019-12-30'),(35,19,1700000,'2019-12-21'),(35,21,1800000,'2019-12-27'),(35,1,1900000,'2019-12-29'),(35,29,2000000,'2019-12-30'),(36,1,1900000,'2019-12-29'),(36,30,2000000,'2019-12-30'),(37,19,1700000,'2019-12-21'),(37,21,1800000,'2019-12-27'),(37,1,1900000,'2019-12-29'),(37,29,2000000,'2019-12-30'),(38,29,2000000,'2019-12-30'),(39,8,1600000,'2019-12-20'),(39,19,1700000,'2019-12-21'),(39,21,1800000,'2019-12-27'),(39,1,1900000,'2019-12-29'),(39,30,2000000,'2019-12-30'),(40,8,1400000,'2019-12-18'),(40,5,1500000,'2019-12-19'),(40,1,1600000,'2019-12-20'),(40,19,1700000,'2019-12-21'),(40,21,1800000,'2019-12-27'),(40,1,1900000,'2019-12-29'),(40,30,2000000,'2019-12-30'),(41,21,1800000,'2019-12-27'),(41,1,1900000,'2019-12-29'),(41,3,2000000,'2019-12-30'),(42,21,1800000,'2019-12-27'),(42,3,1900000,'2019-12-29'),(42,1,2000000,'2019-12-30'),(43,3,1900000,'2019-12-29'),(43,2,2000000,'2019-12-30'),(44,19,1700000,'2019-12-21'),(44,21,1800000,'2019-12-27'),(44,1,1900000,'2019-12-29'),(44,3,2000000,'2019-12-30'),(45,1,1600000,'2019-12-20'),(45,19,1700000,'2019-12-21'),(45,21,1800000,'2019-12-27'),(45,1,1900000,'2019-12-29'),(45,4,2000000,'2019-12-30'),(47,1,1900000,'2019-12-29'),(47,5,2000000,'2019-12-30'),(47,19,1700000,'2019-12-21'),(47,3,1800000,'2019-12-27'),(45,1,1900000,'2019-12-29'),(45,4,2000000,'2019-12-30'),(48,8,1400000,'2019-12-18'),(48,5,1500000,'2019-12-19'),(48,1,1600000,'2019-12-20'),(48,19,1700000,'2019-12-21'),(48,21,1800000,'2019-12-27'),(48,1,1900000,'2019-12-29'),(48,8,2000000,'2019-12-30'),(49,21,1800000,'2019-12-27'),(49,1,1900000,'2019-12-29'),(49,9,2000000,'2019-12-30'),(50,8,1400000,'2019-12-18'),(50,5,1500000,'2019-12-19'),(50,1,1600000,'2019-12-20'),(50,19,1700000,'2019-12-21'),(50,21,1800000,'2019-12-27'),(50,1,1900000,'2019-12-29'),(50,8,2000000,'2019-12-30'),(51,21,1800000,'2019-12-27'),(51,1,1900000,'2019-12-29'),(51,20,2000000,'2019-12-30'),(52,8,1800000,'2019-12-27'),(52,1,1900000,'2019-12-29'),(52,21,2000000,'2019-12-30'),(53,1,1900000,'2019-12-29'),(53,29,2000000,'2019-12-30'),(54,19,1700000,'2019-12-21'),(54,21,1800000,'2019-12-27'),(54,1,1900000,'2019-12-29'),(54,30,2000000,'2019-12-30'),(55,1,1600000,'2019-12-20'),(55,19,1700000,'2019-12-21'),(55,21,1800000,'2019-12-27'),(55,1,1900000,'2019-12-29'),(55,29,2000000,'2019-12-30'),(56,1,1900000,'2019-12-29'),(56,8,2000000,'2019-12-30'),(57,30,1700000,'2019-12-21'),(57,21,1800000,'2019-12-27'),(57,1,1900000,'2019-12-29'),(57,29,2000000,'2019-12-30'),(58,8,1400000,'2019-12-18'),(58,5,1500000,'2019-12-19'),(58,1,1600000,'2019-12-20'),(58,19,1700000,'2019-12-21'),(58,21,1800000,'2019-12-27'),(58,1,1900000,'2019-12-29'),(58,29,2000000,'2019-12-30'),(59,21,1800000,'2019-12-27'),(59,1,1900000,'2019-12-29'),(59,30,2000000,'2019-12-30'),(60,8,1400000,'2019-12-18'),(60,5,1500000,'2019-12-19'),(60,1,1600000,'2019-12-20'),(60,19,1700000,'2019-12-21'),(60,21,1800000,'2019-12-27'),(60,1,1900000,'2019-12-29'),(60,30,2000000,'2019-12-30'),(61,1,1600000,'2019-12-20'),(61,19,1700000,'2019-12-21'),(61,21,1800000,'2019-12-27'),(61,1,1900000,'2019-12-29'),(61,30,2000000,'2019-12-30'),(62,1,1600000,'2019-12-20'),(62,19,1700000,'2019-12-21'),(62,21,1800000,'2019-12-27'),(62,1,1900000,'2019-12-29'),(62,29,2000000,'2019-12-30'),(63,1,1600000,'2019-12-20'),(63,19,1700000,'2019-12-21'),(63,21,1800000,'2019-12-27'),(63,8,1900000,'2019-12-29'),(63,30,2000000,'2019-12-30'),(64,1,1600000,'2019-12-20'),(64,19,1700000,'2019-12-21'),(64,21,1800000,'2019-12-27'),(64,8,1900000,'2019-12-29'),(64,30,2000000,'2019-12-30'),(28,8,2100000,'2020-01-06'),(28,8,2200000,'2020-01-06'),(29,8,3000000,'2020-01-06');
/*!40000 ALTER TABLE `biddinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `link` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'HOUSEHOLD APPLIANCE',NULL,'Thing in home'),(3,'BEAUTY',NULL,'Make you more beautiful'),(4,'LAPTOP',NULL,'Laptop low price'),(5,'SMARTPHONE',NULL,'Smartphone good price'),(6,'admin',NULL,'Administrator');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'Hello','How are you'),(2,'Hello','I\'m fine thanks you'),(3,'No hello','And how about you'),(4,'Bonjour','I\'m French');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter` (
  `sell_product_cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `id_bidder` int(11) DEFAULT NULL,
  `id_owner` int(11) DEFAULT NULL,
  `bid_step` int(11) DEFAULT NULL,
  `current_price` int(11) DEFAULT NULL,
  `buy_now_price` int(11) DEFAULT NULL,
  `startDate` timestamp NULL DEFAULT NULL,
  `endDate` timestamp NULL DEFAULT NULL,
  `details` varchar(5000) DEFAULT NULL,
  `auctioned` int(11) DEFAULT NULL,
  `auctionTIme` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_seller_idx` (`id_owner`),
  KEY `fk_product_bidder_idx` (`id`,`id_bidder`),
  KEY `fk_product_bidder_idx1` (`id_bidder`),
  KEY `fk_product_category` (`category`),
  FULLTEXT KEY `name` (`name`),
  CONSTRAINT `fk_product_bidder` FOREIGN KEY (`id_bidder`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_owner` FOREIGN KEY (`id_owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop A',4,3,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-06 07:02:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,1),(2,'Laptop B',4,1,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 04:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,1),(3,'Laptop C',4,2,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,1),(4,'Laptop D',4,3,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(5,'Laptop E',4,4,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(6,'Laptop F',4,5,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(7,'Laptop G',4,3,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,5),(8,'Laptop H',4,8,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(9,'Laptop I',4,9,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(10,'Laptop K',4,10,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(11,'Laptop M',4,20,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(12,'Laptop L',4,21,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(13,'Laptop N',4,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(14,'Laptop E',4,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(15,'Laptop O',4,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(16,'Smartphone N',5,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(17,'Smartphone M',5,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(18,'Smartphone K',5,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(19,'Smartphone J',5,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(20,'Smartphone H',5,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(21,'Household A',2,3,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(22,'Household B',2,1,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(23,'Household C',2,2,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(24,'Household D',2,3,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(25,'Household E',2,4,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,5),(26,'Household F',2,5,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(27,'Household G',2,3,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(28,'Household H',2,8,28,100000,2200000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,9),(29,'Household I',2,8,30,100000,3000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',1,4),(30,'Household K',2,10,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(31,'Household M',2,20,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(32,'Household L',2,21,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(33,'Household N',2,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,7),(34,'Household E',2,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(35,'Household O',2,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(36,'Household F',2,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(37,'Household Q',2,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(38,'Household W',2,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,1),(39,'Household T',2,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,5),(40,'Household Y',2,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,7),(41,'Beauty A',3,3,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(42,'Beauty B',3,1,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(43,'Beauty C',3,2,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(44,'Beauty D',3,3,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(45,'Beauty E',3,4,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,5),(46,'Beauty F',3,5,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(47,'Beauty G',3,3,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(48,'Beauty H',3,8,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,7),(49,'Beauty I',3,9,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(50,'Beauty K',3,10,30,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,7),(51,'Beauty M',3,20,29,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(52,'Beauty L',3,21,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(53,'Beauty N',3,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(54,'Beauty E',3,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(55,'Beauty O',3,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,5),(56,'Beauty F',3,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,2),(57,'Beauty Q',3,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,4),(58,'Beauty W',3,29,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,7),(59,'Beauty T',3,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,3),(60,'Beauty Y',3,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',0,7),(61,'Smartphone D',5,30,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',1,5),(62,'Smartphone C',5,8,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 06:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',1,5),(63,'Smartphone B',5,8,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',1,5),(64,'Smartphone A',5,8,28,100000,2000000,3000000,'2020-01-05 02:57:13','2020-01-08 05:00:00','Tích hợp liền mạch PC / điện thoại thông minh: Truy cập nhiều thiết bị mà không cần phân chia sự chú ý của bạn Dell Dell Connect Connect ghép nối điện thoại thông minh iOS hoặc Android của bạn với máy tính xách tay.\nHạn chế sự gián đoạn: Với Dell Mobile Connect, bạn có thể thực hiện cuộc gọi, gửi văn bản, nhận thông báo và thậm chí phản chiếu điện thoại Android của mình lên PC để tương tác với tất cả các ứng dụng yêu thích của bạn.',1,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_reviewer` int(11) DEFAULT NULL,
  `review` varchar(1000) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_user_idx` (`id_user`),
  KEY `fk_review_reviewer_idx` (`id_reviewer`),
  CONSTRAINT `fk_review_reviewer` FOREIGN KEY (`id_reviewer`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET latin1 DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `password` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `accessToken` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'chung','tranthituyetchung1@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(2,0,'chung tuyet','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(3,0,'tuyet chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(4,0,'hoang anh','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(5,0,'anh hoang','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(6,0,'tran chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(7,0,'gia loi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(8,0,'Tuyết Chung','tranthituyetchung2@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(9,0,'Trần Thị Tuyết Chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(10,0,'Trương Nguyễn Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(11,0,'Nguyễn Tân Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(12,0,'Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(13,0,'Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(14,0,'Hoàng Nguyễn','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(15,0,'Lợi Trương','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(16,0,'Hoàng Trương','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(17,0,'Lợi Nguyễn','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(18,0,'Lợi Trần','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(19,0,'Chung Tuyết','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(20,1,'Trương Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(21,1,'Nguyễn Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(22,0,'Nguyễn Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(23,0,'Trương Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(24,0,'Nguyễn Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(25,0,'Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(26,0,'Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(27,0,'Lợi Gia Nguyễn','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(28,1,'Tuyết Chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(29,1,'Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(30,1,'Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG',NULL),(37,NULL,'Hoang max dep trai','chinhlaanh@gmail.com','0917121999',NULL,'$2a$10$RjTCQnTYNngeu6akhkWQe.Z48OjH1zQv/VgkFrV8tXGSbP412FjWi',NULL),(41,NULL,'Hoàng ','yellowdragonqn14@gmail.com',NULL,NULL,'$2a$10$hIjYWmbRtRKbFOd8mm6Nxeb5szkNqfXDuBtBFckCiCw.zzHBj8ZxO',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  KEY `fk_watchlist_user_idx` (`id_user`),
  KEY `fk_watchlist_product_idx` (`id_product`),
  CONSTRAINT `fk_watchlist_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_watchlist_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (8,28),(8,29),(8,30),(8,1),(8,2),(8,5),(8,11),(8,21),(8,15),(8,13),(8,10),(8,22),(8,24),(8,3),(8,4);
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `bidder_block`
--

DROP TABLE IF EXISTS `bidder_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidder_block` (
  `id_bidder` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_bidder`,`id_product`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `bidder_block_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  CONSTRAINT `bidder_block_ibfk_2` FOREIGN KEY (`id_bidder`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidder_block`
--

LOCK TABLES `bidder_block` WRITE;
/*!40000 ALTER TABLE `bidder_block` DISABLE KEYS */;
INSERT INTO `bidder_block` VALUES (8,15);
/*!40000 ALTER TABLE `bidder_block` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `biddingproduct`
--

DROP TABLE IF EXISTS `biddingproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biddingproduct` (
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_product`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `biddingproduct_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  CONSTRAINT `biddingproduct_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biddingproduct`
--

LOCK TABLES `biddingproduct` WRITE;
/*!40000 ALTER TABLE `biddingproduct` DISABLE KEYS */;
INSERT INTO `biddingproduct` VALUES (1,22),(1,48),(10,27),(11,15),(11,35),(11,50),(30,40);
/*!40000 ALTER TABLE `biddingproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wonproduct`
--

DROP TABLE IF EXISTS `wonproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wonproduct` (
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_product`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `wonproduct_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  CONSTRAINT `wonproduct_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wonproduct`
--

LOCK TABLES `wonproduct` WRITE;
/*!40000 ALTER TABLE `wonproduct` DISABLE KEYS */;
INSERT INTO `wonproduct` VALUES (1,25),(1,48),(10,12),(11,15),(11,35),(11,50),(30,30);
/*!40000 ALTER TABLE `wonproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2020-01-06 17:27:04
