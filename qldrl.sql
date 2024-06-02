-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: qldrl
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `bai_viet`
--

DROP TABLE IF EXISTS `bai_viet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bai_viet` (
  `id` int NOT NULL,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `noi_dung` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hoat_dong_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hoat_dong_id` (`hoat_dong_id`),
  CONSTRAINT `bai_viet_ibfk_1` FOREIGN KEY (`hoat_dong_id`) REFERENCES `hoat_dong` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bai_viet`
--

LOCK TABLES `bai_viet` WRITE;
/*!40000 ALTER TABLE `bai_viet` DISABLE KEYS */;
INSERT INTO `bai_viet` VALUES (1,'Tham gia workshop ','2024-05-24 00:00:00','Nọi dung 1',1),(2,'Tham gia ngày hội môi trường','2023-09-27 00:00:00','Nộ dung 2',2);
/*!40000 ALTER TABLE `bai_viet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuyen_vien_ctsv`
--

DROP TABLE IF EXISTS `chuyen_vien_ctsv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyen_vien_ctsv` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyen_vien_ctsv`
--

LOCK TABLES `chuyen_vien_ctsv` WRITE;
/*!40000 ALTER TABLE `chuyen_vien_ctsv` DISABLE KEYS */;
INSERT INTO `chuyen_vien_ctsv` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `chuyen_vien_ctsv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `noi_dung` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoi_gian` timestamp NOT NULL,
  `bai_viet_id` int DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bai_viet_id` (`bai_viet_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`bai_viet_id`) REFERENCES `bai_viet` (`id`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Nội dung 1','2024-05-24 17:00:00',1,5),(2,'Nội dung 2','2024-05-29 17:00:00',2,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieu`
--

DROP TABLE IF EXISTS `dieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dieu` int NOT NULL,
  `diem_toi_da` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieu`
--

LOCK TABLES `dieu` WRITE;
/*!40000 ALTER TABLE `dieu` DISABLE KEYS */;
INSERT INTO `dieu` VALUES (1,1,5),(2,2,5),(3,3,10),(4,4,10),(5,5,10);
/*!40000 ALTER TABLE `dieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoat_dong`
--

DROP TABLE IF EXISTS `hoat_dong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoat_dong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diem` int NOT NULL,
  `dieu_id` int DEFAULT NULL,
  `hoc_ki_nam_hoc_id` int DEFAULT NULL,
  `khoa_id` int DEFAULT NULL,
  `tro_ly_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dieu_id` (`dieu_id`),
  KEY `hoc_ki_nam_hoc_id` (`hoc_ki_nam_hoc_id`),
  KEY `khoa_id` (`khoa_id`),
  KEY `tro_ly_id` (`tro_ly_id`),
  CONSTRAINT `hoat_dong_ibfk_1` FOREIGN KEY (`dieu_id`) REFERENCES `dieu` (`id`),
  CONSTRAINT `hoat_dong_ibfk_2` FOREIGN KEY (`hoc_ki_nam_hoc_id`) REFERENCES `hoc_ki_nam_hoc` (`id`),
  CONSTRAINT `hoat_dong_ibfk_3` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`),
  CONSTRAINT `hoat_dong_ibfk_4` FOREIGN KEY (`tro_ly_id`) REFERENCES `tro_ly_sinh_vien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoat_dong`
--

