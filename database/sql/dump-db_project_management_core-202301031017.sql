-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_project_management_core
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
-- Table structure for table `tbl_a_groups`
--

DROP TABLE IF EXISTS `tbl_a_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent_id` int(32) NOT NULL DEFAULT 0,
  `rank` int(1) NOT NULL DEFAULT 0,
  `level` int(32) NOT NULL,
  `is_menu` tinyint(1) NOT NULL DEFAULT 0,
  `is_group_project` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_groups`
--

LOCK TABLES `tbl_a_groups` WRITE;
/*!40000 ALTER TABLE `tbl_a_groups` DISABLE KEYS */;
INSERT INTO `tbl_a_groups` VALUES (1,'system','-',0,1,1500,0,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(2,'superuser','-',0,2,1000,1,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(3,'staff','-',0,3,800,1,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(4,'vendor','-',0,4,300,0,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(5,'tim-isu','-',3,1,600,0,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(6,'tim-isu-isb','-',5,1,500,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(7,'tim-isu-iam','-',5,1,500,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(8,'tim-isu-scr','-',5,2,500,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(9,'tim-developer','-',3,1,600,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(10,'tim-project-owner','-',3,2,200,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(11,'tim-vendor-sat','-',4,1,200,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(12,'tim-vendor-pentest','-',4,2,200,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12');
/*!40000 ALTER TABLE `tbl_a_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_menus`
--

DROP TABLE IF EXISTS `tbl_a_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `content_path` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_badge` tinyint(4) NOT NULL DEFAULT 0,
  `badge` text NOT NULL,
  `badge_id` varchar(255) NOT NULL,
  `badge_value` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_basic` tinyint(1) NOT NULL DEFAULT 0,
  `is_open` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_menus`
--

LOCK TABLES `tbl_a_menus` WRITE;
/*!40000 ALTER TABLE `tbl_a_menus` DISABLE KEYS */;
INSERT INTO `tbl_a_menus` VALUES (1,'Services','','','',1,1,0,'','','',0,0,1,1,2,'2022-07-18 14:47:51',2,'2022-07-18 16:05:45'),(2,'Master','','','',1,2,0,'','','',0,0,0,1,2,'2022-07-18 14:47:57',2,'2022-07-18 14:47:57'),(3,'Prefferences','','','',1,3,0,'','','',0,0,0,1,2,'2022-07-18 14:48:05',2,'2022-07-18 14:48:05'),(4,'Reports','','','',1,6,0,'','','',0,0,0,1,2,'2022-07-18 14:48:11',2,'2022-08-10 15:01:07'),(5,'Projects','','','',2,1,0,'','','',1,0,0,1,2,'2022-07-18 14:55:42',2,'2022-07-18 14:55:42'),(6,'Code Assessments','','','',2,2,0,'','','',1,0,0,1,2,'2022-07-18 15:09:54',2,'2022-07-18 15:09:54'),(7,'Bussiness Assessments','','','',2,3,0,'','','',1,0,0,1,2,'2022-07-18 15:48:44',2,'2022-07-18 15:48:44'),(8,'Create','/project/create','/project/create','',3,1,0,'','','',5,0,0,1,2,'2022-07-18 15:52:31',2,'2022-07-25 13:29:14'),(9,'View','/project/view','/project/view','',3,2,0,'','','',5,0,0,1,2,'2022-07-18 15:52:34',2,'2022-07-25 13:29:26'),(10,'Options','','','',3,3,0,'','','',5,0,0,1,2,'2022-07-18 15:52:50',2,'2022-07-18 15:52:50'),(11,'Types','','','',4,1,0,'','','',10,0,0,1,2,'2022-07-18 15:53:00',2,'2022-07-18 15:53:00'),(12,'Teams','','','',4,2,0,'','','',10,0,0,1,2,'2022-07-18 15:53:08',2,'2022-07-18 15:53:08'),(13,'Documents','','','',4,3,0,'','','',10,0,0,1,2,'2022-07-18 15:53:16',2,'2022-07-25 11:31:38'),(14,'Languages','','','',4,4,0,'','','',10,0,0,1,2,'2022-07-18 15:53:23',2,'2022-07-25 11:32:59'),(15,'Create','/project/type/create','/project/type/create','',5,1,0,'','','',11,0,0,1,2,'2022-07-18 15:53:38',2,'2022-07-19 16:32:36'),(16,'View','/project/type/view','/project/type/view','',5,2,0,'','','',11,0,0,1,2,'2022-07-18 15:53:43',2,'2022-07-19 16:32:27'),(17,'Create','/project/team/create','/project/team/create','',5,1,0,'','','',12,0,0,1,2,'2022-07-18 15:53:58',2,'2022-07-19 16:32:46'),(18,'View','/project/team/view','/project/team/view','',5,2,0,'','','',12,0,0,1,2,'2022-07-18 15:54:01',2,'2022-07-19 16:32:55'),(19,'Create','/project/documents/create','/project/documents/create','',5,1,0,'','','',13,0,0,1,2,'2022-07-18 15:54:04',2,'2022-07-25 11:43:13'),(20,'View','/project/documents/view','/project/documents/view','',5,2,0,'','','',13,0,0,1,2,'2022-07-18 15:54:08',2,'2022-07-25 11:43:05'),(21,'Create','/project/option/memo/create','/project/option/memo/create','',5,1,0,'','','',14,0,0,1,2,'2022-07-18 15:54:11',2,'2022-07-19 19:01:02'),(22,'View','/project/option/memo/view','/project/option/memo/view','',5,2,0,'','','',14,0,0,1,2,'2022-07-18 15:54:15',2,'2022-07-19 19:00:48'),(23,'SAT Scans','','','',3,1,0,'','','',6,0,0,1,2,'2022-07-18 15:55:49',2,'2022-07-18 15:55:49'),(24,'Penetration Test','','','',3,2,0,'','','',6,0,0,1,2,'2022-07-18 15:56:01',2,'2022-07-18 15:56:01'),(25,'Options','','','',3,3,0,'','','',6,0,0,1,2,'2022-07-18 15:56:10',2,'2022-07-18 15:56:33'),(26,'Create','/project/code-assessment/sat-scan/create','/project/code-assessment/sat-scan/create','',4,1,0,'','','',23,0,0,1,2,'2022-07-18 15:56:44',2,'2022-12-30 02:47:06'),(27,'View','/project/code-assessment/sat-scan/view','/project/code-assessment/sat-scan/view','',4,2,0,'','','',23,0,0,1,2,'2022-07-18 15:56:47',2,'2022-12-30 02:46:50'),(28,'Create','/project/code-assessment/pentest/create','/project/code-assessment/pentest/create','',4,1,0,'','','',24,0,0,1,2,'2022-07-18 15:56:50',2,'2022-12-30 02:48:05'),(29,'View','/project/code-assessment/pentest/view','/project/code-assessment/pentest/view','',4,2,0,'','','',24,0,0,1,2,'2022-07-18 15:56:55',2,'2022-12-30 02:47:35'),(30,'Application List','','','',4,1,0,'','','',25,0,0,1,2,'2022-07-18 15:57:02',2,'2022-07-18 15:57:35'),(31,'Vendor List','','','',4,2,0,'','','',25,0,0,1,2,'2022-07-18 15:57:17',2,'2022-07-18 15:57:44'),(32,'Memo','','','',4,3,0,'','','',25,0,0,1,2,'2022-07-18 15:57:25',2,'2022-07-18 15:57:25'),(33,'View','/project/code-assessment/options/application/view','/project/code-assessment/options/application/view','',5,2,0,'','','',30,0,0,1,2,'2022-07-18 15:58:02',2,'2023-01-02 16:15:07'),(34,'View','/project/code-assessment/options/vendor/view','/project/code-assessment/options/vendor/view','',5,2,0,'','','',31,0,0,1,2,'2022-07-18 15:58:09',2,'2023-01-02 16:24:37'),(35,'Create','/project/code-assessment/options/memo/create','/project/code-assessment/options/memo/create','',5,1,0,'','','',32,0,0,1,2,'2022-07-18 15:58:12',2,'2023-01-02 16:26:17'),(36,'View','/project/code-assessment/options/memo/view','/project/code-assessment/options/memo/view','',5,2,0,'','','',32,0,0,1,2,'2022-07-18 15:58:16',2,'2023-01-02 16:26:28'),(37,'Documents','','','',2,1,0,'','','',2,0,0,1,2,'2022-07-18 15:58:55',2,'2022-07-18 15:58:55'),(38,'Permissions','','','',2,2,0,'','','',2,0,0,1,2,'2022-07-18 15:59:02',2,'2022-07-18 15:59:02'),(39,'Groups','','','',2,3,0,'','','',2,0,0,1,2,'2022-07-18 15:59:08',2,'2022-07-18 15:59:08'),(40,'Modules','','','',2,4,0,'','','',2,0,0,1,2,'2022-07-18 15:59:14',2,'2022-07-18 15:59:14'),(41,'Menu','','','',2,5,0,'','','',2,0,0,1,2,'2022-07-18 15:59:19',2,'2022-07-18 15:59:19'),(42,'Users','','','',2,6,0,'','','',2,0,0,1,2,'2022-07-18 15:59:25',2,'2022-07-18 15:59:25'),(43,'Controllers','','','',2,7,0,'','','',2,0,0,1,2,'2022-07-18 15:59:31',2,'2022-07-18 16:00:01'),(44,'Methods','','','',2,8,0,'','','',2,0,0,1,2,'2022-07-18 15:59:40',2,'2022-07-18 15:59:54'),(45,'PDF','','','',3,1,0,'','','',37,0,0,1,2,'2022-07-18 16:00:36',2,'2022-07-18 16:00:36'),(46,'Word','','','',3,2,0,'','','',37,0,0,1,2,'2022-07-18 16:00:41',2,'2022-07-18 16:00:41'),(47,'Excel','','','',3,3,0,'','','',37,0,0,1,2,'2022-07-18 16:00:49',2,'2022-07-18 16:00:49'),(48,'Email','','','',3,4,0,'','','',37,0,0,1,2,'2022-07-18 16:00:55',2,'2022-07-18 16:00:55'),(49,'Create','/master/permission/create','/master/permission/create','',3,1,0,'','','',38,0,0,1,2,'2022-07-18 16:01:02',2,'2022-07-18 16:10:20'),(50,'View','/master/permission/view','/master/permission/view','',3,2,0,'','','',38,0,0,1,2,'2022-07-18 16:01:08',2,'2022-07-18 16:10:14'),(51,'Create','/master/group/create','/master/group/create','',3,1,0,'','','',39,0,0,1,2,'2022-07-18 16:01:12',2,'2022-07-18 16:10:33'),(52,'View','/master/group/view','/master/group/view','',3,2,0,'','','',39,0,0,1,2,'2022-07-18 16:01:15',2,'2022-07-18 16:10:42'),(53,'Create','/master/module/create','/master/module/create','',3,1,0,'','','',40,0,0,1,2,'2022-07-18 16:01:19',2,'2022-07-18 16:11:00'),(54,'View','/master/module/view','/master/module/view','',3,2,0,'','','',40,0,0,1,2,'2022-07-18 16:01:23',2,'2022-07-18 16:11:07'),(55,'Create','/master/menu/create','/master/menu/create','',3,1,0,'','','',41,0,0,1,2,'2022-07-18 16:01:26',2,'2022-07-18 16:11:43'),(56,'View','/master/menu/view','/master/menu/view','',3,2,0,'','','',41,0,0,1,2,'2022-07-18 16:01:29',2,'2022-07-18 16:11:34'),(57,'Create','/master/user/create','/master/user/create','',3,1,0,'','','',42,0,0,1,2,'2022-07-18 16:01:33',2,'2022-07-18 17:09:10'),(58,'View','/master/user/view','/master/user/view','',3,2,0,'','','',42,0,0,1,2,'2022-07-18 16:01:36',2,'2022-07-18 17:09:01'),(59,'Create','/master/controller/create','/master/controller/create','',3,1,0,'','','',43,0,0,1,2,'2022-07-18 16:01:39',2,'2022-07-18 16:12:06'),(60,'View','/master/controller/view','/master/controller/view','',3,2,0,'','','',43,0,0,1,2,'2022-07-18 16:01:42',2,'2022-07-18 16:12:14'),(61,'Create','/master/method/create','/master/method/create','',3,1,0,'','','',44,0,0,1,2,'2022-07-18 16:01:45',2,'2022-07-18 16:12:32'),(62,'View','/master/method/view','/master/method/view','',3,2,0,'','','',44,0,0,1,2,'2022-07-18 16:01:48',2,'2022-07-18 16:12:51'),(63,'User Groups','','','',2,1,0,'','','',3,0,0,1,2,'2022-07-18 16:04:43',2,'2022-07-18 16:04:43'),(64,'Group Permissions','','','',2,2,0,'','','',3,0,0,1,2,'2022-07-18 16:04:52',2,'2022-07-18 16:04:52'),(65,'Menu Permissions','','','',2,3,0,'','','',3,0,0,1,2,'2022-07-18 16:04:59',2,'2022-07-18 16:04:59'),(66,'Create','/prefferences/user/groups/create','/prefferences/user/groups/create','',3,1,0,'','','',63,0,0,1,2,'2022-07-18 16:05:12',2,'2022-07-18 16:40:03'),(67,'View','/prefferences/user/groups/view','/prefferences/user/groups/view','',3,2,0,'','','',63,0,0,1,2,'2022-07-18 16:05:15',2,'2022-07-18 16:39:47'),(68,'Create','/prefferences/group/permissions/create','/prefferences/group/permissions/create','',3,1,0,'','','',64,0,0,1,2,'2022-07-18 16:05:20',2,'2022-07-19 07:39:34'),(69,'View','/prefferences/group/permissions/view','/prefferences/group/permissions/view','',3,2,0,'','','',64,0,0,1,2,'2022-07-18 16:05:23',2,'2022-07-19 07:39:19'),(70,'Create','/prefferences/menu/permissions/create','/prefferences/menu/permissions/create','',3,1,0,'','','',65,0,0,1,2,'2022-07-18 16:05:26',2,'2022-07-19 10:34:24'),(71,'View','/prefferences/menu/permissions/view','/prefferences/menu/permissions/view','',3,2,0,'','','',65,0,0,1,2,'2022-07-18 16:05:29',2,'2022-07-19 10:34:13'),(72,'Application Process','','','',3,1,0,'','','',7,0,0,1,2,'2022-07-18 16:06:15',2,'2022-07-18 16:06:15'),(73,'3rd Party Assessments','','','',3,2,0,'','','',7,0,0,1,2,'2022-07-18 16:06:27',2,'2022-07-18 16:07:15'),(74,'Data Classifications','','','',3,3,0,'','','',7,0,0,1,2,'2022-07-18 16:06:38',2,'2022-07-18 16:06:38'),(75,'User Access Controlls','','','',3,4,0,'','','',7,0,0,1,2,'2022-07-18 16:06:50',2,'2022-07-18 16:06:50'),(76,'Options','','','',3,5,0,'','','',7,0,0,1,2,'2022-07-18 16:06:57',2,'2022-07-18 16:06:57'),(77,'Application List','','','',4,1,0,'','','',76,0,0,1,2,'2022-07-18 16:07:42',2,'2022-07-18 16:07:42'),(78,'Vendor List','','','',4,2,0,'','','',76,0,0,1,2,'2022-07-18 16:07:47',2,'2022-07-18 16:07:47'),(79,'Memo','','','',4,3,0,'','','',76,0,0,1,2,'2022-07-18 16:07:50',2,'2022-07-18 16:07:50'),(80,'Create','','','',5,1,0,'','','',77,0,0,1,2,'2022-07-18 16:08:18',2,'2022-07-18 16:08:18'),(81,'View','','','',5,2,0,'','','',77,0,0,1,2,'2022-07-18 16:08:22',2,'2022-07-18 16:08:22'),(82,'Create','','','',5,1,0,'','','',78,0,0,1,2,'2022-07-18 16:08:25',2,'2022-07-18 16:08:25'),(83,'View','','','',5,2,0,'','','',78,0,0,1,2,'2022-07-18 16:08:29',2,'2022-07-18 16:08:29'),(84,'Create','','','',5,1,0,'','','',79,0,0,1,2,'2022-07-18 16:08:33',2,'2022-07-18 16:08:33'),(85,'View','','','',5,2,0,'','','',79,0,0,1,2,'2022-07-18 16:08:36',2,'2022-07-18 16:08:36'),(86,'Create','','','',4,1,0,'','','',72,0,0,1,2,'2022-07-18 17:28:32',2,'2022-07-18 17:28:32'),(87,'View','','','',4,2,0,'','','',72,0,0,1,2,'2022-07-18 17:28:39',2,'2022-07-18 17:28:39'),(88,'Create','','','',4,1,0,'','','',73,0,0,1,2,'2022-07-18 17:28:43',2,'2022-07-18 17:28:43'),(89,'View','','','',4,2,0,'','','',73,0,0,1,2,'2022-07-18 17:28:48',2,'2022-07-18 17:28:48'),(90,'Create','','','',4,1,0,'','','',74,0,0,1,2,'2022-07-18 17:28:51',2,'2022-07-18 17:28:51'),(91,'View','','','',4,2,0,'','','',74,0,0,1,2,'2022-07-18 17:28:56',2,'2022-07-18 17:28:56'),(92,'Create','','','',4,1,0,'','','',75,0,0,1,2,'2022-07-18 17:29:00',2,'2022-07-18 17:29:00'),(93,'View','','','',4,2,0,'','','',75,0,0,1,2,'2022-07-18 17:29:05',2,'2022-07-18 17:29:05'),(95,'Create','','','',6,1,0,'','','',19,0,0,1,2,'2022-07-25 11:29:00',2,'2022-07-25 11:29:00'),(96,'View','','','',6,2,0,'','','',19,0,0,1,2,'2022-07-25 11:29:04',2,'2022-07-25 11:29:04'),(97,'Create','','','',6,1,0,'','','',20,0,0,1,2,'2022-07-25 11:29:08',2,'2022-07-25 11:29:08'),(98,'View','','','',6,2,0,'','','',20,0,0,1,2,'2022-07-25 11:29:13',2,'2022-07-25 11:29:13'),(99,'Create','','','',6,1,0,'','','',94,0,0,1,2,'2022-07-25 11:29:16',2,'2022-07-25 11:29:16'),(100,'View','','','',6,2,0,'','','',94,0,0,1,2,'2022-07-25 11:29:21',2,'2022-07-25 11:29:21'),(101,'Create','','','',6,3,0,'','','',19,0,0,1,2,'2022-07-25 11:29:42',2,'2022-07-25 11:29:42'),(102,'View','','','',6,4,0,'','','',19,0,0,1,2,'2022-07-25 11:29:48',2,'2022-07-25 11:29:48'),(103,'Photos','','','',4,5,0,'','','',10,0,0,1,2,'2022-07-25 11:33:16',2,'2022-07-25 11:33:16'),(104,'Create','','','',5,1,0,'','','',103,0,0,1,2,'2022-07-25 11:33:29',2,'2022-07-25 11:33:29'),(105,'View','','','',5,2,0,'','','',103,0,0,1,2,'2022-07-25 11:33:34',2,'2022-07-25 11:33:34'),(106,'Messaging','','','',1,5,0,'','','',0,0,0,1,2,'2022-08-10 15:00:53',2,'2022-08-10 15:01:07'),(107,'Compose','/messaging/compose','/messaging/compose','',2,1,0,'','','',106,0,0,1,2,'2022-08-10 15:03:26',2,'2022-08-10 15:05:19'),(108,'Inbox','/messaging/inbox','/messaging/inbox','',2,2,0,'','','',106,0,0,1,2,'2022-08-10 15:03:43',2,'2022-08-10 15:10:47'),(109,'Chat','/messaging/chat','/messaging/chat','',2,3,0,'','','',106,0,0,1,3,'2022-08-22 20:26:17',3,'2022-08-22 20:26:49'),(126,'User Permissions','','','',2,4,0,'','','',3,0,0,1,3,'2022-09-16 10:39:22',3,'2022-09-16 10:39:22'),(127,'Create','/prefferences/user/permissions/create','/prefferences/user/permissions/create','',3,1,0,'','','',126,0,0,1,3,'2022-09-16 10:55:21',3,'2022-09-16 11:04:23'),(128,'View','/prefferences/user/permissions/view','/prefferences/user/permissions/view','',3,2,0,'','','',126,0,0,1,3,'2022-09-16 10:55:29',3,'2022-09-16 11:04:37'),(129,'Create','/project/code-assessment/options/application/create','/project/code-assessment/options/application/create','',5,1,0,'','','',30,0,0,1,2,'2023-01-02 16:08:03',2,'2023-01-02 16:14:56'),(130,'Create','/project/code-assessment/options/vendor/create','/project/code-assessment/options/vendor/create','',5,1,0,'','','',31,0,0,1,2,'2023-01-02 16:15:16',2,'2023-01-02 16:24:24');
/*!40000 ALTER TABLE `tbl_a_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_modules`
--

DROP TABLE IF EXISTS `tbl_a_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rank` int(2) NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_modules`
--

