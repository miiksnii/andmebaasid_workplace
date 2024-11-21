-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: newschema
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `hobused`
--

DROP TABLE IF EXISTS `hobused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobused` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) NOT NULL,
  `omanikID` bigint unsigned NOT NULL,
  `vanus` bigint unsigned NOT NULL,
  `talliboksID` bigint unsigned NOT NULL,
  `tallID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hobused_tallid_foreign` (`tallID`),
  KEY `hobused_omanikid_foreign` (`omanikID`),
  KEY `hobused_talliboksid_foreign` (`talliboksID`),
  CONSTRAINT `hobused_omanikid_foreign` FOREIGN KEY (`omanikID`) REFERENCES `omanikud` (`id`),
  CONSTRAINT `hobused_talliboksid_foreign` FOREIGN KEY (`talliboksID`) REFERENCES `talliboksid` (`id`),
  CONSTRAINT `hobused_tallid_foreign` FOREIGN KEY (`tallID`) REFERENCES `tall` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobused`
--

LOCK TABLES `hobused` WRITE;
/*!40000 ALTER TABLE `hobused` DISABLE KEYS */;
INSERT INTO `hobused` VALUES (1,'Horse 1',1,5,1,1),(2,'Horse 2',2,7,2,1),(3,'Horse 3',3,4,3,1);
/*!40000 ALTER TABLE `hobused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omanikud`
--

DROP TABLE IF EXISTS `omanikud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omanikud` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `omanik` varchar(255) NOT NULL,
  `Aadress` varchar(255) NOT NULL,
  `telefon` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omanikud`
--

