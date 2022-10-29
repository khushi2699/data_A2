CREATE DATABASE  IF NOT EXISTS `a1p11` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `a1p11`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: a1p11
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `applications_id` int NOT NULL AUTO_INCREMENT,
  `applications_program` varchar(100) DEFAULT NULL,
  `applications_status` tinyint DEFAULT NULL,
  `applications_fees_status` tinyint DEFAULT NULL,
  `application_start_date` varchar(45) DEFAULT NULL,
  `application_end_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`applications_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athletics_and_recreations`
--

DROP TABLE IF EXISTS `athletics_and_recreations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athletics_and_recreations` (
  `center_id` int DEFAULT NULL,
  `recreation_id` int DEFAULT NULL,
  KEY `center_id_idx` (`center_id`),
  KEY `recreation_id_idx` (`recreation_id`),
  CONSTRAINT `center_id` FOREIGN KEY (`center_id`) REFERENCES `recreation_center` (`center_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recreation_id` FOREIGN KEY (`recreation_id`) REFERENCES `athletics_recreation` (`recreation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletics_and_recreations`
--

LOCK TABLES `athletics_and_recreations` WRITE;
/*!40000 ALTER TABLE `athletics_and_recreations` DISABLE KEYS */;
/*!40000 ALTER TABLE `athletics_and_recreations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athletics_recreation`
--

DROP TABLE IF EXISTS `athletics_recreation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athletics_recreation` (
  `recreation_id` int NOT NULL AUTO_INCREMENT,
  `recreation_name` varchar(100) DEFAULT NULL,
  `category_of_recreation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`recreation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletics_recreation`
--

