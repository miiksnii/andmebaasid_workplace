-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: palgad
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
-- Table structure for table `ettevõte`
--

DROP TABLE IF EXISTS `ettevõte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ettevõte` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Kood` varchar(10) NOT NULL,
  `Nimi` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ettevõte`
--

LOCK TABLES `ettevõte` WRITE;
/*!40000 ALTER TABLE `ettevõte` DISABLE KEYS */;
INSERT INTO `ettevõte` VALUES (1,'LEV','Levira'),(2,'ET','Ettevõte 2');
/*!40000 ALTER TABLE `ettevõte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palgamakse`
--

DROP TABLE IF EXISTS `palgamakse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palgamakse` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PalkId` int DEFAULT NULL,
  `Summa` decimal(10,2) NOT NULL,
  `Kuupäev` date NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `PalkId` (`PalkId`),
  CONSTRAINT `palgamakse_ibfk_1` FOREIGN KEY (`PalkId`) REFERENCES `palk` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palgamakse`
--

LOCK TABLES `palgamakse` WRITE;
/*!40000 ALTER TABLE `palgamakse` DISABLE KEYS */;
INSERT INTO `palgamakse` VALUES (1,1,2500.00,'2024-10-01');
/*!40000 ALTER TABLE `palgamakse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palk`
--

DROP TABLE IF EXISTS `palk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palk` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Summa` decimal(10,2) NOT NULL,
  `TöölineId` int DEFAULT NULL,
  `EttevõteId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `TöölineId` (`TöölineId`),
  KEY `EttevõteId` (`EttevõteId`),
  CONSTRAINT `palk_ibfk_1` FOREIGN KEY (`TöölineId`) REFERENCES `tööline` (`Id`),
  CONSTRAINT `palk_ibfk_2` FOREIGN KEY (`EttevõteId`) REFERENCES `ettevõte` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palk`
--

LOCK TABLES `palk` WRITE;
/*!40000 ALTER TABLE `palk` DISABLE KEYS */;
INSERT INTO `palk` VALUES (1,2500.00,1,1);
/*!40000 ALTER TABLE `palk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tööline`
--

DROP TABLE IF EXISTS `tööline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tööline` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Isikukood` varchar(11) NOT NULL,
  `Eesnimi` varchar(50) NOT NULL,
  `Perekonnanimi` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tööline`
--

LOCK TABLES `tööline` WRITE;
/*!40000 ALTER TABLE `tööline` DISABLE KEYS */;
INSERT INTO `tööline` VALUES (1,'12345678901','Eesnimi','Perekonnanimi');
/*!40000 ALTER TABLE `tööline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `väljamaksed`
--

DROP TABLE IF EXISTS `väljamaksed`;
/*!50001 DROP VIEW IF EXISTS `väljamaksed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `väljamaksed` AS SELECT 
 1 AS `Eesnimi`,
 1 AS `Perekonnanimi`,
 1 AS `KokkuVäljamakstud`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `väljamaksed`
--

/*!50001 DROP VIEW IF EXISTS `väljamaksed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `väljamaksed` AS select `t`.`Eesnimi` AS `Eesnimi`,`t`.`Perekonnanimi` AS `Perekonnanimi`,sum(`pm`.`Summa`) AS `KokkuVäljamakstud` from ((`tööline` `t` join `palk` `p` on((`t`.`Id` = `p`.`TöölineId`))) join `palgamakse` `pm` on((`p`.`Id` = `pm`.`PalkId`))) group by `t`.`Eesnimi`,`t`.`Perekonnanimi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-24 10:35:10
