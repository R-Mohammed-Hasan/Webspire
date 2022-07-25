-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: webspire
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint NOT NULL,
  `blob_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (42,'posts','Post',6,42,'2022-07-13 14:45:03'),(47,'user_profile','User',6,47,'2022-07-14 14:26:28'),(49,'user_profile','User',8,49,'2022-07-15 10:02:26'),(53,'posts','Post',8,53,'2022-07-15 11:28:58'),(55,'posts','Post',9,55,'2022-07-15 14:46:44'),(57,'user_profile','User',7,57,'2022-07-16 14:16:52'),(62,'posts','Post',11,62,'2022-07-20 07:02:08');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (14,'gpv2aqmbownbig9t86sgnn3l2tvj','user-default-icon.png','image/png','{\"identified\":true,\"analyzed\":true}','local',25344,'4nyHNdqY7GzNzxLiWLJkdQ==','2022-07-11 14:46:19'),(25,'pfv12hvsct8hfovghynsvbrb8nic','user-default-icon.png','image/png','{\"identified\":true,\"analyzed\":true}','local',25344,'4nyHNdqY7GzNzxLiWLJkdQ==','2022-07-12 11:55:20'),(30,'auovq1augdfgiq1xv8a3uq3ky2tv','IMG_20220702_213744.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',3332890,'dlz1XdWnjTXK1DqcNAh5gw==','2022-07-12 12:45:55'),(31,'xlrtrznnmpghh8fff0tce0nyts4c','IMG_20220702_212448.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',3499735,'0RC2w2qp9zp+JxYOTOqsEw==','2022-07-12 12:58:47'),(37,'ux7c492l3opct48me004wawcpgoh','IMG_20220702_212448.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',3499735,'0RC2w2qp9zp+JxYOTOqsEw==','2022-07-13 09:55:53'),(38,'zgcyxqqi4xoipde7k2ywu59qaz26','IMG_20220702_213744.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',3332890,'dlz1XdWnjTXK1DqcNAh5gw==','2022-07-13 10:06:13'),(39,'jh78k88e2zqpqgfr6xgj9vhkx94a','user-default-icon.png','image/png','{\"identified\":true,\"analyzed\":true}','local',25344,'4nyHNdqY7GzNzxLiWLJkdQ==','2022-07-13 10:12:56'),(41,'9o7w42p32fr3fuz4zu9zk1k6wwt8','IMG_20220702_212448.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',3499735,'0RC2w2qp9zp+JxYOTOqsEw==','2022-07-13 14:43:46'),(42,'daqq6nanpy6uejt7i5vtup2l93wk','IMG_20220702_213744.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',3332890,'dlz1XdWnjTXK1DqcNAh5gw==','2022-07-13 14:45:03'),(43,'cfrbm2wd1k0yw8t8ssrhxv4eb06j','user-default-icon.png','image/png','{\"identified\":true,\"analyzed\":true}','local',25344,'4nyHNdqY7GzNzxLiWLJkdQ==','2022-07-14 06:29:11'),(44,'liyk63gk7a7e0la2pbmpsx1r32sf','user-default-icon.png','image/png','{\"identified\":true,\"analyzed\":true}','local',25344,'4nyHNdqY7GzNzxLiWLJkdQ==','2022-07-14 06:29:57'),(47,'bwmzpkjaglryn7i1h3em3clopci4','user-default-icon.png','image/png','{\"identified\":true,\"analyzed\":true}','local',25344,'4nyHNdqY7GzNzxLiWLJkdQ==','2022-07-14 14:26:28'),(49,'bn5y5hsexxuz3b3ba49dft2f98y5','user-default-icon.png','image/png','{\"identified\":true,\"analyzed\":true}','local',25344,'4nyHNdqY7GzNzxLiWLJkdQ==','2022-07-15 10:02:26'),(53,'p6ekz3z3ybg17fm0v72ym4ap83dn','IMG_20220702_212448.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',3499735,'0RC2w2qp9zp+JxYOTOqsEw==','2022-07-15 11:28:58'),(55,'vbdikbpa7x3wly6t6rufp63dz90j','1643861224686.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',5131493,'+/aEByAfZ7nTOyAq0IOf8Q==','2022-07-15 14:46:44'),(57,'r7elp2ytet7dkfougfw5gat6oo5g','1643861224686.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',5131493,'+/aEByAfZ7nTOyAq0IOf8Q==','2022-07-16 14:16:51'),(62,'ljm4spi60gxumk4gx1ox0nphf8cb','1643861224923.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',7343961,'ufluwTqTW2/cvZmUkjZTWQ==','2022-07-20 07:02:08');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_variant_records`
--