LOCK TABLES `hoat_dong` WRITE;
/*!40000 ALTER TABLE `hoat_dong` DISABLE KEYS */;
INSERT INTO `hoat_dong` VALUES (1,'Hoạt động 1','Tham gia buổi workshop',5,3,6,1,1),(2,'Hoạt động 2','Tham gia ngày hội môi trường',5,3,5,2,2),(3,'Hoạt động 3','Trồng cây cho lớp',5,1,4,2,2),(4,'HoÃ¡ÂºÂ¡t ÃÂÃ¡Â»Âng ngoÃÂ i trÃ¡Â»Âi','Phat trien',5,5,4,3,3),(5,'Hoạt động 5','Phòng chống ma túy sv',5,2,3,2,3);
/*!40000 ALTER TABLE `hoat_dong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoc_ki`
--

DROP TABLE IF EXISTS `hoc_ki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoc_ki` (
  `id` int NOT NULL,
  `hoc_ki` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_ki`
--

LOCK TABLES `hoc_ki` WRITE;
/*!40000 ALTER TABLE `hoc_ki` DISABLE KEYS */;
INSERT INTO `hoc_ki` VALUES (1,'HK1'),(2,'HK2'),(3,'HK3');
/*!40000 ALTER TABLE `hoc_ki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoc_ki_nam_hoc`
--

DROP TABLE IF EXISTS `hoc_ki_nam_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoc_ki_nam_hoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hoc_ki_id` int DEFAULT NULL,
  `nam_hoc_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hoc_ki_id` (`hoc_ki_id`),
  KEY `nam_hoc_id` (`nam_hoc_id`),
  CONSTRAINT `hoc_ki_nam_hoc_ibfk_1` FOREIGN KEY (`hoc_ki_id`) REFERENCES `hoc_ki` (`id`),
  CONSTRAINT `hoc_ki_nam_hoc_ibfk_2` FOREIGN KEY (`nam_hoc_id`) REFERENCES `nam_hoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_ki_nam_hoc`
--

LOCK TABLES `hoc_ki_nam_hoc` WRITE;
/*!40000 ALTER TABLE `hoc_ki_nam_hoc` DISABLE KEYS */;
INSERT INTO `hoc_ki_nam_hoc` VALUES (1,1,1),(2,2,1),(3,3,1),(4,1,2),(5,2,3),(6,3,4);
/*!40000 ALTER TABLE `hoc_ki_nam_hoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ten_UNIQUE` (`ten`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'Khoa Công nghệ Thông Tin'),(2,'Khoa Kinh tế'),(3,'Khoa Ngoại Ngữ');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `khoa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khoa_id` (`khoa_id`),
  CONSTRAINT `lop_ibfk_1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
INSERT INTO `lop` VALUES (1,'IT01',1),(2,'IT02',1),(3,'IT03',1),(4,'CS01',1),(5,'CS02',1),(6,'CS03',1);
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nam_hoc`
--

DROP TABLE IF EXISTS `nam_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nam_hoc` (
  `id` int NOT NULL,
  `nam_hoc` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nam_hoc`
--

LOCK TABLES `nam_hoc` WRITE;
/*!40000 ALTER TABLE `nam_hoc` DISABLE KEYS */;
INSERT INTO `nam_hoc` VALUES (1,2021),(2,2022),(3,2023),(4,2024);
/*!40000 ALTER TABLE `nam_hoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ho` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nam_sinh` int DEFAULT NULL,
  `gioi_tinh` smallint DEFAULT NULL,
  `avatar` varchar(205) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (1,'Lê','Tiến',2002,1,'https://i.imgur.com/32QtbJr.jpeg','Admin','abcmin123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ADMIN'),(2,'Nguyễn Đào','Đào',2003,0,'https://i.imgur.com/twzwwNs.jpeg','TroLy','troly123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ASSISTANT'),(3,'Trần','My',2004,0,'https://i.imgur.com/twzwwNs.jpeg','SinhVien','sinhvien123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STUDENT'),(4,'Nguyễn Văn','Dương',2004,1,'https://i.imgur.com/32QtbJr.jpeg','CTSVOU','ctsvou123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_CTSVOU'),(5,'Trần','Dương',2002,1,'https://i.imgur.com/32QtbJr.jpeg','SinhVienIT','sv123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STUDENT'),(6,'Nguyễn','Mai',2003,0,'https://i.imgur.com/twzwwNs.jpeg','SinhVienKT','svkt123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STUDENT'),(7,'Mai','Vy',2004,0,'https://i.imgur.com/twzwwNs.jpeg','SinhVienSH','svsh123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STUDENT'),(8,'Mai','Chí',2004,1,'https://i.imgur.com/32QtbJr.jpeg','SinhVienCS','svcs123@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STUDENT'),(9,'Nguyễn','Ngọc',2003,0,'https://i.imgur.com/twzwwNs.jpeg','SinhVienCS1','svcs21@gmail.com','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STUDENT'),(18,'Äinh','Doanh',2003,0,'BuoiOn23_05.png','doanhki2','doanh122@gmail','$2a$10$KfhZtitAWrkYBUOoXLikG.EUbMkx/jt9v.xA12zqq5vqvHfyQMLfu',NULL),(20,'Tien','Dinh',2003,0,'https://i.imgur.com/twzwwNs.jpeg','tien1122','tien1122@gmail.com','$2a$10$lIXMSOOWXRz4pR8Bu5CZ/e7EnVlJt2C7NzK.6l6B.S0o0x1we/nj2',NULL);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien`
--

DROP TABLE IF EXISTS `sinh_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinh_vien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nienKhoa` int NOT NULL,
  `lop_id` int NOT NULL,
  `nam_hoc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lop_id` (`lop_id`),
  KEY `nam_hoc_id` (`nam_hoc_id`),
  CONSTRAINT `sinh_vien_ibfk_1` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`id`),
  CONSTRAINT `sinh_vien_ibfk_2` FOREIGN KEY (`nam_hoc_id`) REFERENCES `nam_hoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien`
--

LOCK TABLES `sinh_vien` WRITE;
/*!40000 ALTER TABLE `sinh_vien` DISABLE KEYS */;
INSERT INTO `sinh_vien` VALUES (1,2021,1,2),(2,2022,2,3),(3,2023,3,4),(4,2024,1,1);
/*!40000 ALTER TABLE `sinh_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien_hoat_dong`
--

DROP TABLE IF EXISTS `sinh_vien_hoat_dong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinh_vien_hoat_dong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trang_thai` tinyint NOT NULL,
  `hoat_dong_id` int DEFAULT NULL,
  `sinh_vien_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hoat_dong_id` (`hoat_dong_id`),
  KEY `sinh_vien_id` (`sinh_vien_id`),
  CONSTRAINT `sinh_vien_hoat_dong_ibfk_1` FOREIGN KEY (`hoat_dong_id`) REFERENCES `hoat_dong` (`id`),
  CONSTRAINT `sinh_vien_hoat_dong_ibfk_2` FOREIGN KEY (`sinh_vien_id`) REFERENCES `sinh_vien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_hoat_dong`
--

LOCK TABLES `sinh_vien_hoat_dong` WRITE;
/*!40000 ALTER TABLE `sinh_vien_hoat_dong` DISABLE KEYS */;
INSERT INTO `sinh_vien_hoat_dong` VALUES (1,1,1,1),(2,1,2,2),(3,0,4,3);
/*!40000 ALTER TABLE `sinh_vien_hoat_dong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tro_ly_sinh_vien`
--

DROP TABLE IF EXISTS `tro_ly_sinh_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tro_ly_sinh_vien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `khoa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khoa_id` (`khoa_id`),
  CONSTRAINT `tro_ly_sinh_vien_ibfk_1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tro_ly_sinh_vien`
--

LOCK TABLES `tro_ly_sinh_vien` WRITE;
/*!40000 ALTER TABLE `tro_ly_sinh_vien` DISABLE KEYS */;
INSERT INTO `tro_ly_sinh_vien` VALUES (1,1),(4,1),(7,1),(2,2),(5,2),(8,2),(3,3),(6,3),(9,3);
/*!40000 ALTER TABLE `tro_ly_sinh_vien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02 16:39:17
