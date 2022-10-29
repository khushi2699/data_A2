-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 34.172.135.144    Database: a2_remB00923816
-- ------------------------------------------------------
-- Server version	8.0.26-google

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e95b3520-5670-11ed-b545-42010a800007:1-6226';

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `amenities_id` int NOT NULL AUTO_INCREMENT,
  `amenities_name` varchar(45) DEFAULT NULL,
  `amenities_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`amenities_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (1,'Camping','All age group can camp');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(45) DEFAULT NULL,
  `event_desc` varchar(450) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Tree Plantation','People can come and plant trees','2022-12-12');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park`
--

DROP TABLE IF EXISTS `park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park` (
  `park_id` int NOT NULL AUTO_INCREMENT,
  `park_name` varchar(45) DEFAULT NULL,
  `park_area` int DEFAULT NULL,
  `park_address` varchar(450) DEFAULT NULL,
  `timing` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`park_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park`
--

LOCK TABLES `park` WRITE;
/*!40000 ALTER TABLE `park` DISABLE KEYS */;
INSERT INTO `park` VALUES (1,'Halifax public park',2000,'1333, South park Street','7 am to 7 pm');
/*!40000 ALTER TABLE `park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park_has_amenities`
--

DROP TABLE IF EXISTS `park_has_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park_has_amenities` (
  `park_park_id` int NOT NULL,
  `amenities_amenities_id` int NOT NULL,
  PRIMARY KEY (`park_park_id`,`amenities_amenities_id`),
  KEY `fk_park_has_amenities_amenities1_idx` (`amenities_amenities_id`),
  KEY `fk_park_has_amenities_park1_idx` (`park_park_id`),
  CONSTRAINT `fk_park_has_amenities_amenities1` FOREIGN KEY (`amenities_amenities_id`) REFERENCES `amenities` (`amenities_id`),
  CONSTRAINT `fk_park_has_amenities_park1` FOREIGN KEY (`park_park_id`) REFERENCES `park` (`park_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park_has_amenities`
--

LOCK TABLES `park_has_amenities` WRITE;
/*!40000 ALTER TABLE `park_has_amenities` DISABLE KEYS */;
INSERT INTO `park_has_amenities` VALUES (1,1);
/*!40000 ALTER TABLE `park_has_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park_has_events`
--

DROP TABLE IF EXISTS `park_has_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park_has_events` (
  `park_park_id` int NOT NULL,
  `events_event_id` int NOT NULL,
  PRIMARY KEY (`park_park_id`,`events_event_id`),
  KEY `fk_park_has_events_events1_idx` (`events_event_id`),
  KEY `fk_park_has_events_park1_idx` (`park_park_id`),
  CONSTRAINT `fk_park_has_events_events1` FOREIGN KEY (`events_event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_park_has_events_park1` FOREIGN KEY (`park_park_id`) REFERENCES `park` (`park_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park_has_events`
--

LOCK TABLES `park_has_events` WRITE;
/*!40000 ALTER TABLE `park_has_events` DISABLE KEYS */;
INSERT INTO `park_has_events` VALUES (1,1);
/*!40000 ALTER TABLE `park_has_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park_has_rules`
--

DROP TABLE IF EXISTS `park_has_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park_has_rules` (
  `park_park_id` int NOT NULL,
  `rules_rule_id` int NOT NULL,
  PRIMARY KEY (`park_park_id`,`rules_rule_id`),
  KEY `fk_park_has_rules_rules1_idx` (`rules_rule_id`),
  KEY `fk_park_has_rules_park1_idx` (`park_park_id`),
  CONSTRAINT `fk_park_has_rules_park1` FOREIGN KEY (`park_park_id`) REFERENCES `park` (`park_id`),
  CONSTRAINT `fk_park_has_rules_rules1` FOREIGN KEY (`rules_rule_id`) REFERENCES `rules` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park_has_rules`
--

LOCK TABLES `park_has_rules` WRITE;
/*!40000 ALTER TABLE `park_has_rules` DISABLE KEYS */;
INSERT INTO `park_has_rules` VALUES (1,1);
/*!40000 ALTER TABLE `park_has_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park_has_visitors`
--

DROP TABLE IF EXISTS `park_has_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park_has_visitors` (
  `park_park_id` int NOT NULL,
  `visitors_visitor_id` int NOT NULL,
  PRIMARY KEY (`park_park_id`,`visitors_visitor_id`),
  KEY `fk_park_has_visitors_visitors1_idx` (`visitors_visitor_id`),
  KEY `fk_park_has_visitors_park1_idx` (`park_park_id`),
  CONSTRAINT `fk_park_has_visitors_park1` FOREIGN KEY (`park_park_id`) REFERENCES `park` (`park_id`),
  CONSTRAINT `fk_park_has_visitors_visitors1` FOREIGN KEY (`visitors_visitor_id`) REFERENCES `visitors` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park_has_visitors`
--

LOCK TABLES `park_has_visitors` WRITE;
/*!40000 ALTER TABLE `park_has_visitors` DISABLE KEYS */;
INSERT INTO `park_has_visitors` VALUES (1,1);
/*!40000 ALTER TABLE `park_has_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `reservation_by_name` varchar(45) DEFAULT NULL,
  `reservation_event_id` int DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `event_id_idx` (`reservation_event_id`),
  CONSTRAINT `event_id` FOREIGN KEY (`reservation_event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules` (
  `rule_id` int NOT NULL AUTO_INCREMENT,
  `rule_desc` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules`
--

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` VALUES (1,'No shouting');
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `visitor_id` int NOT NULL AUTO_INCREMENT,
  `visitor_name` varchar(45) DEFAULT NULL,
  `visitor_contact_details` varchar(45) DEFAULT NULL,
  `date_of_visit` date DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'Khushi Shah','9029941301','2022-10-24');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 10:12:54
