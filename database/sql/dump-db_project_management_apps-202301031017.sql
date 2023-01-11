-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_project_management_apps
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_a_project_databases`
--

DROP TABLE IF EXISTS `tbl_a_project_databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_databases` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_databases`
--

LOCK TABLES `tbl_a_project_databases` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_databases` DISABLE KEYS */;
INSERT INTO `tbl_a_project_databases` VALUES (1,'Mysql','',1,1,'2022-07-25 12:08:11',1,'2022-07-25 12:08:11'),(2,'Maria DB','',1,1,'2022-07-25 12:08:11',1,'2022-07-25 12:08:11'),(3,'Postgre SQL','',1,1,'2022-07-25 12:08:11',1,'2022-07-25 12:08:11'),(4,'SQL Server','',1,1,'2022-07-25 12:08:11',1,'2022-07-25 12:08:11'),(5,'SQL Lite','',1,1,'2022-07-25 12:08:11',1,'2022-07-25 12:08:11'),(6,'Mongo DB','',1,1,'2022-07-25 12:08:11',1,'2022-07-25 12:08:11');
/*!40000 ALTER TABLE `tbl_a_project_databases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_details`
--

DROP TABLE IF EXISTS `tbl_a_project_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_details` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `version` varchar(32) NOT NULL,
  `project_url_dev` varchar(255) NOT NULL,
  `project_url_prod` varchar(255) NOT NULL,
  `repository_link` varchar(255) NOT NULL,
  `user_manual` varchar(255) NOT NULL,
  `lang_id` varchar(255) NOT NULL,
  `db_id` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_details`
--

LOCK TABLES `tbl_a_project_details` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_details` DISABLE KEYS */;
INSERT INTO `tbl_a_project_details` VALUES (1,'<p>addt<br></p>','1','http://test.local','http://test.local','http://test.local/source.git','http://project-management.local/static/__media/files/projects/REN.2.1588 300922 (UPDATE LAMPIRAN).pdf','13,14,12,1','1',1,2,'2022-10-18 12:00:04',2,'2022-10-18 12:00:04'),(2,'<p>add desc<br></p>','5.7.8','-','-','-','http://project-management.local/static/__media/files/projects/Spesification Tambahan SAT(1).xlsx','13,12,5','3',1,2,'2022-11-08 16:48:18',2,'2022-11-08 16:48:18');
/*!40000 ALTER TABLE `tbl_a_project_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_document_files`
--

DROP TABLE IF EXISTS `tbl_a_project_document_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_document_files` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `project_id` int(32) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_document_files`
--

LOCK TABLES `tbl_a_project_document_files` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_document_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_a_project_document_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_languages`
--

DROP TABLE IF EXISTS `tbl_a_project_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_languages` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_languages`
--

LOCK TABLES `tbl_a_project_languages` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_languages` DISABLE KEYS */;
INSERT INTO `tbl_a_project_languages` VALUES (1,'PHP','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(2,'Java','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(3,'Python','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(4,'Go','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(5,'Kotlin','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(6,'React Native','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(7,'Ruby','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(8,'C','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(9,'C++','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(10,'C#','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(11,'Visual Basic','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(12,'Java Script','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(13,'Css','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54'),(14,'HTML','-',1,1,'2022-07-25 10:33:54',1,'2022-07-25 10:33:54');
/*!40000 ALTER TABLE `tbl_a_project_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_pentest`
--

DROP TABLE IF EXISTS `tbl_a_project_pentest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_pentest` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `project_id` int(32) DEFAULT NULL,
  `pentest_id` int(32) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by` int(32) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(32) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  UNIQUE KEY `id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_pentest`
--

LOCK TABLES `tbl_a_project_pentest` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_pentest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_a_project_pentest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_photos`
--

DROP TABLE IF EXISTS `tbl_a_project_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_photos` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_photos`
--