DROP TABLE IF EXISTS `active_storage_variant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_variant_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blob_id` bigint NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_variant_records`
--

LOCK TABLES `active_storage_variant_records` WRITE;
/*!40000 ALTER TABLE `active_storage_variant_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_variant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity` text,
  `user_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'has accepted your friend request',6,'2022-07-15 12:43:33.055525','2022-07-15 12:43:33.055525',7),(2,'has accepted your friend request',6,'2022-07-15 12:47:12.132556','2022-07-15 12:47:12.132556',7),(3,'has accepted your friend request',8,'2022-07-22 10:28:42.533374','2022-07-22 10:28:42.533374',6),(4,'has accepted your friend request',7,'2022-07-22 11:35:14.652503','2022-07-22 11:35:14.652503',8);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2022-07-07 12:49:51.246008','2022-07-07 12:49:51.246008');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chattings`
--

DROP TABLE IF EXISTS `chattings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chattings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender_id` bigint DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `message` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chattings`
--

LOCK TABLES `chattings` WRITE;
/*!40000 ALTER TABLE `chattings` DISABLE KEYS */;
INSERT INTO `chattings` VALUES (1,8,6,'hi','2022-07-23 06:59:33.807025','2022-07-23 06:59:33.807025'),(2,8,6,'hi','2022-07-23 06:59:59.959644','2022-07-23 06:59:59.959644'),(3,8,6,'hi','2022-07-23 07:00:01.566327','2022-07-23 07:00:01.566327'),(4,8,6,'hi','2022-07-23 07:00:07.199669','2022-07-23 07:00:07.199669'),(5,8,6,'hi','2022-07-23 07:00:22.494346','2022-07-23 07:00:22.494346'),(6,8,6,'hi','2022-07-23 07:00:30.432405','2022-07-23 07:00:30.432405'),(7,8,6,'hi','2022-07-23 07:00:46.875182','2022-07-23 07:00:46.875182'),(8,8,6,'hi','2022-07-23 07:00:59.263677','2022-07-23 07:00:59.263677'),(9,8,6,'hello','2022-07-23 07:01:07.918782','2022-07-23 07:01:07.918782'),(10,8,6,'hello','2022-07-23 07:01:47.794652','2022-07-23 07:01:47.794652'),(11,8,6,'hi','2022-07-23 10:21:15.697979','2022-07-23 10:21:15.697979'),(12,8,6,'hello','2022-07-23 10:25:30.760020','2022-07-23 10:25:30.760020'),(13,8,6,'hi','2022-07-23 10:34:35.405981','2022-07-23 10:34:35.405981'),(14,8,6,'hello','2022-07-23 10:46:15.912933','2022-07-23 10:46:15.912933'),(15,8,6,'hi','2022-07-23 10:50:10.026465','2022-07-23 10:50:10.026465'),(16,8,6,'hi','2022-07-23 10:51:03.994420','2022-07-23 10:51:03.994420'),(17,8,6,'hi','2022-07-23 10:52:42.582858','2022-07-23 10:52:42.582858'),(18,8,6,'hi','2022-07-23 10:56:35.060041','2022-07-23 10:56:35.060041'),(19,8,6,'hello','2022-07-23 11:03:50.013783','2022-07-23 11:03:50.013783'),(20,8,6,'hi','2022-07-23 11:06:12.567171','2022-07-23 11:06:12.567171'),(21,8,6,'hello','2022-07-23 11:11:49.506381','2022-07-23 11:11:49.506381'),(22,8,6,'hi','2022-07-23 11:14:02.455504','2022-07-23 11:14:02.455504'),(23,8,6,'hi','2022-07-23 11:14:31.944648','2022-07-23 11:14:31.944648'),(24,8,6,'hello','2022-07-23 11:20:20.715128','2022-07-23 11:20:20.715128'),(25,8,6,'hi','2022-07-23 11:21:20.048027','2022-07-23 11:21:20.048027'),(26,8,6,'hi','2022-07-23 11:23:07.665638','2022-07-23 11:23:07.665638'),(27,8,6,'hi','2022-07-23 11:23:23.286103','2022-07-23 11:23:23.286103'),(28,8,6,'hasan','2022-07-23 11:28:02.735038','2022-07-23 11:28:02.735038'),(29,8,6,'kasi','2022-07-23 15:57:52.625227','2022-07-23 15:57:52.625227'),(30,8,6,'chitu','2022-07-23 16:19:17.643753','2022-07-23 16:19:17.643753'),(31,8,6,'hasa','2022-07-23 16:21:25.351044','2022-07-23 16:21:25.351044'),(32,8,6,'hasan','2022-07-24 04:39:33.309609','2022-07-24 04:39:33.309609'),(33,8,6,'mom','2022-07-24 04:42:22.349953','2022-07-24 04:42:22.349953'),(34,8,6,'mommy','2022-07-24 04:43:26.207925','2022-07-24 04:43:26.207925'),(35,8,6,'mommy','2022-07-24 04:44:17.541917','2022-07-24 04:44:17.541917'),(36,8,6,'dad','2022-07-24 04:45:14.157408','2022-07-24 04:45:14.157408'),(37,8,6,'don','2022-07-24 04:45:36.296407','2022-07-24 04:45:36.296407'),(38,8,6,'hasan','2022-07-24 04:46:41.955391','2022-07-24 04:46:41.955391'),(39,8,6,'hi','2022-07-24 07:05:07.210346','2022-07-24 07:05:07.210346'),(40,8,6,'hello','2022-07-24 07:06:37.278537','2022-07-24 07:06:37.278537'),(41,8,6,'hi','2022-07-24 07:20:01.980444','2022-07-24 07:20:01.980444');
/*!40000 ALTER TABLE `chattings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `comment` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,8,6,'good photo','2022-07-19 15:31:07.538416','2022-07-19 15:31:07.538416'),(4,9,6,'good friends','2022-07-20 06:13:37.096061','2022-07-20 06:13:37.096061'),(10,8,6,'nice','2022-07-20 13:56:44.880771','2022-07-20 13:56:44.880771'),(14,8,6,'superb','2022-07-20 15:19:37.185334','2022-07-20 15:19:37.185334'),(15,9,6,'hi','2022-07-20 15:31:26.310059','2022-07-20 15:31:26.310059'),(16,9,6,'hello','2022-07-20 15:31:52.722997','2022-07-20 15:31:52.722997'),(20,8,6,'hi','2022-07-21 08:55:26.903968','2022-07-21 08:55:26.903968'),(21,8,6,'hi','2022-07-21 08:55:29.910527','2022-07-21 08:55:29.910527'),(22,8,6,'hello','2022-07-21 09:37:20.866460','2022-07-21 09:37:20.866460'),(23,8,6,'hi','2022-07-21 10:27:04.058474','2022-07-21 10:27:04.058474'),(26,11,8,'good photo','2022-07-23 06:35:18.897232','2022-07-23 06:35:18.897232');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_requests`
--

DROP TABLE IF EXISTS `follow_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_requests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender_id` bigint DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `status` enum('requested','accepted','rejected') DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_requests`
--

