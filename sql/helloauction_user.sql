-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: helloauction
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET latin1 DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `username` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung1','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(2,0,'chung tuyet','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung2','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(3,0,'tuyet chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung3','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(4,0,'hoang anh','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang1','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(5,0,'anh hoang','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang2','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(6,0,'tran chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung4','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(7,0,'gia loi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi1','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(8,0,'Tuyết Chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung5','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(9,0,'Trần Thị Tuyết Chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung6','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(10,0,'Trương Nguyễn Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang3','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(11,0,'Nguyễn Tân Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi2','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(12,0,'Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang4','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(13,0,'Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi3','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(14,0,'Hoàng Nguyễn','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang5','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(15,0,'Lợi Trương','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi4','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(16,0,'Hoàng Trương','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang6','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(17,0,'Lợi Nguyễn','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi5','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(18,0,'Lợi Trần','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi6','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(19,0,'Chung Tuyết','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung7','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(20,0,'Trương Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang7','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(21,0,'Nguyễn Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi7','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(22,0,'Nguyễn Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi8','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(23,0,'Trương Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang8','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(24,0,'Nguyễn Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi9','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(25,0,'Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang9','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(26,0,'Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi10','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(27,0,'Lợi Gia Nguyễn','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi11','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(28,1,'Tuyết Chung','tranthituyetchung@gmail.com','0123456789','1999-06-24','tuyetchung','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(29,1,'Anh Hoàng','tranthituyetchung@gmail.com','0123456789','1999-06-24','anhhoang','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG'),(30,1,'Gia Lợi','tranthituyetchung@gmail.com','0123456789','1999-06-24','gialoi','$2a$10$4VgAdkSJIJYP3ZbUEiFGhOY9MOJSC5Ju/l6DLpYhbDAcH7L20EYpG');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-01  9:54:48
