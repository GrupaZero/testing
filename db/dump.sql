-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: dev_db    Database: gzero-cms
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.14-MariaDB-1~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acl_permission_role`
--

DROP TABLE IF EXISTS `acl_permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `acl_permission_role_permission_id_index` (`permission_id`),
  KEY `acl_permission_role_role_id_index` (`role_id`),
  CONSTRAINT `acl_permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `acl_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acl_permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_permission_role`
--

LOCK TABLES `acl_permission_role` WRITE;
/*!40000 ALTER TABLE `acl_permission_role` DISABLE KEYS */;
INSERT INTO `acl_permission_role` VALUES (1,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(204,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(207,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(205,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(206,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(200,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(203,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(201,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(202,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(212,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(215,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(213,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(214,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(220,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(221,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(222,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(216,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(219,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(217,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(218,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(208,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(211,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(209,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(210,1,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(1,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(200,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(201,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(202,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(203,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(204,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(205,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(206,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(207,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(212,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(213,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(214,2,'2016-12-08 19:55:41','2016-12-08 19:55:41'),(215,2,'2016-12-08 19:55:41','2016-12-08 19:55:41');
/*!40000 ALTER TABLE `acl_permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_permissions`
--

DROP TABLE IF EXISTS `acl_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_permissions`
--

LOCK TABLES `acl_permissions` WRITE;
/*!40000 ALTER TABLE `acl_permissions` DISABLE KEYS */;
INSERT INTO `acl_permissions` VALUES (1,'admin-api-access','general',NULL,NULL),(200,'content-create','content',NULL,NULL),(201,'content-read','content',NULL,NULL),(202,'content-update','content',NULL,NULL),(203,'content-delete','content',NULL,NULL),(204,'block-create','block',NULL,NULL),(205,'block-read','block',NULL,NULL),(206,'block-update','block',NULL,NULL),(207,'block-delete','block',NULL,NULL),(208,'user-create','user',NULL,NULL),(209,'user-read','user',NULL,NULL),(210,'user-update','user',NULL,NULL),(211,'user-delete','user',NULL,NULL),(212,'file-create','file',NULL,NULL),(213,'file-read','file',NULL,NULL),(214,'file-update','file',NULL,NULL),(215,'file-delete','file',NULL,NULL),(216,'role-create','role',NULL,NULL),(217,'role-read','role',NULL,NULL),(218,'role-update','role',NULL,NULL),(219,'role-delete','role',NULL,NULL),(220,'options-read','options',NULL,NULL),(221,'options-update-general','options',NULL,NULL),(222,'options-update-seo','options',NULL,NULL);
/*!40000 ALTER TABLE `acl_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
INSERT INTO `acl_roles` VALUES (1,'Admin','2016-12-08 19:55:41','2016-12-08 19:55:41'),(2,'Moderator','2016-12-08 19:55:41','2016-12-08 19:55:41');
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_user_role`
--

DROP TABLE IF EXISTS `acl_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `acl_user_role_user_id_index` (`user_id`),
  KEY `acl_user_role_role_id_index` (`role_id`),
  CONSTRAINT `acl_user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acl_user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_user_role`
--