LOCK TABLES `tbl_a_modules` WRITE;
/*!40000 ALTER TABLE `tbl_a_modules` DISABLE KEYS */;
INSERT INTO `tbl_a_modules` VALUES (1,'Api','api','-',3,1,1,'2022-07-11 05:30:16',1,'2022-07-11 05:30:16'),(2,'Frontend','frontend','-',2,1,1,'2022-07-11 05:30:16',1,'2022-07-11 05:30:16'),(3,'Backend','backend','-',1,1,1,'2022-07-11 05:30:16',2,'2022-07-13 06:44:03');
/*!40000 ALTER TABLE `tbl_a_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_permissions`
--

DROP TABLE IF EXISTS `tbl_a_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(100) NOT NULL,
  `controller` varchar(155) NOT NULL,
  `method` varchar(255) NOT NULL DEFAULT '2',
  `description` text NOT NULL,
  `is_basic` tinyint(1) NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_permissions`
--

LOCK TABLES `tbl_a_permissions` WRITE;
/*!40000 ALTER TABLE `tbl_a_permissions` DISABLE KEYS */;
INSERT INTO `tbl_a_permissions` VALUES (1,'extraweb/login','extraweb/login','Auth','login','-',0,1,1,1,'2022-06-20 08:20:22',3,'2022-09-12 09:49:58'),(2,'validate-user','extraweb/validate-user','Authenticate','validate_user','-',1,1,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(3,'save-token','extraweb/save-token','Authenticate','save_token','-',1,1,1,1,'2022-06-20 08:20:22',3,'2022-09-15 10:09:11'),(4,'extraweb/dashboard','extraweb/dashboard','Auth','dashboard','-',1,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(5,'extraweb/ajax/get','extraweb/ajax/get/{method}','Ajax','fn_ajax_get','-',1,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(6,'extraweb/ajax/post','extraweb/ajax/post/{method}','Ajax','fn_ajax_post','-',1,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(7,'extraweb/ajax/var/{method}','extraweb/ajax/var/{method}','Ajax','fn_ajax_var','-',1,0,1,1,'2022-06-20 08:20:22',3,'2022-07-01 09:28:55'),(8,'extraweb/logs','extraweb/logs','AuthController','logs','-',0,0,1,2,'2022-08-10 09:57:47',2,'2022-08-10 09:57:47'),(9,'extraweb/logout','extraweb/logout','Auth','logout','-',1,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(10,'extraweb/profile','extraweb/profile','Auth','profile','-',0,0,1,3,'2022-07-04 01:23:51',3,'2022-09-07 13:17:44'),(11,'extraweb/profile/update','extraweb/profile/update','Auth','update_profile','',0,0,1,3,'2022-07-04 01:23:51',3,'2022-07-04 01:23:51'),(12,'extraweb/profile/get-group-permission-list','extraweb/profile/get-group-permission-list','Auth','get_group_permission_list','',0,0,1,3,'2022-07-04 01:23:51',3,'2022-07-04 01:23:51'),(13,'extraweb/profile/fnUploadPhoto','extraweb/profile/fnUploadPhoto','Auth','fnUploadPhoto','',0,0,1,3,'2022-07-04 01:23:51',3,'2022-07-04 01:23:51'),(14,'extraweb/generator/data/dummy/create','extraweb/generator/data/dummy/create','Dummy','create','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(15,'extraweb/generator/data/dummy/delete/{id}','extraweb/generator/data/dummy/delete/{id}','Dummy','delete','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(16,'extraweb/generator/data/dummy/edit/{id}','extraweb/generator/data/dummy/edit/{id}','Dummy','edit','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(17,'extraweb/generator/data/dummy/get_list','extraweb/generator/data/dummy/get_list','Dummy','get_list','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(18,'extraweb/generator/data/dummy/insert','extraweb/generator/data/dummy/insert','Dummy','insert','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(19,'extraweb/generator/data/dummy/remove/{id}','extraweb/generator/data/dummy/remove/{id}','Dummy','remove','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(20,'extraweb/generator/data/dummy/update/{id}','extraweb/generator/data/dummy/update/{id}','Dummy','update','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(21,'extraweb/generator/data/dummy/view','extraweb/generator/data/dummy/view','Dummy','view','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(22,'extraweb/generator/data/subject/create','extraweb/generator/data/subject/create','Subject','create','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(23,'extraweb/generator/data/subject/delete/{id}','extraweb/generator/data/subject/delete/{id}','Subject','delete','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(24,'extraweb/generator/data/subject/edit/{id}','extraweb/generator/data/subject/edit/{id}','Subject','edit','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(25,'extraweb/generator/data/subject/get_list','extraweb/generator/data/subject/get_list','Subject','get_list','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(26,'extraweb/generator/data/subject/insert','extraweb/generator/data/subject/insert','Subject','insert','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(27,'extraweb/generator/data/subject/remove/{id}','extraweb/generator/data/subject/remove/{id}','Subject','remove','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(28,'extraweb/generator/data/subject/update/{id}','extraweb/generator/data/subject/update/{id}','Subject','update','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(29,'extraweb/generator/data/subject/view','extraweb/generator/data/subject/view','Subject','view','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(30,'extraweb/master/group/view','extraweb/master/group/view','Group','view','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(31,'extraweb/master/group/create','extraweb/master/group/create','Group','create','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(32,'extraweb/master/group/get_list','extraweb/master/group/get_list','Group','get_list','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(33,'extraweb/master/group/edit/{id}','extraweb/master/group/edit/{id}','Group','edit','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(34,'extraweb/master/group/update/{id}','extraweb/master/group/update/{id}','Group','update','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(35,'extraweb/master/group/insert','extraweb/master/group/insert','Group','insert','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(36,'extraweb/master/group/remove/{id}','extraweb/master/group/remove/{id}','Group','remove','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(37,'extraweb/master/group/delete/{id}','extraweb/master/group/delete/{id}','Group','delete','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(38,'extraweb/master/permission/view','extraweb/master/permission/view','Permission','view','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(39,'extraweb/master/permission/create','extraweb/master/permission/create','Permission','create','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(40,'extraweb/master/permission/get_list','extraweb/master/permission/get_list','Permission','get_list','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(41,'extraweb/master/permission/edit/{id}','extraweb/master/permission/edit/{id}','Permission','edit','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(42,'extraweb/master/permission/update/{id}','extraweb/master/permission/update/{id}','Permission','update','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(43,'extraweb/master/permission/insert','extraweb/master/permission/insert','Permission','insert','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(44,'extraweb/master/permission/remove/{id}','extraweb/master/permission/remove/{id}','Permission','remove','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(45,'extraweb/master/permission/delete/{id}','extraweb/master/permission/delete/{id}','Permission','delete','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(46,'extraweb/master/module/view','extraweb/master/module/view','Module','view','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(47,'extraweb/master/module/create','extraweb/master/module/create','Module','create','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(48,'extraweb/master/module/get_list','extraweb/master/module/get_list','Module','get_list','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(49,'extraweb/master/module/edit/{id}','extraweb/master/module/edit/{id}','Module','edit','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(50,'extraweb/master/module/update/{id}','extraweb/master/module/update/{id}','Module','update','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(51,'extraweb/master/module/insert','extraweb/master/module/insert','Module','insert','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(52,'extraweb/master/module/remove/{id}','extraweb/master/module/remove/{id}','Module','remove','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(53,'extraweb/master/module/delete/{id}','extraweb/master/module/delete/{id}','Module','delete','-',0,0,1,1,'2022-06-20 08:20:22',1,'2022-06-20 08:20:22'),(54,'extraweb/master/menu/create','extraweb/master/menu/create','Menu','create','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(55,'extraweb/master/menu/delete/{id}','extraweb/master/menu/delete/{id}','Menu','delete','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(56,'extraweb/master/menu/edit/{id}','extraweb/master/menu/edit/{id}','Menu','edit','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(57,'extraweb/master/menu/get_list','extraweb/master/menu/get_list','Menu','get_list','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(58,'extraweb/master/menu/insert','extraweb/master/menu/insert','Menu','insert','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(59,'extraweb/master/menu/remove/{id}','extraweb/master/menu/remove/{id}','Menu','remove','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(60,'extraweb/master/menu/update/{id}','extraweb/master/menu/update/{id}','Menu','update','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(61,'extraweb/master/menu/view','extraweb/master/menu/view','Menu','view','-',0,0,1,2,'2022-07-13 11:10:38',2,'2022-07-13 11:10:38'),(62,'extraweb/master/user/create','extraweb/master/user/create','User','create','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(63,'extraweb/master/user/delete/{id}','extraweb/master/user/delete/{id}','User','delete','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(64,'extraweb/master/user/edit/{id}','extraweb/master/user/edit/{id}','User','edit','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(65,'extraweb/master/user/get_list','extraweb/master/user/get_list','User','get_list','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(66,'extraweb/master/user/insert','extraweb/master/user/insert','User','insert','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(67,'extraweb/master/user/remove/{id}','extraweb/master/user/remove/{id}','User','remove','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(68,'extraweb/master/user/update/{id}','extraweb/master/user/update/{id}','User','update','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(69,'extraweb/master/user/view','extraweb/master/user/view','User','view','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(70,'extraweb/master/method/create','extraweb/master/method/create','Method','create','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(71,'extraweb/master/method/delete/{id}','extraweb/master/method/delete/{id}','Method','delete','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(72,'extraweb/master/method/edit/{id}','extraweb/master/method/edit/{id}','Method','edit','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(73,'extraweb/master/method/get_list','extraweb/master/method/get_list','Method','get_list','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(74,'extraweb/master/method/insert','extraweb/master/method/insert','Method','insert','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(75,'extraweb/master/method/remove/{id}','extraweb/master/method/remove/{id}','Method','remove','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(76,'extraweb/master/method/update/{id}','extraweb/master/method/update/{id}','Method','update','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(77,'extraweb/master/method/view','extraweb/master/method/view','Method','view','-',0,0,1,2,'2022-07-15 15:15:52',2,'2022-07-15 15:15:52'),(78,'extraweb/master/controller/create','extraweb/master/controller/create','Contr','create','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(79,'extraweb/master/controller/delete/{id}','extraweb/master/controller/delete/{id}','Contr','delete','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(80,'extraweb/master/controller/edit/{id}','extraweb/master/controller/edit/{id}','Contr','edit','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(81,'extraweb/master/controller/get_list','extraweb/master/controller/get_list','Contr','get_list','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(82,'extraweb/master/controller/insert','extraweb/master/controller/insert','Contr','insert','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(83,'extraweb/master/controller/remove/{id}','extraweb/master/controller/remove/{id}','Contr','remove','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(84,'extraweb/master/controller/update/{id}','extraweb/master/controller/update/{id}','Contr','update','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(85,'extraweb/master/controller/view','extraweb/master/controller/view','Contr','view','-',0,0,1,2,'2022-07-18 16:24:10',2,'2022-07-18 16:24:10'),(86,'extraweb/prefferences/user/groups/view','extraweb/prefferences/user/groups/view','UserGroup','view','-',0,0,1,2,'2022-07-18 11:46:21',2,'2022-07-18 11:53:46'),(87,'extraweb/prefferences/user/groups/get_list','extraweb/prefferences/user/groups/get_list','UserGroup','get_list','-',0,0,1,2,'2022-07-18 12:41:59',2,'2022-07-18 12:41:59'),(88,'extraweb/prefferences/user/groups/create','extraweb/prefferences/user/groups/create','UserGroup','create','-',0,0,1,2,'2022-07-18 20:31:43',2,'2022-07-18 20:31:43'),(89,'extraweb/prefferences/user/groups/delete/{id}','extraweb/prefferences/user/groups/delete/{id}','UserGroup','delete','-',0,0,1,2,'2022-07-18 20:31:43',2,'2022-07-18 20:31:43'),(90,'extraweb/prefferences/user/groups/edit/{id}','extraweb/prefferences/user/groups/edit/{id}','UserGroup','edit','-',0,0,1,2,'2022-07-18 20:31:43',2,'2022-07-18 20:31:43'),(91,'extraweb/prefferences/user/groups/insert','extraweb/prefferences/user/groups/insert','UserGroup','insert','-',0,0,1,2,'2022-07-18 20:31:43',2,'2022-07-18 20:31:43'),(92,'extraweb/prefferences/user/groups/remove/{id}','extraweb/prefferences/user/groups/remove/{id}','UserGroup','remove','-',0,0,1,2,'2022-07-18 20:31:43',2,'2022-07-18 20:31:43'),(93,'extraweb/prefferences/user/groups/update/{id}','extraweb/prefferences/user/groups/update/{id}','UserGroup','update','-',0,0,1,2,'2022-07-18 20:31:43',2,'2022-07-18 20:31:43'),(94,'extraweb/prefferences/group/permissions/create','extraweb/prefferences/group/permissions/create','GroupPermission','create','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 07:36:28'),(95,'extraweb/prefferences/group/permissions/delete/{id}','extraweb/prefferences/group/permissions/delete/{id}','GroupPermission','delete','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 07:36:28'),(96,'extraweb/prefferences/group/permissions/edit/{id}','extraweb/prefferences/group/permissions/edit/{id}','GroupPermission','edit','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 10:24:01'),(97,'extraweb/prefferences/group/permissions/get_list','extraweb/prefferences/group/permissions/get_list','GroupPermission','get_list','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 07:36:28'),(98,'extraweb/prefferences/group/permissions/insert','extraweb/prefferences/group/permissions/insert','GroupPermission','insert','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 07:36:28'),(99,'extraweb/prefferences/group/permissions/remove/{id}','extraweb/prefferences/group/permissions/remove/{id}','GroupPermission','remove','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 07:36:28'),(100,'extraweb/prefferences/group/permissions/update/{id}','extraweb/prefferences/group/permissions/update/{id}','GroupPermission','update','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 07:36:28'),(101,'extraweb/prefferences/group/permissions/view','extraweb/prefferences/group/permissions/view','GroupPermission','view','-',0,0,1,2,'2022-07-19 07:36:28',2,'2022-07-19 07:36:28'),(102,'extraweb/prefferences/menu/permissions/create','extraweb/prefferences/menu/permissions/create','MenuPermission','create','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:42:56'),(103,'extraweb/prefferences/menu/permissions/delete/{id}','extraweb/prefferences/menu/permissions/delete/{id}','MenuPermission','delete','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:43:36'),(104,'extraweb/prefferences/menu/permissions/edit/{id}','extraweb/prefferences/menu/permissions/edit/{id}','MenuPermission','edit','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:40:54'),(105,'extraweb/prefferences/menu/permissions/get_list','extraweb/prefferences/menu/permissions/get_list','MenuPermission','get_list','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:42:14'),(106,'extraweb/prefferences/menu/permissions/insert','extraweb/prefferences/menu/permissions/insert','MenuPermission','insert','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:42:35'),(107,'extraweb/prefferences/menu/permissions/remove/{id}','extraweb/prefferences/menu/permissions/remove/{id}','MenuPermission','remove','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:40:36'),(108,'extraweb/prefferences/menu/permissions/update/{id}','extraweb/prefferences/menu/permissions/update/{id}','MenuPermission','update','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:40:27'),(109,'extraweb/prefferences/menu/permissions/view','extraweb/prefferences/menu/permissions/view','MenuPermission','view','-',0,0,1,2,'2022-07-19 10:37:06',2,'2022-07-19 10:39:53'),(110,'extraweb/prefferences/user/permissions/create','extraweb/prefferences/user/permissions/create','UserPermissions','create','-',0,0,1,3,'2022-09-16 11:14:17',3,'2022-09-16 11:14:17'),(111,'extraweb/prefferences/user/permissions/delete/{id}','extraweb/prefferences/user/permissions/delete/{id}','UserPermissions','delete','-',0,0,1,3,'2022-09-16 11:14:17',3,'2022-09-16 11:14:17'),(112,'extraweb/prefferences/user/permissions/edit/{id}','extraweb/prefferences/user/permissions/edit/{id}','UserPermissions','edit','-',0,0,1,3,'2022-09-16 11:14:17',3,'2022-09-16 11:14:17'),(113,'extraweb/prefferences/user/permissions/get_list','extraweb/prefferences/user/permissions/get_list','UserPermissions','get_list','-',0,0,1,3,'2022-09-16 11:14:17',3,'2022-09-16 11:14:17'),(114,'extraweb/prefferences/user/permissions/insert','extraweb/prefferences/user/permissions/insert','UserPermissions','insert','-',0,0,1,3,'2022-09-16 11:14:17',3,'2022-09-16 11:14:17'),(115,'extraweb/prefferences/user/permissions/update/{id}','extraweb/prefferences/user/permissions/update/{id}','UserPermissions','update','-',0,0,1,3,'2022-09-16 11:14:17',3,'2022-09-16 11:14:17'),(116,'extraweb/prefferences/user/permissions/view','extraweb/prefferences/user/permissions/view','UserPermissions','view','-',0,0,1,3,'2022-09-16 11:14:17',3,'2022-09-16 11:14:17'),(117,'extraweb/project/type/create','extraweb/project/type/create','Type','create','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(118,'extraweb/project/type/delete/{id}','extraweb/project/type/delete/{id}','Type','delete','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(119,'extraweb/project/type/edit/{id}','extraweb/project/type/edit/{id}','Type','edit','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(120,'extraweb/project/type/get_list','extraweb/project/type/get_list','Type','get_list','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(121,'extraweb/project/type/insert','extraweb/project/type/insert','Type','insert','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(122,'extraweb/project/type/remove/{id}','extraweb/project/type/remove/{id}','Type','remove','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(123,'extraweb/project/type/update/{id}','extraweb/project/type/update/{id}','Type','update','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(124,'extraweb/project/type/view','extraweb/project/type/view','Type','view','-',0,0,1,2,'2022-07-19 16:25:50',2,'2022-07-19 16:25:50'),(125,'extraweb/project/team/create','extraweb/project/team/create','Team','create','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(126,'extraweb/project/team/delete/{id}','extraweb/project/team/delete/{id}','Team','delete','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(127,'extraweb/project/team/edit/{id}','extraweb/project/team/edit/{id}','Team','edit','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(128,'extraweb/project/team/get_list','extraweb/project/team/get_list','Team','get_list','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(129,'extraweb/project/team/insert','extraweb/project/team/insert','Team','insert','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(130,'extraweb/project/team/remove/{id}','extraweb/project/team/remove/{id}','Team','remove','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(131,'extraweb/project/team/update/{id}','extraweb/project/team/update/{id}','Team','update','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(132,'extraweb/project/team/view','extraweb/project/team/view','Team','view','-',0,0,1,2,'2022-07-19 16:27:02',2,'2022-07-19 16:27:02'),(133,'extraweb/project/requirement/create','extraweb/project/requirement/create','Requirement','create','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(134,'extraweb/project/requirement/delete/{id}','extraweb/project/requirement/delete/{id}','Requirement','delete','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(135,'extraweb/project/requirement/edit/{id}','extraweb/project/requirement/edit/{id}','Requirement','edit','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(136,'extraweb/project/requirement/get_list','extraweb/project/requirement/get_list','Requirement','get_list','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(137,'extraweb/project/requirement/insert','extraweb/project/requirement/insert','Requirement','insert','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(138,'extraweb/project/requirement/remove/{id}','extraweb/project/requirement/remove/{id}','Requirement','remove','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(139,'extraweb/project/requirement/update/{id}','extraweb/project/requirement/update/{id}','Requirement','update','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(140,'extraweb/project/requirement/view','extraweb/project/requirement/view','Requirement','view','-',0,0,1,2,'2022-07-19 16:28:12',2,'2022-07-19 16:28:12'),(141,'extraweb/project/team/user/create/{team_id}','extraweb/project/team/user/create/{team_id}','User','create','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 09:04:11'),(142,'extraweb/project/team/user/delete/{id}','extraweb/project/team/user/delete/{id}','User','delete','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 08:37:39'),(143,'extraweb/project/team/user/edit/{id}','extraweb/project/team/user/edit/{id}','User','edit','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 08:37:39'),(144,'extraweb/project/team/user/get_list','extraweb/project/team/user/get_list','User','get_list','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 08:37:39'),(145,'extraweb/project/team/user/insert/{team_id}','extraweb/project/team/user/insert/{team_id}','User','insert','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 09:05:45'),(146,'extraweb/project/team/user/remove/{id}','extraweb/project/team/user/remove/{id}','User','remove','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 08:37:39'),(147,'extraweb/project/team/user/update/{id}','extraweb/project/team/user/update/{id}','User','update','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 08:37:39'),(148,'extraweb/project/team/user/view/{team_id}','extraweb/project/team/user/view/{team_id}','User','view','',0,0,1,2,'2022-07-20 08:37:39',2,'2022-07-20 08:38:21'),(149,'extraweb/project/documents/create','extraweb/project/documents/create','Document','create','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:37:31'),(150,'extraweb/project/documents/delete/{id}','extraweb/project/documents/delete/{id}','Document','delete','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:38:03'),(151,'extraweb/project/documents/edit/{id}','extraweb/project/documents/edit/{id}','Document','edit','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:38:16'),(152,'extraweb/project/documents/get_list','extraweb/project/documents/get_list','Document','get_list','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:38:29'),(153,'extraweb/project/documents/insert','extraweb/project/documents/insert','Document','insert','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:38:51'),(154,'extraweb/project/documents/remove/{id}','extraweb/project/documents/remove/{id}','Document','remove','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:39:03'),(155,'extraweb/project/documents/update/{id}','extraweb/project/documents/update/{id}','Document','update','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:39:16'),(156,'extraweb/project/documents/view','extraweb/project/documents/view','Document','view','-',0,0,1,2,'2022-07-25 11:36:38',2,'2022-07-25 11:39:27'),(157,'extraweb/project/create','extraweb/project/create','Project_main','create','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:36:48'),(158,'extraweb/project/delete/{id}','extraweb/project/delete/{id}','Project_main','delete','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:37:00'),(159,'extraweb/project/edit/{id}','extraweb/project/edit/{id}','Project_main','edit','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:37:12'),(160,'extraweb/project/get_list','extraweb/project/get_list','Project_main','get_list','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:37:43'),(161,'extraweb/project/insert','extraweb/project/insert','Project_main','insert','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:37:23'),(162,'extraweb/project/remove/{id}','extraweb/project/remove/{id}','Project_main','remove','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:37:54'),(163,'extraweb/project/update/{id}','extraweb/project/update/{id}','Project_main','update','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:38:22'),(164,'extraweb/project/view','extraweb/project/view','Project_main','view','-',0,0,1,2,'2022-07-25 13:32:59',2,'2022-07-25 13:38:04'),(165,'extraweb/project/detail/{id}','extraweb/project/detail/{id}','Project_main','detail','-',0,0,1,2,'2022-07-26 11:26:05',2,'2022-07-26 11:26:05'),(166,'extraweb/project/timeline/{id}','extraweb/project/timeline/{id}','Project_main','timeline','-',0,0,1,2,'2022-07-26 14:41:39',2,'2022-07-26 14:41:39'),(167,'extraweb/project/team_user/{id}','extraweb/project/team_user/{id}','Project_main','team_user','-',0,0,1,2,'2022-07-28 08:05:16',2,'2022-07-28 08:05:16'),(168,'extraweb/messaging/compose','extraweb/messaging/compose','MailController','compose','-',0,0,1,2,'2022-08-11 11:12:04',2,'2022-08-11 11:12:04'),(169,'extraweb/messaging/inbox','extraweb/messaging/inbox','MailController','inbox','-',0,0,1,2,'2022-08-11 11:12:04',2,'2022-08-11 11:12:04'),(170,'extraweb/messaging/chat','extraweb/messaging/chat','MailController','chat','-',0,0,1,2,'2022-08-11 11:14:21',2,'2022-08-11 11:14:21'),(171,'extraweb/messaging/inbox/get_list','extraweb/messaging/inbox/get_list','MailController','get_list','-',0,0,1,2,'2022-08-11 11:12:04',2,'2022-08-11 11:12:04'),(172,'extraweb/messaging/sent','extraweb/messaging/sent','MailController','sent','-',0,0,1,2,'2022-08-11 11:12:04',2,'2022-08-11 11:12:04'),(173,'extraweb/messaging/draft','extraweb/messaging/draft','MailController','draft','-',0,0,1,2,'2022-08-11 11:12:04',2,'2022-08-11 11:12:04'),(174,'extraweb/messaging/junk','extraweb/messaging/junk','MailController','junk','-',0,0,1,2,'2022-08-11 11:12:04',2,'2022-08-11 11:12:04'),(175,'extraweb/messaging/trash','extraweb/messaging/trash','MailController','trash','-',0,0,1,2,'2022-08-11 11:12:04',2,'2022-08-11 11:12:04'),(176,'extraweb/project/code-assessment/sat-scan/create','extraweb/project/code-assessment/sat-scan/create','SatController','create','',0,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:54:40'),(177,'extraweb/project/code-assessment/sat-scan/delete/{id}','extraweb/project/code-assessment/sat-scan/delete/{id}','SatController','delete','',0,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:54:48'),(178,'extraweb/project/code-assessment/sat-scan/edit/{id}','extraweb/project/code-assessment/sat-scan/edit/{id}','SatController','edit','',0,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:54:58'),(179,'extraweb/project/code-assessment/sat-scan/get_list','extraweb/project/code-assessment/sat-scan/get_list','SatController','get_list','',0,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:55:13'),(180,'extraweb/project/code-assessment/sat-scan/insert','extraweb/project/code-assessment/sat-scan/insert','SatController','insert','',0,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:55:21'),(181,'extraweb/project/code-assessment/sat-scan/update/{id}','extraweb/project/code-assessment/sat-scan/update/{id}','SatController','update','',0,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:55:31'),(182,'extraweb/project/code-assessment/sat-scan/view','extraweb/project/code-assessment/sat-scan/view','SatController','view','',0,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:55:40'),(183,'extraweb/project/code-assessment/pentest/create','extraweb/project/code-assessment/pentest/create','PentestController','create','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(184,'extraweb/project/code-assessment/pentest/delete/{id}','extraweb/project/code-assessment/pentest/delete/{id}','PentestController','delete','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(185,'extraweb/project/code-assessment/pentest/edit/{id}','extraweb/project/code-assessment/pentest/edit/{id}','PentestController','edit','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(186,'extraweb/project/code-assessment/pentest/get_list','extraweb/project/code-assessment/pentest/get_list','PentestController','get_list','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(187,'extraweb/project/code-assessment/pentest/insert','extraweb/project/code-assessment/pentest/insert','PentestController','insert','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(188,'extraweb/project/code-assessment/pentest/remove/{id}','extraweb/project/code-assessment/pentest/remove/{id}','PentestController','remove','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(189,'extraweb/project/code-assessment/pentest/update/{id}','extraweb/project/code-assessment/pentest/update/{id}','PentestController','update','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(190,'extraweb/project/code-assessment/pentest/view','extraweb/project/code-assessment/pentest/view','PentestController','view','',1,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(191,'extraweb/project/code-assessment/options/application/create','extraweb/project/code-assessment/options/application/create','ApplicationController','create','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(192,'extraweb/project/code-assessment/options/application/delete/{id}','extraweb/project/code-assessment/options/application/delete/{id}','ApplicationController','delete','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(193,'extraweb/project/code-assessment/options/application/edit/{id}','extraweb/project/code-assessment/options/application/edit/{id}','ApplicationController','edit','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(194,'extraweb/project/code-assessment/options/application/get_list','extraweb/project/code-assessment/options/application/get_list','ApplicationController','get_list','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(195,'extraweb/project/code-assessment/options/application/insert','extraweb/project/code-assessment/options/application/insert','ApplicationController','insert','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(196,'extraweb/project/code-assessment/options/application/remove/{id}','extraweb/project/code-assessment/options/application/remove/{id}','ApplicationController','remove','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(197,'extraweb/project/code-assessment/options/application/update/{id}','extraweb/project/code-assessment/options/application/update/{id}','ApplicationController','update','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(198,'extraweb/project/code-assessment/options/application/view','extraweb/project/code-assessment/options/application/view','ApplicationController','view','',1,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(199,'extraweb/project/code-assessment/options/vendor/create','extraweb/project/code-assessment/options/vendor/create','VendorController','create','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(200,'extraweb/project/code-assessment/options/vendor/delete/{id}','extraweb/project/code-assessment/options/vendor/delete/{id}','VendorController','delete','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(201,'extraweb/project/code-assessment/options/vendor/edit/{id}','extraweb/project/code-assessment/options/vendor/edit/{id}','VendorController','edit','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(202,'extraweb/project/code-assessment/options/vendor/get_list','extraweb/project/code-assessment/options/vendor/get_list','VendorController','get_list','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(203,'extraweb/project/code-assessment/options/vendor/insert','extraweb/project/code-assessment/options/vendor/insert','VendorController','insert','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(204,'extraweb/project/code-assessment/options/vendor/remove/{id}','extraweb/project/code-assessment/options/vendor/remove/{id}','VendorController','remove','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(205,'extraweb/project/code-assessment/options/vendor/update/{id}','extraweb/project/code-assessment/options/vendor/update/{id}','VendorController','update','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(206,'extraweb/project/code-assessment/options/vendor/view','extraweb/project/code-assessment/options/vendor/view','VendorController','view','',1,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(207,'extraweb/project/code-assessment/options/memo/create','extraweb/project/code-assessment/options/memo/create','MemoController','create','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(208,'extraweb/project/code-assessment/options/memo/delete/{id}','extraweb/project/code-assessment/options/memo/delete/{id}','MemoController','delete','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(209,'extraweb/project/code-assessment/options/memo/edit/{id}','extraweb/project/code-assessment/options/memo/edit/{id}','MemoController','edit','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(210,'extraweb/project/code-assessment/options/memo/get_list','extraweb/project/code-assessment/options/memo/get_list','MemoController','get_list','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(211,'extraweb/project/code-assessment/options/memo/insert','extraweb/project/code-assessment/options/memo/insert','MemoController','insert','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(212,'extraweb/project/code-assessment/options/memo/remove/{id}','extraweb/project/code-assessment/options/memo/remove/{id}','MemoController','remove','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(213,'extraweb/project/code-assessment/options/memo/update/{id}','extraweb/project/code-assessment/options/memo/update/{id}','MemoController','update','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(214,'extraweb/project/code-assessment/options/memo/view','extraweb/project/code-assessment/options/memo/view','MemoController','view','',1,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56');
/*!40000 ALTER TABLE `tbl_a_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_user_profiles`
--

DROP TABLE IF EXISTS `tbl_a_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_user_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address` text NOT NULL,
  `lat` varchar(155) NOT NULL,
  `lng` varchar(155) NOT NULL,
  `zoom` int(10) unsigned NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `last_education` varchar(255) NOT NULL,
  `last_education_institution` varchar(255) NOT NULL,
  `skill` text NOT NULL,
  `notes` text NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_user_profiles`
--

LOCK TABLES `tbl_a_user_profiles` WRITE;
/*!40000 ALTER TABLE `tbl_a_user_profiles` DISABLE KEYS */;
INSERT INTO `tbl_a_user_profiles` VALUES (1,'address','234113211','312312321',4,'fb','tw','in','ln','-','S1','Unpak','<p>skill<br></p>','<p>notes<br></p>','-',1,2,'2022-10-11 07:24:19',2,'2022-10-11 07:24:19'),(2,'address','234113211','312312321',4,'fb','tw','in','ln','-','S1','Unpak','<p>skill<br></p>','<p>notes<br></p>','-',1,2,'2022-10-11 07:25:22',2,'2022-10-11 07:25:22'),(3,'address','234113211','312312321',4,'fb','tw','in','ln','-','S1','Unpak','skill','notes','-',1,2,'2022-10-11 12:42:22',2,'2022-10-11 12:42:22'),(4,'address','234113211','312312321',4,'fb','tw','in','ln','-','S1','Unpak','skill','notes','-',1,2,'2022-10-11 12:44:05',2,'2022-10-11 12:44:05'),(5,'address','234113211','312312321',4,'fb','tw','in','ln','-','S1','Unpak','skill','notes','-',1,2,'2022-10-11 12:47:14',2,'2022-10-11 12:47:14');
/*!40000 ALTER TABLE `tbl_a_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_user_registered_types`
--

DROP TABLE IF EXISTS `tbl_a_user_registered_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_user_registered_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_user_registered_types`
--

LOCK TABLES `tbl_a_user_registered_types` WRITE;
/*!40000 ALTER TABLE `tbl_a_user_registered_types` DISABLE KEYS */;
INSERT INTO `tbl_a_user_registered_types` VALUES (1,'offline','-',1,1,'2022-06-20 08:25:39',1,'2022-06-20 08:25:39'),(2,'online-register','-',1,1,'2022-06-20 08:25:39',1,'2022-06-20 08:25:39'),(3,'online-social-media','-',1,1,'2022-06-20 08:25:39',1,'2022-06-20 08:25:39');
/*!40000 ALTER TABLE `tbl_a_user_registered_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_user_tokens`
--

DROP TABLE IF EXISTS `tbl_a_user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_user_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` text NOT NULL,
  `expiry` datetime NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `is_logged_in` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_expiry` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_user_tokens`
--

LOCK TABLES `tbl_a_user_tokens` WRITE;
/*!40000 ALTER TABLE `tbl_a_user_tokens` DISABLE KEYS */;
INSERT INTO `tbl_a_user_tokens` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJncm91cF9pZCI6MiwiZ3JvdXBfcGFyZW50X2lkIjowLCJ1c2VyX25hbWUiOiJzdXBlcnVzZXIiLCJ1c2VyX2VtYWlsIjoic3VwZXIudXNlckBtYWlsLmNvbSIsImNyZWF0ZV9kYXRlIjoxNjcyNzM3NDI4LCJleHBpcmVkX2RhdGUiOjE2NzI3OTg2Mjh9.eDPm_VMaW7U0qWdyRGaOFa43qVlTZrfXw8xMrXgjecs','2023-01-04 02:17:08',2,1,0,1,2,'2023-01-03 09:17:08',2,'2023-01-03 09:17:08'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2LCJncm91cF9pZCI6NiwiZ3JvdXBfcGFyZW50X2lkIjozLCJ1c2VyX25hbWUiOiJTZXB0eWFuIiwidXNlcl9lbWFpbCI6InNlcHR5YW4uYXphbnlAYm5pLmNvLmlkIiwiY3JlYXRlX2RhdGUiOjE2NjU0OTMzMTYsImV4cGlyZWRfZGF0ZSI6MTY2NTU1NDUxNn0.3o2W5q0vl3ldxR3aQj5Mi7WcFuUrzuFAjDquF4-oWtE','2022-10-12 06:01:56',6,1,0,1,6,'2022-10-11 13:01:56',6,'2022-10-11 13:01:56');
/*!40000 ALTER TABLE `tbl_a_user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_a_users`
--

DROP TABLE IF EXISTS `tbl_a_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_a_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(155) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `description` text NOT NULL,
  `score` int(16) NOT NULL DEFAULT 0,
  `profile_id` int(32) NOT NULL DEFAULT 0,
  `registered_type_id` int(10) unsigned NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_a_users`
--

LOCK TABLES `tbl_a_users` WRITE;
/*!40000 ALTER TABLE `tbl_a_users` DISABLE KEYS */;
INSERT INTO `tbl_a_users` VALUES (1,'systemweb','system','web','system.web@mail.com','IntcInR5cFwiOlwiSldUXCIsXCJhbGdcIjpcIkhTMjU2XCJ9Ig.IntcInZhbHVlXCI6XCJNelE9JmFtcDtNVEk9JmFtcDtRV0k9XCJ9Ig.HoyFPYcljQjB5zBTw5njM1a0u61EunQuft27DWThw90','-','-',0,0,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(2,'superuser','super','user','super.user@mail.com','IntcInR5cFwiOlwiSldUXCIsXCJhbGdcIjpcIkhTMjU2XCJ9Ig.IntcInZhbHVlXCI6XCJNelE9JmFtcDtNVEk9JmFtcDtRV0k9XCJ9Ig.HoyFPYcljQjB5zBTw5njM1a0u61EunQuft27DWThw90','-','-',0,0,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(3,'administrator-isu','admin','isu','admin.isu@bni.co.id','IntcInR5cFwiOlwiSldUXCIsXCJhbGdcIjpcIkhTMjU2XCJ9Ig.IntcInZhbHVlXCI6XCJNelE9JmFtcDtNVEk9JmFtcDtRV0k9XCJ9Ig.HoyFPYcljQjB5zBTw5njM1a0u61EunQuft27DWThw90','-','-',0,0,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12');
/*!40000 ALTER TABLE `tbl_a_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_group_permissions`
--

DROP TABLE IF EXISTS `tbl_b_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_group_permissions` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `group_id` int(32) NOT NULL,
  `permission_id` int(32) NOT NULL,
  `module_id` int(32) NOT NULL,
  `is_allowed` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_group_permissions`
--

LOCK TABLES `tbl_b_group_permissions` WRITE;
/*!40000 ALTER TABLE `tbl_b_group_permissions` DISABLE KEYS */;
INSERT INTO `tbl_b_group_permissions` VALUES (1,1,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(2,1,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(3,1,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(4,1,4,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(5,1,5,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(6,1,6,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(7,1,7,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(8,1,8,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(9,1,9,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(10,1,10,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(11,1,11,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(12,1,12,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(13,1,13,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(14,1,14,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(15,1,15,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(16,1,16,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(17,1,17,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(18,1,18,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(19,1,19,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(20,1,20,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(21,1,21,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(22,1,22,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(23,1,23,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(24,1,24,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(25,1,25,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(26,1,26,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(27,1,27,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(28,1,28,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(29,1,29,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(30,1,30,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(31,1,31,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(32,1,32,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(33,1,33,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(34,1,34,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(35,1,35,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(36,1,36,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(37,1,37,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(38,1,38,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(39,1,39,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(40,1,40,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(41,1,41,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(42,1,42,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(43,1,43,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(44,1,44,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(45,1,45,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(46,1,46,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(47,1,47,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(48,1,48,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(49,1,49,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(50,1,50,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(51,1,51,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(52,1,52,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(53,1,53,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(54,1,54,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(55,1,55,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(56,1,56,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(57,1,57,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(58,1,58,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(59,1,59,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(60,1,60,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(61,1,61,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(62,1,62,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(63,1,63,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(64,1,64,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(65,1,65,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(66,1,66,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(67,1,67,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(68,1,68,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(69,1,69,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(70,1,70,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(71,1,71,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(72,1,72,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(73,1,73,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(74,1,74,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(75,1,75,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(76,1,76,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(77,1,77,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(78,1,78,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(79,1,79,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(80,1,80,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(81,1,81,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(82,1,82,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(83,1,83,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(84,1,84,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(85,1,85,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(86,1,86,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(87,1,87,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(88,1,88,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(89,1,89,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(90,1,90,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(91,1,91,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(92,1,92,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(93,1,93,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(94,1,94,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(95,1,95,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(96,1,96,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(97,1,97,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(98,1,98,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(99,1,99,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(100,1,100,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(101,1,101,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(102,1,102,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(103,1,103,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(104,1,104,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(105,1,105,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(106,1,106,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(107,1,107,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(108,1,108,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(109,1,109,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(110,1,110,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(111,1,111,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(112,1,112,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(113,1,113,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(114,1,114,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(115,1,115,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(116,1,116,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(117,1,117,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(118,1,118,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(119,1,119,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(120,1,120,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(121,1,121,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(122,1,122,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(123,1,123,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(124,1,124,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(125,1,125,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(126,1,126,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(127,1,127,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(128,1,128,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(129,1,129,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(130,1,130,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(131,1,131,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(132,1,132,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(133,1,133,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(134,1,134,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(135,1,135,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(136,1,136,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(137,1,137,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(138,1,138,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(139,1,139,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(140,1,140,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(141,1,141,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(142,1,142,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(143,1,143,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(144,1,144,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(145,1,145,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(146,1,146,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(147,1,147,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(148,1,148,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(149,1,149,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(150,1,150,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(151,1,151,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(152,1,152,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(153,1,153,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(154,1,154,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(155,1,155,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(156,1,156,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(157,1,157,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(158,1,158,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(159,1,159,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(160,1,160,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(161,1,161,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(162,1,162,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(163,1,163,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(164,1,164,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(165,1,165,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(166,1,166,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(167,1,167,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(168,1,168,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(169,1,169,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(170,1,170,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(171,1,171,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(172,1,172,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(173,1,173,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(174,1,174,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(175,1,175,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(176,2,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(177,2,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(178,2,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(179,2,4,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(180,2,5,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(181,2,6,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(182,2,7,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(183,2,8,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(184,2,9,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(185,2,10,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(186,2,11,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(187,2,12,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(188,2,13,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(189,2,14,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(190,2,15,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(191,2,16,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(192,2,17,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(193,2,18,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(194,2,19,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(195,2,20,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(196,2,21,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(197,2,22,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(198,2,23,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(199,2,24,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(200,2,25,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(201,2,26,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(202,2,27,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(203,2,28,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(204,2,29,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(205,2,30,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(206,2,31,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(207,2,32,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(208,2,33,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(209,2,34,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(210,2,35,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(211,2,36,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(212,2,37,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(213,2,38,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(214,2,39,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(215,2,40,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(216,2,41,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(217,2,42,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(218,2,43,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(219,2,44,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(220,2,45,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(221,2,46,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(222,2,47,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(223,2,48,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(224,2,49,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(225,2,50,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(226,2,51,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(227,2,52,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(228,2,53,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(229,2,54,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(230,2,55,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(231,2,56,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(232,2,57,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(233,2,58,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(234,2,59,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(235,2,60,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(236,2,61,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(237,2,62,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(238,2,63,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(239,2,64,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(240,2,65,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(241,2,66,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(242,2,67,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(243,2,68,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(244,2,69,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(245,2,70,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(246,2,71,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(247,2,72,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(248,2,73,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(249,2,74,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(250,2,75,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(251,2,76,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(252,2,77,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(253,2,78,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(254,2,79,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(255,2,80,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(256,2,81,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(257,2,82,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(258,2,83,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(259,2,84,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(260,2,85,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(261,2,86,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(262,2,87,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(263,2,88,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(264,2,89,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(265,2,90,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(266,2,91,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(267,2,92,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(268,2,93,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(269,2,94,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(270,2,95,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(271,2,96,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(272,2,97,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(273,2,98,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(274,2,99,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(275,2,100,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(276,2,101,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(277,2,102,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(278,2,103,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(279,2,104,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(280,2,105,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(281,2,106,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(282,2,107,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(283,2,108,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(284,2,109,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(285,2,110,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(286,2,111,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(287,2,112,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(288,2,113,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(289,2,114,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(290,2,115,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(291,2,116,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(292,2,117,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(293,2,118,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(294,2,119,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(295,2,120,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(296,2,121,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(297,2,122,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(298,2,123,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(299,2,124,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(300,2,125,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(301,2,126,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(302,2,127,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(303,2,128,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(304,2,129,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(305,2,130,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(306,2,131,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(307,2,132,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(308,2,133,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(309,2,134,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(310,2,135,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(311,2,136,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(312,2,137,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(313,2,138,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(314,2,139,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(315,2,140,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(316,2,141,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(317,2,142,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(318,2,143,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(319,2,144,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(320,2,145,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(321,2,146,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(322,2,147,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(323,2,148,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(324,2,149,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(325,2,150,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(326,2,151,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(327,2,152,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(328,2,153,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(329,2,154,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(330,2,155,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(331,2,156,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(332,2,157,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(333,2,158,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(334,2,159,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(335,2,160,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(336,2,161,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(337,2,162,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(338,2,163,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(339,2,164,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(340,2,165,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(341,2,166,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(342,2,167,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(343,2,168,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(344,2,169,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(345,2,170,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(346,2,171,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(347,2,172,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(348,2,173,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(349,2,174,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(350,2,175,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(351,3,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(352,3,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(353,3,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(354,3,4,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(355,3,5,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(356,3,6,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(357,3,7,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(358,3,8,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(359,3,9,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(360,3,10,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(361,3,11,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(362,3,12,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(363,3,13,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(364,3,14,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(365,3,15,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(366,3,16,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(367,3,17,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(368,3,18,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(369,3,19,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(370,3,20,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(371,3,21,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(372,3,22,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(373,3,23,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(374,3,24,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(375,3,25,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(376,3,26,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(377,3,27,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(378,3,28,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(379,3,29,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(380,3,30,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(381,3,31,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(382,3,32,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(383,3,33,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(384,3,34,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(385,3,35,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(386,3,36,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(387,3,37,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(388,3,38,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(389,3,39,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(390,3,40,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(391,3,41,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(392,3,42,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(393,3,43,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(394,3,44,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(395,3,45,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(396,3,46,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(397,3,47,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(398,3,48,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(399,3,49,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(400,3,50,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(401,3,51,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(402,3,52,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(403,3,53,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(404,3,54,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(405,3,55,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(406,3,56,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(407,3,57,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(408,3,58,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(409,3,59,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(410,3,60,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(411,3,61,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(412,3,62,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(413,3,63,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(414,3,64,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(415,3,65,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(416,3,66,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(417,3,67,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(418,3,68,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(419,3,69,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(420,3,70,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(421,3,71,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(422,3,72,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(423,3,73,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(424,3,74,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(425,3,75,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(426,3,76,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(427,3,77,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(428,3,78,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(429,3,79,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(430,3,80,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(431,3,81,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(432,3,82,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(433,3,83,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(434,3,84,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(435,3,85,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(436,3,86,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(437,3,87,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(438,3,88,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(439,3,89,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(440,3,90,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(441,3,91,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(442,3,92,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(443,3,93,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(444,3,94,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(445,3,95,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(446,3,96,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(447,3,97,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(448,3,98,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(449,3,99,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(450,3,100,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(451,3,101,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(452,3,102,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(453,3,103,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(454,3,104,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(455,3,105,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(456,3,106,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(457,3,107,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(458,3,108,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(459,3,109,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(460,3,110,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(461,3,111,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(462,3,112,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(463,3,113,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(464,3,114,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(465,3,115,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(466,3,116,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(467,3,117,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(468,3,118,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(469,3,119,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(470,3,120,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(471,3,121,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(472,3,122,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(473,3,123,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(474,3,124,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(475,3,125,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(476,3,126,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(477,3,127,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(478,3,128,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(479,3,129,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(480,3,130,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(481,3,131,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(482,3,132,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(483,3,133,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(484,3,134,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(485,3,135,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(486,3,136,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(487,3,137,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(488,3,138,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(489,3,139,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(490,3,140,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(491,3,141,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(492,3,142,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(493,3,143,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(494,3,144,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(495,3,145,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(496,3,146,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(497,3,147,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(498,3,148,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(499,3,149,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(500,3,150,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(501,3,151,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(502,3,152,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(503,3,153,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(504,3,154,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(505,3,155,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(506,3,156,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(507,3,157,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(508,3,158,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(509,3,159,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(510,3,160,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(511,3,161,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(512,3,162,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(513,3,163,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(514,3,164,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(515,3,165,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(516,3,166,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(517,3,167,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(518,3,168,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(519,3,169,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(520,3,170,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(521,3,171,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(522,3,172,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(523,3,173,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(524,3,174,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(525,3,175,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(526,6,1,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(527,6,2,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(528,6,3,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(529,6,4,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(530,6,5,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(531,6,6,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(532,6,8,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(533,6,9,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(534,6,10,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(535,6,11,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(536,6,12,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(537,6,13,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(538,6,101,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(539,6,102,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(540,6,103,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(541,6,104,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(542,6,105,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(543,6,106,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(544,6,107,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(545,6,108,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(546,6,109,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(547,6,110,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(548,6,111,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(549,6,112,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(550,6,113,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(551,6,114,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(552,6,115,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(553,6,116,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(554,6,117,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(555,6,118,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(556,6,119,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(557,6,120,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(558,6,121,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(559,6,122,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(560,6,123,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(561,6,124,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(562,6,125,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(563,6,126,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(564,6,127,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(565,6,128,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(566,6,129,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(567,6,130,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(568,6,131,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(569,6,132,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(570,6,133,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(571,6,134,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(572,6,135,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(573,6,136,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(574,6,137,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(575,6,138,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(576,6,139,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(577,6,140,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(578,6,141,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(579,6,142,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(580,6,143,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(581,6,144,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(582,6,145,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(583,6,146,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(584,6,147,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(585,6,148,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(586,6,149,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(587,6,150,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(588,6,151,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(589,6,152,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(590,6,153,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(591,6,154,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(592,6,155,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(593,6,156,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(594,6,157,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(595,6,158,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(596,6,159,3,1,1,2,'2022-10-11 13:04:27',2,'2022-10-11 13:04:27'),(597,1,176,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(598,2,176,3,1,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:53:15'),(599,3,176,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(600,6,176,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(601,1,177,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(602,2,177,3,1,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:53:18'),(603,3,177,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(604,6,177,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(605,1,178,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(606,2,178,3,1,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:53:20'),(607,3,178,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(608,6,178,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(609,1,179,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(610,2,179,3,1,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:53:22'),(611,3,179,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(612,6,179,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(613,1,180,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(614,2,180,3,1,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:53:24'),(615,3,180,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(616,6,180,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(617,1,181,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(618,2,181,3,1,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:53:26'),(619,3,181,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(620,6,181,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(621,1,182,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(622,2,182,3,1,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:53:28'),(623,3,182,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(624,6,182,3,0,1,2,'2022-12-30 03:51:45',2,'2022-12-30 03:51:45'),(625,1,183,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(626,2,183,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:20'),(627,3,183,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(628,6,183,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(629,1,184,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(630,2,184,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:22'),(631,3,184,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(632,6,184,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(633,1,185,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(634,2,185,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:24'),(635,3,185,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(636,6,185,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(637,1,186,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(638,2,186,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:26'),(639,3,186,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(640,6,186,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(641,1,187,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(642,2,187,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:31'),(643,3,187,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(644,6,187,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(645,1,188,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(646,2,188,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:33'),(647,3,188,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(648,6,188,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(649,1,189,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(650,2,189,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:35'),(651,3,189,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(652,6,189,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(653,1,190,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(654,2,190,3,1,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:58:38'),(655,3,190,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(656,6,190,3,0,1,2,'2022-12-30 03:57:34',2,'2022-12-30 03:57:34'),(657,1,191,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(658,2,191,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:52'),(659,3,191,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(660,6,191,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(661,1,192,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(662,2,192,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:54'),(663,3,192,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(664,6,192,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(665,1,193,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(666,2,193,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:56'),(667,3,193,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(668,6,193,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(669,1,194,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(670,2,194,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:58'),(671,3,194,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(672,6,194,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(673,1,195,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(674,2,195,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:18:00'),(675,3,195,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(676,6,195,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(677,1,196,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(678,2,196,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:18:02'),(679,3,196,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(680,6,196,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(681,1,197,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(682,2,197,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:18:04'),(683,3,197,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(684,6,197,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(685,1,198,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(686,2,198,3,1,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:18:06'),(687,3,198,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(688,6,198,3,0,1,2,'2023-01-02 16:17:13',2,'2023-01-02 16:17:13'),(689,1,199,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(690,2,199,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:41'),(691,3,199,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(692,6,199,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(693,1,200,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(694,2,200,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:20:21'),(695,3,200,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(696,6,200,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(697,1,201,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(698,2,201,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:20:23'),(699,3,201,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(700,6,201,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(701,1,202,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(702,2,202,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:20:24'),(703,3,202,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(704,6,202,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(705,1,203,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(706,2,203,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:20:25'),(707,3,203,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(708,6,203,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(709,1,204,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(710,2,204,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:20:26'),(711,3,204,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(712,6,204,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(713,1,205,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(714,2,205,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:20:27'),(715,3,205,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(716,6,205,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(717,1,206,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(718,2,206,3,1,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:20:28'),(719,3,206,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(720,6,206,3,0,1,2,'2023-01-02 16:19:24',2,'2023-01-02 16:19:24'),(721,1,207,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(722,2,207,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:06'),(723,3,207,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(724,6,207,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(725,1,208,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(726,2,208,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:07'),(727,3,208,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(728,6,208,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(729,1,209,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(730,2,209,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:08'),(731,3,209,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(732,6,209,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(733,1,210,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(734,2,210,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:10'),(735,3,210,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(736,6,210,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(737,1,211,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(738,2,211,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:12'),(739,3,211,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(740,6,211,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(741,1,212,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(742,2,212,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:13'),(743,3,212,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(744,6,212,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(745,1,213,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(746,2,213,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:14'),(747,3,213,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(748,6,213,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(749,1,214,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(750,2,214,3,1,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:21:16'),(751,3,214,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56'),(752,6,214,3,0,1,2,'2023-01-02 16:20:56',2,'2023-01-02 16:20:56');
/*!40000 ALTER TABLE `tbl_b_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_location_areas`
--

DROP TABLE IF EXISTS `tbl_b_location_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_location_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_location_areas`
--

LOCK TABLES `tbl_b_location_areas` WRITE;
/*!40000 ALTER TABLE `tbl_b_location_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_location_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_location_cities`
--

DROP TABLE IF EXISTS `tbl_b_location_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_location_cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_location_cities`
--

LOCK TABLES `tbl_b_location_cities` WRITE;
/*!40000 ALTER TABLE `tbl_b_location_cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_location_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_location_countries`
--

DROP TABLE IF EXISTS `tbl_b_location_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_location_countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_location_countries`
--

LOCK TABLES `tbl_b_location_countries` WRITE;
/*!40000 ALTER TABLE `tbl_b_location_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_location_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_location_districts`
--

DROP TABLE IF EXISTS `tbl_b_location_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_location_districts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `country_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_location_districts`
--

LOCK TABLES `tbl_b_location_districts` WRITE;
/*!40000 ALTER TABLE `tbl_b_location_districts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_location_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_location_provinces`
--

DROP TABLE IF EXISTS `tbl_b_location_provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_location_provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `country_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_location_provinces`
--

LOCK TABLES `tbl_b_location_provinces` WRITE;
/*!40000 ALTER TABLE `tbl_b_location_provinces` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_b_location_provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_menu_permission`
--

DROP TABLE IF EXISTS `tbl_b_menu_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_menu_permission` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `menu_id` int(32) NOT NULL,
  `group_id` int(32) NOT NULL,
  `module_id` int(32) NOT NULL,
  `is_allowed` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_menu_permission`
--

LOCK TABLES `tbl_b_menu_permission` WRITE;
/*!40000 ALTER TABLE `tbl_b_menu_permission` DISABLE KEYS */;
INSERT INTO `tbl_b_menu_permission` VALUES (1,1,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(2,2,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(3,3,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(4,4,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(5,5,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(6,6,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(7,7,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(8,8,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(9,9,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(10,10,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(11,11,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(12,12,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(13,13,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(14,14,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(15,15,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(16,16,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(17,17,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(18,18,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(19,19,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(20,20,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(21,21,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(22,22,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(23,23,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(24,24,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(25,25,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(26,26,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(27,27,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(28,28,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(29,29,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(30,30,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(31,31,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(32,32,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(33,33,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(34,34,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(35,35,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(36,36,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(37,37,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(38,38,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(39,39,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(40,40,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(41,41,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(42,42,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(43,43,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(44,44,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(45,45,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(46,46,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(47,47,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(48,48,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(49,49,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(50,50,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(51,51,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(52,52,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(53,53,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(54,54,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(55,55,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(56,56,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(57,57,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(58,58,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(59,59,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(60,60,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(61,61,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(62,62,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(63,63,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(64,64,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(65,65,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(66,66,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(67,67,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(68,68,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(69,69,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(70,70,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(71,71,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(72,72,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(73,73,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(74,74,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(75,75,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(76,76,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(77,77,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(78,78,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(79,79,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(80,80,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(81,81,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(82,82,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(83,83,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(84,84,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(85,85,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(86,86,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(87,87,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(88,88,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(89,89,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(90,90,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(91,91,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(92,92,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(93,93,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(94,95,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(95,96,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(96,97,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(97,98,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(98,99,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(99,100,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(100,101,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(101,102,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(102,103,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(103,104,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(104,105,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(105,106,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(106,107,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(107,108,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(108,109,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(109,126,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(110,127,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(111,128,1,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(112,1,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(113,2,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(114,3,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(115,4,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(116,5,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(117,6,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(118,7,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(119,8,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(120,9,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(121,10,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(122,11,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(123,12,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(124,13,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(125,14,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(126,15,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(127,16,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(128,17,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(129,18,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(130,19,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(131,20,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(132,21,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(133,22,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(134,23,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(135,24,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(136,25,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(137,26,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(138,27,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(139,28,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(140,29,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(141,30,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(142,31,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(143,32,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(144,33,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(145,34,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(146,35,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(147,36,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(148,37,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(149,38,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(150,39,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(151,40,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(152,41,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(153,42,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(154,43,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(155,44,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(156,45,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(157,46,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(158,47,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(159,48,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(160,49,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(161,50,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(162,51,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(163,52,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(164,53,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(165,54,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(166,55,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(167,56,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(168,57,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(169,58,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(170,59,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(171,60,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(172,61,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(173,62,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(174,63,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(175,64,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(176,65,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(177,66,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(178,67,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(179,68,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(180,69,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(181,70,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(182,71,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(183,72,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(184,73,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(185,74,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(186,75,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(187,76,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(188,77,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(189,78,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(190,79,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(191,80,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(192,81,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(193,82,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(194,83,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(195,84,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(196,85,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(197,86,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(198,87,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(199,88,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(200,89,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(201,90,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(202,91,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(203,92,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(204,93,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(205,95,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(206,96,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(207,97,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(208,98,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(209,99,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(210,100,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(211,101,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(212,102,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(213,103,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(214,104,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(215,105,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(216,106,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(217,107,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(218,108,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(219,109,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(220,126,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(221,127,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(222,128,2,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(223,1,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(224,2,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(225,3,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(226,4,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(227,5,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(228,6,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(229,7,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(230,8,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(231,9,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(232,10,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(233,11,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(234,12,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(235,13,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(236,14,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(237,15,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(238,16,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(239,17,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(240,18,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(241,19,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(242,20,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(243,21,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(244,22,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(245,23,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(246,24,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(247,25,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(248,26,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(249,27,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(250,28,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(251,29,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(252,30,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(253,31,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(254,32,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(255,33,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(256,34,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(257,35,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(258,36,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(259,37,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(260,38,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(261,39,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(262,40,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(263,41,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(264,42,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(265,43,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(266,44,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(267,45,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(268,46,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(269,47,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(270,48,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(271,49,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(272,50,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(273,51,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(274,52,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(275,53,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(276,54,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(277,55,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(278,56,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(279,57,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(280,58,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(281,59,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(282,60,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(283,61,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(284,62,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(285,63,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(286,64,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(287,65,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(288,66,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(289,67,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(290,68,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(291,69,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(292,70,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(293,71,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(294,72,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(295,73,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(296,74,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(297,75,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(298,76,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(299,77,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(300,78,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(301,79,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(302,80,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(303,81,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(304,82,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(305,83,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(306,84,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(307,85,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(308,86,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(309,87,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(310,88,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(311,89,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(312,90,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(313,91,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(314,92,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(315,93,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(316,95,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(317,96,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(318,97,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(319,98,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(320,99,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(321,100,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(322,101,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(323,102,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(324,103,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(325,104,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(326,105,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(327,106,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(328,107,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(329,108,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(330,109,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(331,126,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(332,127,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(333,128,3,3,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(334,129,2,3,1,1,2,'2023-01-02 16:08:03',2,'2023-01-02 16:08:03'),(335,130,2,3,1,1,2,'2023-01-02 16:15:16',2,'2023-01-02 16:15:16');
/*!40000 ALTER TABLE `tbl_b_menu_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_user_groups`
--

DROP TABLE IF EXISTS `tbl_b_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_user_groups` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) NOT NULL,
  `group_id` int(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_user_groups`
--

LOCK TABLES `tbl_b_user_groups` WRITE;
/*!40000 ALTER TABLE `tbl_b_user_groups` DISABLE KEYS */;
INSERT INTO `tbl_b_user_groups` VALUES (1,1,1,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(2,2,2,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(3,3,3,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12');
/*!40000 ALTER TABLE `tbl_b_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_b_user_permissions`
--

DROP TABLE IF EXISTS `tbl_b_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_b_user_permissions` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) NOT NULL,
  `permission_id` int(32) NOT NULL,
  `is_denied` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_b_user_permissions`
--

LOCK TABLES `tbl_b_user_permissions` WRITE;
/*!40000 ALTER TABLE `tbl_b_user_permissions` DISABLE KEYS */;
INSERT INTO `tbl_b_user_permissions` VALUES (1,1,1,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(2,1,2,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(3,1,3,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(4,1,4,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(5,1,5,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(6,1,6,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(7,1,7,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(8,1,8,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(9,1,9,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(10,1,10,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(11,1,11,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(12,1,12,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(13,1,13,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(14,1,14,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(15,1,15,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(16,1,16,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(17,1,17,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(18,1,18,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(19,1,19,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(20,1,20,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(21,1,21,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(22,1,22,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(23,1,23,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(24,1,24,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(25,1,25,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(26,1,26,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(27,1,27,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(28,1,28,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(29,1,29,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(30,1,30,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(31,1,31,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(32,1,32,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(33,1,33,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(34,1,34,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(35,1,35,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(36,1,36,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(37,1,37,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(38,1,38,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(39,1,39,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(40,1,40,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(41,1,41,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(42,1,42,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(43,1,43,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(44,1,44,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(45,1,45,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(46,1,46,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(47,1,47,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(48,1,48,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(49,1,49,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(50,1,50,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(51,1,51,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(52,1,52,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(53,1,53,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(54,1,54,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(55,1,55,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(56,1,56,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(57,1,57,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(58,1,58,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(59,1,59,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(60,1,60,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(61,1,61,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(62,1,62,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(63,1,63,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(64,1,64,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(65,1,65,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(66,1,66,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(67,1,67,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(68,1,68,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(69,1,69,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(70,1,70,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(71,1,71,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(72,1,72,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(73,1,73,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(74,1,74,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(75,1,75,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(76,1,76,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(77,1,77,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(78,1,78,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(79,1,79,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(80,1,80,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(81,1,81,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(82,1,82,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(83,1,83,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(84,1,84,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(85,1,85,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(86,1,86,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(87,1,87,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(88,1,88,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(89,1,89,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(90,1,90,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(91,1,91,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(92,1,92,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(93,1,93,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(94,1,94,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(95,1,95,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(96,1,96,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(97,1,97,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(98,1,98,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(99,1,99,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(100,1,100,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(101,1,101,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(102,1,102,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(103,1,103,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(104,1,104,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(105,1,105,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(106,1,106,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(107,1,107,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(108,1,108,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(109,1,109,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(110,1,110,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(111,1,111,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(112,1,112,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(113,1,113,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(114,1,114,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(115,1,115,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(116,1,116,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(117,1,117,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(118,1,118,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(119,1,119,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(120,1,120,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(121,1,121,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(122,1,122,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(123,1,123,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(124,1,124,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(125,1,125,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(126,1,126,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(127,1,127,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(128,1,128,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(129,1,129,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(130,1,130,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(131,1,131,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(132,1,132,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(133,1,133,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(134,1,134,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(135,1,135,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(136,1,136,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(137,1,137,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(138,1,138,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(139,1,139,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(140,1,140,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(141,1,141,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(142,1,142,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(143,1,143,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(144,1,144,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(145,1,145,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(146,1,146,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(147,1,147,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(148,1,148,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(149,1,149,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(150,1,150,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(151,1,151,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(152,1,152,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(153,1,153,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(154,1,154,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(155,1,155,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(156,1,156,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(157,1,157,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(158,1,158,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(159,1,159,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(160,1,160,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(161,1,161,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(162,1,162,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(163,1,163,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(164,1,164,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(165,1,165,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(166,1,166,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(167,1,167,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(168,1,168,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(169,1,169,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(170,1,170,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(171,1,171,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(172,1,172,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(173,1,173,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(174,1,174,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(175,1,175,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(176,2,1,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(177,2,2,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(178,2,3,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(179,2,4,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(180,2,5,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(181,2,6,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(182,2,7,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(183,2,8,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(184,2,9,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(185,2,10,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(186,2,11,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(187,2,12,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(188,2,13,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(189,2,14,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(190,2,15,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(191,2,16,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(192,2,17,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(193,2,18,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(194,2,19,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(195,2,20,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(196,2,21,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(197,2,22,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(198,2,23,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(199,2,24,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(200,2,25,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(201,2,26,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(202,2,27,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(203,2,28,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(204,2,29,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(205,2,30,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(206,2,31,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(207,2,32,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(208,2,33,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(209,2,34,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(210,2,35,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(211,2,36,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(212,2,37,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(213,2,38,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(214,2,39,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(215,2,40,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(216,2,41,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(217,2,42,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(218,2,43,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(219,2,44,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(220,2,45,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(221,2,46,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(222,2,47,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(223,2,48,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(224,2,49,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(225,2,50,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(226,2,51,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(227,2,52,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(228,2,53,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(229,2,54,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(230,2,55,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(231,2,56,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(232,2,57,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(233,2,58,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(234,2,59,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(235,2,60,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(236,2,61,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(237,2,62,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(238,2,63,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(239,2,64,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(240,2,65,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(241,2,66,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(242,2,67,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(243,2,68,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(244,2,69,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(245,2,70,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(246,2,71,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(247,2,72,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(248,2,73,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(249,2,74,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(250,2,75,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(251,2,76,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(252,2,77,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(253,2,78,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(254,2,79,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(255,2,80,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(256,2,81,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(257,2,82,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(258,2,83,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(259,2,84,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(260,2,85,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(261,2,86,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(262,2,87,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(263,2,88,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(264,2,89,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(265,2,90,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(266,2,91,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(267,2,92,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(268,2,93,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(269,2,94,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(270,2,95,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(271,2,96,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(272,2,97,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(273,2,98,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(274,2,99,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(275,2,100,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(276,2,101,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(277,2,102,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(278,2,103,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(279,2,104,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(280,2,105,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(281,2,106,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(282,2,107,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(283,2,108,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(284,2,109,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(285,2,110,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(286,2,111,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(287,2,112,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(288,2,113,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(289,2,114,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(290,2,115,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(291,2,116,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(292,2,117,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(293,2,118,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(294,2,119,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(295,2,120,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(296,2,121,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(297,2,122,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(298,2,123,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(299,2,124,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(300,2,125,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(301,2,126,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(302,2,127,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(303,2,128,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(304,2,129,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(305,2,130,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(306,2,131,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(307,2,132,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(308,2,133,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(309,2,134,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(310,2,135,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(311,2,136,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(312,2,137,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(313,2,138,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(314,2,139,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(315,2,140,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(316,2,141,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(317,2,142,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(318,2,143,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(319,2,144,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(320,2,145,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(321,2,146,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(322,2,147,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(323,2,148,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(324,2,149,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(325,2,150,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(326,2,151,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(327,2,152,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(328,2,153,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(329,2,154,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(330,2,155,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(331,2,156,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(332,2,157,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(333,2,158,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(334,2,159,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(335,2,160,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(336,2,161,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(337,2,162,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(338,2,163,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(339,2,164,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(340,2,165,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(341,2,166,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(342,2,167,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(343,2,168,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(344,2,169,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(345,2,170,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(346,2,171,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(347,2,172,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(348,2,173,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(349,2,174,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(350,2,175,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(351,3,1,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(352,3,2,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(353,3,3,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(354,3,4,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(355,3,5,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(356,3,6,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(357,3,7,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(358,3,8,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(359,3,9,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(360,3,10,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(361,3,11,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(362,3,12,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(363,3,13,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(364,3,14,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(365,3,15,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(366,3,16,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(367,3,17,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(368,3,18,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(369,3,19,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(370,3,20,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(371,3,21,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(372,3,22,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(373,3,23,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(374,3,24,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(375,3,25,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(376,3,26,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(377,3,27,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(378,3,28,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(379,3,29,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(380,3,30,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(381,3,31,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(382,3,32,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(383,3,33,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(384,3,34,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(385,3,35,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(386,3,36,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(387,3,37,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(388,3,38,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(389,3,39,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(390,3,40,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(391,3,41,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(392,3,42,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(393,3,43,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(394,3,44,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(395,3,45,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(396,3,46,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(397,3,47,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(398,3,48,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(399,3,49,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(400,3,50,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(401,3,51,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(402,3,52,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(403,3,53,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(404,3,54,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(405,3,55,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(406,3,56,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(407,3,57,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(408,3,58,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(409,3,59,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(410,3,60,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(411,3,61,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(412,3,62,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(413,3,63,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(414,3,64,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(415,3,65,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(416,3,66,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(417,3,67,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(418,3,68,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(419,3,69,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(420,3,70,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(421,3,71,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(422,3,72,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(423,3,73,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(424,3,74,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(425,3,75,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(426,3,76,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(427,3,77,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(428,3,78,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(429,3,79,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(430,3,80,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(431,3,81,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(432,3,82,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(433,3,83,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(434,3,84,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(435,3,85,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(436,3,86,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(437,3,87,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(438,3,88,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(439,3,89,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(440,3,90,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(441,3,91,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(442,3,92,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(443,3,93,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(444,3,94,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(445,3,95,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(446,3,96,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(447,3,97,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(448,3,98,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(449,3,99,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(450,3,100,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(451,3,101,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(452,3,102,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(453,3,103,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(454,3,104,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(455,3,105,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(456,3,106,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(457,3,107,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(458,3,108,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(459,3,109,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(460,3,110,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(461,3,111,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(462,3,112,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(463,3,113,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(464,3,114,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(465,3,115,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(466,3,116,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(467,3,117,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(468,3,118,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(469,3,119,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(470,3,120,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(471,3,121,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(472,3,122,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(473,3,123,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(474,3,124,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(475,3,125,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(476,3,126,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(477,3,127,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(478,3,128,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(479,3,129,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(480,3,130,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(481,3,131,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(482,3,132,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(483,3,133,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(484,3,134,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(485,3,135,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(486,3,136,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(487,3,137,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(488,3,138,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(489,3,139,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(490,3,140,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(491,3,141,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(492,3,142,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(493,3,143,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(494,3,144,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(495,3,145,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(496,3,146,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(497,3,147,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(498,3,148,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(499,3,149,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(500,3,150,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(501,3,151,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(502,3,152,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(503,3,153,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(504,3,154,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(505,3,155,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(506,3,156,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(507,3,157,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(508,3,158,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(509,3,159,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(510,3,160,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(511,3,161,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(512,3,162,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(513,3,163,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(514,3,164,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(515,3,165,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(516,3,166,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(517,3,167,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(518,3,168,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(519,3,169,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(520,3,170,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(521,3,171,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(522,3,172,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(523,3,173,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(524,3,174,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12'),(525,3,175,0,1,1,'2022-10-13 18:25:12',1,'2022-10-13 18:25:12');
/*!40000 ALTER TABLE `tbl_b_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_c_content_categories`
--

DROP TABLE IF EXISTS `tbl_c_content_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_c_content_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_c_content_categories`
--

LOCK TABLES `tbl_c_content_categories` WRITE;
/*!40000 ALTER TABLE `tbl_c_content_categories` DISABLE KEYS */;
INSERT INTO `tbl_c_content_categories` VALUES (1,'Blog','-',1,1,'2022-06-27 03:05:44',1,'2022-06-27 03:05:44'),(2,'Content','-',1,1,'2022-06-27 03:05:44',1,'2022-06-27 03:05:44');
/*!40000 ALTER TABLE `tbl_c_content_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_c_content_metas`
--

DROP TABLE IF EXISTS `tbl_c_content_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_c_content_metas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_c_content_metas`
--

LOCK TABLES `tbl_c_content_metas` WRITE;
/*!40000 ALTER TABLE `tbl_c_content_metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_c_content_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_c_content_photos`
--

DROP TABLE IF EXISTS `tbl_c_content_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_c_content_photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_c_content_photos`
--

LOCK TABLES `tbl_c_content_photos` WRITE;
/*!40000 ALTER TABLE `tbl_c_content_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_c_content_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_c_contents`
--

DROP TABLE IF EXISTS `tbl_c_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_c_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_raw` text NOT NULL,
  `content_sanitize` text NOT NULL,
  `photo_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `meta_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_c_contents`
--

LOCK TABLES `tbl_c_contents` WRITE;
/*!40000 ALTER TABLE `tbl_c_contents` DISABLE KEYS */;
INSERT INTO `tbl_c_contents` VALUES (1,'content-top','content-top','','',0,0,0,1,1,'2022-06-27 03:06:27',1,'2022-06-27 03:06:27'),(2,'content-about','content-about','','',0,0,0,1,1,'2022-06-27 03:06:27',1,'2022-06-27 03:06:27'),(3,'content-services','content-services','','',0,0,0,1,1,'2022-06-27 03:06:27',1,'2022-06-27 03:06:27');
/*!40000 ALTER TABLE `tbl_c_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_app_contacts`
--

DROP TABLE IF EXISTS `tbl_d_app_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_app_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_app_contacts`
--

LOCK TABLES `tbl_d_app_contacts` WRITE;
/*!40000 ALTER TABLE `tbl_d_app_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_app_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_app_social_medias`
--

DROP TABLE IF EXISTS `tbl_d_app_social_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_app_social_medias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_app_social_medias`
--

LOCK TABLES `tbl_d_app_social_medias` WRITE;
/*!40000 ALTER TABLE `tbl_d_app_social_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_app_social_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_currencies`
--

DROP TABLE IF EXISTS `tbl_d_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `rate` double(8,2) NOT NULL,
  `base_to` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_currencies`
--

LOCK TABLES `tbl_d_currencies` WRITE;
/*!40000 ALTER TABLE `tbl_d_currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_icons`
--

DROP TABLE IF EXISTS `tbl_d_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_icons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_icons`
--

LOCK TABLES `tbl_d_icons` WRITE;
/*!40000 ALTER TABLE `tbl_d_icons` DISABLE KEYS */;
INSERT INTO `tbl_d_icons` VALUES (1,'file','fa-solid fa-file','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18'),(2,'file-lines','fa-solid fa-file-lines','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18'),(3,'code','fa-solid fa-code','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18'),(4,'code-simple','fa-solid fa-code-simple','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18'),(5,'filter','fa-solid fa-filter','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18'),(6,'folder','fa-solid fa-folder','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18'),(7,'folder-open','fa-solid fa-folder-open','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18'),(8,'gears','fa-solid fa-gears','',1,1,'2022-07-15 05:03:18',1,'2022-07-15 05:03:18');
/*!40000 ALTER TABLE `tbl_d_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_login_attempts`
--

DROP TABLE IF EXISTS `tbl_d_login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_login_attempts` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password_attempt` varchar(255) NOT NULL,
  `device_id` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `browser` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_login_attempts`
--

LOCK TABLES `tbl_d_login_attempts` WRITE;
/*!40000 ALTER TABLE `tbl_d_login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_logs`
--

DROP TABLE IF EXISTS `tbl_d_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fraud_scan` longtext NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `browser` text NOT NULL,
  `class` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_logs`
--

LOCK TABLES `tbl_d_logs` WRITE;
/*!40000 ALTER TABLE `tbl_d_logs` DISABLE KEYS */;
INSERT INTO `tbl_d_logs` VALUES (1,'user accesshttp://localhost:3000/v1/auth/get-list/0/20 using browser {\"browser\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\",\"language\":\"en-US,en;q=0.9\",\"country\":\"Unknown\",\"region\":\"Unknown\",\"geo\":null}','::1','{\"browser\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\",\"language\":\"en-US,en;q=0.9\",\"country\":\"Unknown\",\"region\":\"Unknown\",\"geo\":null}','get-list','0','GET',1,1,'2022-12-29 12:15:43',1,'2022-12-29 12:15:43'),(2,'user accesshttp://localhost:3000/ using browser {\"browser\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\",\"language\":\"en-US,en;q=0.9\",\"country\":\"Unknown\",\"region\":\"Unknown\",\"geo\":null}','::1','{\"browser\":\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36\",\"language\":\"en-US,en;q=0.9\",\"country\":\"Unknown\",\"region\":\"Unknown\",\"geo\":null}','home','index','GET',1,1,'2022-12-29 12:15:51',1,'2022-12-29 12:15:51');
/*!40000 ALTER TABLE `tbl_d_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_meta_descriptions`
--

DROP TABLE IF EXISTS `tbl_d_meta_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_meta_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_meta_descriptions`
--

LOCK TABLES `tbl_d_meta_descriptions` WRITE;
/*!40000 ALTER TABLE `tbl_d_meta_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_meta_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_d_meta_keywords`
--

DROP TABLE IF EXISTS `tbl_d_meta_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_d_meta_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_d_meta_keywords`
--

LOCK TABLES `tbl_d_meta_keywords` WRITE;
/*!40000 ALTER TABLE `tbl_d_meta_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_d_meta_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_e_message_attachments`
--

DROP TABLE IF EXISTS `tbl_e_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_e_message_attachments` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `mail_id` int(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_e_message_attachments`
--

LOCK TABLES `tbl_e_message_attachments` WRITE;
/*!40000 ALTER TABLE `tbl_e_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_e_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_e_message_send`
--

DROP TABLE IF EXISTS `tbl_e_message_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_e_message_send` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `mail_from` int(32) NOT NULL,
  `mail_to` int(32) NOT NULL,
  `mail_id` int(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_e_message_send`
--

LOCK TABLES `tbl_e_message_send` WRITE;
/*!40000 ALTER TABLE `tbl_e_message_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_e_message_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_e_messages`
--

DROP TABLE IF EXISTS `tbl_e_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_e_messages` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_chat` tinyint(1) NOT NULL DEFAULT 0,
  `is_mail` tinyint(1) NOT NULL DEFAULT 0,
  `is_draft` tinyint(1) DEFAULT 0,
  `is_junk` tinyint(1) NOT NULL DEFAULT 0,
  `is_trash` tinyint(1) NOT NULL DEFAULT 0,
  `is_read_notification` tinyint(1) DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_e_messages`
--

LOCK TABLES `tbl_e_messages` WRITE;
/*!40000 ALTER TABLE `tbl_e_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_e_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_f_document_types`
--

DROP TABLE IF EXISTS `tbl_f_document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_f_document_types` (
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
-- Dumping data for table `tbl_f_document_types`
--

LOCK TABLES `tbl_f_document_types` WRITE;
/*!40000 ALTER TABLE `tbl_f_document_types` DISABLE KEYS */;
INSERT INTO `tbl_f_document_types` VALUES (1,'PDF','-',1,1,'2022-08-25 05:01:24',1,'2022-08-25 05:01:24'),(2,'Word','-',1,1,'2022-08-25 05:01:24',1,'2022-08-25 05:01:24'),(3,'Excel','-',1,1,'2022-08-25 05:01:24',1,'2022-08-25 05:01:24'),(4,'Email','-',1,1,'2022-08-25 05:01:24',1,'2022-08-25 05:01:24');
/*!40000 ALTER TABLE `tbl_f_document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_f_documents`
--

DROP TABLE IF EXISTS `tbl_f_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_f_documents` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `html_content` longtext NOT NULL,
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
-- Dumping data for table `tbl_f_documents`
--

LOCK TABLES `tbl_f_documents` WRITE;
/*!40000 ALTER TABLE `tbl_f_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_f_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_master_controllers`
--

DROP TABLE IF EXISTS `tbl_master_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_master_controllers` (
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
-- Dumping data for table `tbl_master_controllers`
--

LOCK TABLES `tbl_master_controllers` WRITE;
/*!40000 ALTER TABLE `tbl_master_controllers` DISABLE KEYS */;
INSERT INTO `tbl_master_controllers` VALUES (1,'user','-',1,1,'2022-07-13 04:57:30',1,'2022-07-13 04:57:30'),(2,'group','-',1,1,'2022-07-13 04:57:30',1,'2022-07-13 04:57:30'),(3,'permission','-',1,1,'2022-07-13 04:57:30',1,'2022-07-13 04:57:30'),(4,'module','-',1,1,'2022-07-13 04:57:30',1,'2022-07-13 04:57:30');
/*!40000 ALTER TABLE `tbl_master_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_master_methods`
--

DROP TABLE IF EXISTS `tbl_master_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_master_methods` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `param` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_master_methods`
--

LOCK TABLES `tbl_master_methods` WRITE;
/*!40000 ALTER TABLE `tbl_master_methods` DISABLE KEYS */;
INSERT INTO `tbl_master_methods` VALUES (1,'create','','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(2,'edit','{id}','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(3,'view','','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(4,'update','{id}','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(5,'insert','','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(6,'remove','{id}','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(7,'delete','{id}','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(8,'get_list','','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(9,'archive','','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(10,'get_list_archive','','-',1,1,'2022-07-13 04:55:01',1,'2022-07-13 04:55:01'),(12,'detail','/{id}','-',1,2,'2022-07-26 11:25:28',2,'2022-07-26 11:25:28'),(13,'timeline','/{id}','-',1,2,'2022-07-26 14:41:13',2,'2022-07-26 14:41:13'),(14,'team_user','/{id}','-',1,2,'2022-07-28 08:04:51',2,'2022-07-28 08:04:51'),(15,'logs','','',1,2,'2022-08-10 09:56:33',2,'2022-08-10 09:56:33'),(16,'compose','','-',1,2,'2022-08-11 11:09:01',2,'2022-08-11 11:09:01'),(17,'inbox','','-',1,2,'2022-08-11 11:09:19',2,'2022-08-11 11:09:19'),(18,'chat','','-',1,2,'2022-08-11 11:10:28',2,'2022-08-11 11:10:28');
/*!40000 ALTER TABLE `tbl_master_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_project_management_core'
--

--
-- Dumping routines for database 'db_project_management_core'
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
