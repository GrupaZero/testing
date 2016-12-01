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
-- Table structure for table `ACLPermissions`
--

DROP TABLE IF EXISTS `ACLPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACLPermissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aclpermissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACLPermissions`
--

LOCK TABLES `ACLPermissions` WRITE;
/*!40000 ALTER TABLE `ACLPermissions` DISABLE KEYS */;
INSERT INTO `ACLPermissions` VALUES (1,'admin-api-access','general'),(200,'content-create','content'),(201,'content-read','content'),(202,'content-update','content'),(203,'content-delete','content'),(204,'block-create','block'),(205,'block-read','block'),(206,'block-update','block'),(207,'block-delete','block'),(208,'user-create','user'),(209,'user-read','user'),(210,'user-update','user'),(211,'user-delete','user'),(212,'file-create','file'),(213,'file-read','file'),(214,'file-update','file'),(215,'file-delete','file'),(216,'role-create','role'),(217,'role-read','role'),(218,'role-update','role'),(219,'role-delete','role'),(220,'options-read','options'),(221,'options-update-general','options'),(222,'options-update-seo','options');
/*!40000 ALTER TABLE `ACLPermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACLRolePermissions`
--

DROP TABLE IF EXISTS `ACLRolePermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACLRolePermissions` (
  `permissionId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `aclrolepermissions_permissionid_index` (`permissionId`),
  KEY `aclrolepermissions_roleid_index` (`roleId`),
  CONSTRAINT `aclrolepermissions_permissionid_foreign` FOREIGN KEY (`permissionId`) REFERENCES `ACLPermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `aclrolepermissions_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `ACLRoles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACLRolePermissions`
--

LOCK TABLES `ACLRolePermissions` WRITE;
/*!40000 ALTER TABLE `ACLRolePermissions` DISABLE KEYS */;
INSERT INTO `ACLRolePermissions` VALUES (1,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(204,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(207,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(205,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(206,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(200,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(203,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(201,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(202,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(212,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(215,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(213,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(214,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(220,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(221,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(222,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(216,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(219,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(217,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(218,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(208,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(211,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(209,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(210,1,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(1,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(200,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(201,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(202,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(203,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(204,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(205,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(206,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(207,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(212,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(213,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(214,2,'2016-11-22 15:45:22','2016-11-22 15:45:22'),(215,2,'2016-11-22 15:45:22','2016-11-22 15:45:22');
/*!40000 ALTER TABLE `ACLRolePermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACLRoles`
--

DROP TABLE IF EXISTS `ACLRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACLRoles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aclroles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACLRoles`
--

LOCK TABLES `ACLRoles` WRITE;
/*!40000 ALTER TABLE `ACLRoles` DISABLE KEYS */;
INSERT INTO `ACLRoles` VALUES (1,'Admin','2016-11-22 15:45:22','2016-11-22 15:45:22'),(2,'Moderator','2016-11-22 15:45:22','2016-11-22 15:45:22');
/*!40000 ALTER TABLE `ACLRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACLUserRoles`
--

DROP TABLE IF EXISTS `ACLUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACLUserRoles` (
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `acluserroles_userid_index` (`userId`),
  KEY `acluserroles_roleid_index` (`roleId`),
  CONSTRAINT `acluserroles_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `ACLRoles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acluserroles_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACLUserRoles`
--

LOCK TABLES `ACLUserRoles` WRITE;
/*!40000 ALTER TABLE `ACLUserRoles` DISABLE KEYS */;
INSERT INTO `ACLUserRoles` VALUES (1,1,'2016-11-22 15:45:22','2016-11-22 15:45:22');
/*!40000 ALTER TABLE `ACLUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlockTranslations`
--

DROP TABLE IF EXISTS `BlockTranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlockTranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langCode` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `blockId` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `customFields` text COLLATE utf8_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `blocktranslations_blockid_foreign` (`blockId`),
  KEY `blocktranslations_langcode_foreign` (`langCode`),
  CONSTRAINT `blocktranslations_blockid_foreign` FOREIGN KEY (`blockId`) REFERENCES `Blocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blocktranslations_langcode_foreign` FOREIGN KEY (`langCode`) REFERENCES `Langs` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlockTranslations`
--

LOCK TABLES `BlockTranslations` WRITE;
/*!40000 ALTER TABLE `BlockTranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlockTranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlockTypes`
--

DROP TABLE IF EXISTS `BlockTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlockTypes` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `blocktypes_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlockTypes`
--

LOCK TABLES `BlockTypes` WRITE;
/*!40000 ALTER TABLE `BlockTypes` DISABLE KEYS */;
INSERT INTO `BlockTypes` VALUES ('basic',1,'2016-11-22 15:45:21','2016-11-22 15:45:21'),('content',1,'2016-11-22 15:45:21','2016-11-22 15:45:21'),('menu',1,'2016-11-22 15:45:21','2016-11-22 15:45:21'),('slider',1,'2016-11-22 15:45:21','2016-11-22 15:45:21'),('widget',1,'2016-11-22 15:45:21','2016-11-22 15:45:21');
/*!40000 ALTER TABLE `BlockTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blocks`
--

DROP TABLE IF EXISTS `Blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blockableId` int(10) unsigned DEFAULT NULL,
  `blockableType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT NULL,
  `filter` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `weight` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `isCacheable` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blocks_blockableid_blockabletype_index` (`blockableId`,`blockableType`),
  KEY `blocks_authorid_foreign` (`authorId`),
  KEY `blocks_type_foreign` (`type`),
  CONSTRAINT `blocks_authorid_foreign` FOREIGN KEY (`authorId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blocks_type_foreign` FOREIGN KEY (`type`) REFERENCES `BlockTypes` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blocks`
--

LOCK TABLES `Blocks` WRITE;
/*!40000 ALTER TABLE `Blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContentTranslations`
--

DROP TABLE IF EXISTS `ContentTranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContentTranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langCode` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `contentId` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teaser` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `seoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `contenttranslations_contentid_foreign` (`contentId`),
  KEY `contenttranslations_langcode_foreign` (`langCode`),
  CONSTRAINT `contenttranslations_contentid_foreign` FOREIGN KEY (`contentId`) REFERENCES `Contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contenttranslations_langcode_foreign` FOREIGN KEY (`langCode`) REFERENCES `Langs` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContentTranslations`
--

LOCK TABLES `ContentTranslations` WRITE;
/*!40000 ALTER TABLE `ContentTranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContentTranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContentTypes`
--

DROP TABLE IF EXISTS `ContentTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContentTypes` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `contenttypes_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContentTypes`
--

LOCK TABLES `ContentTypes` WRITE;
/*!40000 ALTER TABLE `ContentTypes` DISABLE KEYS */;
INSERT INTO `ContentTypes` VALUES ('category',1,'2016-11-22 15:45:20','2016-11-22 15:45:20'),('content',1,'2016-11-22 15:45:20','2016-11-22 15:45:20');
/*!40000 ALTER TABLE `ContentTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contents`
--

DROP TABLE IF EXISTS `Contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentId` int(10) unsigned DEFAULT NULL,
  `fileId` int(10) unsigned DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `visits` int(11) NOT NULL DEFAULT '0',
  `isOnHome` tinyint(1) NOT NULL DEFAULT '0',
  `isCommentAllowed` tinyint(1) NOT NULL DEFAULT '0',
  `isPromoted` tinyint(1) NOT NULL DEFAULT '0',
  `isSticky` tinyint(1) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `publishedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_type_path_parentid_level_index` (`type`,`path`,`parentId`,`level`),
  KEY `contents_authorid_foreign` (`authorId`),
  KEY `contents_parentid_foreign` (`parentId`),
  KEY `contents_fileid_foreign` (`fileId`),
  CONSTRAINT `contents_authorid_foreign` FOREIGN KEY (`authorId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `contents_fileid_foreign` FOREIGN KEY (`fileId`) REFERENCES `Files` (`id`) ON DELETE SET NULL,
  CONSTRAINT `contents_parentid_foreign` FOREIGN KEY (`parentId`) REFERENCES `Contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contents_type_foreign` FOREIGN KEY (`type`) REFERENCES `ContentTypes` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contents`
--

LOCK TABLES `Contents` WRITE;
/*!40000 ALTER TABLE `Contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileTranslations`
--

DROP TABLE IF EXISTS `FileTranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileTranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langCode` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `fileId` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filetranslations_fileid_langcode_unique` (`fileId`,`langCode`),
  KEY `filetranslations_langcode_foreign` (`langCode`),
  CONSTRAINT `filetranslations_fileid_foreign` FOREIGN KEY (`fileId`) REFERENCES `Files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `filetranslations_langcode_foreign` FOREIGN KEY (`langCode`) REFERENCES `Langs` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileTranslations`
--

LOCK TABLES `FileTranslations` WRITE;
/*!40000 ALTER TABLE `FileTranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileTranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileTypes`
--

DROP TABLE IF EXISTS `FileTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileTypes` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extensions` text COLLATE utf8_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `filetypes_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileTypes`
--

LOCK TABLES `FileTypes` WRITE;
/*!40000 ALTER TABLE `FileTypes` DISABLE KEYS */;
INSERT INTO `FileTypes` VALUES ('document',NULL,1,'2016-11-22 15:45:21','2016-11-22 15:45:21'),('image',NULL,1,'2016-11-22 15:45:21','2016-11-22 15:45:21'),('music',NULL,1,'2016-11-22 15:45:21','2016-11-22 15:45:21'),('video',NULL,1,'2016-11-22 15:45:21','2016-11-22 15:45:21');
/*!40000 ALTER TABLE `FileTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Files`
--

DROP TABLE IF EXISTS `Files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `mimeType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `createdBy` int(10) unsigned DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `files_createdby_foreign` (`createdBy`),
  KEY `files_type_foreign` (`type`),
  CONSTRAINT `files_createdby_foreign` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_type_foreign` FOREIGN KEY (`type`) REFERENCES `FileTypes` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Files`
--

LOCK TABLES `Files` WRITE;
/*!40000 ALTER TABLE `Files` DISABLE KEYS */;
/*!40000 ALTER TABLE `Files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Langs`
--

DROP TABLE IF EXISTS `Langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Langs` (
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `i18n` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `langs_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Langs`
--

LOCK TABLES `Langs` WRITE;
/*!40000 ALTER TABLE `Langs` DISABLE KEYS */;
INSERT INTO `Langs` VALUES ('en','en_US',1,1,'2016-11-22 15:45:20','2016-11-22 15:45:20'),('pl','pl_PL',1,0,'2016-11-22 15:45:20','2016-11-22 15:45:20'),('de','de_DE',0,0,'2016-11-22 15:45:20','2016-11-22 15:45:20'),('fr','fr_FR',0,0,'2016-11-22 15:45:20','2016-11-22 15:45:20');
/*!40000 ALTER TABLE `Langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OptionCategories`
--

DROP TABLE IF EXISTS `OptionCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OptionCategories` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`key`),
  KEY `optioncategories_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OptionCategories`
--

LOCK TABLES `OptionCategories` WRITE;
/*!40000 ALTER TABLE `OptionCategories` DISABLE KEYS */;
INSERT INTO `OptionCategories` VALUES ('general','2016-11-22 15:45:20','2016-11-22 15:45:20'),('seo','2016-11-22 15:45:20','2016-11-22 15:45:20');
/*!40000 ALTER TABLE `OptionCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Options`
--

DROP TABLE IF EXISTS `Options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categoryKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `options_categorykey_key_index` (`categoryKey`,`key`),
  CONSTRAINT `options_categorykey_foreign` FOREIGN KEY (`categoryKey`) REFERENCES `OptionCategories` (`key`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Options`
--

LOCK TABLES `Options` WRITE;
/*!40000 ALTER TABLE `Options` DISABLE KEYS */;
INSERT INTO `Options` VALUES (1,'siteName','general','{\"en\":\"G-ZERO CMS\",\"pl\":\"G-ZERO CMS\",\"de\":\"G-ZERO CMS\",\"fr\":\"G-ZERO CMS\"}','2016-11-22 15:45:20','2016-11-22 15:45:20'),(2,'siteDesc','general','{\"en\":\"Content management system.\",\"pl\":\"Content management system.\",\"de\":\"Content management system.\",\"fr\":\"Content management system.\"}','2016-11-22 15:45:20','2016-11-22 15:45:20'),(3,'defaultPageSize','general','{\"en\":5,\"pl\":5,\"de\":5,\"fr\":5}','2016-11-22 15:45:20','2016-11-22 15:45:20'),(4,'cookiesPolicyUrl','general','{\"en\":null,\"pl\":null,\"de\":null,\"fr\":null}','2016-11-22 15:45:20','2016-11-22 15:45:20'),(5,'seoDescLength','seo','{\"en\":160,\"pl\":160,\"de\":160,\"fr\":160}','2016-11-22 15:45:20','2016-11-22 15:45:20'),(6,'googleAnalyticsId','seo','{\"en\":null,\"pl\":null,\"de\":null,\"fr\":null}','2016-11-22 15:45:20','2016-11-22 15:45:20');
/*!40000 ALTER TABLE `Options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PasswordReminders`
--

DROP TABLE IF EXISTS `PasswordReminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PasswordReminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `passwordreminders_email_index` (`email`),
  KEY `passwordreminders_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PasswordReminders`
--

LOCK TABLES `PasswordReminders` WRITE;
/*!40000 ALTER TABLE `PasswordReminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `PasswordReminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RouteTranslations`
--

DROP TABLE IF EXISTS `RouteTranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RouteTranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langCode` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `routeId` int(10) unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `routetranslations_langcode_routeid_unique` (`langCode`,`routeId`),
  UNIQUE KEY `routetranslations_langcode_url_unique` (`langCode`,`url`),
  KEY `routetranslations_routeid_foreign` (`routeId`),
  KEY `routetranslations_url_index` (`url`),
  CONSTRAINT `routetranslations_langcode_foreign` FOREIGN KEY (`langCode`) REFERENCES `Langs` (`code`) ON DELETE CASCADE,
  CONSTRAINT `routetranslations_routeid_foreign` FOREIGN KEY (`routeId`) REFERENCES `Routes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RouteTranslations`
--

LOCK TABLES `RouteTranslations` WRITE;
/*!40000 ALTER TABLE `RouteTranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `RouteTranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Routes`
--

DROP TABLE IF EXISTS `Routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `routableId` int(10) unsigned DEFAULT NULL,
  `routableType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Routes`
--

LOCK TABLES `Routes` WRITE;
/*!40000 ALTER TABLE `Routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Uploadables`
--

DROP TABLE IF EXISTS `Uploadables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Uploadables` (
  `fileId` int(10) unsigned NOT NULL,
  `uploadableId` int(10) unsigned DEFAULT NULL,
  `uploadableType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `uploadables_fileid_index` (`fileId`),
  CONSTRAINT `uploadables_fileid_foreign` FOREIGN KEY (`fileId`) REFERENCES `Files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Uploadables`
--

LOCK TABLES `Uploadables` WRITE;
/*!40000 ALTER TABLE `Uploadables` DISABLE KEYS */;
/*!40000 ALTER TABLE `Uploadables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nickName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rememberToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_nickname_unique` (`nickName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'admin@gzero.pl','$2y$10$LkWcg4ee62bd0Ldq9xgZzuMN8t75TeYnJaxOfLHcQ44kQFWcKoSZO','Admin','John','Doe',NULL,1,'2016-11-22 15:45:20','2016-11-22 15:45:20');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Widgets`
--

DROP TABLE IF EXISTS `Widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `args` text COLLATE utf8_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `isCacheable` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Widgets`
--

LOCK TABLES `Widgets` WRITE;
/*!40000 ALTER TABLE `Widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Widgets` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_11_16_114110_create_lang',1),(4,'2014_11_16_114111_create_user',1),(5,'2014_11_16_114112_create_route',1),(6,'2014_11_16_114113_create_content',1),(7,'2015_09_07_100656_create_options',1),(8,'2015_11_26_115322_create_block',1),(9,'2016_05_08_111342_create_files_table',1),(10,'2016_05_08_140929_add_file_column_to_contents_table',1),(11,'2016_06_01_000001_create_oauth_auth_codes_table',1),(12,'2016_06_01_000002_create_oauth_access_tokens_table',1),(13,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(14,'2016_06_01_000004_create_oauth_clients_table',1),(15,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(16,'2016_08_13_113755_create_roles_and_permissions_table',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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

-- Dump completed on 2016-11-22 15:46:43