LOCK TABLES `acl_user_role` WRITE;
/*!40000 ALTER TABLE `acl_user_role` DISABLE KEYS */;
INSERT INTO `acl_user_role` VALUES (1,1,'2016-12-08 19:55:41','2016-12-08 19:55:41');
/*!40000 ALTER TABLE `acl_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_translations`
--

DROP TABLE IF EXISTS `block_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `block_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `custom_fields` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_translations_block_id_foreign` (`block_id`),
  KEY `block_translations_lang_code_foreign` (`lang_code`),
  CONSTRAINT `block_translations_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `block_translations_lang_code_foreign` FOREIGN KEY (`lang_code`) REFERENCES `langs` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_translations`
--

LOCK TABLES `block_translations` WRITE;
/*!40000 ALTER TABLE `block_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_types`
--

DROP TABLE IF EXISTS `block_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_types` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `block_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_types`
--

LOCK TABLES `block_types` WRITE;
/*!40000 ALTER TABLE `block_types` DISABLE KEYS */;
INSERT INTO `block_types` VALUES ('basic',1,'2016-12-08 19:55:40','2016-12-08 19:55:40'),('content',1,'2016-12-08 19:55:40','2016-12-08 19:55:40'),('menu',1,'2016-12-08 19:55:40','2016-12-08 19:55:40'),('slider',1,'2016-12-08 19:55:40','2016-12-08 19:55:40'),('widget',1,'2016-12-08 19:55:40','2016-12-08 19:55:40');
/*!40000 ALTER TABLE `block_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blockable_id` int(10) unsigned DEFAULT NULL,
  `blockable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `filter` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `weight` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_cacheable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blocks_blockable_id_blockable_type_index` (`blockable_id`,`blockable_type`),
  KEY `blocks_author_id_foreign` (`author_id`),
  KEY `blocks_type_foreign` (`type`),
  CONSTRAINT `blocks_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blocks_type_foreign` FOREIGN KEY (`type`) REFERENCES `block_types` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_translations`
--

DROP TABLE IF EXISTS `content_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `content_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teaser` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_translations_content_id_foreign` (`content_id`),
  KEY `content_translations_lang_code_foreign` (`lang_code`),
  CONSTRAINT `content_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_translations_lang_code_foreign` FOREIGN KEY (`lang_code`) REFERENCES `langs` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_translations`
--

LOCK TABLES `content_translations` WRITE;
/*!40000 ALTER TABLE `content_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_types`
--

DROP TABLE IF EXISTS `content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_types` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `content_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_types`
--

LOCK TABLES `content_types` WRITE;
/*!40000 ALTER TABLE `content_types` DISABLE KEYS */;
INSERT INTO `content_types` VALUES ('category',1,'2016-12-08 19:55:39','2016-12-08 19:55:39'),('content',1,'2016-12-08 19:55:39','2016-12-08 19:55:39');
/*!40000 ALTER TABLE `content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `visits` int(11) NOT NULL DEFAULT '0',
  `is_on_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_comment_allowed` tinyint(1) NOT NULL DEFAULT '0',
  `is_promoted` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_type_path_parent_id_level_index` (`type`,`path`,`parent_id`,`level`),
  KEY `contents_author_id_foreign` (`author_id`),
  KEY `contents_parent_id_foreign` (`parent_id`),
  KEY `contents_file_id_foreign` (`file_id`),
  CONSTRAINT `contents_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `contents_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE SET NULL,
  CONSTRAINT `contents_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contents_type_foreign` FOREIGN KEY (`type`) REFERENCES `content_types` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_translations`
--

DROP TABLE IF EXISTS `file_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_translations_file_id_lang_code_unique` (`file_id`,`lang_code`),
  KEY `file_translations_lang_code_foreign` (`lang_code`),
  CONSTRAINT `file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_translations_lang_code_foreign` FOREIGN KEY (`lang_code`) REFERENCES `langs` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_translations`
--

LOCK TABLES `file_translations` WRITE;
/*!40000 ALTER TABLE `file_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_types`
--

DROP TABLE IF EXISTS `file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_types` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extensions` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `file_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_types`
--

LOCK TABLES `file_types` WRITE;
/*!40000 ALTER TABLE `file_types` DISABLE KEYS */;
INSERT INTO `file_types` VALUES ('document',NULL,1,'2016-12-08 19:55:40','2016-12-08 19:55:40'),('image',NULL,1,'2016-12-08 19:55:40','2016-12-08 19:55:40'),('music',NULL,1,'2016-12-08 19:55:40','2016-12-08 19:55:40'),('video',NULL,1,'2016-12-08 19:55:40','2016-12-08 19:55:40');
/*!40000 ALTER TABLE `file_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `created_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_created_by_foreign` (`created_by`),
  KEY `files_type_foreign` (`type`),
  CONSTRAINT `files_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_type_foreign` FOREIGN KEY (`type`) REFERENCES `file_types` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langs`
--

DROP TABLE IF EXISTS `langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langs` (
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `i18n` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `langs_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langs`
--

LOCK TABLES `langs` WRITE;
/*!40000 ALTER TABLE `langs` DISABLE KEYS */;
INSERT INTO `langs` VALUES ('en','en_US',1,1,'2016-12-08 19:55:39','2016-12-08 19:55:39'),('pl','pl_PL',1,0,'2016-12-08 19:55:39','2016-12-08 19:55:39'),('de','de_DE',0,0,'2016-12-08 19:55:39','2016-12-08 19:55:39'),('fr','fr_FR',0,0,'2016-12-08 19:55:39','2016-12-08 19:55:39');
/*!40000 ALTER TABLE `langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_100000_create_password_resets_table',1),(2,'2014_11_16_114110_create_lang',1),(3,'2014_11_16_114111_create_user',1),(4,'2014_11_16_114112_create_route',1),(5,'2014_11_16_114113_create_content',1),(6,'2015_09_07_100656_create_options',1),(7,'2015_11_26_115322_create_block',1),(8,'2016_05_08_111342_create_files_table',1),(9,'2016_05_08_140929_add_file_column_to_contents_table',1),(10,'2016_06_01_000001_create_oauth_auth_codes_table',1),(11,'2016_06_01_000002_create_oauth_access_tokens_table',1),(12,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(13,'2016_06_01_000004_create_oauth_clients_table',1),(14,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(15,'2016_08_13_113755_create_roles_and_permissions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'GZERO-CMS Personal Access Client','YX0vA7mdSeGBHIYUzrdedUfdRtkWyEHpJHuCOErw','http://localhost',1,0,0,'2016-12-08 19:56:10','2016-12-08 19:56:10'),(2,NULL,'GZERO-CMS Password Grant Client','tDVrxmGJdWNpKH37EK7olcr4ZeHqsYLI9SyvYto5','http://localhost',0,1,0,'2016-12-08 19:56:10','2016-12-08 19:56:10');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2016-12-08 19:56:10','2016-12-08 19:56:10');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_categories`
--

DROP TABLE IF EXISTS `option_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_categories` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`key`),
  KEY `option_categories_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_categories`
--

LOCK TABLES `option_categories` WRITE;
/*!40000 ALTER TABLE `option_categories` DISABLE KEYS */;
INSERT INTO `option_categories` VALUES ('general','2016-12-08 19:55:40','2016-12-08 19:55:40'),('seo','2016-12-08 19:55:40','2016-12-08 19:55:40');
/*!40000 ALTER TABLE `option_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `options_category_key_key_index` (`category_key`,`key`),
  CONSTRAINT `options_category_key_foreign` FOREIGN KEY (`category_key`) REFERENCES `option_categories` (`key`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'site_name','general','{\"en\":\"G-ZERO CMS\",\"pl\":\"G-ZERO CMS\",\"de\":\"G-ZERO CMS\",\"fr\":\"G-ZERO CMS\"}','2016-12-08 19:55:40','2016-12-08 19:55:40'),(2,'site_desc','general','{\"en\":\"Content management system.\",\"pl\":\"Content management system.\",\"de\":\"Content management system.\",\"fr\":\"Content management system.\"}','2016-12-08 19:55:40','2016-12-08 19:55:40'),(3,'default_page_size','general','{\"en\":5,\"pl\":5,\"de\":5,\"fr\":5}','2016-12-08 19:55:40','2016-12-08 19:55:40'),(4,'cookies_policy_url','general','{\"en\":null,\"pl\":null,\"de\":null,\"fr\":null}','2016-12-08 19:55:40','2016-12-08 19:55:40'),(5,'desc_length','seo','{\"en\":160,\"pl\":160,\"de\":160,\"fr\":160}','2016-12-08 19:55:40','2016-12-08 19:55:40'),(6,'google_analytics_id','seo','{\"en\":null,\"pl\":null,\"de\":null,\"fr\":null}','2016-12-08 19:55:40','2016-12-08 19:55:40');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_translations`
--

DROP TABLE IF EXISTS `route_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `route_id` int(10) unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_translations_lang_code_route_id_unique` (`lang_code`,`route_id`),
  UNIQUE KEY `route_translations_lang_code_url_unique` (`lang_code`,`url`),
  KEY `route_translations_route_id_foreign` (`route_id`),
  KEY `route_translations_url_index` (`url`),
  CONSTRAINT `route_translations_lang_code_foreign` FOREIGN KEY (`lang_code`) REFERENCES `langs` (`code`) ON DELETE CASCADE,
  CONSTRAINT `route_translations_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_translations`
--

LOCK TABLES `route_translations` WRITE;
/*!40000 ALTER TABLE `route_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `routable_id` int(10) unsigned DEFAULT NULL,
  `routable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadables`
--

DROP TABLE IF EXISTS `uploadables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadables` (
  `file_id` int(10) unsigned NOT NULL,
  `uploadable_id` int(10) unsigned DEFAULT NULL,
  `uploadable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `uploadables_file_id_index` (`file_id`),
  CONSTRAINT `uploadables_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadables`
--

LOCK TABLES `uploadables` WRITE;
/*!40000 ALTER TABLE `uploadables` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nick` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_nick_unique` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gzero.pl','$2y$10$8M6RUjmGV2.CK2GRG7GOiOzNw6Bj0v8mII.FrehzR7WzucgqdE0YW','Admin','John','Doe',1,NULL,'2016-12-08 19:55:39','2016-12-08 19:55:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `args` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_cacheable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gzero-cms'
--

--
-- Dumping routines for database 'gzero-cms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-08 19:56:18
