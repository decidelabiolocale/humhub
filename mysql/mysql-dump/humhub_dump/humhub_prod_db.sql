-- MySQL dump 10.19  Distrib 10.3.32-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: humhub_prod_db
-- ------------------------------------------------------
-- Server version	10.3.32-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',1),(2,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\post\\models\\Post',1),(3,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(4,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(5,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\post\\models\\Post',2),(6,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',1),(7,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',2),(8,'humhub\\modules\\like\\activities\\Liked','like','humhub\\modules\\like\\models\\Like',1),(9,'humhub\\modules\\like\\activities\\Liked','like','humhub\\modules\\like\\models\\Like',2),(10,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\polls\\models\\Poll',1),(11,'humhub\\modules\\polls\\activities\\NewVote','polls','humhub\\modules\\polls\\models\\Poll',1),(12,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',3),(13,'humhub\\modules\\polls\\activities\\NewVote','polls','humhub\\modules\\polls\\models\\Poll',1),(14,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',4),(15,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(16,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',2),(17,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\calendar\\models\\CalendarEntry',1),(18,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',3),(19,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',4),(20,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',5),(21,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(22,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',2),(23,'humhub\\modules\\user\\activities\\UserFollow','user','humhub\\modules\\user\\models\\Follow',10),(24,'humhub\\modules\\user\\activities\\UserFollow','user','humhub\\modules\\user\\models\\Follow',11),(25,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',6),(26,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\calendar\\models\\CalendarEntry',2),(27,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',6),(28,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(29,'humhub\\modules\\polls\\activities\\NewVote','polls','humhub\\modules\\polls\\models\\Poll',1);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_entry`
--

DROP TABLE IF EXISTS `calendar_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `all_day` tinyint(4) NOT NULL,
  `participation_mode` tinyint(4) NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_decline` tinyint(4) DEFAULT 1,
  `allow_maybe` tinyint(4) DEFAULT 1,
  `time_zone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) DEFAULT 0,
  `max_participants` int(11) DEFAULT NULL,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rrule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `recurrence_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exdate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int(11) DEFAULT 0,
  `location` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_calendar_entry_parent_event` (`parent_event_id`),
  CONSTRAINT `fk_calendar_entry_parent_event` FOREIGN KEY (`parent_event_id`) REFERENCES `calendar_entry` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_entry`
--

LOCK TABLES `calendar_entry` WRITE;
/*!40000 ALTER TABLE `calendar_entry` DISABLE KEYS */;
INSERT INTO `calendar_entry` VALUES (1,'Repair Café','','2022-02-13 14:30:00','2022-02-13 17:30:00',0,2,'#dd0b82',1,1,'UTC','',0,NULL,'humhub-calendar_event-8fe287d7-4104-4b22-a4f4-9a3b0fd2d445',NULL,NULL,NULL,NULL,0,'La Forge Enchantée'),(2,'chantier participatif pour la construction d\'un appentis ','toutes les bonnes volontés sont les bienvenues pour aider à la construction de ce petit appentis. Sa structure est en IPN.','2022-02-12 00:00:00','2022-02-13 00:00:00',1,2,'#0b9119',1,1,'Europe/Paris','',0,NULL,'humhub-calendar_event-63afa745-f8ca-4c48-ac5a-be7f74b4afbc',NULL,NULL,NULL,NULL,0,'La Forge Enchantée');
/*!40000 ALTER TABLE `calendar_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_entry_participant`
--

DROP TABLE IF EXISTS `calendar_entry_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_entry_participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_entry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `participation_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entryuser` (`calendar_entry_id`,`user_id`),
  KEY `fk-calendar-participant-user-id` (`user_id`),
  CONSTRAINT `fk-calendar-participant-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_entry_participant`
--

LOCK TABLES `calendar_entry_participant` WRITE;
/*!40000 ALTER TABLE `calendar_entry_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_entry_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_reminder`
--

DROP TABLE IF EXISTS `calendar_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` tinyint(4) DEFAULT NULL,
  `unit` tinyint(4) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `disabled` tinyint(4) DEFAULT 0,
  `contentcontainer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_calendar_reminder_container_id` (`contentcontainer_id`),
  KEY `fk_calendar_reminder_content_id` (`content_id`),
  CONSTRAINT `fk_calendar_reminder_container_id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_calendar_reminder_content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_reminder`
--

LOCK TABLES `calendar_reminder` WRITE;
/*!40000 ALTER TABLE `calendar_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_reminder_sent`
--

DROP TABLE IF EXISTS `calendar_reminder_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_reminder_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminder_id` int(11) NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_calendar_reminder_sent_id` (`reminder_id`),
  KEY `fk_calendar_reminder_sent_content_id` (`content_id`),
  CONSTRAINT `fk_calendar_reminder_sent_content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_calendar_reminder_sent_id` FOREIGN KEY (`reminder_id`) REFERENCES `calendar_reminder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_reminder_sent`
--

LOCK TABLES `calendar_reminder_sent` WRITE;
/*!40000 ALTER TABLE `calendar_reminder_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_reminder_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment-created_by` (`created_by`),
  KEY `idx_comment_target` (`object_id`,`object_model`),
  CONSTRAINT `fk_comment-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Nike - Just buy it. :wink:','humhub\\modules\\post\\models\\Post',2,'2022-01-25 22:08:53',2,'2022-01-25 22:08:53',2),(2,'Calvin Klein - Entre l\'amour et la folie, il y a l\'obsession.','humhub\\modules\\post\\models\\Post',2,'2022-01-25 22:08:53',3,'2022-01-25 22:08:53',3),(3,'Pourquoi on n\'irait pas au bar Bemelmans ?','humhub\\modules\\polls\\models\\Poll',1,'2022-01-25 22:08:56',2,'2022-01-25 22:08:56',2),(4,'Encore ? ;Weary;','humhub\\modules\\polls\\models\\Poll',1,'2022-01-25 22:08:57',3,'2022-01-25 22:08:57',3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `pinned` tinyint(4) DEFAULT NULL,
  `archived` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked_comments` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `stream_sort_date` datetime DEFAULT NULL,
  `stream_channel` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  UNIQUE KEY `index_guid` (`guid`),
  KEY `fk-contentcontainer` (`contentcontainer_id`),
  KEY `fk-create-user` (`created_by`),
  KEY `fk-update-user` (`updated_by`),
  KEY `stream_channe` (`stream_channel`),
  CONSTRAINT `fk-contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-create-user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-update-user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'ff006bf9-1af4-4165-b82b-9c8a2ad2c933','humhub\\modules\\activity\\models\\Activity',1,1,0,'0',0,'2022-01-25 22:08:32',1,'2022-01-25 22:08:32',1,2,'2022-01-25 22:08:32','activity'),(2,'bbed1526-45c0-4d3f-a2e9-20bd102b24e9','humhub\\modules\\post\\models\\Post',1,1,0,'0',0,'2022-01-25 22:08:32',1,'2022-01-25 22:08:32',1,2,'2022-01-25 22:08:32','default'),(3,'ebb2fb03-e02c-4c39-a1c1-76632beb59a2','humhub\\modules\\activity\\models\\Activity',2,1,0,'0',0,'2022-01-25 22:08:32',1,'2022-01-25 22:08:32',1,2,'2022-01-25 22:08:32','activity'),(4,'58cc1227-2bd7-4d0c-a088-6bc7e1681f6a','humhub\\modules\\activity\\models\\Activity',3,0,0,'0',0,'2022-01-25 22:08:48',2,'2022-01-25 22:08:48',1,2,'2022-01-25 22:08:48','activity'),(5,'ae544c88-df62-44b3-a5a0-223fa50d0ffe','humhub\\modules\\activity\\models\\Activity',4,0,0,'0',0,'2022-01-25 22:08:50',3,'2022-01-25 22:08:50',1,2,'2022-01-25 22:08:50','activity'),(6,'58498200-d095-41e7-b614-23a2d883c43b','humhub\\modules\\post\\models\\Post',2,0,0,'0',0,'2022-01-25 22:08:52',1,'2022-01-25 22:08:52',1,2,'2022-01-25 22:08:54','default'),(7,'4aac5f66-e6d4-4a8f-8844-3dc87b145bd9','humhub\\modules\\activity\\models\\Activity',5,0,0,'0',0,'2022-01-25 22:08:52',1,'2022-01-25 22:08:52',1,2,'2022-01-25 22:08:52','activity'),(8,'27f5eb96-6793-407c-8a5a-dda71638d73a','humhub\\modules\\activity\\models\\Activity',6,0,0,'0',0,'2022-01-25 22:08:53',2,'2022-01-25 22:08:53',2,2,'2022-01-25 22:08:53','activity'),(9,'abd9e5b5-3528-4d34-8d02-1a531dff5181','humhub\\modules\\activity\\models\\Activity',7,0,0,'0',0,'2022-01-25 22:08:54',3,'2022-01-25 22:08:54',3,2,'2022-01-25 22:08:54','activity'),(10,'4776b5b7-88d5-446a-b04b-de90c4eb624a','humhub\\modules\\activity\\models\\Activity',8,0,0,'0',0,'2022-01-25 22:08:54',3,'2022-01-25 22:08:54',3,2,'2022-01-25 22:08:54','activity'),(11,'9fce9bfe-b938-483a-a6f2-4209f34da348','humhub\\modules\\activity\\models\\Activity',9,0,0,'0',0,'2022-01-25 22:08:54',3,'2022-01-25 22:08:54',3,2,'2022-01-25 22:08:54','activity'),(12,'4fa2c090-8f56-49fc-871b-0a2124d8f35b','humhub\\modules\\polls\\models\\Poll',1,0,0,'0',0,'2022-01-25 22:08:55',1,'2022-01-25 22:08:55',1,2,'2022-01-25 22:08:57','default'),(13,'cc64c5b6-2656-4595-93ce-5da282cf367f','humhub\\modules\\activity\\models\\Activity',10,0,0,'0',0,'2022-01-25 22:08:55',1,'2022-01-25 22:08:55',1,2,'2022-01-25 22:08:55','activity'),(14,'eb070140-c01b-4250-a8ad-f151d1ee7bd9','humhub\\modules\\activity\\models\\Activity',11,0,0,'0',0,'2022-01-25 22:08:56',2,'2022-01-25 22:08:56',2,2,'2022-01-25 22:08:56','activity'),(15,'67c375ba-567d-46cc-a125-e2945fee41b8','humhub\\modules\\activity\\models\\Activity',12,0,0,'0',0,'2022-01-25 22:08:56',2,'2022-01-25 22:08:56',2,2,'2022-01-25 22:08:56','activity'),(16,'657dcf8e-4f62-4105-b491-60ebe30e5c03','humhub\\modules\\activity\\models\\Activity',13,0,0,'0',0,'2022-01-25 22:08:57',3,'2022-01-25 22:08:57',3,2,'2022-01-25 22:08:57','activity'),(17,'cbb7156e-c5e1-43c2-b4c8-b764489b11ce','humhub\\modules\\activity\\models\\Activity',14,0,0,'0',0,'2022-01-25 22:08:57',3,'2022-01-25 22:08:57',3,2,'2022-01-25 22:08:57','activity'),(18,'24ab1e8e-ac57-48e5-a26f-96d4de81c7d4','humhub\\modules\\activity\\models\\Activity',15,0,0,'0',0,'2022-01-28 10:10:38',4,'2022-01-28 10:10:38',NULL,2,'2022-01-28 10:10:38','activity'),(19,'1ea93f8c-5fae-4f4e-ae06-4afa4db54f0f','humhub\\modules\\activity\\models\\Activity',16,1,0,'0',0,'2022-01-28 18:01:50',1,'2022-01-28 18:01:50',1,6,'2022-01-28 18:01:50','activity'),(20,'8dfceec5-a956-4350-b97e-d887b5aad9b2','humhub\\modules\\calendar\\models\\CalendarEntry',1,0,0,'0',0,'2022-01-28 18:04:19',1,'2022-01-28 18:04:20',1,6,'2022-01-28 18:04:20','default'),(21,'ddfffea6-92c9-429d-98d7-17a50785a94c','humhub\\modules\\activity\\models\\Activity',17,0,0,'0',0,'2022-01-28 18:04:20',1,'2022-01-28 18:04:20',1,6,'2022-01-28 18:04:20','activity'),(22,'ce57e92d-37b8-4f5e-ab56-be82b1dad44a','humhub\\modules\\activity\\models\\Activity',18,1,0,'0',0,'2022-01-28 18:06:47',1,'2022-01-28 18:06:47',1,7,'2022-01-28 18:06:47','activity'),(23,'31d13ba7-2403-4839-9d48-da40e2e0523c','humhub\\modules\\activity\\models\\Activity',19,1,0,'0',0,'2022-01-28 18:07:15',1,'2022-01-28 18:07:15',1,8,'2022-01-28 18:07:15','activity'),(24,'4fb0133b-0b3b-4eb5-8657-9ab29e77684c','humhub\\modules\\activity\\models\\Activity',20,1,0,'0',0,'2022-01-28 18:08:10',1,'2022-01-28 18:08:10',1,9,'2022-01-28 18:08:10','activity'),(25,'6a93e7b4-011d-42fa-92ed-a68f6b663c14','humhub\\modules\\activity\\models\\Activity',21,0,0,'0',0,'2022-01-28 19:50:21',5,'2022-01-28 19:50:21',NULL,2,'2022-01-28 19:50:21','activity'),(26,'b034bd51-998c-4084-aa5d-3ee602c1e0a9','humhub\\modules\\activity\\models\\Activity',22,0,0,'0',0,'2022-01-28 19:52:53',5,'2022-01-28 19:52:53',1,6,'2022-01-28 19:52:53','activity'),(27,'37b3d45b-12f9-4807-a786-fca9b4952018','humhub\\modules\\activity\\models\\Activity',23,1,0,'0',0,'2022-01-28 19:57:56',5,'2022-01-28 19:57:56',5,10,'2022-01-28 19:57:56','activity'),(28,'3384117f-659c-4b8a-9172-65bf194a970d','humhub\\modules\\activity\\models\\Activity',24,1,0,'0',0,'2022-01-28 19:58:27',1,'2022-01-28 19:58:27',1,1,'2022-01-28 19:58:27','activity'),(29,'4271c258-077c-4c73-9c5c-d8051f6c9c60','humhub\\modules\\activity\\models\\Activity',25,1,0,'0',0,'2022-01-28 20:01:23',5,'2022-01-28 20:01:23',5,11,'2022-01-28 20:01:23','activity'),(30,'1bcb2c4e-429a-4d18-a4d8-892b6ccebbd9','humhub\\modules\\calendar\\models\\CalendarEntry',2,1,0,'0',0,'2022-01-28 20:06:27',5,'2022-01-28 20:06:27',5,11,'2022-01-28 20:06:27','default'),(31,'3dc88219-2173-4ad0-abb5-a86ba1ffb399','humhub\\modules\\activity\\models\\Activity',26,1,0,'0',0,'2022-01-28 20:06:27',5,'2022-01-28 20:06:27',5,11,'2022-01-28 20:06:27','activity'),(32,'a8f99775-3576-4ee7-8a71-e9bb5361a11f','humhub\\modules\\activity\\models\\Activity',27,0,0,'0',0,'2022-01-30 15:58:19',1,'2022-01-30 15:58:19',1,11,'2022-01-30 15:58:19','activity'),(33,'ae20b579-e2c4-45a6-8e98-2ca3c55bf1c7','humhub\\modules\\activity\\models\\Activity',28,0,0,'0',0,'2022-01-31 10:30:51',6,'2022-01-31 10:30:51',NULL,2,'2022-01-31 10:30:51','activity'),(34,'4087963f-445f-4b1e-90e6-b40f415f9e80','humhub\\modules\\activity\\models\\Activity',29,0,0,'0',0,'2022-01-31 10:31:14',6,'2022-01-31 10:31:14',6,2,'2022-01-31 10:31:14','activity');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tag`
--

DROP TABLE IF EXISTS `content_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx-content-tag` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-content-tag-container-id` (`contentcontainer_id`),
  KEY `fk-content-tag-parent-id` (`parent_id`),
  CONSTRAINT `fk-content-tag-container-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-parent-id` FOREIGN KEY (`parent_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tag`
--

LOCK TABLES `content_tag` WRITE;
/*!40000 ALTER TABLE `content_tag` DISABLE KEYS */;
INSERT INTO `content_tag` VALUES (1,'Slogans','topic',2,'humhub\\modules\\topic\\models\\Topic',NULL,NULL,0),(2,'Réparation','topic',6,'humhub\\modules\\topic\\models\\Topic',NULL,NULL,0);
/*!40000 ALTER TABLE `content_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tag_relation`
--

DROP TABLE IF EXISTS `content_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tag_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-content-tag-rel-content-id` (`content_id`),
  KEY `fk-content-tag-rel-tag-id` (`tag_id`),
  CONSTRAINT `fk-content-tag-rel-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tag_relation`
--

LOCK TABLES `content_tag_relation` WRITE;
/*!40000 ALTER TABLE `content_tag_relation` DISABLE KEYS */;
INSERT INTO `content_tag_relation` VALUES (1,6,1),(2,20,2);
/*!40000 ALTER TABLE `content_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer`
--

DROP TABLE IF EXISTS `contentcontainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `tags_cached` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_target` (`class`,`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer`
--

LOCK TABLES `contentcontainer` WRITE;
/*!40000 ALTER TABLE `contentcontainer` DISABLE KEYS */;
INSERT INTO `contentcontainer` VALUES (1,'741d4314-a44a-4ae8-94af-8235a80977a9','humhub\\modules\\user\\models\\User',1,1,'Administration, Support, HumHub'),(2,'b967e712-5f23-4ffc-95c8-be848669e53e','humhub\\modules\\space\\models\\Space',1,1,NULL),(3,'891a835f-ba95-4c29-ab0c-cd01b555ae8f','humhub\\modules\\user\\models\\User',2,2,'Microsoft Office, Marketing, SEM, Digital Native'),(4,'48e5ab27-8849-4b7e-a2be-f69244a60b9b','humhub\\modules\\user\\models\\User',3,3,'Yoga, Travel, English, German, French'),(5,'0d10fd55-e3d6-40d5-b59c-84cb58990215','humhub\\modules\\user\\models\\User',4,4,'Producteur'),(6,'526fa0a0-b373-4e64-9f7d-a901bf1756d5','humhub\\modules\\space\\models\\Space',2,1,NULL),(7,'22333755-dac6-4397-ba89-101cd02dd73b','humhub\\modules\\space\\models\\Space',3,1,NULL),(8,'9ca15b1d-91b9-4c72-8c67-e6f35ab6ef27','humhub\\modules\\space\\models\\Space',4,1,NULL),(9,'b53844f2-974b-4ae3-ba59-7fbdc4ddf94a','humhub\\modules\\space\\models\\Space',5,1,NULL),(10,'3a2a6c2a-3ec5-4fd9-a310-c0e58a33b838','humhub\\modules\\user\\models\\User',5,5,NULL),(11,'5a71b22f-5b41-4ba9-a661-2a4e3973847a','humhub\\modules\\space\\models\\Space',6,5,'forge'),(12,'28a91cd3-520e-482d-973a-89be3da37e5c','humhub\\modules\\user\\models\\User',6,6,NULL);
/*!40000 ALTER TABLE `contentcontainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_blocked_users`
--

DROP TABLE IF EXISTS `contentcontainer_blocked_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_blocked_users` (
  `contentcontainer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`contentcontainer_id`,`user_id`),
  KEY `fk-contentcontainer-blocked-users-rel-user-id` (`user_id`),
  CONSTRAINT `fk-contentcontainer-blocked-users-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-contentcontainer-blocked-users-rel-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_blocked_users`
--

LOCK TABLES `contentcontainer_blocked_users` WRITE;
/*!40000 ALTER TABLE `contentcontainer_blocked_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_blocked_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_default_permission`
--

DROP TABLE IF EXISTS `contentcontainer_default_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_default_permission` (
  `permission_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_class` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_default_permission`
--

LOCK TABLES `contentcontainer_default_permission` WRITE;
/*!40000 ALTER TABLE `contentcontainer_default_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_default_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_module`
--

DROP TABLE IF EXISTS `contentcontainer_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_module` (
  `contentcontainer_id` int(11) NOT NULL,
  `module_id` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`contentcontainer_id`,`module_id`),
  CONSTRAINT `fk_contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_module`
--

LOCK TABLES `contentcontainer_module` WRITE;
/*!40000 ALTER TABLE `contentcontainer_module` DISABLE KEYS */;
INSERT INTO `contentcontainer_module` VALUES (2,'polls',1),(6,'calendar',1),(6,'custom_pages',1),(6,'polls',1),(6,'tasks',1),(6,'wiki',1),(7,'polls',1),(8,'custom_pages',1),(9,'calendar',1),(11,'calendar',1),(11,'polls',1),(11,'tasks',1),(11,'wiki',1);
/*!40000 ALTER TABLE `contentcontainer_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_permission`
--

DROP TABLE IF EXISTS `contentcontainer_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_permission` (
  `permission_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `group_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_permission`
--

LOCK TABLES `contentcontainer_permission` WRITE;
/*!40000 ALTER TABLE `contentcontainer_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentcontainer_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_setting`
--

DROP TABLE IF EXISTS `contentcontainer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings-unique` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-contentcontainerx` (`contentcontainer_id`),
  CONSTRAINT `fk-contentcontainerx` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_setting`
--

LOCK TABLES `contentcontainer_setting` WRITE;
/*!40000 ALTER TABLE `contentcontainer_setting` DISABLE KEYS */;
INSERT INTO `contentcontainer_setting` VALUES (1,'calendar',1,'lastSelectors','[]'),(2,'calendar',1,'lastFilters','[]'),(3,'activity',1,'mailSummaryLast','1643652064'),(4,'activity',3,'mailSummaryLast','1643652064'),(5,'activity',4,'mailSummaryLast','1643652064'),(6,'tour',1,'interface','1'),(7,'tour',1,'spaces','1'),(8,'tour',1,'profile','1'),(9,'tour',1,'administration','1'),(12,'tour',5,'hideTourPanel','0'),(13,'breakingnews',1,'timestamp','1643394325'),(14,'breakingnews',10,'timestamp','1643394325'),(15,'calendar',10,'lastSelectors','[]'),(16,'calendar',10,'lastFilters','[]'),(17,'activity',5,'mailSummaryLast','1643652065'),(18,'activity',10,'mailSummaryLast','1643652066'),(19,'breakingnews',12,'timestamp','1643394325');
/*!40000 ALTER TABLE `contentcontainer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_tag`
--

DROP TABLE IF EXISTS `contentcontainer_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_class` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-contentcontainer-tag` (`contentcontainer_class`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_tag`
--

LOCK TABLES `contentcontainer_tag` WRITE;
/*!40000 ALTER TABLE `contentcontainer_tag` DISABLE KEYS */;
INSERT INTO `contentcontainer_tag` VALUES (14,'forge','humhub\\modules\\space\\models\\Space'),(1,'Administration','humhub\\modules\\user\\models\\User'),(7,'Digital Native','humhub\\modules\\user\\models\\User'),(10,'English','humhub\\modules\\user\\models\\User'),(12,'French','humhub\\modules\\user\\models\\User'),(11,'German','humhub\\modules\\user\\models\\User'),(3,'HumHub','humhub\\modules\\user\\models\\User'),(5,'Marketing','humhub\\modules\\user\\models\\User'),(4,'Microsoft Office','humhub\\modules\\user\\models\\User'),(13,'Producteur','humhub\\modules\\user\\models\\User'),(6,'SEM','humhub\\modules\\user\\models\\User'),(2,'Support','humhub\\modules\\user\\models\\User'),(9,'Travel','humhub\\modules\\user\\models\\User'),(8,'Yoga','humhub\\modules\\user\\models\\User');
/*!40000 ALTER TABLE `contentcontainer_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentcontainer_tag_relation`
--

DROP TABLE IF EXISTS `contentcontainer_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentcontainer_tag_relation` (
  `contentcontainer_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`contentcontainer_id`,`tag_id`),
  KEY `fk-contentcontainer-tag-rel-tag-id` (`tag_id`),
  CONSTRAINT `fk-contentcontainer-tag-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-contentcontainer-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `contentcontainer_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentcontainer_tag_relation`
--

LOCK TABLES `contentcontainer_tag_relation` WRITE;
/*!40000 ALTER TABLE `contentcontainer_tag_relation` DISABLE KEYS */;
INSERT INTO `contentcontainer_tag_relation` VALUES (1,1),(1,2),(1,3),(3,4),(3,5),(3,6),(3,7),(4,8),(4,9),(4,10),(4,11),(4,12),(5,13),(11,14);
/*!40000 ALTER TABLE `contentcontainer_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_container_page`
--

DROP TABLE IF EXISTS `custom_pages_container_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_container_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `in_new_window` tinyint(1) DEFAULT 0,
  `admin_only` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SpaceMenu',
  `abstract` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_container_page`
--

LOCK TABLES `custom_pages_container_page` WRITE;
/*!40000 ALTER TABLE `custom_pages_container_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_container_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_container_snippet`
--

DROP TABLE IF EXISTS `custom_pages_container_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_container_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `admin_only` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SpaceStreamSidebar',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_container_snippet`
--

LOCK TABLES `custom_pages_container_snippet` WRITE;
/*!40000 ALTER TABLE `custom_pages_container_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_container_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_page`
--

DROP TABLE IF EXISTS `custom_pages_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_only` tinyint(1) DEFAULT 0,
  `in_new_window` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abstract` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom-page-url-unique` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_page`
--

LOCK TABLES `custom_pages_page` WRITE;
/*!40000 ALTER TABLE `custom_pages_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_snippet`
--

DROP TABLE IF EXISTS `custom_pages_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_only` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_snippet`
--

LOCK TABLES `custom_pages_snippet` WRITE;
/*!40000 ALTER TABLE `custom_pages_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template`
--

DROP TABLE IF EXISTS `custom_pages_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_for_spaces` tinyint(1) DEFAULT 0,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `allow_inline_activation` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tmpl_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template`
--

LOCK TABLES `custom_pages_template` WRITE;
/*!40000 ALTER TABLE `custom_pages_template` DISABLE KEYS */;
INSERT INTO `custom_pages_template` VALUES (1,'system_two_column_layout','twig','Simple two column layout.','<div class=\"row\">\n	<div class=\"col-md-8\">\n		<div class=\"panel panel-default\">\n			<div class=\"panel-body\">\n				{{ content }}\n			</div>\n		</div>\n	</div>\n	<div class=\"col-md-4\">\n		<div class=\"panel panel-default\">\n			<div class=\"panel-body\">\n				{{ sidebar_container }}\n			</div>\n		</div>\n	</div>\n</div>',0,'layout','2022-01-26 15:33:36',NULL,NULL,NULL,0),(2,'system_one_column_layout','twig','Simple one column layout.','<div class=\"row\">\n	<div class=\"col-md-12\">\n            <div class=\"panel panel-default\">\n			<div class=\"panel-body\">\n                            {{ content }}\n                        </div>\n            </div>\n	</div>\n</div>',0,'layout','2022-01-26 15:33:37',NULL,NULL,NULL,0),(3,'system_headline_container','twig','Simple headline row with background image.','{% if background.empty %}\n    {% set bg = assets[\'bgImage2.jpg\']  %}\n{% else %}\n    {% set bg =  background %}\n{% endif %}\n\n<div style=\"height:218px;overflow:hidden;color:#fff;background-image: url(\'{{ bg }}\');background-position:50% 50%;text-align:center;\">\n	<div style=\"padding-top:40px;\">\n		<h1 style=\"color:#fff;font-size:36px;margin:20px 0 10px;\">{{ heading }}</h1>\n		<hr style=\"max-width:100px;border-width:3px;\">\n		 <span>{{ subheading }}</span>\n  	 </div>\n</div>',0,'container','2022-01-26 15:33:37',NULL,NULL,NULL,0),(4,'system_article_container','twig','Simple richtext article.','<div style=\"margin-top:15px;\">\n	<div style=\"padding:0 15px;\">\n		{{ content }}\n	</div>\n</div>',0,'container','2022-01-26 15:33:38',NULL,NULL,NULL,0),(5,'system_simple_snippet_layout','twig','Simple snippet layout with head container and richtext.','<div>\n        {{ heading }}\n</div>\n<div style=\"margin-top:15px;\">\n	{{ content }}\n</div>',0,'snipped-layout','2022-01-26 15:33:38',NULL,NULL,NULL,0),(6,'system_download_item','twig','Single download item.','<div class=\"download-item\">\n    {{ file_download }}\n</div>',0,'container','2022-01-26 15:33:41',NULL,NULL,NULL,0),(7,'system_download_list','twig','File download list.','<div class=\"download-list\">\n    {{ download_list }}\n</div>',0,'container','2022-01-26 15:33:41',NULL,NULL,NULL,0),(8,'system_plain_layout','twig','Simple container layout.','{{ content }}',0,'layout','2022-01-26 15:33:43',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `custom_pages_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container`
--

DROP TABLE IF EXISTS `custom_pages_template_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-template` (`template_id`),
  CONSTRAINT `fk-tmpl-template` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container`
--

LOCK TABLES `custom_pages_template_container` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content`
--

DROP TABLE IF EXISTS `custom_pages_template_container_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-definition` (`definition_id`),
  CONSTRAINT `fk-tmpl-container-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_container_content_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content`
--

LOCK TABLES `custom_pages_template_container_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_container_content` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `custom_pages_template_container_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content_definition`
--

DROP TABLE IF EXISTS `custom_pages_template_container_content_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allow_multiple` tinyint(1) DEFAULT 0,
  `is_inline` tinyint(1) DEFAULT 0,
  `is_default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content_definition`
--

LOCK TABLES `custom_pages_template_container_content_definition` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content_definition` DISABLE KEYS */;
INSERT INTO `custom_pages_template_container_content_definition` VALUES (1,1,0,1),(2,1,0,1),(3,1,0,1),(4,0,0,1),(5,1,0,1),(6,1,0,1);
/*!40000 ALTER TABLE `custom_pages_template_container_content_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content_item`
--

DROP TABLE IF EXISTS `custom_pages_template_container_content_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `container_content_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT 100,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-item-tmpl` (`template_id`),
  KEY `fk-tmpl-container-item-content` (`container_content_id`),
  CONSTRAINT `fk-tmpl-container-item-content` FOREIGN KEY (`container_content_id`) REFERENCES `custom_pages_template_container_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-tmpl-container-item-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content_item`
--

LOCK TABLES `custom_pages_template_container_content_item` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_container_content_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_container_content_template`
--

DROP TABLE IF EXISTS `custom_pages_template_container_content_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_container_content_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `definition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-tmpl` (`template_id`),
  KEY `fk-tmpl-container-tmpl-definition` (`definition_id`),
  CONSTRAINT `fk-tmpl-container-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-tmpl-container-tmpl-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_container_content_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_container_content_template`
--

LOCK TABLES `custom_pages_template_container_content_template` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_container_content_template` DISABLE KEYS */;
INSERT INTO `custom_pages_template_container_content_template` VALUES (1,3,4),(2,6,5);
/*!40000 ALTER TABLE `custom_pages_template_container_content_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_element`
--

DROP TABLE IF EXISTS `custom_pages_template_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-element-tmpl` (`template_id`),
  CONSTRAINT `fk-tmpl-element-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_element`
--

LOCK TABLES `custom_pages_template_element` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_element` DISABLE KEYS */;
INSERT INTO `custom_pages_template_element` VALUES (1,1,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',NULL),(2,1,'sidebar_container','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',NULL),(3,2,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',NULL),(4,3,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent',NULL),(5,3,'subheading','humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent',NULL),(6,3,'background','humhub\\modules\\custom_pages\\modules\\template\\models\\FileContent',NULL),(7,4,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent',NULL),(8,5,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',NULL),(9,5,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent',NULL),(10,6,'file_download','humhub\\modules\\custom_pages\\modules\\template\\models\\FileDownloadContent','File'),(11,7,'download_list','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent','File List'),(12,8,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',NULL);
/*!40000 ALTER TABLE `custom_pages_template_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_file_content`
--

DROP TABLE IF EXISTS `custom_pages_template_file_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_file_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_file_content`
--

LOCK TABLES `custom_pages_template_file_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_file_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_file_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_file_download_content`
--

DROP TABLE IF EXISTS `custom_pages_template_file_download_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_file_download_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `showFileinfo` tinyint(1) DEFAULT 1,
  `showIcon` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_file_download_content`
--

LOCK TABLES `custom_pages_template_file_download_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_file_download_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_file_download_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_hh_richtext_content`
--

DROP TABLE IF EXISTS `custom_pages_template_hh_richtext_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_hh_richtext_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_hh_richtext_content`
--

LOCK TABLES `custom_pages_template_hh_richtext_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_hh_richtext_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_hh_richtext_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_image_content`
--

DROP TABLE IF EXISTS `custom_pages_template_image_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_image_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-image-definition` (`definition_id`),
  CONSTRAINT `fk-tmpl-image-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_image_content_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_image_content`
--

LOCK TABLES `custom_pages_template_image_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_image_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_image_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_image_content_definition`
--

DROP TABLE IF EXISTS `custom_pages_template_image_content_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_image_content_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `style` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_image_content_definition`
--

LOCK TABLES `custom_pages_template_image_content_definition` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_image_content_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pages_template_image_content_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_owner_content`
--

DROP TABLE IF EXISTS `custom_pages_template_owner_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_owner_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_id` int(11) NOT NULL,
  `use_default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_owner_content`
--

LOCK TABLES `custom_pages_template_owner_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_owner_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_owner_content` VALUES (1,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',1,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',1,0),(2,'sidebar_container','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',1,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',2,0),(3,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',2,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',3,0),(4,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',3,'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent',1,0),(5,'subheading','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',3,'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent',2,0),(6,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',4,'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent',1,0),(7,'heading','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',5,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',4,0),(8,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',5,'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent',2,0),(9,'download_list','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',7,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',5,0),(10,'content','humhub\\modules\\custom_pages\\modules\\template\\models\\Template',8,'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent',6,0);
/*!40000 ALTER TABLE `custom_pages_template_owner_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_richtext_content`
--

DROP TABLE IF EXISTS `custom_pages_template_richtext_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_richtext_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_richtext_content`
--

LOCK TABLES `custom_pages_template_richtext_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_richtext_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_richtext_content` VALUES (1,'<h1>This is a&nbsp;simple article!</h1>\n\n<hr />\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\n'),(2,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>');
/*!40000 ALTER TABLE `custom_pages_template_richtext_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pages_template_text_content`
--

DROP TABLE IF EXISTS `custom_pages_template_text_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_pages_template_text_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `inline_text` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages_template_text_content`
--

LOCK TABLES `custom_pages_template_text_content` WRITE;
/*!40000 ALTER TABLE `custom_pages_template_text_content` DISABLE KEYS */;
INSERT INTO `custom_pages_template_text_content` VALUES (1,'My Headline',1),(2,'My Subheadline',1);
/*!40000 ALTER TABLE `custom_pages_template_text_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `object_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `show_in_stream` tinyint(1) DEFAULT 1,
  `hash_sha1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onlyoffice_key` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`),
  KEY `fk_file-created_by` (`created_by`),
  CONSTRAINT `fk_file-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_history`
--

DROP TABLE IF EXISTS `file_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `size` bigint(20) NOT NULL,
  `hash_sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_history` (`file_id`),
  KEY `fk_file_history_user` (`created_by`),
  CONSTRAINT `fk_file_history` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_file_history_user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_history`
--

LOCK TABLES `file_history` WRITE;
/*!40000 ALTER TABLE `file_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `show_at_registration` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_directory` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `notify_users` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'Administrators','Default group for administrators of this HumHub Installation','2022-01-25 22:03:09',NULL,NULL,NULL,NULL,1,0,0,0,0,100,0),(2,'Users','Default group for all newly registered users of the network','2022-01-25 22:04:22',NULL,'2022-01-25 22:04:22',NULL,NULL,0,1,0,1,0,100,0);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_permission`
--

DROP TABLE IF EXISTS `group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_permission` (
  `permission_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`),
  KEY `fk_group_permission-group_id` (`group_id`),
  CONSTRAINT `fk_group_permission-group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_permission`
--

LOCK TABLES `group_permission` WRITE;
/*!40000 ALTER TABLE `group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_space`
--

DROP TABLE IF EXISTS `group_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_space` (`space_id`,`group_id`),
  KEY `fk-group_space-group` (`group_id`),
  CONSTRAINT `fk-group_space-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-group_space-space` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_space`
--

LOCK TABLES `group_space` WRITE;
/*!40000 ALTER TABLE `group_space` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_group_manager` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_user` (`user_id`,`group_id`),
  KEY `fk-group-group` (`group_id`),
  CONSTRAINT `fk-group-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user-group` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,1,1,0,'2022-01-25 22:08:31',NULL,'2022-01-25 22:08:31',NULL),(2,2,2,0,'2022-01-25 22:08:49',1,'2022-01-25 22:08:49',1),(3,3,2,0,'2022-01-25 22:08:52',1,'2022-01-25 22:08:52',1),(4,4,2,0,'2022-01-28 10:10:39',NULL,'2022-01-28 10:10:39',NULL),(5,5,2,0,'2022-01-28 19:50:21',NULL,'2022-01-28 19:50:21',NULL),(6,6,2,0,'2022-01-31 10:30:52',NULL,'2022-01-31 10:30:52',NULL),(7,6,1,0,'2022-01-31 10:31:38',1,'2022-01-31 10:31:38',1);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`),
  KEY `fk_like-created_by` (`created_by`),
  KEY `fk_like-target_user_id` (`target_user_id`),
  CONSTRAINT `fk_like-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like-target_user_id` FOREIGN KEY (`target_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,NULL,'humhub\\modules\\comment\\models\\Comment',1,'2022-01-25 22:08:54',3,'2022-01-25 22:08:54',3),(2,NULL,'humhub\\modules\\post\\models\\Post',2,'2022-01-25 22:08:54',3,'2022-01-25 22:08:54',3);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live`
--

DROP TABLE IF EXISTS `live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `visibility` int(1) DEFAULT NULL,
  `serialized_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentcontainer` (`contentcontainer_id`),
  CONSTRAINT `contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live`
--

LOCK TABLES `live` WRITE;
/*!40000 ALTER TABLE `live` DISABLE KEYS */;
/*!40000 ALTER TABLE `live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_updated` (`updated_at`),
  KEY `index_updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_entry`
--

DROP TABLE IF EXISTS `message_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_entry`
--

LOCK TABLES `message_entry` WRITE;
/*!40000 ALTER TABLE `message_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_tag`
--

DROP TABLE IF EXISTS `message_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-message-tag-user-id` (`user_id`),
  CONSTRAINT `fk-message-tag-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_tag`
--

LOCK TABLES `message_tag` WRITE;
/*!40000 ALTER TABLE `message_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1643148082),('m131023_164513_initial',1643148088),('m131023_165214_initial',1643394963),('m131023_165411_initial',1643148089),('m131023_165507_initial',1643148409),('m131023_165625_initial',1643148090),('m131023_165755_initial',1643148092),('m131023_165835_initial',1643148092),('m131023_165921_initial',1643148397),('m131023_170033_initial',1643148092),('m131023_170135_initial',1643148093),('m131023_170159_initial',1643148093),('m131023_170253_initial',1643148093),('m131023_170339_initial',1643148094),('m131030_122743_longer_questions',1643148398),('m131203_110444_oembed',1643148094),('m131213_165552_user_optimize',1643148097),('m140226_111945_ldap',1643148097),('m140303_125031_password',1643148099),('m140304_142711_memberautoadd',1643148099),('m140321_000917_content',1643148100),('m140324_170617_membership',1643148100),('m140507_150421_create_settings_table',1643148102),('m140507_171527_create_settings_table',1643148103),('m140512_141414_i18n_profilefields',1643148103),('m140513_180317_createlogging',1643148103),('m140701_000611_profile_genderfield',1643148103),('m140701_074404_protect_default_profilefields',1643148103),('m140702_143912_notify_notification_unify',1643148104),('m140703_104527_profile_birthdayfield',1643148104),('m140704_080659_installationid',1643148104),('m140705_065525_emailing_settings',1643148106),('m140706_135210_lastlogin',1643148107),('m140729_223509_initial',1643211143),('m140812_093445_rename_deadline_column',1643394964),('m140829_122906_delete',1643148108),('m140830_145504_following',1643148110),('m140901_080147_indizies',1643148110),('m140901_080432_indices',1643148110),('m140901_112246_addState',1643148113),('m140901_153403_addState',1643148116),('m140901_170329_group_create_space',1643148116),('m140902_091234_session_key_length',1643148117),('m140907_140822_zip_field_to_text',1643148117),('m140930_045035_initial',1643211199),('m140930_205511_fix_default',1643148120),('m140930_205859_fix_default',1643148121),('m140930_210142_fix_default',1643148123),('m140930_210635_fix_default',1643148125),('m140930_212528_fix_default',1643148126),('m141002_084750_fix_default',1643394964),('m141002_092800_fix_deadline',1643394964),('m141002_093710_fix_default',1643148399),('m141004_022835_initial',1643394472),('m141015_173305_follow_notifications',1643148127),('m141019_093319_mentioning',1643148128),('m141020_162639_fix_default',1643148131),('m141020_193920_rm_alsocreated',1643148131),('m141020_193931_rm_alsoliked',1643148131),('m141021_162639_oembed_setting',1643148131),('m141022_094635_addDefaults',1643148131),('m141026_135537_adminOnly',1643211199),('m141106_185632_log_init',1643148132),('m150204_103433_html5_notified',1643148132),('m150210_190006_user_invite_lang',1643148132),('m150302_114347_add_visibility',1643148133),('m150322_194403_remove_type_field',1643148133),('m150322_195619_allowedExt2Text',1643148133),('m150429_190600_indexes',1643148411),('m150429_223856_optimize',1643148135),('m150629_220311_change',1643148135),('m150703_012735_typelength',1643148137),('m150703_024635_activityTypes',1643148137),('m150703_033650_namespace',1643148137),('m150703_130157_migrate',1643148137),('m150704_005338_namespace',1643148137),('m150704_005418_namespace',1643148137),('m150704_005434_namespace',1643148137),('m150704_005452_namespace',1643148137),('m150704_005504_namespace',1643148138),('m150705_081309_namespace',1643394472),('m150706_193118_renamefield',1643211143),('m150707_134615_update',1643211143),('m150709_050451_namespace',1643148411),('m150709_050452_message_tags',1643148412),('m150709_050453_conversation_tags',1643148416),('m150709_151858_namespace',1643148399),('m150710_055123_namespace',1643394964),('m150713_054441_timezone',1643148138),('m150714_093525_activity',1643148140),('m150714_100355_cleanup',1643148144),('m150831_061628_notifications',1643148144),('m150910_223305_fix_user_follow',1643148144),('m150916_131805_container',1643211199),('m150917_104409_add_new_windows',1643211200),('m150924_133344_update_notification_fix',1643148145),('m150924_154635_user_invite_add_first_lastname',1643148145),('m150927_190830_create_contentcontainer',1643148148),('m150928_103711_permissions',1643148149),('m150928_134934_groups',1643148152),('m150928_140718_setColorVariables',1643148152),('m151010_124437_group_permissions',1643148154),('m151010_175000_default_visibility',1643148154),('m151013_223814_include_dashboard',1643148154),('m151022_131128_module_fix',1643148154),('m151106_090948_addColor',1643148154),('m151223_171310_fix_notifications',1643148154),('m151224_162440_fix_module_id_notifications',1643394964),('m151226_164234_authclient',1643148156),('m160125_053702_stored_filename',1643148156),('m160205_203840_foreign_keys',1643148166),('m160205_203913_foreign_keys',1643148170),('m160205_203939_foreign_keys',1643148171),('m160205_203955_foreign_keys',1643148173),('m160205_204000_foreign_keys',1643148174),('m160205_204010_foreign_keys',1643148175),('m160205_205540_foreign_keys',1643148177),('m160216_160119_initial',1643148180),('m160217_161220_addCanLeaveFlag',1643148180),('m160218_132531_close_and_anonymous_poll',1643148399),('m160220_013525_contentcontainer_id',1643148185),('m160221_222312_public_permission_change',1643148185),('m160225_180229_remove_website',1643148185),('m160227_073020_birthday_date',1643148186),('m160229_162959_multiusergroups',1643148191),('m160309_141222_longerUserName',1643148191),('m160408_100725_rename_groupadmin_to_manager',1643148191),('m160415_180332_wall_remove',1643148194),('m160501_220850_activity_pk_int',1643148195),('m160507_202611_settings',1643148197),('m160508_005740_settings_cleanup',1643148202),('m160509_214811_spaceurl',1643148202),('m160517_132535_group',1643148203),('m160523_105732_profile_searchable',1643148203),('m160714_142827_remove_space_id',1643148204),('m160719_131212_init_templates',1643211213),('m160808_124800_text_content',1643211213),('m160817_130334_page_content_medium_text',1643211214),('m160831_133950_snippets',1643211215),('m160907_122454_file_content',1643211216),('m160907_175706_default_templates',1643211219),('m160908_084038_admin_only_other_pagetypes',1643211219),('m160922_092100_page_class',1643211219),('m160922_115053_page_url',1643211220),('m160922_143514_page_url_index',1643211220),('m161031_161947_file_directories',1643148204),('m170110_151419_membership_notifications',1643148204),('m170110_152425_space_follow_reset_send_notification',1643148204),('m170111_190400_disable_web_notifications',1643148204),('m170112_115052_settings',1643148205),('m170118_162332_streamchannel',1643148207),('m170119_160740_initial',1643148208),('m170122_091531_missingdefault',1643394964),('m170123_125622_pinned',1643148208),('m170211_105743_show_in_stream',1643148208),('m170224_100937_fix_default_modules',1643148208),('m170322_102446_removeContainerPagesFromStream',1643211220),('m170410_222653_eventColors',1643211144),('m170411_124612_fileDownloadContent',1643211220),('m170412_152540_template_element_label',1643211221),('m170412_163156_allow_inline_activation',1643211221),('m170413_085114_download_link_template',1643211221),('m170717_123220_allow_maybe_decline_flag',1643211144),('m170717_124743_safe_form_timezone',1643211144),('m170717_205750_participant_info',1643211144),('m170721_203204_close_event',1643211144),('m170723_133337_content_tag',1643148214),('m170723_133338_content_tag_sort_order',1643148214),('m170724_190633_max_participants',1643211144),('m170805_211208_authclient_id',1643148214),('m170810_220543_group_sort',1643148214),('m171015_155102_contentcontainer_module',1643148217),('m171025_142030_queue_update',1643148218),('m171025_200312_utf8mb4_fixes',1643148218),('m171027_185418_user_id_index',1643211145),('m171027_185419_uid',1643211146),('m171027_185420_reminder',1643211150),('m171027_185421_drop_legacy_columns',1643211153),('m171027_185422_recurrence',1643211154),('m171027_185423_sequence',1643211154),('m171027_220519_exclusive_jobs',1643148219),('m180305_084435_membership_pk',1643148223),('m180315_112748_fix_email_length',1643148225),('m180327_125017_show_result_after_close',1643148399),('m180411_093623_checklist_and_revision',1643394971),('m180413_145745_categories',1643394473),('m180502_142535_renameclasses',1643394971),('m180504_092302_permission_name_and_list_updated_at',1643394971),('m180515_120940_list_settings_updated_at',1643394971),('m180515_120941_added_uid',1643394972),('m180907_224038_page_sort_order',1643394474),('m181029_160453_collation',1643148231),('m190211_133045_channel_length',1643148231),('m190213_135902_align_page_types',1643211222),('m190213_135903_humhub_richtext_content',1643211222),('m190213_135904_page_abstract',1643211223),('m190213_135905_blank_template',1643211223),('m190213_135906_text_edit_mode',1643211223),('m190309_201944_rename_settings',1643148231),('m190920_142605_fix_language_codes',1643148231),('m200217_122108_profile_translation_fix',1643148231),('m200218_122109_profile_translation_fix2',1643148231),('m200323_162006_fix_visibility',1643148231),('m200401_101409_file_oo_key',1643394630),('m200401_164457_shareLinks',1643394632),('m200604_204445_remove_post_field',1643148232),('m200715_171721_defaultOption',1643148232),('m200715_184207_commentIndex',1643148232),('m200729_080349_commentIndex_fix_order',1643148232),('m200930_151639_add_about',1643148233),('m201013_172104_add_calendar_entry_location',1643211155),('m201020_125649_question_description',1643148400),('m201020_130431_fix_default_file_setting_value',1643148234),('m201025_095247_spaces_of_users_group',1643148237),('m201115_083832_add_notify_users_to_group',1643148237),('m201125_034854_alter_content_type_in_wiki_page_review',1643394475),('m201130_073907_default_permissions',1643148238),('m201130_073908_disable_legacy_richtextparser',1643148239),('m201208_045103_fix_account_menu_visibility',1643211223),('m201217_081828_fix_oembed_setting',1643148239),('m201228_064513_default_group',1643148239),('m210111_105355_hash',1643148240),('m210203_122333_profilePermissions',1643148240),('m210204_054203_fix_settings_unique_index',1643148240),('m210211_051243_container_tag',1643148245),('m210217_055359_protected_group',1643148246),('m210310_103412_fix_hash',1643148246),('m210331_115144_default_timezone',1643148246),('m210506_060737_profile_field_directory_filter',1643148247),('m210618_131400_is_container_menu',1643394475),('m210721_055137_content_locked_comments',1643148248),('m210727_102150_follow_friend',1643148248),('m210924_114847_container_blocked_users',1643148251),('m211022_152413_file_history',1643148254),('m211124_180441_admin_group_label',1643148254);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_enabled`
--

DROP TABLE IF EXISTS `module_enabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_enabled` (
  `module_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_enabled`
--

LOCK TABLES `module_enabled` WRITE;
/*!40000 ALTER TABLE `module_enabled` DISABLE KEYS */;
INSERT INTO `module_enabled` VALUES ('birthday'),('breakingnews'),('calendar'),('custom_pages'),('jitsi-meet'),('mail'),('mostactiveusers'),('newmembers'),('onlyoffice'),('polls'),('popover-vcard'),('tasks'),('usermap'),('wiki');
/*!40000 ALTER TABLE `module_enabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `desktop_notified` tinyint(1) DEFAULT 0,
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `group_key` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_web_notifications` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_seen` (`seen`),
  KEY `index_desktop_notified` (`desktop_notified`),
  KEY `index_desktop_emailed` (`emailed`),
  KEY `index_groupuser` (`user_id`,`class`,`group_key`),
  CONSTRAINT `fk_notification-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'humhub\\modules\\comment\\notifications\\NewComment',1,1,'humhub\\modules\\comment\\models\\Comment',1,1,0,'2022-01-25 22:08:58',1,2,'comment','humhub\\modules\\post\\models\\Post-2',1),(2,'humhub\\modules\\comment\\notifications\\NewComment',3,0,'humhub\\modules\\comment\\models\\Comment',1,1,0,'2022-01-25 22:08:58',0,2,'comment','humhub\\modules\\post\\models\\Post-2',1),(3,'humhub\\modules\\comment\\notifications\\NewComment',1,1,'humhub\\modules\\comment\\models\\Comment',2,1,0,'2022-01-25 22:08:59',1,3,'comment','humhub\\modules\\post\\models\\Post-2',1),(4,'humhub\\modules\\comment\\notifications\\NewComment',2,0,'humhub\\modules\\comment\\models\\Comment',2,1,0,'2022-01-25 22:08:59',0,3,'comment','humhub\\modules\\post\\models\\Post-2',1),(5,'humhub\\modules\\like\\notifications\\NewLike',2,0,'humhub\\modules\\like\\models\\Like',1,1,0,'2022-01-25 22:08:59',0,3,'like','humhub\\modules\\comment\\models\\Comment-1',1),(6,'humhub\\modules\\like\\notifications\\NewLike',1,1,'humhub\\modules\\like\\models\\Like',2,1,0,'2022-01-25 22:08:59',1,3,'like','humhub\\modules\\post\\models\\Post-2',1),(7,'humhub\\modules\\comment\\notifications\\NewComment',1,1,'humhub\\modules\\comment\\models\\Comment',3,1,0,'2022-01-25 22:09:00',1,2,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(8,'humhub\\modules\\comment\\notifications\\NewComment',3,0,'humhub\\modules\\comment\\models\\Comment',3,1,0,'2022-01-25 22:09:00',0,2,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(9,'humhub\\modules\\comment\\notifications\\NewComment',1,1,'humhub\\modules\\comment\\models\\Comment',4,1,0,'2022-01-25 22:09:01',1,3,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(10,'humhub\\modules\\comment\\notifications\\NewComment',2,0,'humhub\\modules\\comment\\models\\Comment',4,1,0,'2022-01-25 22:09:01',0,3,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(11,'humhub\\modules\\space\\notifications\\Invite',4,0,'humhub\\modules\\space\\models\\Space',2,2,0,'2022-01-28 18:03:02',0,1,'space',NULL,1),(12,'humhub\\modules\\space\\notifications\\ApprovalRequest',1,1,'humhub\\modules\\space\\models\\Space',2,2,0,'2022-01-28 19:53:02',1,5,'space',NULL,1),(13,'humhub\\modules\\space\\notifications\\ApprovalRequestAccepted',5,1,'humhub\\modules\\space\\models\\Space',2,2,0,'2022-01-28 19:53:04',1,1,'space',NULL,1),(15,'humhub\\modules\\user\\notifications\\Followed',1,1,'humhub\\modules\\user\\models\\Follow',10,NULL,0,'2022-01-28 19:58:04',1,5,'user',NULL,1),(16,'humhub\\modules\\friendship\\notifications\\RequestApproved',5,1,'humhub\\modules\\friendship\\models\\Friendship',2,NULL,0,'2022-01-28 19:59:02',1,1,'friendship',NULL,1),(17,'humhub\\modules\\user\\notifications\\Followed',5,1,'humhub\\modules\\user\\models\\Follow',11,NULL,0,'2022-01-28 19:59:04',1,1,'user',NULL,1),(19,'humhub\\modules\\space\\notifications\\InviteAccepted',5,0,'humhub\\modules\\space\\models\\Space',6,6,0,'2022-01-30 15:59:02',0,1,'space',NULL,1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlyoffice_share`
--

DROP TABLE IF EXISTS `onlyoffice_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlyoffice_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `mode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_onlyoffice_share_unq` (`file_id`,`mode`),
  CONSTRAINT `fk_file` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlyoffice_share`
--

LOCK TABLES `onlyoffice_share` WRITE;
/*!40000 ALTER TABLE `onlyoffice_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `onlyoffice_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_multiple` smallint(6) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_random` tinyint(1) DEFAULT 0,
  `closed` tinyint(1) DEFAULT 0,
  `anonymous` tinyint(1) DEFAULT 0,
  `show_result_after_close` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` VALUES (1,'Location of the next meeting','Nous sommes en train de préparer notre prochaine rencontre, et nous voudrions savoir où vous aimeriez aller ?',0,'2022-01-25 22:08:55',1,'2022-01-25 22:08:55',1,0,0,0,0);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer`
--

DROP TABLE IF EXISTS `poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer`
--

LOCK TABLES `poll_answer` WRITE;
/*!40000 ALTER TABLE `poll_answer` DISABLE KEYS */;
INSERT INTO `poll_answer` VALUES (1,1,'Chez Daniel','2022-01-25 22:08:55',1,'2022-01-25 22:08:55',1),(2,1,'Hippopotamus','2022-01-25 22:08:55',1,'2022-01-25 22:08:55',1),(3,1,'Panini chez Pisillo','2022-01-25 22:08:55',1,'2022-01-25 22:08:55',1);
/*!40000 ALTER TABLE `poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer_user`
--

DROP TABLE IF EXISTS `poll_answer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `poll_answer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer_user`
--

LOCK TABLES `poll_answer_user` WRITE;
/*!40000 ALTER TABLE `poll_answer_user` DISABLE KEYS */;
INSERT INTO `poll_answer_user` VALUES (1,1,2,'2022-01-25 22:08:56',2,'2022-01-25 22:08:56',2),(2,1,3,'2022-01-25 22:08:56',3,'2022-01-25 22:08:56',3),(3,1,2,'2022-01-31 10:31:14',6,'2022-01-31 10:31:14',6);
/*!40000 ALTER TABLE `poll_answer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Yay ! Je viens d\'installer HumHub :sunglasses:',NULL,'2022-01-25 22:08:32',1,'2022-01-25 22:08:32',1),(2,'Nous cherchons des slogans formidables de marques connues. Peut-être pouvez-vous apporter des exemples ?',NULL,'2022-01-25 22:08:52',1,'2022-01-25 22:08:52',1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_private` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `im_skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `im_xmpp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_xing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_vimeo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_flickr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_myspace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profile-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Duy Minh','Vu','System Administration','male','9 Passage de la Main d\'Or','75011','PARIS','FR','Paris',0,'1961-07-08','Photographe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'David','Roberts','Late riser',NULL,'2443 Queens Lane','24574','Allwood','Virginia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Sara','Schuster','Do-gooder',NULL,'Schmarjestrasse 51','17095','Friedland','Niedersachsen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Michel','UtilisateurPourTest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Antoinette','Franc de Ferrière',NULL,'female','2599 Route de Montaigne','24610','Montpeyroux','FR',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Abel','Pouillet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_field`
--

DROP TABLE IF EXISTS `profile_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_type_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT 1,
  `directory_filter` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_profile_field_category` (`profile_field_category_id`),
  KEY `index_directory_filter` (`directory_filter`),
  CONSTRAINT `fk_profile_field-profile_field_category_id` FOREIGN KEY (`profile_field_category_id`) REFERENCES `profile_field_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_field`
--

LOCK TABLES `profile_field` WRITE;
/*!40000 ALTER TABLE `profile_field` DISABLE KEYS */;
INSERT INTO `profile_field` VALUES (1,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":20,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','firstname','First name',NULL,100,1,1,1,1,'2022-01-25 22:04:16',NULL,'2022-01-25 22:04:16',NULL,'givenName',NULL,1,1,0),(2,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":30,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','lastname','Last name',NULL,200,1,1,1,1,'2022-01-25 22:04:16',NULL,'2022-01-25 22:04:17',NULL,'sn',NULL,1,1,0),(3,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":50,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','title','Title',NULL,300,NULL,NULL,1,1,'2022-01-25 22:04:17',NULL,'2022-01-25 22:04:17',NULL,'title',NULL,1,1,0),(4,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Select','{\"options\":\"male=>Male\\nfemale=>Female\\ncustom=>Custom\",\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','gender','Gender',NULL,300,NULL,NULL,1,1,'2022-01-25 22:04:17',NULL,'2022-01-25 22:04:17',NULL,NULL,NULL,1,1,0),(5,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":150,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','street','Street',NULL,400,NULL,NULL,1,1,'2022-01-25 22:04:17',NULL,'2022-01-25 22:04:17',NULL,NULL,NULL,1,1,0),(6,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":10,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','zip','Zip',NULL,500,NULL,NULL,1,1,'2022-01-25 22:04:17',NULL,'2022-01-25 22:04:17',NULL,NULL,NULL,1,1,0),(7,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','city','City',NULL,600,NULL,NULL,1,1,'2022-01-25 22:04:18',NULL,'2022-01-25 22:04:18',NULL,NULL,NULL,1,1,0),(8,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\CountrySelect','{\"options\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','country','Country',NULL,700,NULL,NULL,1,1,'2022-01-25 22:04:18',NULL,'2022-01-25 22:04:18',NULL,NULL,NULL,1,1,0),(9,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','state','State',NULL,800,NULL,NULL,1,1,'2022-01-25 22:04:18',NULL,'2022-01-25 22:04:18',NULL,NULL,NULL,1,1,0),(10,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Birthday','{\"defaultHideAge\":\"0\",\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}','birthday','Birthday',NULL,900,NULL,NULL,1,1,'2022-01-25 22:04:18',NULL,'2022-01-25 22:04:18',NULL,NULL,NULL,1,1,0),(11,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\TextArea','{\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}','about','About',NULL,900,NULL,NULL,1,1,'2022-01-25 22:04:18',NULL,'2022-01-25 22:04:19',NULL,NULL,NULL,1,1,0),(12,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','phone_private','Phone Private',NULL,100,NULL,NULL,1,1,'2022-01-25 22:04:19',NULL,'2022-01-25 22:04:19',NULL,NULL,NULL,1,1,0),(13,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','phone_work','Phone Work',NULL,200,NULL,NULL,1,1,'2022-01-25 22:04:19',NULL,'2022-01-25 22:04:19',NULL,NULL,NULL,1,1,0),(14,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','mobile','Mobile',NULL,300,NULL,NULL,1,1,'2022-01-25 22:04:19',NULL,'2022-01-25 22:04:19',NULL,NULL,NULL,1,1,0),(15,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\UserEmail','{\"isVirtual\":true,\"fieldTypes\":[],\"canBeDirectoryFilter\":false}','email_virtual','E-Mail',NULL,350,0,0,0,0,'2022-01-25 22:04:19',NULL,'2022-01-25 22:04:19',NULL,NULL,NULL,NULL,0,0),(16,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','fax','Fax',NULL,400,NULL,NULL,1,1,'2022-01-25 22:04:19',NULL,'2022-01-25 22:04:19',NULL,NULL,NULL,1,1,0),(17,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','im_skype','Skype Nickname',NULL,500,NULL,NULL,1,1,'2022-01-25 22:04:20',NULL,'2022-01-25 22:04:20',NULL,NULL,NULL,1,1,0),(18,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"email\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','im_xmpp','XMPP Jabber Address',NULL,800,NULL,NULL,1,1,'2022-01-25 22:04:20',NULL,'2022-01-25 22:04:20',NULL,NULL,NULL,1,1,0),(19,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url','Url',NULL,100,NULL,NULL,1,1,'2022-01-25 22:04:20',NULL,'2022-01-25 22:04:20',NULL,NULL,NULL,1,1,0),(20,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_facebook','Facebook URL',NULL,200,NULL,NULL,1,1,'2022-01-25 22:04:20',NULL,'2022-01-25 22:04:20',NULL,NULL,NULL,1,1,0),(21,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_linkedin','LinkedIn URL',NULL,300,NULL,NULL,1,1,'2022-01-25 22:04:20',NULL,'2022-01-25 22:04:20',NULL,NULL,NULL,1,1,0),(22,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_xing','Xing URL',NULL,400,NULL,NULL,1,1,'2022-01-25 22:04:21',NULL,'2022-01-25 22:04:21',NULL,NULL,NULL,1,1,0),(23,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_youtube','Youtube URL',NULL,500,NULL,NULL,1,1,'2022-01-25 22:04:21',NULL,'2022-01-25 22:04:21',NULL,NULL,NULL,1,1,0),(24,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_vimeo','Vimeo URL',NULL,600,NULL,NULL,1,1,'2022-01-25 22:04:21',NULL,'2022-01-25 22:04:21',NULL,NULL,NULL,1,1,0),(25,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_flickr','Flickr URL',NULL,700,NULL,NULL,1,1,'2022-01-25 22:04:21',NULL,'2022-01-25 22:04:22',NULL,NULL,NULL,1,1,0),(26,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_myspace','MySpace URL',NULL,800,NULL,NULL,1,1,'2022-01-25 22:04:22',NULL,'2022-01-25 22:04:22',NULL,NULL,NULL,1,1,0),(27,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}','url_twitter','Twitter URL',NULL,1000,NULL,NULL,1,1,'2022-01-25 22:04:22',NULL,'2022-01-25 22:04:22',NULL,NULL,NULL,1,1,0);
/*!40000 ALTER TABLE `profile_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_field_category`
--

DROP TABLE IF EXISTS `profile_field_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_field_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_field_category`
--

LOCK TABLES `profile_field_category` WRITE;
/*!40000 ALTER TABLE `profile_field_category` DISABLE KEYS */;
INSERT INTO `profile_field_category` VALUES (1,'General','',100,NULL,1,'2022-01-25 22:04:16',NULL,'2022-01-25 22:04:16',NULL,NULL,1),(2,'Communication','',200,NULL,1,'2022-01-25 22:04:16',NULL,'2022-01-25 22:04:16',NULL,NULL,1),(3,'Social bookmarks','',300,NULL,1,'2022-01-25 22:04:16',NULL,'2022-01-25 22:04:16',NULL,NULL,1);
/*!40000 ALTER TABLE `profile_field_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` blob NOT NULL,
  `pushed_at` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `reserved_at` int(11) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `done_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `reserved_at` (`reserved_at`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=2309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_exclusive`
--

DROP TABLE IF EXISTS `queue_exclusive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_exclusive` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_message_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_status` smallint(6) DEFAULT 2,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_exclusive`
--

LOCK TABLES `queue_exclusive` WRITE;
/*!40000 ALTER TABLE `queue_exclusive` DISABLE KEYS */;
INSERT INTO `queue_exclusive` VALUES ('humhub\\modules\\activity\\jobs\\SendMailSummary1','2303',2,'2022-02-08 15:51:02'),('humhub\\modules\\activity\\jobs\\SendMailSummary2','2151',2,'2022-02-07 18:00:02'),('humhub\\modules\\activity\\jobs\\SendMailSummary3','1979',2,'2022-02-06 18:00:01'),('search.delete.40bd90581a29001b6ab35f09067ebb27','903',2,'2022-01-31 10:31:38'),('search.update.129de593806632c4d00e8bdbf3c47c4e','463',2,'2022-01-28 20:08:57'),('search.update.1dad9ed37f07f9399478eab024d98832','434',2,'2022-01-28 18:06:46'),('search.update.2dff23be401b0155b0f3b55fef8b79b4','433',2,'2022-01-28 18:04:20'),('search.update.34adc3f8ba09ff3ef48513a09d9518f3','6',2,'2022-01-25 22:08:54'),('search.update.35b00d81c1c9c19138d948da20a13253','14',2,'2022-01-25 22:08:57'),('search.update.361d0180b3272bc66c0b8d301370686e','454',2,'2022-01-28 19:55:16'),('search.update.3d7b2424b991a0e9e3f987185369465f','2',2,'2022-01-25 22:08:32'),('search.update.49e5bf1ceddaea2bdb047f46cb3866ff','377',2,'2022-01-28 10:14:19'),('search.update.5a1f359fd1047743f8abb8379d515399','6',2,'2022-01-25 22:08:50'),('search.update.85a19f443c20eca221cb2a2b6034bec8','430',2,'2022-01-28 18:01:50'),('search.update.a4cb70bb5efe4d31fd8302088ec03b1d','115',2,'2022-01-26 15:58:16'),('search.update.b9593d625fde18702cc768fa5c44c33b','436',2,'2022-01-28 18:08:10'),('search.update.bf655d283ff597c58a52647d65148919','5',2,'2022-01-25 22:08:47'),('search.update.ca3eed32cca9699d748ffeba1df43690','462',2,'2022-01-28 20:06:27'),('search.update.d44770b89ae8b7a54ccc3fb8b952c372','4',2,'2022-01-25 22:08:33'),('search.update.d683163f3163e8fe371202288b014226','902',2,'2022-01-31 10:31:38'),('search.update.da0441b5e815a7743573d38784544d01','435',2,'2022-01-28 18:07:14');
/*!40000 ALTER TABLE `queue_exclusive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-setting` (`name`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'oembedProviders','{\"vimeo.com\":\"https://vimeo.com/api/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450\",\"youtube.com\":\"https://www.youtube.com/oembed?scheme=https&url=%url%&format=json&maxwidth=450\",\"youtu.be\":\"https://www.youtube.com/oembed?scheme=https&url=%url%&format=json&maxwidth=450\",\"soundcloud.com\":\"https://soundcloud.com/oembed?url=%url%&format=json&maxwidth=450\",\"slideshare.net\":\"https://www.slideshare.net/api/oembed/2?url=%url%&format=json&maxwidth=450\"}','base'),(2,'defaultVisibility','1','space'),(3,'defaultJoinPolicy','1','space'),(4,'includeCommunityModules','1','marketplace'),(5,'richtextCompatMode','0','content'),(6,'auth.showRegistrationUserGroup','1','user'),(7,'themeParents','[]','base'),(8,'name','decidelabiolocale','base'),(9,'baseUrl','http://localhost/humhub','base'),(10,'paginationSize','10','base'),(11,'displayNameFormat','{profile.firstname} {profile.lastname}','base'),(12,'horImageScrollOnMobile','1','base'),(13,'cronLastDailyRun','1644256802','base'),(14,'auth.needApproval','0','user'),(15,'auth.anonymousRegistration','1','user'),(16,'auth.internalUsersCanInvite','1','user'),(17,'auth.showCaptureInRegisterForm','1','user'),(18,'mailer.transportType','smtp','base'),(19,'mailer.systemEmailAddress','duyminh@free.fr','base'),(20,'mailer.systemEmailName','decidelabiolocale.org','base'),(21,'mailSummaryInterval','2','activity'),(22,'maxFileSize','5242880','file'),(23,'excludeMediaFilesPreview','1','file'),(24,'cache.class','yii\\caching\\FileCache','base'),(25,'cache.expireTime','3600','base'),(26,'installationId','98a732134fa4d4cdf2f7fb2442eedcb5','admin'),(27,'spaceOrder','0','space'),(28,'enable','1','tour'),(29,'defaultLanguage','fr','base'),(30,'enable_html5_desktop_notifications','0','notification'),(31,'cronLastRun','1644338102','base'),(32,'theme.var.HumHub.default','#f3f3f3','base'),(33,'theme.var.HumHub.primary','#435f6f','base'),(34,'theme.var.HumHub.info','#21A1B3','base'),(35,'theme.var.HumHub.success','#97d271','base'),(36,'theme.var.HumHub.warning','#FFC107','base'),(37,'theme.var.HumHub.danger','#FC4A64','base'),(38,'theme.var.HumHub.link','#21A1B3','base'),(39,'theme.var.HumHub.isFluid','false','base'),(40,'theme.var.HumHub.text-color-main','#555','base'),(41,'theme.var.HumHub.text-color-secondary','#7a7a7a','base'),(42,'theme.var.HumHub.text-color-highlight','#000','base'),(43,'theme.var.HumHub.text-color-soft','#555555','base'),(44,'theme.var.HumHub.text-color-soft2','#aeaeae','base'),(45,'theme.var.HumHub.text-color-soft3','#bac2c7','base'),(46,'theme.var.HumHub.text-color-contrast','#fff','base'),(47,'theme.var.HumHub.background-color-main','#fff','base'),(48,'theme.var.HumHub.background-color-secondary','#f7f7f7','base'),(49,'theme.var.HumHub.background-color-page','#ededed','base'),(50,'theme.var.HumHub.background-color-highlight','#fff8e0','base'),(51,'theme.var.HumHub.background3','#d7d7d7','base'),(52,'theme.var.HumHub.background4','#b2b2b2','base'),(53,'theme.var.HumHub.background-color-success','#f7fbf4','base'),(54,'theme.var.HumHub.text-color-success','#84be5e','base'),(55,'theme.var.HumHub.border-color-success','#97d271','base'),(56,'theme.var.HumHub.background-color-warning','#fffbf7','base'),(57,'theme.var.HumHub.text-color-warning','#e9b168','base'),(58,'theme.var.HumHub.border-color-warning','#fdd198','base'),(59,'theme.var.HumHub.background-color-danger','#fff6f6','base'),(60,'theme.var.HumHub.text-color-danger','#ff8989','base'),(61,'theme.var.HumHub.border-color-danger','#ff8989','base'),(62,'theme.var.HumHub.mail-font-url','\'http://fonts.googleapis.com/css?family=Open+Sans:300,100,400,600\'','base'),(63,'theme.var.HumHub.mail-font-family','\'Open Sans\', Arial, Tahoma, Helvetica, sans-serif','base'),(64,'useCase','community','base'),(65,'auth.allowGuestAccess','1','user'),(66,'enable','1','friendship'),(67,'shownDays','2','birthday'),(68,'noUsers','mostactiveusers','base'),(69,'noUsers','5','mostactiveusers'),(70,'sampleData','1','installer'),(71,'secret','6310fa33-5f90-4e10-a69d-da3443314827','base'),(72,'defaultTimeZone','UTC','base'),(73,'timeZone','UTC','base'),(74,'group.adminGroupId','1','user'),(75,'cronLastHourlyRun','1644335463','base'),(76,'mailSummaryLimitSpaces','','activity'),(77,'mailSummaryLimitSpacesMode','','activity'),(78,'mailSummaryActivitySuppress','','activity'),(79,'lastReminderRunTS','1644337742','calendar'),(80,'global_pages_migrated_visibility','1','custom_pages'),(81,'map_widget_location','dashboard_sidebar','usermap'),(82,'map_widget_location_sort_order','400','usermap'),(83,'geocoding_provider','mapbox','usermap'),(84,'geocoding_api_key','pk.eyJ1IjoiZGVjaWRlbGFiaW9sb2NhbGUiLCJhIjoiY2t4c3J1b3pmMTV4cDJzbXZ6aWtxOTNrbiJ9.UrHhSVL477MEsqwLPJubrQ','usermap'),(85,'mailer.hostname','pro.eu.turbo-smtp.com','base'),(86,'mailer.username','support@decidelabiolocale.org','base'),(87,'mailer.password','ML7vKQDa','base'),(88,'mailer.port','587','base'),(89,'mailer.encryption','','base'),(90,'mailer.allowSelfSignedCerts','0','base'),(91,'title','Les dernières nouvelles','breakingnews'),(92,'message','Ceci est un test pour le module Breaking News','breakingnews'),(93,'active','1','breakingnews'),(94,'timestamp','1643394325','breakingnews'),(95,'showInTopNav','1','mail'),(96,'newUserRestrictionEnabled','0','mail'),(97,'newUserSinceDays','3','mail'),(98,'newUserConversationRestriction','2','mail'),(99,'newUserMessageRestriction','5','mail'),(100,'userConversationRestriction','15','mail'),(101,'userMessageRestriction','0','mail'),(102,'panelTitle','New Members','newmembers'),(103,'maxMembers','10','newmembers'),(104,'fromDate','','newmembers'),(105,'displayForMembers','1','newmembers'),(106,'displayForGuests','1','newmembers');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space`
--

DROP TABLE IF EXISTS `space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `members_can_leave` int(11) DEFAULT 1,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url-unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space`
--

LOCK TABLES `space` WRITE;
/*!40000 ALTER TABLE `space` DISABLE KEYS */;
INSERT INTO `space` VALUES (1,'b967e712-5f23-4ffc-95c8-be848669e53e','Espace de bienvenue','Votre premier espace de test pour découvrir la plateforme.',NULL,2,2,1,'2022-01-25 22:08:31',1,'2022-01-25 22:08:31',1,NULL,1,2,NULL,'#6fdbe8',1,'espace-de-bienvenue'),(2,'526fa0a0-b373-4e64-9f7d-a901bf1756d5','Réparation de matériel','Espace dédié aux ressources, lieux, dates pour réparation de matériel',NULL,1,1,1,'2022-01-28 18:01:49',1,'2022-01-28 18:01:49',1,NULL,NULL,6,NULL,'#dd0b82',1,'reparation-de-materiel'),(3,'22333755-dac6-4397-ba89-101cd02dd73b','Espace viticulteurs','',NULL,1,1,1,'2022-01-28 18:06:46',1,'2022-01-28 18:06:46',1,NULL,NULL,7,NULL,'#822103',1,'espace-viticulteurs'),(4,'9ca15b1d-91b9-4c72-8c67-e6f35ab6ef27','Espace maraichers','',NULL,1,1,1,'2022-01-28 18:07:14',1,'2022-01-28 18:07:14',1,NULL,NULL,8,NULL,'#9b0d2c',1,'espace-maraichers'),(5,'b53844f2-974b-4ae3-ba59-7fbdc4ddf94a','Espace glanage','Pour échanger sur tous les lieux où faire du glanage',NULL,1,1,1,'2022-01-28 18:08:10',1,'2022-01-28 18:08:10',1,NULL,NULL,9,NULL,'#5d0ba0',1,'espace-glanage'),(6,'5a71b22f-5b41-4ba9-a661-2a4e3973847a','La Forge Enchantée','lieu de création et réparation d\'outils','Lieu: Saint Michel de Montaigne, à l’entrée du bourg à droite quand on vient de Lamothe Montravel.',1,1,1,'2022-01-28 20:01:22',5,'2022-01-28 20:08:56',5,NULL,NULL,11,NULL,'#0b9119',1,'la-forge-enchantee');
/*!40000 ALTER TABLE `space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_membership`
--

DROP TABLE IF EXISTS `space_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT 1,
  `can_cancel_membership` int(11) DEFAULT 1,
  `send_notifications` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_status` (`status`),
  KEY `fk_space_membership-space_id` (`space_id`),
  KEY `fk_space_membership-user_id` (`user_id`),
  CONSTRAINT `fk_space_membership-space_id` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_space_membership-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_membership`
--

LOCK TABLES `space_membership` WRITE;
/*!40000 ALTER TABLE `space_membership` DISABLE KEYS */;
INSERT INTO `space_membership` VALUES (1,1,NULL,3,NULL,'2022-01-28 18:10:04','2022-01-25 22:08:32',1,'2022-01-25 22:08:32',1,'admin',1,1,0,1),(1,2,NULL,3,NULL,NULL,'2022-01-25 22:08:47',1,'2022-01-25 22:08:47',1,'member',1,1,0,2),(1,3,NULL,3,NULL,NULL,'2022-01-25 22:08:50',1,'2022-01-25 22:08:50',1,'member',1,1,0,3),(1,4,NULL,3,NULL,NULL,'2022-01-28 10:10:38',NULL,'2022-01-28 10:10:38',NULL,'member',1,1,0,4),(2,1,NULL,3,NULL,'2022-01-30 15:58:39','2022-01-28 18:01:50',1,'2022-01-28 18:01:50',1,'admin',1,1,0,5),(2,4,'1',1,NULL,NULL,'2022-01-28 18:02:16',1,'2022-01-28 18:02:16',1,'member',1,1,0,6),(3,1,NULL,3,NULL,'2022-01-28 18:06:59','2022-01-28 18:06:46',1,'2022-01-28 18:06:46',1,'admin',1,1,0,7),(4,1,NULL,3,NULL,'2022-01-28 18:07:28','2022-01-28 18:07:14',1,'2022-01-28 18:07:14',1,'admin',1,1,0,8),(5,1,NULL,3,NULL,'2022-01-28 18:08:22','2022-01-28 18:08:10',1,'2022-01-28 18:08:10',1,'admin',1,1,0,9),(1,5,NULL,3,NULL,NULL,'2022-01-28 19:50:20',NULL,'2022-01-28 19:50:20',NULL,'member',1,1,0,10),(2,5,NULL,3,'Antoinette de la Forge Enchantée','2022-01-28 20:09:52','2022-01-28 19:52:06',5,'2022-01-28 19:52:52',1,'member',1,1,0,11),(6,5,NULL,3,NULL,'2022-01-28 20:09:31','2022-01-28 20:01:23',5,'2022-01-28 20:01:23',5,'admin',1,1,0,12),(6,1,'5',3,NULL,'2022-01-30 15:58:28','2022-01-28 20:02:01',5,'2022-01-30 15:58:19',1,'member',1,1,0,13),(1,6,NULL,3,NULL,'2022-01-31 10:31:14','2022-01-31 10:30:51',NULL,'2022-01-31 10:30:51',NULL,'member',1,1,0,14);
/*!40000 ALTER TABLE `space_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `max_users` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` tinyint(4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduling` tinyint(4) NOT NULL,
  `all_day` tinyint(4) NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `cal_mode` tinyint(4) NOT NULL DEFAULT 0,
  `time_zone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_sent` tinyint(4) DEFAULT 0,
  `task_list_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-task-list-task-id` (`task_list_id`),
  CONSTRAINT `fk-task-list-task-id` FOREIGN KEY (`task_list_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_item`
--

DROP TABLE IF EXISTS `task_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed` tinyint(4) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk-task-item-task-id` (`task_id`),
  CONSTRAINT `fk-task-item-task-id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_item`
--

LOCK TABLES `task_item` WRITE;
/*!40000 ALTER TABLE `task_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_list_setting`
--

DROP TABLE IF EXISTS `task_list_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_list_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `hide_if_completed` tinyint(4) DEFAULT 1,
  `sort_order` int(11) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-task-list-setting-task-id` (`tag_id`),
  CONSTRAINT `fk-task-list-setting-task-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_list_setting`
--

LOCK TABLES `task_list_setting` WRITE;
/*!40000 ALTER TABLE `task_list_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_list_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_reminder`
--

DROP TABLE IF EXISTS `task_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `remind_mode` tinyint(4) DEFAULT 0,
  `start_reminder_sent` tinyint(4) NOT NULL DEFAULT 0,
  `end_reminder_sent` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk-task-reminder-task-id` (`task_id`),
  CONSTRAINT `fk-task-reminder-task-id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_reminder`
--

LOCK TABLES `task_reminder` WRITE;
/*!40000 ALTER TABLE `task_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_user`
--

DROP TABLE IF EXISTS `task_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `user_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_user`
--

LOCK TABLES `task_user` WRITE;
/*!40000 ALTER TABLE `task_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_oembed`
--

DROP TABLE IF EXISTS `url_oembed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_oembed` (
  `url` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_oembed`
--

LOCK TABLES `url_oembed` WRITE;
/*!40000 ALTER TABLE `url_oembed` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_oembed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_mode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT 1,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `authclient_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_authclient_id` (`authclient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'741d4314-a44a-4ae8-94af-8235a80977a9',1,'admin','duyminh@free.fr','local','','2022-01-25 22:08:30',NULL,'2022-01-26 15:58:15',1,'2022-02-03 17:26:49',1,'UTC',1,NULL),(2,'891a835f-ba95-4c29-ab0c-cd01b555ae8f',1,'david1986','david.roberts@example.com','local','','2022-01-25 22:08:47',1,'2022-01-25 22:08:47',1,NULL,1,NULL,3,NULL),(3,'48e5ab27-8849-4b7e-a2be-f69244a60b9b',1,'sara1989','sara.schuster@example.com','local','','2022-01-25 22:08:49',1,'2022-01-25 22:08:49',1,NULL,1,NULL,4,NULL),(4,'0d10fd55-e3d6-40d5-b59c-84cb58990215',1,'MichelUtilisateurPourTest','support@decidelabiolocale.org','local','fr','2022-01-28 10:10:38',NULL,'2022-01-28 10:14:19',4,'2022-01-28 10:13:38',1,'Europe/Paris',5,NULL),(5,'3a2a6c2a-3ec5-4fd9-a310-c0e58a33b838',1,'Antoinette','antoinette@ferriere.net','local','fr','2022-01-28 19:50:20',NULL,'2022-01-28 19:55:16',5,'2022-01-28 19:50:22',1,'Europe/Paris',10,NULL),(6,'28a91cd3-520e-482d-973a-89be3da37e5c',1,'Apouillet','abelix.pouillet@gmail.com','local','fr','2022-01-31 10:30:51',NULL,'2022-01-31 10:31:38',1,'2022-02-07 09:46:40',1,'Europe/Paris',12,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follow`
--

DROP TABLE IF EXISTS `user_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `index_user` (`user_id`),
  KEY `index_object` (`object_model`,`object_id`),
  CONSTRAINT `fk_user_follow-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follow`
--

LOCK TABLES `user_follow` WRITE;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
INSERT INTO `user_follow` VALUES (1,'humhub\\modules\\post\\models\\Post',1,1,1),(2,'humhub\\modules\\post\\models\\Post',2,1,1),(3,'humhub\\modules\\post\\models\\Post',2,2,1),(4,'humhub\\modules\\post\\models\\Post',2,3,1),(5,'humhub\\modules\\polls\\models\\Poll',1,1,1),(6,'humhub\\modules\\polls\\models\\Poll',1,2,1),(7,'humhub\\modules\\polls\\models\\Poll',1,3,1),(8,'humhub\\modules\\calendar\\models\\CalendarEntry',1,1,1),(10,'humhub\\modules\\user\\models\\User',1,5,0),(11,'humhub\\modules\\user\\models\\User',5,1,0),(12,'humhub\\modules\\calendar\\models\\CalendarEntry',2,5,1);
/*!40000 ALTER TABLE `user_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friendship`
--

DROP TABLE IF EXISTS `user_friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-friends` (`user_id`,`friend_user_id`),
  KEY `fk-friend` (`friend_user_id`),
  CONSTRAINT `fk-friend` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friendship`
--

LOCK TABLES `user_friendship` WRITE;
/*!40000 ALTER TABLE `user_friendship` DISABLE KEYS */;
INSERT INTO `user_friendship` VALUES (1,5,1,'2022-01-28 19:57:56'),(2,1,5,'2022-01-28 19:58:26');
/*!40000 ALTER TABLE `user_friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_http_session`
--

DROP TABLE IF EXISTS `user_http_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_http_session` (
  `id` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_http_session-user_id` (`user_id`),
  CONSTRAINT `fk_user_http_session-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_http_session`
--

LOCK TABLES `user_http_session` WRITE;
/*!40000 ALTER TABLE `user_http_session` DISABLE KEYS */;
INSERT INTO `user_http_session` VALUES ('1ivvi37aqu3rola8t2vfjaoihb',1644339529,1,'__flash|a:0:{}__captcha/user/auth/captcha|s:7:\"vrhuzuc\";__captcha/user/auth/captchacount|i:1;__id|i:1;__expire|i:1644339489;currentAuthClientId|s:5:\"local\";user.canSeeAdminSection|b:1;live.poll.lastQueryTime|i:1644338089;');
/*!40000 ALTER TABLE `user_http_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invite`
--

DROP TABLE IF EXISTS `user_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` char(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invite`
--

LOCK TABLES `user_invite` WRITE;
/*!40000 ALTER TABLE `user_invite` DISABLE KEYS */;
INSERT INTO `user_invite` VALUES (7,NULL,NULL,'duyminh.vu@gmail.com','self','271AcSd_knTK','2022-01-28 10:26:27',NULL,'2022-01-28 10:26:27',NULL,'fr',NULL,NULL);
/*!40000 ALTER TABLE `user_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mentioning`
--

DROP TABLE IF EXISTS `user_mentioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mentioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user` (`user_id`),
  KEY `i_object` (`object_model`,`object_id`),
  CONSTRAINT `fk_user_mentioning-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mentioning`
--

LOCK TABLES `user_mentioning` WRITE;
/*!40000 ALTER TABLE `user_mentioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mentioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_originator` tinyint(4) DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`,`user_id`),
  KEY `index_last_viewed` (`last_viewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message_tag`
--

DROP TABLE IF EXISTS `user_message_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message_tag` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`message_id`,`tag_id`),
  KEY `fk-user-message-id` (`message_id`,`user_id`),
  KEY `fk-conversation-tag-tag-id` (`tag_id`),
  CONSTRAINT `fk-conversation-tag-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `message_tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user-message-id` FOREIGN KEY (`message_id`, `user_id`) REFERENCES `user_message` (`message_id`, `user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message_tag`
--

LOCK TABLES `user_message_tag` WRITE;
/*!40000 ALTER TABLE `user_message_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_password`
--

DROP TABLE IF EXISTS `user_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `fk_user_password-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password`
--

LOCK TABLES `user_password` WRITE;
/*!40000 ALTER TABLE `user_password` DISABLE KEYS */;
INSERT INTO `user_password` VALUES (1,1,'sha512whirlpool','15e93ec533be8c6d3ebb23621c6addb9bc4dd1fa4e778fbdf535e4ed622d99305848dcdad17cc92a2958d9ad7222070048edf4e08d0f00ae86e36a8fbc8f3312','f1ff7fa9-dcce-4df3-bf19-e60fab2769b6','2022-01-25 22:08:31'),(2,4,'sha512whirlpool','f2b538795f33b0a58c086cc9dcc295ebf23e0a20da0db42124d447f28b3f3005bea83e17913aa647668279ced24322174c83fd45dbc688cd69949458534c08a1','c97b38e2-a6f2-414c-9d2c-2c151f45631f','2022-01-28 10:10:39'),(3,5,'sha512whirlpool','e3d28359e9854958c849b31d9505b6198758919c56331bf9afc1f3d33b66358a484e05c3dfe03a3c26fc08a8df652efcb5c6b14e0abcdafb800a9b97fa921525','ccdc3f67-d0b1-4a41-a2fa-bfde51d67675','2022-01-28 19:50:21'),(4,6,'sha512whirlpool','bf4fddb6e8f5b18cdf097327bc88f903c54de9bb24d7037d4add6bc6c3a1fb219b404213c2499dd5151bdfbf5e92a2025f2d25eb65b531e3165b678b73d8724c','1a47a62b-d9e0-44e1-9669-11ed23a760e4','2022-01-31 10:31:38');
/*!40000 ALTER TABLE `user_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_page`
--

DROP TABLE IF EXISTS `wiki_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_home` tinyint(4) NOT NULL DEFAULT 0,
  `admin_only` tinyint(4) NOT NULL DEFAULT 0,
  `is_category` tinyint(1) DEFAULT 0,
  `parent_page_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_container_menu` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `container_menu_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_page_parent` (`parent_page_id`),
  CONSTRAINT `wiki_page_parent` FOREIGN KEY (`parent_page_id`) REFERENCES `wiki_page` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_page`
--

LOCK TABLES `wiki_page` WRITE;
/*!40000 ALTER TABLE `wiki_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_page_revision`
--

DROP TABLE IF EXISTS `wiki_page_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_page_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` int(11) NOT NULL,
  `is_latest` tinyint(1) NOT NULL DEFAULT 0,
  `wiki_page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_page_revision`
--

LOCK TABLES `wiki_page_revision` WRITE;
/*!40000 ALTER TABLE `wiki_page_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_page_revision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 17:35:11