LOCK TABLES `athletics_recreation` WRITE;
/*!40000 ALTER TABLE `athletics_recreation` DISABLE KEYS */;
/*!40000 ALTER TABLE `athletics_recreation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `books_id` int NOT NULL AUTO_INCREMENT,
  `no_of_copies` int DEFAULT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `book_author` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`books_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_and_library`
--

DROP TABLE IF EXISTS `books_and_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_and_library` (
  `book_id` int DEFAULT NULL,
  `library_id` int DEFAULT NULL,
  KEY `book_id_idx` (`book_id`),
  KEY `library_id_idx` (`library_id`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`books_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `library_id` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_and_library`
--

LOCK TABLES `books_and_library` WRITE;
/*!40000 ALTER TABLE `books_and_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_and_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildings` (
  `building_id` int NOT NULL AUTO_INCREMENT,
  `building_number` int DEFAULT NULL,
  `building_campus_id` int DEFAULT NULL,
  `departments_in_building` int DEFAULT NULL,
  PRIMARY KEY (`building_id`),
  KEY `campus_id_idx` (`building_campus_id`),
  CONSTRAINT `campus_id` FOREIGN KEY (`building_campus_id`) REFERENCES `campus` (`campus_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafeteria`
--

DROP TABLE IF EXISTS `cafeteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafeteria` (
  `cafeteria_id` int NOT NULL AUTO_INCREMENT,
  `cafeteria_name` varchar(100) DEFAULT NULL,
  `cafeteria_working_hours` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cafeteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafeteria`
--

LOCK TABLES `cafeteria` WRITE;
/*!40000 ALTER TABLE `cafeteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafeteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus` (
  `campus_id` int NOT NULL AUTO_INCREMENT,
  `campus_name` varchar(100) DEFAULT NULL,
  `no_of_buildings_in_campus` int DEFAULT NULL,
  `campus_city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `classroom_id` int NOT NULL AUTO_INCREMENT,
  `classroom_number` int DEFAULT NULL,
  `classroom_type` varchar(45) DEFAULT NULL,
  `classroom_capacity` int DEFAULT NULL,
  PRIMARY KEY (`classroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `contact_details_id` int NOT NULL AUTO_INCREMENT,
  `contact_number` varchar(45) DEFAULT NULL,
  `contact_of` varchar(100) DEFAULT NULL,
  `coodinator_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`contact_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_faculties`
--

DROP TABLE IF EXISTS `department_faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_faculties` (
  `deparment_id` int DEFAULT NULL,
  `facutly_banner_id` int DEFAULT NULL,
  KEY `department_id_idx` (`deparment_id`),
  KEY `facutly_banner_id_idx` (`facutly_banner_id`),
  CONSTRAINT `department_faculties_department_id` FOREIGN KEY (`deparment_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `department_faculties_facutly_banner_id` FOREIGN KEY (`facutly_banner_id`) REFERENCES `faculties` (`faculty_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_faculties`
--

LOCK TABLES `department_faculties` WRITE;
/*!40000 ALTER TABLE `department_faculties` DISABLE KEYS */;
/*!40000 ALTER TABLE `department_faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) DEFAULT NULL,
  `no_of_progs_in_dept` int DEFAULT NULL,
  `head_of_department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science',10,'Smith Chokshi'),(2,'Engineering',2,'Sam Simpson');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) DEFAULT NULL,
  `club_id` int DEFAULT NULL,
  `event_desc` varchar(100) DEFAULT NULL,
  `event_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) DEFAULT NULL,
  `exam_subjects` varchar(45) DEFAULT NULL,
  `no_of_studs_in_exam` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculties` (
  `faculty_banner_id` int NOT NULL,
  `faculty_name` varchar(100) DEFAULT NULL,
  `facutly_email` varchar(100) DEFAULT NULL,
  `faculty_office_hours` varchar(45) DEFAULT NULL,
  `faculty_linkedIn` varchar(100) DEFAULT NULL,
  `faculty_mobile_number` double DEFAULT NULL,
  `payroll_id` int DEFAULT NULL,
  PRIMARY KEY (`faculty_banner_id`),
  KEY `payroll_id_idx` (`payroll_id`),
  CONSTRAINT `payroll_id` FOREIGN KEY (`payroll_id`) REFERENCES `a1p1`.`payroll_details` (`payroll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(45) DEFAULT NULL,
  `grade_score_range` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_care`
--

DROP TABLE IF EXISTS `health_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_care` (
  `health_care_id` int NOT NULL AUTO_INCREMENT,
  `health_care_name` varchar(100) DEFAULT NULL,
  `health_care_dept_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`health_care_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_care`
--

LOCK TABLES `health_care` WRITE;
/*!40000 ALTER TABLE `health_care` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_care_services`
--

DROP TABLE IF EXISTS `health_care_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_care_services` (
  `health_care_id` int DEFAULT NULL,
  `health_care_service_name` varchar(100) DEFAULT NULL,
  `health_care_service_desc` varchar(100) DEFAULT NULL,
  KEY `health_care_id_idx` (`health_care_id`),
  CONSTRAINT `health_care_id` FOREIGN KEY (`health_care_id`) REFERENCES `health_care` (`health_care_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_care_services`
--

LOCK TABLES `health_care_services` WRITE;
/*!40000 ALTER TABLE `health_care_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_care_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `holiday_id` int NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(100) DEFAULT NULL,
  `holiday_day` varchar(45) DEFAULT NULL,
  `holiday_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_opportunities`
--

DROP TABLE IF EXISTS `job_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_opportunities` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) DEFAULT NULL,
  `job_type` varchar(100) DEFAULT NULL,
  `job_position` varchar(100) DEFAULT NULL,
  `job_desc` varchar(100) DEFAULT NULL,
  `job_application_deadline` varchar(45) DEFAULT NULL,
  `job_min_wages` int DEFAULT NULL,
  `job_requirements` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_opportunities`
--

LOCK TABLES `job_opportunities` WRITE;
/*!40000 ALTER TABLE `job_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_of_study`
--

DROP TABLE IF EXISTS `level_of_study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level_of_study` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_name` varchar(100) DEFAULT NULL,
  `no_of_progs_in_level` int DEFAULT NULL,
  `no_of_studs_in_level` int DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_of_study`
--

LOCK TABLES `level_of_study` WRITE;
/*!40000 ALTER TABLE `level_of_study` DISABLE KEYS */;
/*!40000 ALTER TABLE `level_of_study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `library_id` int NOT NULL AUTO_INCREMENT,
  `library_name` varchar(45) DEFAULT NULL,
  `library_services` varchar(100) DEFAULT NULL,
  `library_working_hours` varchar(45) DEFAULT NULL,
  `library_no_of_meeting_rooms` int DEFAULT NULL,
  PRIMARY KEY (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_details` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `student_banner_id` int DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `student_banner_id_idx` (`student_banner_id`),
  CONSTRAINT `login_details_student_banner_id` FOREIGN KEY (`student_banner_id`) REFERENCES `students` (`student_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `management_id` int NOT NULL AUTO_INCREMENT,
  `management_name` varchar(100) DEFAULT NULL,
  `management_responsibility` varchar(100) DEFAULT NULL,
  `management_coordinator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`management_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markers`
--

DROP TABLE IF EXISTS `markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markers` (
  `marker_banner_id` int NOT NULL,
  `marker_name` varchar(100) DEFAULT NULL,
  `marker_email` varchar(100) DEFAULT NULL,
  `marker_office_hours` varchar(45) DEFAULT NULL,
  `marker_linkedIn` varchar(100) DEFAULT NULL,
  `marker_mobile_number` varchar(45) DEFAULT NULL,
  `marker_allowed_hours` varchar(45) DEFAULT NULL,
  `payroll_id` int DEFAULT NULL,
  PRIMARY KEY (`marker_banner_id`),
  KEY `payroll_id_idx` (`payroll_id`),
  CONSTRAINT `markers_payroll_id` FOREIGN KEY (`payroll_id`) REFERENCES `payroll_details` (`payroll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markers`
--

LOCK TABLES `markers` WRITE;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `news_id` int NOT NULL AUTO_INCREMENT,
  `news_date` varchar(45) DEFAULT NULL,
  `news_details` varchar(100) DEFAULT NULL,
  `news_category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_details`
--

DROP TABLE IF EXISTS `payroll_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_details` (
  `payroll_id` int NOT NULL AUTO_INCREMENT,
  `sin_number` varchar(45) DEFAULT NULL,
  `payroll_bank_name` varchar(45) DEFAULT NULL,
  `payroll_bank_acc_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payroll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_details`
--

LOCK TABLES `payroll_details` WRITE;
/*!40000 ALTER TABLE `payroll_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `policy_id` int NOT NULL AUTO_INCREMENT,
  `policy_name` varchar(100) DEFAULT NULL,
  `policy_details` varchar(100) DEFAULT NULL,
  `policy_category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `program_id` int NOT NULL AUTO_INCREMENT,
  `program_name` varchar(100) DEFAULT NULL,
  `program_duration` int DEFAULT NULL,
  `no_of_studs_in_prog` int DEFAULT NULL,
  `program_requirements` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'MACS',16,120,'Bachelors'),(2,'Internetworking',16,150,'Masters');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_dept_level`
--

DROP TABLE IF EXISTS `programs_dept_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs_dept_level` (
  `program_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `level_id` int DEFAULT NULL,
  KEY `department_id_idx` (`department_id`),
  KEY `program_id_idx` (`program_id`),
  KEY `level_id_idx` (`level_id`),
  CONSTRAINT `programs_dept_level_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `programs_dept_level_level_id` FOREIGN KEY (`level_id`) REFERENCES `level_of_study` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `programs_dept_level_program_id` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_dept_level`
--

LOCK TABLES `programs_dept_level` WRITE;
/*!40000 ALTER TABLE `programs_dept_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs_dept_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recreation_center`
--

DROP TABLE IF EXISTS `recreation_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recreation_center` (
  `center_id` int NOT NULL AUTO_INCREMENT,
  `center_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recreation_center`
--

LOCK TABLES `recreation_center` WRITE;
/*!40000 ALTER TABLE `recreation_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `recreation_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_and_students`
--

DROP TABLE IF EXISTS `research_and_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_and_students` (
  `research_id` int DEFAULT NULL,
  `student_banner_id` int DEFAULT NULL,
  KEY `research_id_idx` (`research_id`),
  KEY `student_banner_id_idx` (`student_banner_id`),
  CONSTRAINT `research_and_students_research_id` FOREIGN KEY (`research_id`) REFERENCES `research_innovation` (`research_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `research_and_students_student_banner_id` FOREIGN KEY (`student_banner_id`) REFERENCES `students` (`student_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_and_students`
--

LOCK TABLES `research_and_students` WRITE;
/*!40000 ALTER TABLE `research_and_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `research_and_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_innovation`
--

DROP TABLE IF EXISTS `research_innovation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_innovation` (
  `research_id` int NOT NULL AUTO_INCREMENT,
  `research_name` varchar(45) DEFAULT NULL,
  `research_supervisor_id` int DEFAULT NULL,
  `research_fundings` varchar(100) DEFAULT NULL,
  `research_publications` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`research_id`),
  KEY `supervisor_id_idx` (`research_supervisor_id`),
  CONSTRAINT `research_innovation_supervisor_id` FOREIGN KEY (`research_supervisor_id`) REFERENCES `supervisor` (`supervisor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_innovation`
--

LOCK TABLES `research_innovation` WRITE;
/*!40000 ALTER TABLE `research_innovation` DISABLE KEYS */;
/*!40000 ALTER TABLE `research_innovation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residence`
--

DROP TABLE IF EXISTS `residence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residence` (
  `residence_campus_id` int NOT NULL AUTO_INCREMENT,
  `residence_campus_name` varchar(100) DEFAULT NULL,
  `residence_food_plan` varchar(100) DEFAULT NULL,
  `no_of_residence_building` int DEFAULT NULL,
  `no_of_students_living_in_campusq` int DEFAULT NULL,
  PRIMARY KEY (`residence_campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residence`
--

LOCK TABLES `residence` WRITE;
/*!40000 ALTER TABLE `residence` DISABLE KEYS */;
/*!40000 ALTER TABLE `residence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `schedule_subject_id` int DEFAULT NULL,
  `rooms_allocated_to_subject` int DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `subject_id_idx` (`schedule_subject_id`),
  CONSTRAINT `schedules_subject_id` FOREIGN KEY (`schedule_subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scholarships`
--

DROP TABLE IF EXISTS `scholarships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scholarships` (
  `scholarship_id` int NOT NULL AUTO_INCREMENT,
  `scholarship_name` varchar(100) DEFAULT NULL,
  `scholarship_category` varchar(100) DEFAULT NULL,
  `scholarship_eligibility` varchar(100) DEFAULT NULL,
  `scholarship_coordinator` varchar(100) DEFAULT NULL,
  `scholarship_applicant_banner_id` int DEFAULT NULL,
  `scholarship_status` tinyint DEFAULT NULL,
  PRIMARY KEY (`scholarship_id`),
  KEY `student_banner_id_idx` (`scholarship_applicant_banner_id`),
  CONSTRAINT `student_banner_id` FOREIGN KEY (`scholarship_applicant_banner_id`) REFERENCES `a1p1`.`students` (`student_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scholarships`
--

LOCK TABLES `scholarships` WRITE;
/*!40000 ALTER TABLE `scholarships` DISABLE KEYS */;
/*!40000 ALTER TABLE `scholarships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_club_services`
--

DROP TABLE IF EXISTS `student_club_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_club_services` (
  `sc_service_id` int NOT NULL AUTO_INCREMENT,
  `sc_service_name` varchar(100) DEFAULT NULL,
  `sc_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sc_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_club_services`
--

LOCK TABLES `student_club_services` WRITE;
/*!40000 ALTER TABLE `student_club_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_club_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_clubs`
--

DROP TABLE IF EXISTS `student_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_clubs` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `club_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_clubs`
--

LOCK TABLES `student_clubs` WRITE;
/*!40000 ALTER TABLE `student_clubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_services`
--

DROP TABLE IF EXISTS `student_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `serivce_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_services`
--

LOCK TABLES `student_services` WRITE;
/*!40000 ALTER TABLE `student_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_subjects`
--

DROP TABLE IF EXISTS `student_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_subjects` (
  `student_banner_id` int DEFAULT NULL,
  `student_subject_id` int DEFAULT NULL,
  `student_grade_id` int DEFAULT NULL,
  KEY `student_banner_id_idx` (`student_banner_id`),
  KEY `subject_id_idx` (`student_subject_id`),
  KEY `grade_id_idx` (`student_grade_id`),
  CONSTRAINT `student_subjects_grade_id` FOREIGN KEY (`student_grade_id`) REFERENCES `grades` (`grade_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_subjects_student_banner_id` FOREIGN KEY (`student_banner_id`) REFERENCES `students` (`student_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_subjects_subject_id` FOREIGN KEY (`student_subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_subjects`
--

LOCK TABLES `student_subjects` WRITE;
/*!40000 ALTER TABLE `student_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_banner_id` int NOT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `student_department_id` int DEFAULT NULL,
  `student_program_id` int DEFAULT NULL,
  `student_current_term` varchar(45) DEFAULT NULL,
  `student_fees` varchar(45) DEFAULT NULL,
  `student_scholarship_status` tinyint DEFAULT NULL,
  `student_scholarship_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_banner_id`),
  KEY `department_id_idx` (`student_department_id`),
  KEY `program_id_idx` (`student_program_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`student_department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `program_id` FOREIGN KEY (`student_program_id`) REFERENCES `programs` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Khushi Shah','khushi@dal.ca',1,1,'1','27000',0,'Dean Scholarship');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_in_cub`
--

DROP TABLE IF EXISTS `students_in_cub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_in_cub` (
  `club_in` int DEFAULT NULL,
  `student_banner_id` int DEFAULT NULL,
  KEY `club_id_idx` (`club_in`),
  KEY `student_banner_id_idx` (`student_banner_id`),
  CONSTRAINT `club_id` FOREIGN KEY (`club_in`) REFERENCES `student_clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `students_in_cub_student_banner_id` FOREIGN KEY (`student_banner_id`) REFERENCES `students` (`student_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_in_cub`
--

LOCK TABLES `students_in_cub` WRITE;
/*!40000 ALTER TABLE `students_in_cub` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_in_cub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_marker`
--

DROP TABLE IF EXISTS `subject_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_marker` (
  `subject_id` int NOT NULL,
  `marker_banner_id` int DEFAULT NULL,
  KEY `subject_id_idx` (`subject_id`),
  CONSTRAINT `subject_marker_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_marker`
--

LOCK TABLES `subject_marker` WRITE;
/*!40000 ALTER TABLE `subject_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_ta`
--

DROP TABLE IF EXISTS `subject_ta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_ta` (
  `subject_id` int NOT NULL,
  `ta_banner_id` int DEFAULT NULL,
  KEY `subject_id_idx` (`subject_id`),
  KEY `ta_banner_id_idx` (`ta_banner_id`),
  CONSTRAINT `subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ta_banner_id` FOREIGN KEY (`ta_banner_id`) REFERENCES `teaching_assistants` (`ta_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_ta`
--

LOCK TABLES `subject_ta` WRITE;
/*!40000 ALTER TABLE `subject_ta` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_ta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) DEFAULT NULL,
  `faculty_banner_id` int DEFAULT NULL,
  `no_of_students` int DEFAULT NULL,
  `subject_credits` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `faculty_banner_id_idx` (`faculty_banner_id`),
  CONSTRAINT `faculty_banner_id` FOREIGN KEY (`faculty_banner_id`) REFERENCES `faculties` (`faculty_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `supervisor_id` int NOT NULL AUTO_INCREMENT,
  `supervisor_banner_id` int DEFAULT NULL,
  `supervisor_name` varchar(100) DEFAULT NULL,
  `supervisor_email` varchar(100) DEFAULT NULL,
  `supervisor_working_hours` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`supervisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor_student`
--

DROP TABLE IF EXISTS `supervisor_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor_student` (
  `supervisor_id` int DEFAULT NULL,
  `student_banner_idq` int DEFAULT NULL,
  KEY `supervisor_id_idx` (`supervisor_id`),
  KEY `student_banner_id_idx` (`student_banner_idq`),
  CONSTRAINT `supervisor_student_student_banner_id` FOREIGN KEY (`student_banner_idq`) REFERENCES `students` (`student_banner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supervisor_student_supervisor_id` FOREIGN KEY (`supervisor_id`) REFERENCES `supervisor` (`supervisor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor_student`
--

LOCK TABLES `supervisor_student` WRITE;
/*!40000 ALTER TABLE `supervisor_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisor_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_university`
--

DROP TABLE IF EXISTS `support_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_university` (
  `support_id` int NOT NULL AUTO_INCREMENT,
  `support_name` varchar(100) DEFAULT NULL,
  `support_purpose` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`support_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_university`
--

LOCK TABLES `support_university` WRITE;
/*!40000 ALTER TABLE `support_university` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching_assistants`
--

DROP TABLE IF EXISTS `teaching_assistants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching_assistants` (
  `ta_banner_id` int NOT NULL,
  `ta_name` varchar(100) DEFAULT NULL,
  `ta_email` varchar(100) DEFAULT NULL,
  `ta_office_hours` varchar(45) DEFAULT NULL,
  `ta_linkedIn` varchar(100) DEFAULT NULL,
  `ta_mobile_number` varchar(45) DEFAULT NULL,
  `ta_allowed_hours` varchar(45) DEFAULT NULL,
  `payroll_id` int DEFAULT NULL,
  PRIMARY KEY (`ta_banner_id`),
  KEY `payroll_id_idx` (`payroll_id`),
  CONSTRAINT `teaching_assistants_payroll_id` FOREIGN KEY (`payroll_id`) REFERENCES `payroll_details` (`payroll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching_assistants`
--

LOCK TABLES `teaching_assistants` WRITE;
/*!40000 ALTER TABLE `teaching_assistants` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaching_assistants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 21:50:13