LOCK TABLES `tbl_a_project_photos` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_a_project_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_sat`
--

DROP TABLE IF EXISTS `tbl_a_project_sat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_sat` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` varchar(16) DEFAULT NULL,
  `project_id` int(32) DEFAULT NULL,
  `sat_id` int(32) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(32) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  UNIQUE KEY `id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_sat`
--

LOCK TABLES `tbl_a_project_sat` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_sat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_a_project_sat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_status`
--

DROP TABLE IF EXISTS `tbl_a_project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_status` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_status`
--

LOCK TABLES `tbl_a_project_status` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_status` DISABLE KEYS */;
INSERT INTO `tbl_a_project_status` VALUES (1,'open','-',1,1,'2022-08-01 05:31:22',1,'0000-00-00'),(2,'progress','-',1,1,'2022-08-01 05:31:22',1,'0000-00-00'),(3,'pending','-',1,1,'2022-08-01 05:31:22',1,'0000-00-00'),(4,'done','-',1,1,'2022-08-01 05:31:22',1,'0000-00-00'),(5,'close','-',1,1,'2022-08-01 05:31:22',1,'0000-00-00'),(6,'cancel','-',1,1,'2022-08-01 05:31:22',1,'0000-00-00'),(7,'failed','-',1,1,'2022-08-01 05:31:22',1,'0000-00-00');
/*!40000 ALTER TABLE `tbl_a_project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_team_id`
--

DROP TABLE IF EXISTS `tbl_a_project_team_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_team_id` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `project_id` int(32) NOT NULL,
  `team_user_id` int(32) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_team_id`
--