LOCK TABLES `omanikud` WRITE;
/*!40000 ALTER TABLE `omanikud` DISABLE KEYS */;
INSERT INTO `omanikud` VALUES (1,'Aadu Laid','Tallinn',55231231),(2,'Ester Teeveer','Kuressaare',5832325),(3,'Raul Väli','Paide',123456789),(4,'Mihkel Soo','Lehtse',987654321),(5,'Paavo Neihaus','Aruküla',555555555),(6,'Oskar Vallik','Tartu',654321987),(7,'Reet Romanjuk','Pärnu',52377),(8,'Karin Hallas','Mooste',557877667),(9,'Carina Romana Ciaro','Ikla',53242342);
/*!40000 ALTER TABLE `omanikud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protsetuuride_ajalugu`
--

DROP TABLE IF EXISTS `protsetuuride_ajalugu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protsetuuride_ajalugu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `HobuseNimi` varchar(255) NOT NULL,
  `protseduur` varchar(255) NOT NULL,
  `kommentaar` varchar(1000) NOT NULL,
  `kuupäev` date NOT NULL,
  `HobuseID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `protsetuuride_ajalugu_hobuseid_foreign` (`HobuseID`),
  CONSTRAINT `protsetuuride_ajalugu_hobuseid_foreign` FOREIGN KEY (`HobuseID`) REFERENCES `hobused` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protsetuuride_ajalugu`
--

LOCK TABLES `protsetuuride_ajalugu` WRITE;
/*!40000 ALTER TABLE `protsetuuride_ajalugu` DISABLE KEYS */;
INSERT INTO `protsetuuride_ajalugu` VALUES (1,'Horse 1','Vaccination','Flu vaccination','2024-09-15',1),(2,'Horse 2','Check-up','Regular health check','2024-09-20',2);
/*!40000 ALTER TABLE `protsetuuride_ajalugu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tall`
--

DROP TABLE IF EXISTS `tall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tall` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) NOT NULL,
  `aadress` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tall`
--

LOCK TABLES `tall` WRITE;
/*!40000 ALTER TABLE `tall` DISABLE KEYS */;
INSERT INTO `tall` VALUES (1,'Tallinn Stable',55231231);
/*!40000 ALTER TABLE `tall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talli_varustus`
--

DROP TABLE IF EXISTS `talli_varustus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talli_varustus` (
  `id` varchar(255) NOT NULL,
  `nimi` varchar(255) NOT NULL,
  `varustus` varchar(255) NOT NULL,
  `TallID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talli_varustus_tallid_foreign` (`TallID`),
  CONSTRAINT `talli_varustus_tallid_foreign` FOREIGN KEY (`TallID`) REFERENCES `tall` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talli_varustus`
--

LOCK TABLES `talli_varustus` WRITE;
/*!40000 ALTER TABLE `talli_varustus` DISABLE KEYS */;
INSERT INTO `talli_varustus` VALUES ('1','Saddle','Leather saddle',1),('2','Bridle','Leather bridle',1);
/*!40000 ALTER TABLE `talli_varustus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talliboksid`
--

DROP TABLE IF EXISTS `talliboksid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talliboksid` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `num` varchar(255) NOT NULL,
  `töötaja` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talliboksid_töötaja_foreign` (`töötaja`),
  CONSTRAINT `talliboksid_töötaja_foreign` FOREIGN KEY (`töötaja`) REFERENCES `töötajad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talliboksid`
--

LOCK TABLES `talliboksid` WRITE;
/*!40000 ALTER TABLE `talliboksid` DISABLE KEYS */;
INSERT INTO `talliboksid` VALUES (1,'Box 1',1),(2,'Box 2',2),(3,'Box 3',3);
/*!40000 ALTER TABLE `talliboksid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treeningud`
--

DROP TABLE IF EXISTS `treeningud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treeningud` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TöötajaID` bigint unsigned NOT NULL,
  `kuupäev` date NOT NULL,
  `HobuseID` bigint unsigned NOT NULL,
  `kirjeldus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `treeningud_töötajaid_foreign` (`TöötajaID`),
  KEY `treeningud_hobuseid_foreign` (`HobuseID`),
  CONSTRAINT `treeningud_hobuseid_foreign` FOREIGN KEY (`HobuseID`) REFERENCES `hobused` (`id`),
  CONSTRAINT `treeningud_töötajaid_foreign` FOREIGN KEY (`TöötajaID`) REFERENCES `töötajad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treeningud`
--

LOCK TABLES `treeningud` WRITE;
/*!40000 ALTER TABLE `treeningud` DISABLE KEYS */;
INSERT INTO `treeningud` VALUES (1,1,'2024-10-01',1,'Basic training for Horse 1'),(2,2,'2024-10-02',2,'Jumping exercises for Horse 2'),(3,3,'2024-10-03',3,'Dressage training for Horse 3');
/*!40000 ALTER TABLE `treeningud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `töögraafikud`
--

DROP TABLE IF EXISTS `töögraafikud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `töögraafikud` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) NOT NULL,
  `kirjeldus` varchar(255) NOT NULL,
  `kuupäev` date NOT NULL,
  `töötajaID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `töögraafikud_töötajaid_foreign` (`töötajaID`),
  CONSTRAINT `töögraafikud_töötajaid_foreign` FOREIGN KEY (`töötajaID`) REFERENCES `töötajad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `töögraafikud`
--

LOCK TABLES `töögraafikud` WRITE;
/*!40000 ALTER TABLE `töögraafikud` DISABLE KEYS */;
INSERT INTO `töögraafikud` VALUES (1,'Shift 1','Morning shift','2024-10-01',1),(2,'Shift 2','Afternoon shift','2024-10-02',2);
/*!40000 ALTER TABLE `töögraafikud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `töötajad`
--

DROP TABLE IF EXISTS `töötajad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `töötajad` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `töötajad`
--

LOCK TABLES `töötajad` WRITE;
/*!40000 ALTER TABLE `töötajad` DISABLE KEYS */;
INSERT INTO `töötajad` VALUES (1,'Aadu Laid'),(2,'Ester Teeveer'),(3,'Raul Väli'),(4,'Mihkel Soo'),(5,'Paavo Neihaus'),(6,'Oskar Vallik'),(7,'Reet Romanjuk'),(8,'Karin Hallas'),(9,'Carina Romana Ciaro');
/*!40000 ALTER TABLE `töötajad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-17  8:43:14