LOCK TABLES `follow_requests` WRITE;
/*!40000 ALTER TABLE `follow_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `follower_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (5,7,6,'2022-07-15 12:47:12.095129','2022-07-15 12:47:12.095129'),(6,6,8,'2022-07-22 10:28:42.486064','2022-07-22 10:28:42.486064'),(7,8,7,'2022-07-22 11:35:14.617301','2022-07-22 11:35:14.617301');
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_of_post` (`user_id`,`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (77,6,11,'2022-07-21 16:22:01.500623','2022-07-21 16:22:01.500623'),(80,6,9,'2022-07-21 16:22:11.268643','2022-07-21 16:22:11.268643'),(81,6,8,'2022-07-21 16:22:12.570538','2022-07-21 16:22:12.570538'),(84,8,11,'2022-07-21 16:33:31.865766','2022-07-21 16:33:31.865766'),(89,8,9,'2022-07-23 06:36:12.115641','2022-07-23 06:36:12.115641');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `description` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (8,7,'certificates','2022-07-15 11:28:58.071875','2022-07-15 11:28:58.093916'),(9,7,'My friends','2022-07-15 14:46:44.748115','2022-07-15 14:46:44.798746'),(11,6,'My cute friends','2022-07-20 07:02:08.494008','2022-07-20 07:02:19.837993');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20220707124413'),('20220708115854'),('20220708120625'),('20220708140534'),('20220710122946'),('20220710123215'),('20220712092449'),('20220712100549'),('20220712110622'),('20220713093232'),('20220713095003'),('20220713103009'),('20220714112818'),('20220714113658'),('20220714114754'),('20220714114814'),('20220715063358'),('20220715065045'),('20220715123331'),('20220719102913');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` text,
  `email` text,
  `mobile_number` bigint DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `description` text,
  `gender` enum('male','female','not say') DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'Mohammed','riyas@gmail.com',8937487843,'$2a$12$jkE3XO38q3skPs4agLhek.LJfqG56aESqRTurHiDCKolcV..y1PTi','2022-07-14 14:26:28.107466','2022-07-21 06:05:34.391788',NULL,NULL,NULL),(7,'hasan_don','hasan@gmail.com',8937487847,'$2a$12$2eGUlZS3Y3fjarDxWt.ViOBnwpRXk3qDKxcm1eq3a10KIQ/fn7Vaa','2022-07-15 10:01:23.213790','2022-07-19 05:13:43.584210',NULL,NULL,NULL),(8,'hasan','hasan7@gmail.com',8937487845,'$2a$12$.AaC96jsmOBn2Jo4YQ61NeOSFV9dEPflnt/R1P2a5gqsHzbiSYWIy','2022-07-15 10:02:26.525473','2022-07-16 13:57:48.448225',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-25 10:52:50