LOCK TABLES `tbl_a_project_team_id` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_team_id` DISABLE KEYS */;
INSERT INTO `tbl_a_project_team_id` VALUES (1,2,1,'desc',1,2,'2022-11-08 16:48:18',2,'2022-11-08 16:48:18'),(2,2,4,'desc',1,2,'2022-11-08 16:48:18',2,'2022-11-08 16:48:18'),(3,2,5,'desc',1,2,'2022-11-08 16:48:18',2,'2022-11-08 16:48:18'),(4,2,10,'desc',1,2,'2022-11-08 16:48:18',2,'2022-11-08 16:48:18'),(5,2,11,'desc',1,2,'2022-11-08 16:48:18',2,'2022-11-08 16:48:18');
/*!40000 ALTER TABLE `tbl_a_project_team_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_team_users`
--

DROP TABLE IF EXISTS `tbl_a_project_team_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_team_users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(155) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `team_id` int(32) NOT NULL DEFAULT 0,
  `group_id` int(32) NOT NULL DEFAULT 0,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_team_users`
--

LOCK TABLES `tbl_a_project_team_users` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_team_users` DISABLE KEYS */;
INSERT INTO `tbl_a_project_team_users` VALUES (1,'project_user_6_001_0001','arif.firmansyah','arif','firmansyah','arif.firmansyah@bni.co.id','-','0',1,6,0,1,2,'2022-11-07 14:39:27',2,'2022-11-07 14:39:27'),(2,'project_user_6_001_0002','elang.saputro','elang','saputro','elang.saputro@bni.co.id','-','0',1,6,0,1,2,'2022-11-07 14:39:27',2,'2022-11-07 14:39:27'),(3,'project_user_6_001_0003','septyan.azany','septyan','azany','septyan.azany@bni.co.id','-','0',1,6,0,1,2,'2022-11-07 14:39:27',2,'2022-11-07 14:39:27'),(4,'project_user_9_0213_0001','developer-test1','developer','test1','developer.test1@bni.co.id','-','0',3,9,0,1,2,'2022-11-08 15:59:07',2,'2022-11-08 15:59:07'),(5,'project_user_9_0213_0002','developer-test2','developer','test2','developer.test2@bni.co.id','-','0',3,9,0,1,2,'2022-11-08 15:59:07',2,'2022-11-08 15:59:07'),(6,'project_user_9_0213_0003','developer-test3','developer','test3','developer.test3@bni.co.id','-','0',3,9,0,1,2,'2022-11-08 15:59:07',2,'2022-11-08 15:59:07'),(7,'project_user_9_0213_0004','developer-test4','developer','test4','developer.test4@bni.co.id','-','0',3,9,0,1,2,'2022-11-08 15:59:07',2,'2022-11-08 15:59:07'),(8,'project_user_12_00214_0001','pentest-test1','pentest','test1','pentest.test1@bni.co.id','-','0',4,12,0,1,2,'2022-11-08 16:04:05',2,'2022-11-08 16:04:05'),(9,'project_user_12_00214_0002','pentest-test2','pentest','test2','pentest.test2@bni.co.id','-','0',4,12,0,1,2,'2022-11-08 16:04:05',2,'2022-11-08 16:04:05'),(10,'project_user_12_00214_0003','pentest-test3','pentest','test3','pentest.test3@bni.co.id','-','0',4,12,0,1,2,'2022-11-08 16:04:05',2,'2022-11-08 16:04:05'),(11,'project_user_12_00214_0004','pentest-test4','pentest','test4','pentest.test4@bni.co.id','-','0',4,12,0,1,2,'2022-11-08 16:04:05',2,'2022-11-08 16:04:05');
/*!40000 ALTER TABLE `tbl_a_project_team_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_teams`
--

DROP TABLE IF EXISTS `tbl_a_project_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_teams` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `group_id` int(32) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_teams`
--

LOCK TABLES `tbl_a_project_teams` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_teams` DISABLE KEYS */;
INSERT INTO `tbl_a_project_teams` VALUES (1,'001','Tim-PIC-ISU','-','isu-isb@bni.co.id','088821363521',6,1,2,'2022-10-17 09:23:38',2,'2022-10-17 09:23:38'),(2,'002','Tim-PIC-Owner','-','-','088821363521',10,1,2,'2022-10-17 09:24:15',2,'2022-10-17 10:50:11'),(3,'003','Tim-PIC-Developer','-','-','088821363521',9,1,2,'2022-10-17 09:24:29',2,'2022-10-17 09:24:29'),(4,'004','Tim-PIC-Pentester','-','-','088821363521',12,1,2,'2022-10-17 09:24:44',2,'2022-10-17 09:24:44');
/*!40000 ALTER TABLE `tbl_a_project_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_timeline_event_colors`
--

DROP TABLE IF EXISTS `tbl_a_project_timeline_event_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_timeline_event_colors` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_timeline_event_colors`
--

LOCK TABLES `tbl_a_project_timeline_event_colors` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_timeline_event_colors` DISABLE KEYS */;
INSERT INTO `tbl_a_project_timeline_event_colors` VALUES (1,'rgb(0,99,130)','-',0,0,2,'2022-10-18 12:01:39',2,'2022-10-18 12:01:39'),(2,'rgb(69,241,15)','-',0,0,2,'2022-11-11 10:22:23',2,'2022-11-11 10:22:23'),(3,'rgb(228,13,239)','-',0,0,2,'2022-11-11 10:36:50',2,'2022-11-11 10:36:50'),(4,'rgb(91,31,241)','-',0,0,2,'2022-11-11 10:41:48',2,'2022-11-11 10:41:48'),(5,'rgb(30,235,137)','-',0,0,2,'2022-11-11 10:48:31',2,'2022-11-11 10:48:31'),(6,'rgb(227,183,45)','-',0,0,2,'2022-11-11 10:50:01',2,'2022-11-11 10:50:01'),(7,'rgb(123,123,123)','-',0,0,2,'2022-11-11 10:55:38',2,'2022-11-11 10:55:38'),(8,'rgb(235,211,211)','-',0,0,2,'2022-11-11 10:57:10',2,'2022-11-11 10:57:10'),(9,'rgb(247,236,27)','-',0,0,2,'2022-11-11 11:02:24',2,'2022-11-11 11:02:24'),(10,'rgb(76,101,111)','-',0,0,2,'2022-11-11 11:03:35',2,'2022-11-11 11:03:35'),(11,'rgb(48,226,235)','-',0,0,2,'2022-11-11 11:10:08',2,'2022-11-11 11:10:08'),(12,'#3c8dbc','-',0,0,2,'2022-11-11 14:44:15',2,'2022-11-11 14:44:15');
/*!40000 ALTER TABLE `tbl_a_project_timeline_event_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_timeline_events`
--

DROP TABLE IF EXISTS `tbl_a_project_timeline_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_timeline_events` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_draggable_event` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_timeline_events`
--

LOCK TABLES `tbl_a_project_timeline_events` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_timeline_events` DISABLE KEYS */;
INSERT INTO `tbl_a_project_timeline_events` VALUES (1,'pentest','rgb(0,99,130)','-',0,0,2,'2022-10-18 12:01:39',2,'2022-10-18 12:01:39'),(2,'SAT Scan (HCL)','rgb(228,13,239)','-',1,0,2,'2022-11-11 10:36:50',2,'2022-11-11 10:36:50'),(3,'PIR & Promote','rgb(91,31,241)','-',0,0,2,'2022-11-11 10:41:48',2,'2022-11-11 10:41:48'),(4,'Cek Koneksi','rgb(30,235,137)','-',0,0,2,'2022-11-11 10:48:31',2,'2022-11-11 10:48:31'),(5,'Fixing temuan SAST','rgb(227,183,45)','-',0,0,2,'2022-11-11 10:50:01',2,'2022-11-11 10:50:01'),(6,'Diskusi persiapan SAST & Pentest','rgb(123,123,123)','-',0,0,2,'2022-11-11 10:55:38',2,'2022-11-11 10:55:38'),(7,'UAT','rgb(235,211,211)','-',0,0,2,'2022-11-11 10:57:10',2,'2022-11-11 10:57:10'),(8,'Setup server UAT','rgb(247,236,27)','-',0,0,2,'2022-11-11 11:02:24',2,'2022-11-11 11:02:24'),(9,'Report hasil UAT','rgb(76,101,111)','-',0,0,2,'2022-11-11 11:03:35',2,'2022-11-11 11:03:35'),(10,'Penetration Test','rgb(48,226,235)','-',1,0,2,'2022-11-11 11:10:08',2,'2022-11-11 11:10:08'),(11,'DAST','#3c8dbc','-',0,0,2,'2022-11-11 14:44:15',2,'2022-11-11 14:44:15'),(12,'SAT Scan (HCL)','rgb(228,13,239)','-',0,0,2,'2023-01-02 17:49:14',2,'2023-01-02 17:49:14');
/*!40000 ALTER TABLE `tbl_a_project_timeline_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_timelines`
--

DROP TABLE IF EXISTS `tbl_a_project_timelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_timelines` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dayname` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `date_start` date NOT NULL,
  `time_start` varchar(8) NOT NULL,
  `date_end` date NOT NULL,
  `time_end` varchar(8) NOT NULL,
  `notes` text NOT NULL,
  `project_id` int(32) NOT NULL,
  `project_status_id` int(32) NOT NULL,
  `project_timeline_event_id` int(32) NOT NULL,
  `project_timeline_event_color_id` int(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_timelines`
--

LOCK TABLES `tbl_a_project_timelines` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_timelines` DISABLE KEYS */;
INSERT INTO `tbl_a_project_timelines` VALUES (1,'834690247','pentest','wednesday','2022-10-26','2022-10-26','00:00:00','2022-10-28','00:00:00','-',1,1,1,1,1,2,'2022-10-18 12:01:39',2,'2022-10-18 12:01:39'),(2,'834690247','pentest','thursday','2022-10-27','2022-10-26','00:00:00','2022-10-28','00:00:00','-',1,1,1,1,1,2,'2022-10-18 12:01:39',2,'2022-10-18 12:01:39'),(3,'834690247','pentest','friday','2022-10-28','2022-10-26','00:00:00','2022-10-28','00:00:00','-',1,1,1,1,1,2,'2022-10-18 12:01:39',2,'2022-10-18 12:01:39'),(4,'988799768','SAT Scan (HCL)','tuesday','2022-11-29','2022-11-29','00:00:00','2022-11-30','00:00:00','-',2,1,2,3,1,2,'2022-11-11 10:36:50',2,'2022-11-11 10:36:50'),(5,'988799768','SAT Scan (HCL)','wednesday','2022-11-30','2022-11-29','00:00:00','2022-11-30','00:00:00','-',2,1,2,3,1,2,'2022-11-11 10:36:50',2,'2022-11-11 10:36:50'),(6,'965646803','PIR & Promote','wednesday','2022-11-23','2022-11-23','00:00:00','2022-11-25','00:00:00','-',2,1,3,4,1,2,'2022-11-11 10:41:48',2,'2022-11-11 10:41:48'),(7,'965646803','PIR & Promote','thursday','2022-11-24','2022-11-23','00:00:00','2022-11-25','00:00:00','-',2,1,3,4,1,2,'2022-11-11 10:41:48',2,'2022-11-11 10:41:48'),(8,'965646803','PIR & Promote','friday','2022-11-25','2022-11-23','00:00:00','2022-11-25','00:00:00','-',2,1,3,4,1,2,'2022-11-11 10:41:48',2,'2022-11-11 10:41:48'),(10,'994302283','Fixing temuan SAST','thursday','2022-12-01','2022-12-01','00:00:00','2022-12-02','00:00:00','-',2,1,5,6,1,2,'2022-11-11 10:50:01',2,'2022-11-11 10:50:01'),(11,'994302283','Fixing temuan SAST','friday','2022-12-02','2022-12-01','00:00:00','2022-12-02','00:00:00','-',2,1,5,6,1,2,'2022-11-11 10:50:01',2,'2022-11-11 10:50:01'),(12,'239267347','Diskusi persiapan SAST & Pentest','monday','2022-11-21','2022-11-21','00:00:00','2022-11-22','00:00:00','-',2,1,6,7,1,2,'2022-11-11 10:55:38',2,'2022-11-11 10:55:38'),(13,'239267347','Diskusi persiapan SAST & Pentest','tuesday','2022-11-22','2022-11-21','00:00:00','2022-11-22','00:00:00','-',2,1,6,7,1,2,'2022-11-11 10:55:38',2,'2022-11-11 10:55:38'),(14,'033065023','UAT','monday','2022-11-14','2022-11-14','00:00:00','2022-11-18','00:00:00','-',2,1,7,8,1,2,'2022-11-11 10:57:10',2,'2022-11-11 10:57:10'),(15,'033065023','UAT','tuesday','2022-11-15','2022-11-14','00:00:00','2022-11-18','00:00:00','-',2,1,7,8,1,2,'2022-11-11 10:57:10',2,'2022-11-11 10:57:10'),(16,'033065023','UAT','wednesday','2022-11-16','2022-11-14','00:00:00','2022-11-18','00:00:00','-',2,1,7,8,1,2,'2022-11-11 10:57:10',2,'2022-11-11 10:57:10'),(17,'033065023','UAT','thursday','2022-11-17','2022-11-14','00:00:00','2022-11-18','00:00:00','-',2,1,7,8,1,2,'2022-11-11 10:57:10',2,'2022-11-11 10:57:10'),(18,'033065023','UAT','friday','2022-11-18','2022-11-14','00:00:00','2022-11-18','00:00:00','-',2,1,7,8,1,2,'2022-11-11 10:57:10',2,'2022-11-11 10:57:10'),(19,'239279602','Setup server UAT','wednesday','2022-11-09','2022-11-09','00:00:00','2022-11-12','00:00:00','-',2,1,8,9,1,2,'2022-11-11 11:02:24',2,'2022-11-11 11:02:24'),(20,'239279602','Setup server UAT','thursday','2022-11-10','2022-11-09','00:00:00','2022-11-12','00:00:00','-',2,1,8,9,1,2,'2022-11-11 11:02:24',2,'2022-11-11 11:02:24'),(21,'239279602','Setup server UAT','friday','2022-11-11','2022-11-09','00:00:00','2022-11-12','00:00:00','-',2,1,8,9,1,2,'2022-11-11 11:02:24',2,'2022-11-11 11:02:24'),(22,'239279602','Setup server UAT','saturday','2022-11-12','2022-11-09','00:00:00','2022-11-12','00:00:00','-',2,1,8,9,1,2,'2022-11-11 11:02:24',2,'2022-11-11 11:02:24'),(23,'319217144','Report hasil UAT','friday','2022-11-18','2022-11-18','00:00:00','2022-11-18','00:00:00','-',2,1,9,10,1,2,'2022-11-11 11:03:35',2,'2022-11-11 11:03:35'),(24,'558251955','Penetration Test','monday','2022-11-14','2022-11-14','00:00:00','2022-11-16','00:00:00','-',1,1,10,11,1,2,'2022-11-11 11:10:08',2,'2022-11-11 11:10:08'),(25,'558251955','Penetration Test','tuesday','2022-11-15','2022-11-14','00:00:00','2022-11-16','00:00:00','-',1,1,10,11,1,2,'2022-11-11 11:10:08',2,'2022-11-11 11:10:08'),(26,'558251955','Penetration Test','wednesday','2022-11-16','2022-11-14','00:00:00','2022-11-16','00:00:00','-',1,1,10,11,1,2,'2022-11-11 11:10:08',2,'2022-11-11 11:10:08'),(27,'366429066','DAST','friday','2022-11-18','2022-11-18','00:00:00','2022-11-18','00:00:00','-',1,1,11,12,1,2,'2022-11-11 14:44:15',2,'2022-11-11 14:44:15'),(28,'873289460','Cek Koneksi','monday','2022-12-05','2022-12-05','00:00:00','2022-12-05','00:00:00','-',2,1,4,5,1,2,'2022-12-30 02:15:41',2,'2022-12-30 02:15:41'),(29,'573177279','SAT Scan (HCL)','thursday','1970-01-01','1970-01-01','00:00:00','1970-01-01','00:00:00','-',2,1,12,3,1,2,'2023-01-02 17:49:14',2,'2023-01-02 17:49:14');
/*!40000 ALTER TABLE `tbl_a_project_timelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_project_types`
--

DROP TABLE IF EXISTS `tbl_a_project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_project_types` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_project_types`
--

LOCK TABLES `tbl_a_project_types` WRITE;
/*!40000 ALTER TABLE `tbl_a_project_types` DISABLE KEYS */;
INSERT INTO `tbl_a_project_types` VALUES (1,'website','-',1,1,'2022-06-20 05:31:11',2,'2022-07-20 01:10:04'),(2,'restapi','-',1,1,'2022-06-20 05:31:11',1,'2022-06-20 05:31:11'),(3,'apps - android','-',1,1,'2022-06-20 05:31:11',2,'2022-07-19 09:45:12'),(4,'apps - ios','-',1,1,'2022-06-20 05:31:11',1,'2022-06-20 05:31:11');
/*!40000 ALTER TABLE `tbl_a_project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_projects`
--

DROP TABLE IF EXISTS `tbl_a_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_projects` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `project_detail_id` int(32) NOT NULL,
  `project_type_id` int(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_projects`
--

LOCK TABLES `tbl_a_projects` WRITE;
/*!40000 ALTER TABLE `tbl_a_projects` DISABLE KEYS */;
INSERT INTO `tbl_a_projects` VALUES (1,'RHCLIMUJO2ZF','TEST','-',1,1,1,2,'2022-10-18 12:00:03',2,'2022-10-18 12:00:04'),(2,'GUSNAA22RL3E','Project MBank','desc',2,3,1,2,'2022-11-08 16:48:18',2,'2022-11-08 16:48:18');
/*!40000 ALTER TABLE `tbl_a_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_pentest_request`
--

DROP TABLE IF EXISTS `tbl_b_pentest_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_pentest_request` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `request_by` int(32) NOT NULL,
  `handle_by` int(32) NOT NULL,
  `authorize_by` int(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_pentest_request`
--

LOCK TABLES `tbl_b_pentest_request` WRITE;
/*!40000 ALTER TABLE `tbl_b_pentest_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_pentest_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_pentest_results`
--

DROP TABLE IF EXISTS `tbl_b_pentest_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_pentest_results` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `critical_issue_total` int(12) NOT NULL,
  `critical_issue_summary` text NOT NULL,
  `high_issue_total` int(12) NOT NULL,
  `high_issue_summary` text NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_pentest_results`
--

LOCK TABLES `tbl_b_pentest_results` WRITE;
/*!40000 ALTER TABLE `tbl_b_pentest_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_pentest_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_pentest_vendor_users`
--

DROP TABLE IF EXISTS `tbl_b_pentest_vendor_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_pentest_vendor_users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `mobile_phone` int(16) NOT NULL,
  `address` text NOT NULL,
  `photos` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_pentest_vendor_users`
--

LOCK TABLES `tbl_b_pentest_vendor_users` WRITE;
/*!40000 ALTER TABLE `tbl_b_pentest_vendor_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_pentest_vendor_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_pentest_vendors`
--

DROP TABLE IF EXISTS `tbl_b_pentest_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_pentest_vendors` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `fax_number` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_pentest_vendors`
--

LOCK TABLES `tbl_b_pentest_vendors` WRITE;
/*!40000 ALTER TABLE `tbl_b_pentest_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_pentest_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_sat`
--

DROP TABLE IF EXISTS `tbl_b_sat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_sat` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `attempt` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by` int(32) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(32) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  UNIQUE KEY `id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_sat`
--

LOCK TABLES `tbl_b_sat` WRITE;
/*!40000 ALTER TABLE `tbl_b_sat` DISABLE KEYS */;
INSERT INTO `tbl_b_sat` VALUES (1,'Fortify','0','-',1,2,'2023-01-02 10:28:17',2,'2023-01-02 10:28:17'),(2,'HCL Appscan','0','-',1,2,'2023-01-02 10:34:09',2,'2023-01-02 10:34:09');
/*!40000 ALTER TABLE `tbl_b_sat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_c_source_code_assessments`
--

DROP TABLE IF EXISTS `tbl_c_source_code_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_c_source_code_assessments` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `project_summary` text NOT NULL,
  `critical_issue_total` int(12) NOT NULL,
  `critical_issue_summary` text NOT NULL,
  `high_issue_total` int(12) NOT NULL,
  `high_issue_summary` text NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_c_source_code_assessments`
--

LOCK TABLES `tbl_c_source_code_assessments` WRITE;
/*!40000 ALTER TABLE `tbl_c_source_code_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_c_source_code_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_project_assessments`
--

DROP TABLE IF EXISTS `tbl_d_project_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_project_assessments` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `consequence_to_server` mediumtext NOT NULL,
  `consequence_to_website` mediumtext NOT NULL,
  `consequence_to_brand` mediumtext NOT NULL,
  `project_id` int(32) NOT NULL,
  `source_code_assessment_id` int(32) NOT NULL,
  `pentest_request_id` int(32) NOT NULL,
  `pentest_result_id` int(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_project_assessments`
--

LOCK TABLES `tbl_d_project_assessments` WRITE;
/*!40000 ALTER TABLE `tbl_d_project_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_project_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_project_memo`
--

DROP TABLE IF EXISTS `tbl_d_project_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_project_memo` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `memo_to` varchar(255) NOT NULL,
  `memo_from` tinytext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `attachment` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_project_memo`
--

LOCK TABLES `tbl_d_project_memo` WRITE;
/*!40000 ALTER TABLE `tbl_d_project_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_project_memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_project_management_apps'
--

--
-- Dumping routines for database 'db_project_management_apps'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-03 10:17:48
