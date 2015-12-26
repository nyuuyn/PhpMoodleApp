CREATE DATABASE  IF NOT EXISTS `DBNAME` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `DBNAME`;

-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: moodle
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `mdl_assign`
--

DROP TABLE IF EXISTS `mdl_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign`
--

LOCK TABLES `mdl_assign` WRITE;
/*!40000 ALTER TABLE `mdl_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_grades`
--

DROP TABLE IF EXISTS `mdl_assign_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_ass_ix` (`assignment`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_grades`
--

LOCK TABLES `mdl_assign_grades` WRITE;
/*!40000 ALTER TABLE `mdl_assign_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_plugin_config`
--

DROP TABLE IF EXISTS `mdl_assign_plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_plugin_config`
--

LOCK TABLES `mdl_assign_plugin_config` WRITE;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_submission`
--

DROP TABLE IF EXISTS `mdl_assign_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_ass_ix` (`assignment`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_submission`
--

LOCK TABLES `mdl_assign_submission` WRITE;
/*!40000 ALTER TABLE `mdl_assign_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_flags`
--

DROP TABLE IF EXISTS `mdl_assign_user_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_flags`
--

LOCK TABLES `mdl_assign_user_flags` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_mapping`
--

DROP TABLE IF EXISTS `mdl_assign_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_mapping`
--

LOCK TABLES `mdl_assign_user_mapping` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_comments`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_comments`
--

LOCK TABLES `mdl_assignfeedback_comments` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_annot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'line',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores annotations added to pdfs submitted by students';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_annot`
--

LOCK TABLES `mdl_assignfeedback_editpdf_annot` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_cmnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext COLLATE utf8_unicode_ci,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores comments added to pdfs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_cmnt`
--

LOCK TABLES `mdl_assignfeedback_editpdf_cmnt` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_quick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores teacher specified quicklist comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_quick`
--

LOCK TABLES `mdl_assignfeedback_editpdf_quick` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_file`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_file`
--

LOCK TABLES `mdl_assignfeedback_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment`
--

LOCK TABLES `mdl_assignment` WRITE;
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_submissions`
--

LOCK TABLES `mdl_assignment_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_upgrade`
--

DROP TABLE IF EXISTS `mdl_assignment_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  KEY `mdl_assiupgr_old2_ix` (`oldinstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_upgrade`
--

LOCK TABLES `mdl_assignment_upgrade` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_file`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_file`
--

LOCK TABLES `mdl_assignsubmission_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_onlinetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_onlinetext`
--

LOCK TABLES `mdl_assignsubmission_onlinetext` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_controllers`
--

LOCK TABLES `mdl_backup_controllers` WRITE;
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_courses`
--

LOCK TABLES `mdl_backup_courses` WRITE;
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_logs`
--

DROP TABLE IF EXISTS `mdl_backup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_logs`
--

LOCK TABLES `mdl_backup_logs` WRITE;
/*!40000 ALTER TABLE `mdl_backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge`
--

DROP TABLE IF EXISTS `mdl_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge`
--

LOCK TABLES `mdl_badge` WRITE;
/*!40000 ALTER TABLE `mdl_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_backpack`
--

DROP TABLE IF EXISTS `mdl_badge_backpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_backpack`
--

LOCK TABLES `mdl_badge_backpack` WRITE;
/*!40000 ALTER TABLE `mdl_badge_backpack` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_backpack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria`
--

DROP TABLE IF EXISTS `mdl_badge_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria`
--

LOCK TABLES `mdl_badge_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_met`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_met`
--

LOCK TABLES `mdl_badge_criteria_met` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_param`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_param`
--

LOCK TABLES `mdl_badge_criteria_param` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_external`
--

DROP TABLE IF EXISTS `mdl_badge_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_external`
--

LOCK TABLES `mdl_badge_external` WRITE;
/*!40000 ALTER TABLE `mdl_badge_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_issued`
--

DROP TABLE IF EXISTS `mdl_badge_issued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_issued`
--

LOCK TABLES `mdl_badge_issued` WRITE;
/*!40000 ALTER TABLE `mdl_badge_issued` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_issued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_manual_award`
--

DROP TABLE IF EXISTS `mdl_badge_manual_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_manual_award`
--

LOCK TABLES `mdl_badge_manual_award` WRITE;
/*!40000 ALTER TABLE `mdl_badge_manual_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_manual_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block`
--

LOCK TABLES `mdl_block` WRITE;
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` VALUES (1,'activity_modules',0,0,1),(2,'admin_bookmarks',0,0,1),(3,'blog_menu',0,0,1),(4,'blog_recent',0,0,1),(5,'blog_tags',0,0,1),(6,'calendar_month',0,0,1),(7,'calendar_upcoming',0,0,1),(8,'comments',0,0,1),(9,'community',0,0,1),(10,'completionstatus',0,0,1),(11,'course_list',0,0,1),(12,'course_overview',0,0,1),(13,'course_summary',0,0,1),(14,'feedback',0,0,0),(15,'glossary_random',0,0,1),(16,'html',0,0,1),(17,'login',0,0,1),(18,'mentees',0,0,1),(19,'messages',0,0,1),(20,'mnet_hosts',0,0,1),(21,'myprofile',0,0,1),(22,'navigation',0,0,1),(23,'news_items',0,0,1),(24,'online_users',0,0,1),(25,'participants',0,0,1),(26,'private_files',0,0,1),(27,'quiz_results',0,0,1),(28,'recent_activity',86400,0,1),(29,'rss_client',300,0,1),(30,'search_forums',0,0,1),(31,'section_links',0,0,1),(32,'selfcompletion',0,0,1),(33,'settings',0,0,1),(34,'site_main_menu',0,0,1),(35,'social_activities',0,0,1),(36,'tag_flickr',0,0,1),(37,'tag_youtube',0,0,1),(38,'tags',0,0,1),(39,'badges',0,0,1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_community`
--

DROP TABLE IF EXISTS `mdl_block_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_community`
--

LOCK TABLES `mdl_block_community` WRITE;
/*!40000 ALTER TABLE `mdl_block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_instances`
--

DROP TABLE IF EXISTS `mdl_block_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_instances`
--

LOCK TABLES `mdl_block_instances` WRITE;
/*!40000 ALTER TABLE `mdl_block_instances` DISABLE KEYS */;
INSERT INTO `mdl_block_instances` VALUES (1,'site_main_menu',2,0,'site-index',NULL,'side-pre',0,''),(2,'course_summary',2,0,'site-index',NULL,'side-post',0,''),(3,'calendar_month',2,0,'site-index',NULL,'side-post',1,''),(4,'navigation',1,1,'*',NULL,'side-pre',0,''),(5,'settings',1,1,'*',NULL,'side-pre',1,''),(6,'admin_bookmarks',1,0,'admin-*',NULL,'side-pre',0,''),(7,'private_files',1,0,'my-index','2','side-post',0,''),(8,'online_users',1,0,'my-index','2','side-post',1,''),(9,'course_overview',1,0,'my-index','2','content',0,''),(10,'calendar_month',1,0,'my-index','2','side-post',0,''),(11,'calendar_upcoming',1,0,'my-index','2','side-post',0,'');
/*!40000 ALTER TABLE `mdl_block_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_positions`
--

DROP TABLE IF EXISTS `mdl_block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_positions`
--

LOCK TABLES `mdl_block_positions` WRITE;
/*!40000 ALTER TABLE `mdl_block_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_recent_activity`
--

DROP TABLE IF EXISTS `mdl_block_recent_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_recent_activity`
--

LOCK TABLES `mdl_block_recent_activity` WRITE;
/*!40000 ALTER TABLE `mdl_block_recent_activity` DISABLE KEYS */;
INSERT INTO `mdl_block_recent_activity` VALUES (1,1,0,1417538694,0,3,NULL);
/*!40000 ALTER TABLE `mdl_block_recent_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_rss_client`
--

LOCK TABLES `mdl_block_rss_client` WRITE;
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_association`
--

DROP TABLE IF EXISTS `mdl_blog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_association`
--

LOCK TABLES `mdl_blog_association` WRITE;
/*!40000 ALTER TABLE `mdl_blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_external`
--

DROP TABLE IF EXISTS `mdl_blog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_external`
--

LOCK TABLES `mdl_blog_external` WRITE;
/*!40000 ALTER TABLE `mdl_blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book`
--

LOCK TABLES `mdl_book` WRITE;
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book_chapters`
--

LOCK TABLES `mdl_book_chapters` WRITE;
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_filters`
--

LOCK TABLES `mdl_cache_filters` WRITE;
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_flags`
--

LOCK TABLES `mdl_cache_flags` WRITE;
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
INSERT INTO `mdl_cache_flags` VALUES (1,'accesslib/dirtycontexts','/1',1417538689,'1',1417545889),(2,'userpreferenceschanged','2',1417538832,'1',1417546032);
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_capabilities`
--

LOCK TABLES `mdl_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` VALUES (1,'moodle/site:config','write',10,'moodle',62),(2,'moodle/site:readallmessages','read',10,'moodle',8),(3,'moodle/site:sendmessage','write',10,'moodle',16),(4,'moodle/site:approvecourse','write',10,'moodle',4),(5,'moodle/backup:backupcourse','write',50,'moodle',28),(6,'moodle/backup:backupsection','write',50,'moodle',28),(7,'moodle/backup:backupactivity','write',70,'moodle',28),(8,'moodle/backup:backuptargethub','write',50,'moodle',28),(9,'moodle/backup:backuptargetimport','write',50,'moodle',28),(10,'moodle/backup:downloadfile','write',50,'moodle',28),(11,'moodle/backup:configure','write',50,'moodle',28),(12,'moodle/backup:userinfo','read',50,'moodle',8),(13,'moodle/backup:anonymise','read',50,'moodle',8),(14,'moodle/restore:restorecourse','write',50,'moodle',28),(15,'moodle/restore:restoresection','write',50,'moodle',28),(16,'moodle/restore:restoreactivity','write',50,'moodle',28),(17,'moodle/restore:viewautomatedfilearea','write',50,'moodle',28),(18,'moodle/restore:restoretargethub','write',50,'moodle',28),(19,'moodle/restore:restoretargetimport','write',50,'moodle',28),(20,'moodle/restore:uploadfile','write',50,'moodle',28),(21,'moodle/restore:configure','write',50,'moodle',28),(22,'moodle/restore:rolldates','write',50,'moodle',0),(23,'moodle/restore:userinfo','write',50,'moodle',30),(24,'moodle/restore:createuser','write',10,'moodle',24),(25,'moodle/site:manageblocks','write',80,'moodle',20),(26,'moodle/site:accessallgroups','read',50,'moodle',0),(27,'moodle/site:viewfullnames','read',50,'moodle',0),(28,'moodle/site:viewuseridentity','read',50,'moodle',0),(29,'moodle/site:viewreports','read',50,'moodle',8),(30,'moodle/site:trustcontent','write',50,'moodle',4),(31,'moodle/site:uploadusers','write',10,'moodle',24),(32,'moodle/filter:manage','write',50,'moodle',0),(33,'moodle/user:create','write',10,'moodle',24),(34,'moodle/user:delete','write',10,'moodle',8),(35,'moodle/user:update','write',10,'moodle',24),(36,'moodle/user:viewdetails','read',50,'moodle',0),(37,'moodle/user:viewalldetails','read',30,'moodle',8),(38,'moodle/user:viewhiddendetails','read',50,'moodle',8),(39,'moodle/user:loginas','write',50,'moodle',30),(40,'moodle/user:managesyspages','write',10,'moodle',0),(41,'moodle/user:manageblocks','write',30,'moodle',0),(42,'moodle/user:manageownblocks','write',10,'moodle',0),(43,'moodle/user:manageownfiles','write',10,'moodle',0),(44,'moodle/user:ignoreuserquota','write',10,'moodle',0),(45,'moodle/my:configsyspages','write',10,'moodle',0),(46,'moodle/role:assign','write',50,'moodle',28),(47,'moodle/role:review','read',50,'moodle',8),(48,'moodle/role:override','write',50,'moodle',28),(49,'moodle/role:safeoverride','write',50,'moodle',16),(50,'moodle/role:manage','write',10,'moodle',28),(51,'moodle/role:switchroles','read',50,'moodle',12),(52,'moodle/category:manage','write',40,'moodle',4),(53,'moodle/category:viewhiddencategories','read',40,'moodle',0),(54,'moodle/cohort:manage','write',40,'moodle',0),(55,'moodle/cohort:assign','write',40,'moodle',0),(56,'moodle/cohort:view','read',50,'moodle',0),(57,'moodle/course:create','write',40,'moodle',4),(58,'moodle/course:request','write',10,'moodle',0),(59,'moodle/course:delete','write',50,'moodle',32),(60,'moodle/course:update','write',50,'moodle',4),(61,'moodle/course:view','read',50,'moodle',0),(62,'moodle/course:enrolreview','read',50,'moodle',8),(63,'moodle/course:enrolconfig','write',50,'moodle',8),(64,'moodle/course:bulkmessaging','write',50,'moodle',16),(65,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(66,'moodle/course:viewhiddencourses','read',50,'moodle',0),(67,'moodle/course:visibility','write',50,'moodle',0),(68,'moodle/course:managefiles','write',50,'moodle',4),(69,'moodle/course:ignorefilesizelimits','write',50,'moodle',0),(70,'moodle/course:manageactivities','write',70,'moodle',4),(71,'moodle/course:activityvisibility','write',70,'moodle',0),(72,'moodle/course:viewhiddenactivities','write',70,'moodle',0),(73,'moodle/course:viewparticipants','read',50,'moodle',0),(74,'moodle/course:changefullname','write',50,'moodle',4),(75,'moodle/course:changeshortname','write',50,'moodle',4),(76,'moodle/course:changeidnumber','write',50,'moodle',4),(77,'moodle/course:changecategory','write',50,'moodle',4),(78,'moodle/course:changesummary','write',50,'moodle',4),(79,'moodle/site:viewparticipants','read',10,'moodle',0),(80,'moodle/course:isincompletionreports','read',50,'moodle',0),(81,'moodle/course:viewscales','read',50,'moodle',0),(82,'moodle/course:managescales','write',50,'moodle',0),(83,'moodle/course:managegroups','write',50,'moodle',0),(84,'moodle/course:reset','write',50,'moodle',32),(85,'moodle/blog:view','read',10,'moodle',0),(86,'moodle/blog:search','read',10,'moodle',0),(87,'moodle/blog:viewdrafts','read',10,'moodle',8),(88,'moodle/blog:create','write',10,'moodle',16),(89,'moodle/blog:manageentries','write',10,'moodle',16),(90,'moodle/blog:manageexternal','write',10,'moodle',16),(91,'moodle/blog:associatecourse','write',50,'moodle',0),(92,'moodle/blog:associatemodule','write',70,'moodle',0),(93,'moodle/calendar:manageownentries','write',50,'moodle',16),(94,'moodle/calendar:managegroupentries','write',50,'moodle',16),(95,'moodle/calendar:manageentries','write',50,'moodle',16),(96,'moodle/user:editprofile','write',30,'moodle',24),(97,'moodle/user:editownprofile','write',10,'moodle',16),(98,'moodle/user:changeownpassword','write',10,'moodle',0),(99,'moodle/user:readuserposts','read',30,'moodle',0),(100,'moodle/user:readuserblogs','read',30,'moodle',0),(101,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8),(102,'moodle/user:editmessageprofile','write',30,'moodle',16),(103,'moodle/user:editownmessageprofile','write',10,'moodle',0),(104,'moodle/question:managecategory','write',50,'moodle',20),(105,'moodle/question:add','write',50,'moodle',20),(106,'moodle/question:editmine','write',50,'moodle',20),(107,'moodle/question:editall','write',50,'moodle',20),(108,'moodle/question:viewmine','read',50,'moodle',0),(109,'moodle/question:viewall','read',50,'moodle',0),(110,'moodle/question:usemine','read',50,'moodle',0),(111,'moodle/question:useall','read',50,'moodle',0),(112,'moodle/question:movemine','write',50,'moodle',0),(113,'moodle/question:moveall','write',50,'moodle',0),(114,'moodle/question:config','write',10,'moodle',2),(115,'moodle/question:flag','write',50,'moodle',0),(116,'moodle/site:doclinks','read',10,'moodle',0),(117,'moodle/course:sectionvisibility','write',50,'moodle',0),(118,'moodle/course:useremail','write',50,'moodle',0),(119,'moodle/course:viewhiddensections','write',50,'moodle',0),(120,'moodle/course:setcurrentsection','write',50,'moodle',0),(121,'moodle/course:movesections','write',50,'moodle',0),(122,'moodle/site:mnetlogintoremote','read',10,'moodle',0),(123,'moodle/grade:viewall','read',50,'moodle',8),(124,'moodle/grade:view','read',50,'moodle',0),(125,'moodle/grade:viewhidden','read',50,'moodle',8),(126,'moodle/grade:import','write',50,'moodle',12),(127,'moodle/grade:export','read',50,'moodle',8),(128,'moodle/grade:manage','write',50,'moodle',12),(129,'moodle/grade:edit','write',50,'moodle',12),(130,'moodle/grade:managegradingforms','write',50,'moodle',12),(131,'moodle/grade:sharegradingforms','write',10,'moodle',4),(132,'moodle/grade:managesharedforms','write',10,'moodle',4),(133,'moodle/grade:manageoutcomes','write',50,'moodle',0),(134,'moodle/grade:manageletters','write',50,'moodle',0),(135,'moodle/grade:hide','write',50,'moodle',0),(136,'moodle/grade:lock','write',50,'moodle',0),(137,'moodle/grade:unlock','write',50,'moodle',0),(138,'moodle/my:manageblocks','write',10,'moodle',0),(139,'moodle/notes:view','read',50,'moodle',0),(140,'moodle/notes:manage','write',50,'moodle',16),(141,'moodle/tag:manage','write',10,'moodle',16),(142,'moodle/tag:create','write',10,'moodle',16),(143,'moodle/tag:edit','write',10,'moodle',16),(144,'moodle/tag:flag','write',10,'moodle',16),(145,'moodle/tag:editblocks','write',10,'moodle',0),(146,'moodle/block:view','read',80,'moodle',0),(147,'moodle/block:edit','write',80,'moodle',20),(148,'moodle/portfolio:export','read',10,'moodle',0),(149,'moodle/comment:view','read',50,'moodle',0),(150,'moodle/comment:post','write',50,'moodle',24),(151,'moodle/comment:delete','write',50,'moodle',32),(152,'moodle/webservice:createtoken','write',10,'moodle',62),(153,'moodle/webservice:createmobiletoken','write',10,'moodle',24),(154,'moodle/rating:view','read',50,'moodle',0),(155,'moodle/rating:viewany','read',50,'moodle',8),(156,'moodle/rating:viewall','read',50,'moodle',8),(157,'moodle/rating:rate','write',50,'moodle',0),(158,'moodle/course:publish','write',10,'moodle',24),(159,'moodle/course:markcomplete','write',50,'moodle',0),(160,'moodle/community:add','write',10,'moodle',0),(161,'moodle/community:download','write',10,'moodle',0),(162,'mod/assign:view','read',70,'mod_assign',0),(163,'mod/assign:submit','write',70,'mod_assign',0),(164,'mod/assign:grade','write',70,'mod_assign',4),(165,'mod/assign:exportownsubmission','read',70,'mod_assign',0),(166,'mod/assign:addinstance','write',50,'mod_assign',4),(167,'mod/assign:grantextension','write',70,'mod_assign',0),(168,'mod/assign:revealidentities','write',70,'mod_assign',0),(169,'mod/assignment:view','read',70,'mod_assignment',0),(170,'mod/assignment:addinstance','write',50,'mod_assignment',4),(171,'mod/assignment:submit','write',70,'mod_assignment',0),(172,'mod/assignment:grade','write',70,'mod_assignment',4),(173,'mod/assignment:exportownsubmission','read',70,'mod_assignment',0),(174,'mod/book:addinstance','write',50,'mod_book',4),(175,'mod/book:read','read',70,'mod_book',0),(176,'mod/book:viewhiddenchapters','read',70,'mod_book',0),(177,'mod/book:edit','write',70,'mod_book',4),(178,'mod/chat:addinstance','write',50,'mod_chat',4),(179,'mod/chat:chat','write',70,'mod_chat',16),(180,'mod/chat:readlog','read',70,'mod_chat',0),(181,'mod/chat:deletelog','write',70,'mod_chat',0),(182,'mod/chat:exportparticipatedsession','read',70,'mod_chat',8),(183,'mod/chat:exportsession','read',70,'mod_chat',8),(184,'mod/choice:addinstance','write',50,'mod_choice',4),(185,'mod/choice:choose','write',70,'mod_choice',0),(186,'mod/choice:readresponses','read',70,'mod_choice',0),(187,'mod/choice:deleteresponses','write',70,'mod_choice',0),(188,'mod/choice:downloadresponses','read',70,'mod_choice',0),(189,'mod/data:addinstance','write',50,'mod_data',4),(190,'mod/data:viewentry','read',70,'mod_data',0),(191,'mod/data:writeentry','write',70,'mod_data',16),(192,'mod/data:comment','write',70,'mod_data',16),(193,'mod/data:rate','write',70,'mod_data',0),(194,'mod/data:viewrating','read',70,'mod_data',0),(195,'mod/data:viewanyrating','read',70,'mod_data',8),(196,'mod/data:viewallratings','read',70,'mod_data',8),(197,'mod/data:approve','write',70,'mod_data',16),(198,'mod/data:manageentries','write',70,'mod_data',16),(199,'mod/data:managecomments','write',70,'mod_data',16),(200,'mod/data:managetemplates','write',70,'mod_data',20),(201,'mod/data:viewalluserpresets','read',70,'mod_data',0),(202,'mod/data:manageuserpresets','write',70,'mod_data',20),(203,'mod/data:exportentry','read',70,'mod_data',8),(204,'mod/data:exportownentry','read',70,'mod_data',0),(205,'mod/data:exportallentries','read',70,'mod_data',8),(206,'mod/data:exportuserinfo','read',70,'mod_data',8),(207,'mod/feedback:addinstance','write',50,'mod_feedback',4),(208,'mod/feedback:view','read',70,'mod_feedback',0),(209,'mod/feedback:complete','write',70,'mod_feedback',16),(210,'mod/feedback:viewanalysepage','read',70,'mod_feedback',8),(211,'mod/feedback:deletesubmissions','write',70,'mod_feedback',0),(212,'mod/feedback:mapcourse','write',70,'mod_feedback',0),(213,'mod/feedback:edititems','write',70,'mod_feedback',20),(214,'mod/feedback:createprivatetemplate','write',70,'mod_feedback',16),(215,'mod/feedback:createpublictemplate','write',70,'mod_feedback',16),(216,'mod/feedback:deletetemplate','write',70,'mod_feedback',0),(217,'mod/feedback:viewreports','read',70,'mod_feedback',8),(218,'mod/feedback:receivemail','read',70,'mod_feedback',8),(219,'mod/folder:addinstance','write',50,'mod_folder',4),(220,'mod/folder:view','read',70,'mod_folder',0),(221,'mod/folder:managefiles','write',70,'mod_folder',16),(222,'mod/forum:addinstance','write',50,'mod_forum',4),(223,'mod/forum:viewdiscussion','read',70,'mod_forum',0),(224,'mod/forum:viewhiddentimedposts','read',70,'mod_forum',0),(225,'mod/forum:startdiscussion','write',70,'mod_forum',16),(226,'mod/forum:replypost','write',70,'mod_forum',16),(227,'mod/forum:addnews','write',70,'mod_forum',16),(228,'mod/forum:replynews','write',70,'mod_forum',16),(229,'mod/forum:viewrating','read',70,'mod_forum',0),(230,'mod/forum:viewanyrating','read',70,'mod_forum',8),(231,'mod/forum:viewallratings','read',70,'mod_forum',8),(232,'mod/forum:rate','write',70,'mod_forum',0),(233,'mod/forum:createattachment','write',70,'mod_forum',16),(234,'mod/forum:deleteownpost','read',70,'mod_forum',0),(235,'mod/forum:deleteanypost','read',70,'mod_forum',0),(236,'mod/forum:splitdiscussions','read',70,'mod_forum',0),(237,'mod/forum:movediscussions','read',70,'mod_forum',0),(238,'mod/forum:editanypost','write',70,'mod_forum',16),(239,'mod/forum:viewqandawithoutposting','read',70,'mod_forum',0),(240,'mod/forum:viewsubscribers','read',70,'mod_forum',0),(241,'mod/forum:managesubscriptions','read',70,'mod_forum',16),(242,'mod/forum:postwithoutthrottling','write',70,'mod_forum',16),(243,'mod/forum:exportdiscussion','read',70,'mod_forum',8),(244,'mod/forum:exportpost','read',70,'mod_forum',8),(245,'mod/forum:exportownpost','read',70,'mod_forum',8),(246,'mod/forum:addquestion','write',70,'mod_forum',16),(247,'mod/forum:allowforcesubscribe','read',70,'mod_forum',0),(248,'mod/glossary:addinstance','write',50,'mod_glossary',4),(249,'mod/glossary:view','read',70,'mod_glossary',0),(250,'mod/glossary:write','write',70,'mod_glossary',16),(251,'mod/glossary:manageentries','write',70,'mod_glossary',16),(252,'mod/glossary:managecategories','write',70,'mod_glossary',16),(253,'mod/glossary:comment','write',70,'mod_glossary',16),(254,'mod/glossary:managecomments','write',70,'mod_glossary',16),(255,'mod/glossary:import','write',70,'mod_glossary',16),(256,'mod/glossary:export','read',70,'mod_glossary',0),(257,'mod/glossary:approve','write',70,'mod_glossary',16),(258,'mod/glossary:rate','write',70,'mod_glossary',0),(259,'mod/glossary:viewrating','read',70,'mod_glossary',0),(260,'mod/glossary:viewanyrating','read',70,'mod_glossary',8),(261,'mod/glossary:viewallratings','read',70,'mod_glossary',8),(262,'mod/glossary:exportentry','read',70,'mod_glossary',8),(263,'mod/glossary:exportownentry','read',70,'mod_glossary',0),(264,'mod/imscp:view','read',70,'mod_imscp',0),(265,'mod/imscp:addinstance','write',50,'mod_imscp',4),(266,'mod/label:addinstance','write',50,'mod_label',4),(267,'mod/lesson:addinstance','write',50,'mod_lesson',4),(268,'mod/lesson:edit','write',70,'mod_lesson',4),(269,'mod/lesson:manage','write',70,'mod_lesson',0),(270,'mod/lti:view','read',70,'mod_lti',0),(271,'mod/lti:addinstance','write',50,'mod_lti',4),(273,'mod/lti:manage','write',70,'mod_lti',8),(274,'mod/lti:addcoursetool','write',50,'mod_lti',0),(275,'mod/lti:requesttooladd','write',50,'mod_lti',0),(276,'mod/page:view','read',70,'mod_page',0),(277,'mod/page:addinstance','write',50,'mod_page',4),(278,'mod/quiz:view','read',70,'mod_quiz',0),(279,'mod/quiz:addinstance','write',50,'mod_quiz',4),(280,'mod/quiz:attempt','write',70,'mod_quiz',16),(281,'mod/quiz:reviewmyattempts','read',70,'mod_quiz',0),(282,'mod/quiz:manage','write',70,'mod_quiz',16),(283,'mod/quiz:manageoverrides','write',70,'mod_quiz',0),(284,'mod/quiz:preview','write',70,'mod_quiz',0),(285,'mod/quiz:grade','write',70,'mod_quiz',16),(286,'mod/quiz:regrade','write',70,'mod_quiz',16),(287,'mod/quiz:viewreports','read',70,'mod_quiz',8),(288,'mod/quiz:deleteattempts','write',70,'mod_quiz',32),(289,'mod/quiz:ignoretimelimits','read',70,'mod_quiz',0),(290,'mod/quiz:emailconfirmsubmission','read',70,'mod_quiz',0),(291,'mod/quiz:emailnotifysubmission','read',70,'mod_quiz',0),(292,'mod/quiz:emailwarnoverdue','read',70,'mod_quiz',0),(293,'mod/resource:view','read',70,'mod_resource',0),(294,'mod/resource:addinstance','write',50,'mod_resource',4),(295,'mod/scorm:addinstance','write',50,'mod_scorm',4),(296,'mod/scorm:viewreport','read',70,'mod_scorm',0),(297,'mod/scorm:skipview','write',70,'mod_scorm',0),(298,'mod/scorm:savetrack','write',70,'mod_scorm',0),(299,'mod/scorm:viewscores','read',70,'mod_scorm',0),(300,'mod/scorm:deleteresponses','read',70,'mod_scorm',0),(301,'mod/scorm:deleteownresponses','write',70,'mod_scorm',0),(302,'mod/survey:addinstance','write',50,'mod_survey',4),(303,'mod/survey:participate','read',70,'mod_survey',0),(304,'mod/survey:readresponses','read',70,'mod_survey',0),(305,'mod/survey:download','read',70,'mod_survey',0),(306,'mod/url:view','read',70,'mod_url',0),(307,'mod/url:addinstance','write',50,'mod_url',4),(308,'mod/wiki:addinstance','write',50,'mod_wiki',4),(309,'mod/wiki:viewpage','read',70,'mod_wiki',0),(310,'mod/wiki:editpage','write',70,'mod_wiki',16),(311,'mod/wiki:createpage','write',70,'mod_wiki',16),(312,'mod/wiki:viewcomment','read',70,'mod_wiki',0),(313,'mod/wiki:editcomment','write',70,'mod_wiki',16),(314,'mod/wiki:managecomment','write',70,'mod_wiki',0),(315,'mod/wiki:managefiles','write',70,'mod_wiki',0),(316,'mod/wiki:overridelock','write',70,'mod_wiki',0),(317,'mod/wiki:managewiki','write',70,'mod_wiki',0),(318,'mod/workshop:view','read',70,'mod_workshop',0),(319,'mod/workshop:addinstance','write',50,'mod_workshop',4),(320,'mod/workshop:switchphase','write',70,'mod_workshop',0),(321,'mod/workshop:editdimensions','write',70,'mod_workshop',4),(322,'mod/workshop:submit','write',70,'mod_workshop',0),(323,'mod/workshop:peerassess','write',70,'mod_workshop',0),(324,'mod/workshop:manageexamples','write',70,'mod_workshop',0),(325,'mod/workshop:allocate','write',70,'mod_workshop',0),(326,'mod/workshop:publishsubmissions','write',70,'mod_workshop',0),(327,'mod/workshop:viewauthornames','read',70,'mod_workshop',0),(328,'mod/workshop:viewreviewernames','read',70,'mod_workshop',0),(329,'mod/workshop:viewallsubmissions','read',70,'mod_workshop',0),(330,'mod/workshop:viewpublishedsubmissions','read',70,'mod_workshop',0),(331,'mod/workshop:viewauthorpublished','read',70,'mod_workshop',0),(332,'mod/workshop:viewallassessments','read',70,'mod_workshop',0),(333,'mod/workshop:overridegrades','write',70,'mod_workshop',0),(334,'mod/workshop:ignoredeadlines','write',70,'mod_workshop',0),(341,'enrol/category:synchronised','write',10,'enrol_category',0),(342,'enrol/cohort:config','write',50,'enrol_cohort',0),(343,'enrol/cohort:unenrol','write',50,'enrol_cohort',0),(344,'enrol/database:unenrol','write',50,'enrol_database',0),(345,'enrol/guest:config','write',50,'enrol_guest',0),(346,'enrol/ldap:manage','write',50,'enrol_ldap',0),(347,'enrol/manual:config','write',50,'enrol_manual',0),(348,'enrol/manual:enrol','write',50,'enrol_manual',0),(349,'enrol/manual:manage','write',50,'enrol_manual',0),(350,'enrol/manual:unenrol','write',50,'enrol_manual',0),(351,'enrol/manual:unenrolself','write',50,'enrol_manual',0),(352,'enrol/meta:config','write',50,'enrol_meta',0),(353,'enrol/meta:selectaslinked','read',50,'enrol_meta',0),(354,'enrol/meta:unenrol','write',50,'enrol_meta',0),(355,'enrol/paypal:config','write',50,'enrol_paypal',0),(356,'enrol/paypal:manage','write',50,'enrol_paypal',0),(357,'enrol/paypal:unenrol','write',50,'enrol_paypal',0),(358,'enrol/paypal:unenrolself','write',50,'enrol_paypal',0),(359,'enrol/self:config','write',50,'enrol_self',0),(360,'enrol/self:manage','write',50,'enrol_self',0),(361,'enrol/self:unenrolself','write',50,'enrol_self',0),(362,'enrol/self:unenrol','write',50,'enrol_self',0),(363,'block/activity_modules:addinstance','write',80,'block_activity_modules',20),(364,'block/admin_bookmarks:myaddinstance','write',10,'block_admin_bookmarks',0),(365,'block/admin_bookmarks:addinstance','write',80,'block_admin_bookmarks',20),(366,'block/blog_menu:addinstance','write',80,'block_blog_menu',20),(367,'block/blog_recent:addinstance','write',80,'block_blog_recent',20),(368,'block/blog_tags:addinstance','write',80,'block_blog_tags',20),(369,'block/calendar_month:myaddinstance','write',10,'block_calendar_month',0),(370,'block/calendar_month:addinstance','write',80,'block_calendar_month',20),(371,'block/calendar_upcoming:myaddinstance','write',10,'block_calendar_upcoming',0),(372,'block/calendar_upcoming:addinstance','write',80,'block_calendar_upcoming',20),(373,'block/comments:myaddinstance','write',10,'block_comments',0),(374,'block/comments:addinstance','write',80,'block_comments',20),(375,'block/community:myaddinstance','write',10,'block_community',0),(376,'block/community:addinstance','write',80,'block_community',20),(377,'block/completionstatus:addinstance','write',80,'block_completionstatus',20),(378,'block/course_list:myaddinstance','write',10,'block_course_list',0),(379,'block/course_list:addinstance','write',80,'block_course_list',20),(380,'block/course_overview:myaddinstance','write',10,'block_course_overview',0),(381,'block/course_summary:addinstance','write',80,'block_course_summary',20),(382,'block/feedback:addinstance','write',80,'block_feedback',20),(383,'block/glossary_random:addinstance','write',80,'block_glossary_random',20),(384,'block/html:myaddinstance','write',10,'block_html',0),(385,'block/html:addinstance','write',80,'block_html',20),(386,'block/login:addinstance','write',80,'block_login',20),(387,'block/mentees:addinstance','write',80,'block_mentees',20),(388,'block/messages:myaddinstance','write',10,'block_messages',0),(389,'block/messages:addinstance','write',80,'block_messages',20),(390,'block/mnet_hosts:myaddinstance','write',10,'block_mnet_hosts',0),(391,'block/mnet_hosts:addinstance','write',80,'block_mnet_hosts',20),(392,'block/myprofile:myaddinstance','write',10,'block_myprofile',0),(393,'block/myprofile:addinstance','write',80,'block_myprofile',20),(394,'block/navigation:myaddinstance','write',10,'block_navigation',0),(395,'block/navigation:addinstance','write',80,'block_navigation',20),(396,'block/news_items:addinstance','write',80,'block_news_items',20),(397,'block/online_users:addinstance','write',80,'block_online_users',20),(398,'block/online_users:viewlist','read',80,'block_online_users',0),(399,'block/participants:addinstance','write',80,'block_participants',20),(400,'block/private_files:myaddinstance','write',10,'block_private_files',0),(401,'block/private_files:addinstance','write',80,'block_private_files',20),(402,'block/quiz_results:addinstance','write',80,'block_quiz_results',20),(403,'block/recent_activity:addinstance','write',80,'block_recent_activity',20),(404,'block/rss_client:myaddinstance','write',10,'block_rss_client',0),(405,'block/rss_client:addinstance','write',80,'block_rss_client',20),(406,'block/rss_client:manageownfeeds','write',80,'block_rss_client',0),(407,'block/rss_client:manageanyfeeds','write',80,'block_rss_client',16),(408,'block/search_forums:addinstance','write',80,'block_search_forums',20),(409,'block/section_links:addinstance','write',80,'block_section_links',20),(410,'block/selfcompletion:addinstance','write',80,'block_selfcompletion',20),(411,'block/settings:myaddinstance','write',10,'block_settings',0),(412,'block/settings:addinstance','write',80,'block_settings',20),(413,'block/site_main_menu:addinstance','write',80,'block_site_main_menu',20),(414,'block/social_activities:addinstance','write',80,'block_social_activities',20),(415,'block/tag_flickr:addinstance','write',80,'block_tag_flickr',20),(416,'block/tag_youtube:addinstance','write',80,'block_tag_youtube',20),(417,'block/tags:myaddinstance','write',10,'block_tags',0),(418,'block/tags:addinstance','write',80,'block_tags',20),(419,'report/completion:view','read',50,'report_completion',8),(420,'report/courseoverview:view','read',10,'report_courseoverview',8),(421,'report/log:view','read',50,'report_log',8),(422,'report/log:viewtoday','read',50,'report_log',8),(423,'report/loglive:view','read',50,'report_loglive',8),(424,'report/outline:view','read',50,'report_outline',8),(425,'report/participation:view','read',50,'report_participation',8),(426,'report/progress:view','read',50,'report_progress',8),(427,'report/questioninstances:view','read',10,'report_questioninstances',0),(428,'report/security:view','read',10,'report_security',2),(429,'report/stats:view','read',50,'report_stats',8),(430,'gradeexport/ods:view','read',50,'gradeexport_ods',8),(431,'gradeexport/ods:publish','read',50,'gradeexport_ods',8),(432,'gradeexport/txt:view','read',50,'gradeexport_txt',8),(433,'gradeexport/txt:publish','read',50,'gradeexport_txt',8),(434,'gradeexport/xls:view','read',50,'gradeexport_xls',8),(435,'gradeexport/xls:publish','read',50,'gradeexport_xls',8),(436,'gradeexport/xml:view','read',50,'gradeexport_xml',8),(437,'gradeexport/xml:publish','read',50,'gradeexport_xml',8),(438,'gradeimport/csv:view','write',50,'gradeimport_csv',0),(439,'gradeimport/xml:view','write',50,'gradeimport_xml',0),(440,'gradeimport/xml:publish','write',50,'gradeimport_xml',0),(441,'gradereport/grader:view','read',50,'gradereport_grader',8),(442,'gradereport/outcomes:view','read',50,'gradereport_outcomes',8),(443,'gradereport/overview:view','read',50,'gradereport_overview',8),(444,'gradereport/user:view','read',50,'gradereport_user',8),(445,'webservice/amf:use','read',50,'webservice_amf',62),(446,'webservice/rest:use','read',50,'webservice_rest',62),(447,'webservice/soap:use','read',50,'webservice_soap',62),(448,'webservice/xmlrpc:use','read',50,'webservice_xmlrpc',62),(449,'repository/alfresco:view','read',70,'repository_alfresco',0),(450,'repository/boxnet:view','read',70,'repository_boxnet',0),(451,'repository/coursefiles:view','read',70,'repository_coursefiles',0),(452,'repository/-- DROPbox:view','read',70,'repository_-- DROPbox',0),(453,'repository/equella:view','read',70,'repository_equella',0),(454,'repository/filesystem:view','read',70,'repository_filesystem',0),(455,'repository/flickr:view','read',70,'repository_flickr',0),(456,'repository/flickr_public:view','read',70,'repository_flickr_public',0),(457,'repository/googledocs:view','read',70,'repository_googledocs',0),(458,'repository/local:view','read',70,'repository_local',0),(459,'repository/merlot:view','read',70,'repository_merlot',0),(460,'repository/picasa:view','read',70,'repository_picasa',0),(461,'repository/recent:view','read',70,'repository_recent',0),(462,'repository/s3:view','read',70,'repository_s3',0),(463,'repository/upload:view','read',70,'repository_upload',0),(464,'repository/url:view','read',70,'repository_url',0),(465,'repository/user:view','read',70,'repository_user',0),(466,'repository/webdav:view','read',70,'repository_webdav',0),(467,'repository/wikimedia:view','read',70,'repository_wikimedia',0),(468,'repository/youtube:view','read',70,'repository_youtube',0),(469,'tool/customlang:view','read',10,'tool_customlang',2),(470,'tool/customlang:edit','write',10,'tool_customlang',6),(471,'booktool/exportimscp:export','read',70,'booktool_exportimscp',0),(472,'booktool/importhtml:import','write',70,'booktool_importhtml',4),(473,'booktool/print:print','read',70,'booktool_print',0),(474,'quiz/grading:viewstudentnames','read',70,'quiz_grading',0),(475,'quiz/grading:viewidnumber','read',70,'quiz_grading',0),(476,'quiz/statistics:view','read',70,'quiz_statistics',0),(477,'moodle/user:viewlastip','read',30,'moodle',8),(478,'moodle/course:reviewotherusers','read',50,'moodle',0),(479,'moodle/course:viewsuspendedusers','read',10,'moodle',0),(480,'moodle/badges:manageglobalsettings','write',10,'moodle',34),(481,'moodle/badges:viewbadges','read',50,'moodle',0),(482,'moodle/badges:manageownbadges','write',30,'moodle',0),(483,'moodle/badges:viewotherbadges','read',30,'moodle',0),(484,'moodle/badges:earnbadge','write',50,'moodle',0),(485,'moodle/badges:createbadge','write',50,'moodle',16),(486,'moodle/badges:deletebadge','write',50,'moodle',32),(487,'moodle/badges:configuredetails','write',50,'moodle',16),(488,'moodle/badges:configurecriteria','write',50,'moodle',0),(489,'moodle/badges:configuremessages','write',50,'moodle',16),(490,'moodle/badges:awardbadge','write',50,'moodle',16),(491,'moodle/badges:viewawarded','read',50,'moodle',8),(492,'moodle/site:forcelanguage','read',10,'moodle',0),(493,'mod/assign:editothersubmission','write',70,'mod_assign',41),(494,'mod/assign:reviewgrades','write',70,'mod_assign',0),(495,'mod/assign:releasegrades','write',70,'mod_assign',0),(496,'mod/assign:managegrades','write',70,'mod_assign',0),(497,'mod/assign:manageallocations','write',70,'mod_assign',0),(498,'mod/assign:viewgrades','read',70,'mod_assign',0),(499,'mod/assign:viewblinddetails','write',70,'mod_assign',8),(500,'mod/assign:receivegradernotifications','read',70,'mod_assign',0),(501,'mod/lesson:grade','write',70,'mod_lesson',16),(502,'enrol/category:config','write',50,'enrol_category',0),(503,'enrol/database:config','write',50,'enrol_database',0),(504,'enrol/flatfile:manage','write',50,'enrol_flatfile',0),(505,'enrol/flatfile:unenrol','write',50,'enrol_flatfile',0),(506,'enrol/imsenterprise:config','write',50,'enrol_imsenterprise',0),(507,'enrol/mnet:config','write',50,'enrol_mnet',0),(508,'message/airnotifier:managedevice','write',10,'message_airnotifier',0),(509,'block/badges:addinstance','read',80,'block_badges',0),(510,'block/badges:myaddinstance','read',10,'block_badges',8),(511,'block/course_overview:addinstance','write',80,'block_course_overview',20),(512,'block/glossary_random:myaddinstance','write',10,'block_glossary_random',0),(513,'block/mentees:myaddinstance','write',10,'block_mentees',0),(514,'block/news_items:myaddinstance','write',10,'block_news_items',0),(515,'block/online_users:myaddinstance','write',10,'block_online_users',0),(516,'block/recent_activity:viewaddupdatemodule','read',50,'block_recent_activity',0),(517,'block/recent_activity:viewdeletemodule','read',50,'block_recent_activity',0),(518,'report/performance:view','read',10,'report_performance',2),(519,'gradeimport/direct:view','write',50,'gradeimport_direct',0),(520,'gradereport/history:view','read',50,'gradereport_history',8),(521,'gradereport/singleview:view','read',50,'gradereport_singleview',8),(522,'repository/areafiles:view','read',70,'repository_areafiles',0),(523,'repository/dropbox:view','read',70,'repository_dropbox',0),(524,'repository/skydrive:view','read',70,'repository_skydrive',0),(525,'tool/monitor:subscribe','read',50,'tool_monitor',8),(526,'tool/monitor:managerules','write',50,'tool_monitor',4),(527,'tool/monitor:managetool','write',10,'tool_monitor',4),(528,'tool/uploaduser:uploaduserpictures','write',10,'tool_uploaduser',16);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat`
--

LOCK TABLES `mdl_chat` WRITE;
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages_current`
--

DROP TABLE IF EXISTS `mdl_chat_messages_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages_current`
--

LOCK TABLES `mdl_chat_messages_current` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_users`
--

LOCK TABLES `mdl_chat_users` WRITE;
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice`
--

LOCK TABLES `mdl_choice` WRITE;
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_answers`
--

LOCK TABLES `mdl_choice_answers` WRITE;
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_options`
--

LOCK TABLES `mdl_choice_options` WRITE;
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort`
--

DROP TABLE IF EXISTS `mdl_cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort`
--

LOCK TABLES `mdl_cohort` WRITE;
/*!40000 ALTER TABLE `mdl_cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort_members`
--

DROP TABLE IF EXISTS `mdl_cohort_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort_members`
--

LOCK TABLES `mdl_cohort_members` WRITE;
/*!40000 ALTER TABLE `mdl_cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_comments`
--

DROP TABLE IF EXISTS `mdl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_comments`
--

LOCK TABLES `mdl_comments` WRITE;
/*!40000 ALTER TABLE `mdl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config`
--

LOCK TABLES `mdl_config` WRITE;
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` VALUES (2,'rolesactive','1'),(3,'auth','email'),(4,'auth_pop3mailbox','INBOX'),(5,'enrol_plugins_enabled','manual,guest,self,cohort'),(6,'theme','clean'),(7,'filter_multilang_converted','1'),(8,'siteidentifier','NdKyEuh5oK73BUo87Nh9Mkq5Ze8iOmsy9.152.136.232'),(9,'backup_version','2008111700'),(10,'backup_release','2.0 dev'),(11,'mnet_dispatcher_mode','off'),(12,'sessiontimeout','7200'),(13,'stringfilters',''),(14,'filterall','0'),(15,'texteditors','atto,tinymce,textarea'),(16,'mnet_localhost_id','1'),(17,'mnet_all_hosts_id','2'),(18,'siteguest','1'),(19,'siteadmins','2'),(20,'themerev','1417538703'),(21,'jsrev','1417538703'),(22,'licenses','unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),(23,'version','2014111001.02'),(24,'enableoutcomes','0'),(25,'usecomments','1'),(26,'usetags','1'),(27,'enablenotes','1'),(28,'enableportfolios','0'),(29,'enablewebservices','0'),(30,'messaging','1'),(31,'messaginghidereadnotifications','0'),(32,'messagingdeletereadnotificationsdelay','604800'),(33,'messagingallowemailoverride','0'),(34,'enablestats','0'),(35,'enablerssfeeds','0'),(36,'enableblogs','1'),(37,'enablecompletion','0'),(38,'enableavailability','0'),(39,'enableplagiarism','0'),(40,'autologinguests','0'),(41,'hiddenuserfields',''),(42,'showuseridentity','email'),(43,'enablegravatar','0'),(44,'gravatardefaulturl','mm'),(45,'enablecourserequests','0'),(46,'defaultrequestcategory','1'),(47,'requestcategoryselection','0'),(48,'courserequestnotify',''),(49,'grade_profilereport','user'),(50,'grade_aggregationposition','1'),(51,'grade_includescalesinaggregation','1'),(52,'grade_hiddenasdate','0'),(53,'gradepublishing','0'),(54,'grade_export_displaytype','1'),(55,'grade_export_decimalpoints','2'),(56,'grade_navmethod','0'),(57,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email'),(58,'grade_export_customprofilefields',''),(59,'recovergradesdefault','0'),(60,'gradeexport',''),(61,'unlimitedgrades','0'),(62,'grade_hideforcedsettings','1'),(63,'grade_aggregation','11'),(64,'grade_aggregation_flag','0'),(65,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13'),(66,'grade_aggregateonlygraded','1'),(67,'grade_aggregateonlygraded_flag','2'),(68,'grade_aggregateoutcomes','0'),(69,'grade_aggregateoutcomes_flag','2'),(70,'grade_aggregatesubcats','0'),(71,'grade_aggregatesubcats_flag','2'),(72,'grade_keephigh','0'),(73,'grade_keephigh_flag','3'),(74,'grade_-- DROPlow','0'),(75,'grade_-- DROPlow_flag','2'),(76,'grade_displaytype','1'),(77,'grade_decimalpoints','2'),(78,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),(79,'grade_report_studentsperpage','100'),(80,'grade_report_quickgrading','1'),(81,'grade_report_showquickfeedback','0'),(82,'grade_report_fixedstudents','0'),(83,'grade_report_meanselection','1'),(84,'grade_report_enableajax','0'),(85,'grade_report_showcalculations','0'),(86,'grade_report_showeyecons','0'),(87,'grade_report_showaverages','1'),(88,'grade_report_showlocks','0'),(89,'grade_report_showranges','0'),(90,'grade_report_showanalysisicon','1'),(91,'grade_report_showuserimage','1'),(92,'grade_report_showactivityicons','1'),(93,'grade_report_shownumberofgrades','0'),(94,'grade_report_averagesdisplaytype','inherit'),(95,'grade_report_rangesdisplaytype','inherit'),(96,'grade_report_averagesdecimalpoints','inherit'),(97,'grade_report_rangesdecimalpoints','inherit'),(98,'grade_report_overview_showrank','0'),(99,'grade_report_overview_showtotalsifcontainhidden','0'),(100,'grade_report_user_showrank','0'),(101,'grade_report_user_showpercentage','1'),(102,'grade_report_user_showgrade','1'),(103,'grade_report_user_showfeedback','1'),(104,'grade_report_user_showrange','1'),(105,'grade_report_user_showweight','1'),(106,'grade_report_user_showaverage','0'),(107,'grade_report_user_showlettergrade','0'),(108,'grade_report_user_rangedecimals','0'),(109,'grade_report_user_showhiddenitems','1'),(110,'grade_report_user_showtotalsifcontainhidden','0'),(111,'timezone','99'),(112,'forcetimezone','99'),(113,'country','0'),(114,'defaultcity',''),(115,'geoipfile','/home/moodledata/geoip/GeoLiteCity.dat'),(116,'googlemapkey3',''),(117,'allcountrycodes',''),(118,'autolang','1'),(119,'lang','en'),(120,'langmenu','1'),(121,'langlist',''),(122,'langrev','1417538703'),(123,'langcache','1'),(124,'langstringcache','1'),(125,'locale',''),(126,'latinexcelexport','0'),(127,'block_course_list_adminview','all'),(128,'block_course_list_hideallcourseslink','0'),(129,'block_html_allowcssclasses','0'),(130,'block_online_users_timetosee','5'),(131,'block_rss_client_num_entries','5'),(132,'block_rss_client_timeout','30'),(133,'block_tags_showcoursetags','0'),(134,'registerauth',''),(135,'authpreventaccountcreation','0'),(136,'loginpageautofocus','0'),(137,'guestloginbutton','1'),(138,'alternateloginurl',''),(139,'forgottenpasswordurl',''),(140,'auth_instructions',''),(141,'allowemailaddresses',''),(142,'denyemailaddresses',''),(143,'verifychangedemail','1'),(144,'recaptchapublickey',''),(145,'recaptchaprivatekey',''),(146,'sitedefaultlicense','allrightsreserved'),(148,'filteruploadedfiles','0'),(149,'filtermatchoneperpage','0'),(150,'filtermatchonepertext','0'),(151,'portfolio_moderate_filesize_threshold','1048576'),(152,'portfolio_high_filesize_threshold','5242880'),(153,'portfolio_moderate_db_threshold','20'),(154,'portfolio_high_db_threshold','50'),(155,'repositorycacheexpire','120'),(156,'repositoryallowexternallinks','1'),(157,'legacyfilesinnewcourses','0'),(158,'mobilecssurl',''),(159,'enablewsdocumentation','0'),(160,'allowbeforeblock','0'),(161,'allowedip',''),(162,'blockedip',''),(163,'protectusernames','1'),(164,'forcelogin','0'),(165,'forceloginforprofiles','1'),(166,'forceloginforprofileimage','0'),(167,'opentogoogle','0'),(168,'maxbytes','0'),(169,'userquota','104857600'),(170,'allowobjectembed','0'),(171,'enabletrusttext','0'),(172,'maxeditingtime','1800'),(173,'fullnamedisplay','language'),(174,'extendedusernamechars','0'),(175,'sitepolicy',''),(176,'sitepolicyguest',''),(177,'keeptagnamecase','1'),(178,'profilesforenrolledusersonly','1'),(179,'cronclionly','0'),(180,'cronremotepassword',''),(181,'passwordpolicy','1'),(182,'minpasswordlength','8'),(183,'minpassworddigits','1'),(184,'minpasswordlower','1'),(185,'minpasswordupper','1'),(186,'minpasswordnonalphanum','1'),(187,'maxconsecutiveidentchars','0'),(188,'groupenrolmentkeypolicy','1'),(189,'disableuserimages','0'),(190,'emailchangeconfirmation','1'),(191,'rememberusername','2'),(192,'strictformsrequired','0'),(193,'loginhttps','0'),(194,'cookiesecure','0'),(195,'cookiehttponly','0'),(196,'allowframembedding','0'),(197,'loginpasswordautocomplete','0'),(198,'displayloginfailures','0'),(199,'notifyloginfailures',''),(200,'notifyloginthreshold','10'),(201,'runclamonupload','0'),(202,'pathtoclam',''),(203,'quarantinedir',''),(204,'clamfailureonupload','donothing'),(205,'themelist',''),(206,'themedesignermode','0'),(207,'allowuserthemes','0'),(208,'allowcoursethemes','0'),(209,'allowcategorythemes','0'),(210,'allowthemechangeonurl','0'),(211,'allowuserblockhiding','1'),(212,'allowblockstodock','1'),(213,'custommenuitems',''),(214,'enabledevicedetection','1'),(215,'devicedetectregex','[]'),(216,'calendar_adminseesall','0'),(217,'calendar_site_timeformat','0'),(218,'calendar_startwday','0'),(219,'calendar_weekend','65'),(220,'calendar_lookahead','21'),(221,'calendar_maxevents','10'),(222,'enablecalendarexport','1'),(223,'calendar_exportsalt','brQZsTdSb2LHiVMRiQy3yP2nExlIWLX2BiTtpekEHJJG7PuB42DUWvJUkgad'),(224,'useblogassociations','1'),(225,'bloglevel','4'),(226,'useexternalblogs','1'),(227,'externalblogcrontime','86400'),(228,'maxexternalblogsperuser','1'),(229,'blogusecomments','1'),(230,'blogshowcommentscount','1'),(231,'defaulthomepage','0'),(232,'allowguestmymoodle','1'),(233,'navshowcategories','1'),(234,'navshowmycoursecategories','0'),(235,'navshowallcourses','0'),(236,'navcourselimit','20'),(237,'usesitenameforsitepages','0'),(238,'linkadmincategories','0'),(239,'navshowfrontpagemods','1'),(240,'navadduserpostslinks','1'),(241,'formatstringstriptags','1'),(242,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]'),(243,'core_media_enable_youtube','1'),(244,'core_media_enable_vimeo','0'),(245,'core_media_enable_mp3','1'),(246,'core_media_enable_flv','1'),(247,'core_media_enable_swf','1'),(248,'core_media_enable_html5audio','1'),(249,'core_media_enable_html5video','1'),(250,'core_media_enable_qt','1'),(251,'core_media_enable_wmp','1'),(252,'core_media_enable_rm','1'),(253,'docroot','http://docs.moodle.org'),(254,'doctonewwindow','0'),(255,'courselistshortnames','0'),(256,'coursesperpage','20'),(257,'courseswithsummarieslimit','10'),(258,'enableajax','1'),(259,'useexternalyui','0'),(260,'yuicomboloading','1'),(261,'cachejs','1'),(262,'modchooserdefault','1'),(263,'additionalhtmlhead',''),(264,'additionalhtmltopofbody',''),(265,'additionalhtmlfooter',''),(266,'gdversion','2'),(267,'pathtodu',''),(268,'aspellpath',''),(269,'pathtodot',''),(270,'supportpage',''),(271,'dbsessions','1'),(272,'sessioncookie',''),(273,'sessioncookiepath',''),(274,'sessioncookiedomain',''),(275,'statsfirstrun','none'),(276,'statsmaxruntime','0'),(277,'statsruntimedays','31'),(278,'statsruntimestarthour','0'),(279,'statsruntimestartminute','0'),(280,'statsuserthreshold','0'),(281,'slasharguments','1'),(282,'getremoteaddrconf','0'),(283,'proxyhost',''),(284,'proxyport','0'),(285,'proxytype','HTTP'),(286,'proxyuser',''),(287,'proxypassword',''),(288,'proxybypass','localhost, 127.0.0.1'),(289,'maintenance_enabled','0'),(290,'maintenance_message',''),(291,'deleteunconfirmed','168'),(292,'deleteincompleteusers','0'),(293,'logguests','1'),(294,'loglifetime','0'),(295,'disablegradehistory','0'),(296,'gradehistorylifetime','0'),(298,'extramemorylimit','512M'),(299,'curlcache','120'),(300,'curltimeoutkbitrate','56'),(301,'updateautocheck','1'),(302,'updateautodeploy','0'),(303,'updateminmaturity','200'),(304,'updatenotifybuilds','0'),(305,'enablesafebrowserintegration','0'),(307,'dndallowtextandlinks','0'),(308,'enablecssoptimiser','0'),(309,'debug','0'),(310,'debugdisplay','1'),(311,'debugsmtp','0'),(312,'perfdebug','7'),(313,'debugstringids','0'),(314,'debugvalidators','0'),(315,'debugpageinfo','0'),(316,'release','2.8.1+ (Build: 20141128)'),(317,'branch','28'),(318,'notloggedinroleid','6'),(319,'guestroleid','6'),(320,'defaultuserroleid','7'),(321,'creatornewroleid','3'),(322,'restorernewroleid','3'),(323,'gradebookroles','5'),(324,'smtphosts',''),(325,'smtpsecure',''),(326,'smtpuser',''),(327,'smtppass',''),(328,'smtpmaxbulk','1'),(329,'noreplyaddress','noreply@9.152.136.232'),(330,'sitemailcharset','0'),(331,'allowusermailcharset','0'),(332,'mailnewline','LF'),(333,'jabberhost',''),(334,'jabberserver',''),(335,'jabberusername',''),(336,'jabberpassword',''),(337,'jabberport','5222'),(338,'enablemobilewebservice','0'),(339,'profileroles','5,4,3'),(340,'coursecontact','3'),(341,'frontpage','6'),(342,'frontpageloggedin','5,7'),(343,'maxcategorydepth','0'),(344,'commentsperpage','15'),(345,'defaultfrontpageroleid','8'),(346,'supportname','Admin User'),(347,'supportemail',''),(348,'localcachedirpurged','1417538703'),(349,'scheduledtaskreset','1417538703'),(351,'filesrootrecordsfixed','1'),(352,'movingmoduleupgradescriptwasrun','1'),(353,'grades_sumofgrades_upgrade_flagged','1'),(354,'allversionshash','53157a2788e4b2afa5723c2a12a804e163e5b9d3');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_log`
--

DROP TABLE IF EXISTS `mdl_config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_log`
--

LOCK TABLES `mdl_config_log` WRITE;
/*!40000 ALTER TABLE `mdl_config_log` DISABLE KEYS */;
INSERT INTO `mdl_config_log` VALUES (1,0,1359111414,NULL,'enableoutcomes','0',NULL),(2,0,1359111414,NULL,'usecomments','1',NULL),(3,0,1359111414,NULL,'usetags','1',NULL),(4,0,1359111414,NULL,'enablenotes','1',NULL),(5,0,1359111414,NULL,'enableportfolios','0',NULL),(6,0,1359111414,NULL,'enablewebservices','0',NULL),(7,0,1359111414,NULL,'messaging','1',NULL),(8,0,1359111414,NULL,'messaginghidereadnotifications','0',NULL),(9,0,1359111414,NULL,'messagingdeletereadnotificationsdelay','604800',NULL),(10,0,1359111414,NULL,'messagingallowemailoverride','0',NULL),(11,0,1359111414,NULL,'enablestats','0',NULL),(12,0,1359111414,NULL,'enablerssfeeds','0',NULL),(13,0,1359111414,NULL,'enableblogs','1',NULL),(14,0,1359111414,NULL,'enablecompletion','0',NULL),(15,0,1359111414,NULL,'enableavailability','0',NULL),(16,0,1359111414,NULL,'enableplagiarism','0',NULL),(17,0,1359111414,NULL,'autologinguests','0',NULL),(18,0,1359111414,NULL,'hiddenuserfields','',NULL),(19,0,1359111414,NULL,'showuseridentity','email',NULL),(20,0,1359111414,NULL,'enablegravatar','0',NULL),(21,0,1359111414,NULL,'gravatardefaulturl','mm',NULL),(22,0,1359111414,'moodlecourse','format','weeks',NULL),(23,0,1359111414,'moodlecourse','maxsections','52',NULL),(24,0,1359111414,'moodlecourse','numsections','10',NULL),(25,0,1359111414,'moodlecourse','hiddensections','0',NULL),(26,0,1359111414,'moodlecourse','newsitems','5',NULL),(27,0,1359111414,'moodlecourse','showgrades','1',NULL),(28,0,1359111414,'moodlecourse','showreports','0',NULL),(29,0,1359111414,'moodlecourse','maxbytes','2097152',NULL),(30,0,1359111414,'moodlecourse','coursedisplay','0',NULL),(31,0,1359111414,'moodlecourse','groupmode','0',NULL),(32,0,1359111414,'moodlecourse','groupmodeforce','0',NULL),(33,0,1359111414,'moodlecourse','visible','1',NULL),(34,0,1359111414,'moodlecourse','lang','',NULL),(35,0,1359111414,'moodlecourse','enablecompletion','0',NULL),(36,0,1359111414,'moodlecourse','completionstartonenrol','0',NULL),(37,0,1359111414,NULL,'enablecourserequests','0',NULL),(38,0,1359111414,NULL,'defaultrequestcategory','1',NULL),(39,0,1359111414,NULL,'requestcategoryselection','0',NULL),(40,0,1359111414,NULL,'courserequestnotify','',NULL),(41,0,1359111414,'backup','loglifetime','30',NULL),(42,0,1359111414,'backup','backup_general_users','1',NULL),(43,0,1359111414,'backup','backup_general_users_locked','0',NULL),(44,0,1359111414,'backup','backup_general_anonymize','0',NULL),(45,0,1359111414,'backup','backup_general_anonymize_locked','0',NULL),(46,0,1359111414,'backup','backup_general_role_assignments','1',NULL),(47,0,1359111414,'backup','backup_general_role_assignments_locked','0',NULL),(48,0,1359111414,'backup','backup_general_activities','1',NULL),(49,0,1359111414,'backup','backup_general_activities_locked','0',NULL),(50,0,1359111414,'backup','backup_general_blocks','1',NULL),(51,0,1359111414,'backup','backup_general_blocks_locked','0',NULL),(52,0,1359111414,'backup','backup_general_filters','1',NULL),(53,0,1359111414,'backup','backup_general_filters_locked','0',NULL),(54,0,1359111414,'backup','backup_general_comments','1',NULL),(55,0,1359111414,'backup','backup_general_comments_locked','0',NULL),(56,0,1359111414,'backup','backup_general_userscompletion','1',NULL),(57,0,1359111414,'backup','backup_general_userscompletion_locked','0',NULL),(58,0,1359111414,'backup','backup_general_logs','0',NULL),(59,0,1359111414,'backup','backup_general_logs_locked','0',NULL),(60,0,1359111414,'backup','backup_general_histories','0',NULL),(61,0,1359111414,'backup','backup_general_histories_locked','0',NULL),(62,0,1359111414,'backup','backup_auto_active','0',NULL),(63,0,1359111414,'backup','backup_auto_weekdays','0000000',NULL),(64,0,1359111414,'backup','backup_auto_hour','0',NULL),(65,0,1359111414,'backup','backup_auto_minute','0',NULL),(66,0,1359111414,'backup','backup_auto_storage','0',NULL),(67,0,1359111414,'backup','backup_auto_destination','',NULL),(68,0,1359111414,'backup','backup_auto_keep','1',NULL),(69,0,1359111414,'backup','backup_shortname','0',NULL),(70,0,1359111415,'backup','backup_auto_skip_hidden','1',NULL),(71,0,1359111415,'backup','backup_auto_skip_modif_days','30',NULL),(72,0,1359111415,'backup','backup_auto_skip_modif_prev','0',NULL),(73,0,1359111415,'backup','backup_auto_users','1',NULL),(74,0,1359111415,'backup','backup_auto_role_assignments','1',NULL),(75,0,1359111415,'backup','backup_auto_activities','1',NULL),(76,0,1359111415,'backup','backup_auto_blocks','1',NULL),(77,0,1359111415,'backup','backup_auto_filters','1',NULL),(78,0,1359111415,'backup','backup_auto_comments','1',NULL),(79,0,1359111415,'backup','backup_auto_userscompletion','1',NULL),(80,0,1359111415,'backup','backup_auto_logs','0',NULL),(81,0,1359111415,'backup','backup_auto_histories','0',NULL),(82,0,1359111415,NULL,'grade_profilereport','user',NULL),(83,0,1359111415,NULL,'grade_aggregationposition','1',NULL),(84,0,1359111415,NULL,'grade_includescalesinaggregation','1',NULL),(85,0,1359111415,NULL,'grade_hiddenasdate','0',NULL),(86,0,1359111415,NULL,'gradepublishing','0',NULL),(87,0,1359111415,NULL,'grade_export_displaytype','1',NULL),(88,0,1359111415,NULL,'grade_export_decimalpoints','2',NULL),(89,0,1359111415,NULL,'grade_navmethod','0',NULL),(90,0,1359111415,NULL,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email',NULL),(91,0,1359111415,NULL,'grade_export_customprofilefields','',NULL),(92,0,1359111415,NULL,'recovergradesdefault','0',NULL),(93,0,1359111415,NULL,'gradeexport','',NULL),(94,0,1359111415,NULL,'unlimitedgrades','0',NULL),(95,0,1359111415,NULL,'grade_hideforcedsettings','1',NULL),(96,0,1359111415,NULL,'grade_aggregation','11',NULL),(97,0,1359111415,NULL,'grade_aggregation_flag','0',NULL),(98,0,1359111415,NULL,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13',NULL),(99,0,1359111415,NULL,'grade_aggregateonlygraded','1',NULL),(100,0,1359111415,NULL,'grade_aggregateonlygraded_flag','2',NULL),(101,0,1359111415,NULL,'grade_aggregateoutcomes','0',NULL),(102,0,1359111415,NULL,'grade_aggregateoutcomes_flag','2',NULL),(103,0,1359111415,NULL,'grade_aggregatesubcats','0',NULL),(104,0,1359111415,NULL,'grade_aggregatesubcats_flag','2',NULL),(105,0,1359111415,NULL,'grade_keephigh','0',NULL),(106,0,1359111415,NULL,'grade_keephigh_flag','3',NULL),(107,0,1359111415,NULL,'grade_-- DROPlow','0',NULL),(108,0,1359111415,NULL,'grade_-- DROPlow_flag','2',NULL),(109,0,1359111415,NULL,'grade_displaytype','1',NULL),(110,0,1359111415,NULL,'grade_decimalpoints','2',NULL),(111,0,1359111415,NULL,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime',NULL),(112,0,1359111415,NULL,'grade_report_studentsperpage','100',NULL),(113,0,1359111415,NULL,'grade_report_quickgrading','1',NULL),(114,0,1359111415,NULL,'grade_report_showquickfeedback','0',NULL),(115,0,1359111415,NULL,'grade_report_fixedstudents','0',NULL),(116,0,1359111415,NULL,'grade_report_meanselection','1',NULL),(117,0,1359111415,NULL,'grade_report_enableajax','0',NULL),(118,0,1359111415,NULL,'grade_report_showcalculations','0',NULL),(119,0,1359111415,NULL,'grade_report_showeyecons','0',NULL),(120,0,1359111415,NULL,'grade_report_showaverages','1',NULL),(121,0,1359111415,NULL,'grade_report_showlocks','0',NULL),(122,0,1359111415,NULL,'grade_report_showranges','0',NULL),(123,0,1359111415,NULL,'grade_report_showanalysisicon','1',NULL),(124,0,1359111415,NULL,'grade_report_showuserimage','1',NULL),(125,0,1359111415,NULL,'grade_report_showactivityicons','1',NULL),(126,0,1359111415,NULL,'grade_report_shownumberofgrades','0',NULL),(127,0,1359111415,NULL,'grade_report_averagesdisplaytype','inherit',NULL),(128,0,1359111415,NULL,'grade_report_rangesdisplaytype','inherit',NULL),(129,0,1359111415,NULL,'grade_report_averagesdecimalpoints','inherit',NULL),(130,0,1359111415,NULL,'grade_report_rangesdecimalpoints','inherit',NULL),(131,0,1359111415,NULL,'grade_report_overview_showrank','0',NULL),(132,0,1359111415,NULL,'grade_report_overview_showtotalsifcontainhidden','0',NULL),(133,0,1359111415,NULL,'grade_report_user_showrank','0',NULL),(134,0,1359111415,NULL,'grade_report_user_showpercentage','1',NULL),(135,0,1359111415,NULL,'grade_report_user_showgrade','1',NULL),(136,0,1359111415,NULL,'grade_report_user_showfeedback','1',NULL),(137,0,1359111415,NULL,'grade_report_user_showrange','1',NULL),(138,0,1359111415,NULL,'grade_report_user_showweight','0',NULL),(139,0,1359111415,NULL,'grade_report_user_showaverage','0',NULL),(140,0,1359111415,NULL,'grade_report_user_showlettergrade','0',NULL),(141,0,1359111415,NULL,'grade_report_user_rangedecimals','0',NULL),(142,0,1359111415,NULL,'grade_report_user_showhiddenitems','1',NULL),(143,0,1359111415,NULL,'grade_report_user_showtotalsifcontainhidden','0',NULL),(144,0,1359111415,NULL,'timezone','99',NULL),(145,0,1359111415,NULL,'forcetimezone','99',NULL),(146,0,1359111415,NULL,'country','0',NULL),(147,0,1359111415,NULL,'defaultcity','',NULL),(148,0,1359111415,NULL,'geoipfile','/home/moodledata/geoip/GeoLiteCity.dat',NULL),(149,0,1359111415,NULL,'googlemapkey3','',NULL),(150,0,1359111415,NULL,'allcountrycodes','',NULL),(151,0,1359111415,NULL,'autolang','1',NULL),(152,0,1359111415,NULL,'lang','en',NULL),(153,0,1359111415,NULL,'langmenu','1',NULL),(154,0,1359111415,NULL,'langlist','',NULL),(155,0,1359111415,NULL,'langcache','1',NULL),(156,0,1359111415,NULL,'langstringcache','1',NULL),(157,0,1359111415,NULL,'locale','',NULL),(158,0,1359111415,NULL,'latinexcelexport','0',NULL),(159,0,1359111415,NULL,'block_course_list_adminview','all',NULL),(160,0,1359111415,NULL,'block_course_list_hideallcourseslink','0',NULL),(161,0,1359111415,'block_course_overview','defaultmaxcourses','10',NULL),(162,0,1359111415,'block_course_overview','forcedefaultmaxcourses','0',NULL),(163,0,1359111415,'block_course_overview','showchildren','0',NULL),(164,0,1359111415,'block_course_overview','showwelcomearea','0',NULL),(165,0,1359111415,NULL,'block_html_allowcssclasses','0',NULL),(166,0,1359111415,NULL,'block_online_users_timetosee','5',NULL),(167,0,1359111415,NULL,'block_rss_client_num_entries','5',NULL),(168,0,1359111415,NULL,'block_rss_client_timeout','30',NULL),(169,0,1359111415,'blocks/section_links','numsections1','22',NULL),(170,0,1359111415,'blocks/section_links','incby1','2',NULL),(171,0,1359111415,'blocks/section_links','numsections2','40',NULL),(172,0,1359111415,'blocks/section_links','incby2','5',NULL),(173,0,1359111415,NULL,'block_tags_showcoursetags','0',NULL),(174,0,1359111415,NULL,'registerauth','',NULL),(175,0,1359111415,NULL,'authpreventaccountcreation','0',NULL),(176,0,1359111415,NULL,'loginpageautofocus','0',NULL),(177,0,1359111415,NULL,'guestloginbutton','1',NULL),(178,0,1359111415,NULL,'alternateloginurl','',NULL),(179,0,1359111415,NULL,'forgottenpasswordurl','',NULL),(180,0,1359111415,NULL,'auth_instructions','',NULL),(181,0,1359111415,NULL,'allowemailaddresses','',NULL),(182,0,1359111415,NULL,'denyemailaddresses','',NULL),(183,0,1359111415,NULL,'verifychangedemail','1',NULL),(184,0,1359111415,NULL,'recaptchapublickey','',NULL),(185,0,1359111415,NULL,'recaptchaprivatekey','',NULL),(186,0,1359111415,'enrol_database','dbtype','',NULL),(187,0,1359111415,'enrol_database','dbhost','localhost',NULL),(188,0,1359111415,'enrol_database','dbuser','',NULL),(189,0,1359111415,'enrol_database','dbpass','',NULL),(190,0,1359111415,'enrol_database','dbname','',NULL),(191,0,1359111415,'enrol_database','dbencoding','utf-8',NULL),(192,0,1359111415,'enrol_database','dbsetupsql','',NULL),(193,0,1359111415,'enrol_database','dbsybasequoting','0',NULL),(194,0,1359111415,'enrol_database','debugdb','0',NULL),(195,0,1359111415,'enrol_database','localcoursefield','idnumber',NULL),(196,0,1359111415,'enrol_database','localuserfield','idnumber',NULL),(197,0,1359111415,'enrol_database','localrolefield','shortname',NULL),(198,0,1359111415,'enrol_database','localcategoryfield','id',NULL),(199,0,1359111415,'enrol_database','remoteenroltable','',NULL),(200,0,1359111415,'enrol_database','remotecoursefield','',NULL),(201,0,1359111415,'enrol_database','remoteuserfield','',NULL),(202,0,1359111415,'enrol_database','remoterolefield','',NULL),(203,0,1359111415,'enrol_database','ignorehiddencourses','0',NULL),(204,0,1359111415,'enrol_database','unenrolaction','0',NULL),(205,0,1359111415,'enrol_database','newcoursetable','',NULL),(206,0,1359111415,'enrol_database','newcoursefullname','fullname',NULL),(207,0,1359111415,'enrol_database','newcourseshortname','shortname',NULL),(208,0,1359111415,'enrol_database','newcourseidnumber','idnumber',NULL),(209,0,1359111415,'enrol_database','newcoursecategory','',NULL),(210,0,1359111415,'enrol_database','templatecourse','',NULL),(211,0,1359111415,'enrol_flatfile','location','',NULL),(212,0,1359111415,'enrol_flatfile','mailstudents','0',NULL),(213,0,1359111415,'enrol_flatfile','mailteachers','0',NULL),(214,0,1359111415,'enrol_flatfile','mailadmins','0',NULL),(215,0,1359111415,'enrol_guest','requirepassword','0',NULL),(216,0,1359111415,'enrol_guest','usepasswordpolicy','0',NULL),(217,0,1359111415,'enrol_guest','showhint','0',NULL),(218,0,1359111415,'enrol_guest','defaultenrol','1',NULL),(219,0,1359111415,'enrol_guest','status','1',NULL),(220,0,1359111415,'enrol_guest','status_adv','0',NULL),(221,0,1359111415,'enrol_imsenterprise','imsfilelocation','',NULL),(222,0,1359111415,'enrol_imsenterprise','logtolocation','',NULL),(223,0,1359111415,'enrol_imsenterprise','mailadmins','0',NULL),(224,0,1359111415,'enrol_imsenterprise','createnewusers','0',NULL),(225,0,1359111415,'enrol_imsenterprise','imsdeleteusers','0',NULL),(226,0,1359111415,'enrol_imsenterprise','fixcaseusernames','0',NULL),(227,0,1359111415,'enrol_imsenterprise','fixcasepersonalnames','0',NULL),(228,0,1359111415,'enrol_imsenterprise','imssourcedidfallback','0',NULL),(229,0,1359111415,'enrol_imsenterprise','truncatecoursecodes','0',NULL),(230,0,1359111415,'enrol_imsenterprise','createnewcourses','0',NULL),(231,0,1359111415,'enrol_imsenterprise','createnewcategories','0',NULL),(232,0,1359111415,'enrol_imsenterprise','imsunenrol','0',NULL),(233,0,1359111415,'enrol_imsenterprise','imsrestricttarget','',NULL),(234,0,1359111415,'enrol_imsenterprise','imscapitafix','0',NULL),(235,0,1359111415,'enrol_manual','expiredaction','1',NULL),(236,0,1359111415,'enrol_manual','expirynotifyhour','6',NULL),(237,0,1359111415,'enrol_manual','defaultenrol','1',NULL),(238,0,1359111415,'enrol_manual','status','0',NULL),(239,0,1359111415,'enrol_manual','enrolperiod','0',NULL),(240,0,1359111415,'enrol_manual','expirynotify','0',NULL),(241,0,1359111415,'enrol_manual','expirythreshold','86400',NULL),(242,0,1359111415,'enrol_paypal','paypalbusiness','',NULL),(243,0,1359111415,'enrol_paypal','mailstudents','0',NULL),(244,0,1359111415,'enrol_paypal','mailteachers','0',NULL),(245,0,1359111415,'enrol_paypal','mailadmins','0',NULL),(246,0,1359111415,'enrol_paypal','status','1',NULL),(247,0,1359111415,'enrol_paypal','cost','0',NULL),(248,0,1359111415,'enrol_paypal','currency','USD',NULL),(249,0,1359111415,'enrol_paypal','enrolperiod','0',NULL),(250,0,1359111415,'enrol_self','requirepassword','0',NULL),(251,0,1359111415,'enrol_self','usepasswordpolicy','0',NULL),(252,0,1359111415,'enrol_self','showhint','0',NULL),(253,0,1359111415,'enrol_self','expiredaction','1',NULL),(254,0,1359111415,'enrol_self','expirynotifyhour','6',NULL),(255,0,1359111415,'enrol_self','defaultenrol','1',NULL),(256,0,1359111415,'enrol_self','status','1',NULL),(257,0,1359111415,'enrol_self','groupkey','0',NULL),(258,0,1359111415,'enrol_self','enrolperiod','0',NULL),(259,0,1359111415,'enrol_self','expirynotify','0',NULL),(260,0,1359111415,'enrol_self','expirythreshold','86400',NULL),(261,0,1359111415,'enrol_self','longtimenosee','0',NULL),(262,0,1359111415,'enrol_self','maxenrolled','0',NULL),(263,0,1359111415,'enrol_self','sendcoursewelcomemessage','1',NULL),(264,0,1359111415,'editor_tinymce','customtoolbar','fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code',NULL),(265,0,1359111415,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings',NULL),(266,0,1359111415,'editor_tinymce','customconfig','',NULL),(267,0,1359111415,'tinymce_dragmath','requiretex','1',NULL),(268,0,1359111415,'tinymce_moodleemoticon','requireemoticon','1',NULL),(269,0,1359111415,'tinymce_spellchecker','spellengine','GoogleSpell',NULL),(270,0,1359111415,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv',NULL),(271,0,1359111415,NULL,'sitedefaultlicense','allrightsreserved',NULL),(272,0,1359111415,NULL,'cachetext','60',NULL),(273,0,1359111415,NULL,'filteruploadedfiles','0',NULL),(274,0,1359111415,NULL,'filtermatchoneperpage','0',NULL),(275,0,1359111415,NULL,'filtermatchonepertext','0',NULL),(276,0,1359111415,NULL,'portfolio_moderate_filesize_threshold','1048576',NULL),(277,0,1359111415,NULL,'portfolio_high_filesize_threshold','5242880',NULL),(278,0,1359111415,NULL,'portfolio_moderate_db_threshold','20',NULL),(279,0,1359111415,NULL,'portfolio_high_db_threshold','50',NULL),(280,0,1359111415,NULL,'repositorycacheexpire','120',NULL),(281,0,1359111415,NULL,'repositoryallowexternallinks','1',NULL),(282,0,1359111415,NULL,'legacyfilesinnewcourses','0',NULL),(283,0,1359111415,NULL,'mobilecssurl','',NULL),(284,0,1359111415,NULL,'enablewsdocumentation','0',NULL),(285,0,1359111415,'cachestore_memcache','testservers','',NULL),(286,0,1359111415,'cachestore_memcached','testservers','',NULL),(287,0,1359111415,'cachestore_mongodb','testserver','',NULL),(288,0,1359111415,NULL,'allowbeforeblock','0',NULL),(289,0,1359111415,NULL,'allowedip','',NULL),(290,0,1359111415,NULL,'blockedip','',NULL),(291,0,1359111415,NULL,'protectusernames','1',NULL),(292,0,1359111415,NULL,'forcelogin','0',NULL),(293,0,1359111415,NULL,'forceloginforprofiles','1',NULL),(294,0,1359111415,NULL,'forceloginforprofileimage','0',NULL),(295,0,1359111415,NULL,'opentogoogle','0',NULL),(296,0,1359111415,NULL,'maxbytes','0',NULL),(297,0,1359111415,NULL,'userquota','104857600',NULL),(298,0,1359111415,NULL,'allowobjectembed','0',NULL),(299,0,1359111415,NULL,'enabletrusttext','0',NULL),(300,0,1359111415,NULL,'maxeditingtime','1800',NULL),(301,0,1359111415,NULL,'fullnamedisplay','language',NULL),(302,0,1359111415,NULL,'extendedusernamechars','0',NULL),(303,0,1359111415,NULL,'sitepolicy','',NULL),(304,0,1359111415,NULL,'sitepolicyguest','',NULL),(305,0,1359111415,NULL,'keeptagnamecase','1',NULL),(306,0,1359111415,NULL,'profilesforenrolledusersonly','1',NULL),(307,0,1359111415,NULL,'cronclionly','0',NULL),(308,0,1359111415,NULL,'cronremotepassword','',NULL),(309,0,1359111415,NULL,'passwordpolicy','1',NULL),(310,0,1359111415,NULL,'minpasswordlength','8',NULL),(311,0,1359111415,NULL,'minpassworddigits','1',NULL),(312,0,1359111415,NULL,'minpasswordlower','1',NULL),(313,0,1359111415,NULL,'minpasswordupper','1',NULL),(314,0,1359111415,NULL,'minpasswordnonalphanum','1',NULL),(315,0,1359111415,NULL,'maxconsecutiveidentchars','0',NULL),(316,0,1359111415,NULL,'groupenrolmentkeypolicy','1',NULL),(317,0,1359111415,NULL,'disableuserimages','0',NULL),(318,0,1359111415,NULL,'emailchangeconfirmation','1',NULL),(319,0,1359111415,NULL,'rememberusername','2',NULL),(320,0,1359111415,NULL,'strictformsrequired','0',NULL),(321,0,1359111415,NULL,'loginhttps','0',NULL),(322,0,1359111415,NULL,'cookiesecure','0',NULL),(323,0,1359111415,NULL,'cookiehttponly','0',NULL),(324,0,1359111415,NULL,'allowframembedding','0',NULL),(325,0,1359111415,NULL,'loginpasswordautocomplete','0',NULL),(326,0,1359111415,NULL,'displayloginfailures','',NULL),(327,0,1359111415,NULL,'notifyloginfailures','',NULL),(328,0,1359111415,NULL,'notifyloginthreshold','10',NULL),(329,0,1359111415,NULL,'runclamonupload','0',NULL),(330,0,1359111415,NULL,'pathtoclam','',NULL),(331,0,1359111415,NULL,'quarantinedir','',NULL),(332,0,1359111415,NULL,'clamfailureonupload','donothing',NULL),(333,0,1359111415,NULL,'themelist','',NULL),(334,0,1359111415,NULL,'themedesignermode','0',NULL),(335,0,1359111415,NULL,'allowuserthemes','0',NULL),(336,0,1359111415,NULL,'allowcoursethemes','0',NULL),(337,0,1359111415,NULL,'allowcategorythemes','0',NULL),(338,0,1359111415,NULL,'allowthemechangeonurl','0',NULL),(339,0,1359111415,NULL,'allowuserblockhiding','1',NULL),(340,0,1359111415,NULL,'allowblockstodock','1',NULL),(341,0,1359111415,NULL,'custommenuitems','',NULL),(342,0,1359111415,NULL,'enabledevicedetection','1',NULL),(343,0,1359111415,NULL,'devicedetectregex','[]',NULL),(344,0,1359111415,'theme_afterburner','logo','',NULL),(345,0,1359111415,'theme_afterburner','footnote','',NULL),(346,0,1359111415,'theme_afterburner','customcss','',NULL),(347,0,1359111415,'theme_arialist','logo','',NULL),(348,0,1359111415,'theme_arialist','tagline','',NULL),(349,0,1359111415,'theme_arialist','linkcolor','#f25f0f',NULL),(350,0,1359111415,'theme_arialist','regionwidth','250',NULL),(351,0,1359111415,'theme_arialist','customcss','',NULL),(352,0,1359111415,'theme_brick','logo','',NULL),(353,0,1359111415,'theme_brick','linkcolor','#06365b',NULL),(354,0,1359111415,'theme_brick','linkhover','#5487ad',NULL),(355,0,1359111415,'theme_brick','maincolor','#8e2800',NULL),(356,0,1359111415,'theme_brick','maincolorlink','#fff0a5',NULL),(357,0,1359111415,'theme_brick','headingcolor','#5c3500',NULL),(358,0,1359111415,'theme_formal_white','fontsizereference','13',NULL),(359,0,1359111415,'theme_formal_white','noframe','0',NULL),(360,0,1359111415,'theme_formal_white','framemargin','15',NULL),(361,0,1359111415,'theme_formal_white','headercontent','1',NULL),(362,0,1359111415,'theme_formal_white','customlogourl','',NULL),(363,0,1359111415,'theme_formal_white','frontpagelogourl','',NULL),(364,0,1359111415,'theme_formal_white','headerbgc','#E3DFD4',NULL),(365,0,1359111415,'theme_formal_white','creditstomoodleorg','2',NULL),(366,0,1359111415,'theme_formal_white','blockcolumnwidth','200',NULL),(367,0,1359111415,'theme_formal_white','blockpadding','8',NULL),(368,0,1359111415,'theme_formal_white','blockcontentbgc','#F6F6F6',NULL),(369,0,1359111415,'theme_formal_white','lblockcolumnbgc','#E3DFD4',NULL),(370,0,1359111415,'theme_formal_white','rblockcolumnbgc','',NULL),(371,0,1359111415,'theme_formal_white','footnote','',NULL),(372,0,1359111415,'theme_formal_white','customcss','',NULL),(373,0,1359111415,'theme_fusion','linkcolor','#2d83d5',NULL),(374,0,1359111415,'theme_fusion','tagline','',NULL),(375,0,1359111415,'theme_fusion','footertext','',NULL),(376,0,1359111415,'theme_fusion','customcss','',NULL),(377,0,1359111415,'theme_magazine','background','',NULL),(378,0,1359111415,'theme_magazine','logo','',NULL),(379,0,1359111415,'theme_magazine','linkcolor','#32529a',NULL),(380,0,1359111415,'theme_magazine','linkhover','#4e2300',NULL),(381,0,1359111415,'theme_magazine','maincolor','#002f2f',NULL),(382,0,1359111415,'theme_magazine','maincoloraccent','#092323',NULL),(383,0,1359111415,'theme_magazine','headingcolor','#4e0000',NULL),(384,0,1359111415,'theme_magazine','blockcolor','#002f2f',NULL),(385,0,1359111415,'theme_magazine','forumback','#e6e2af',NULL),(386,0,1359111415,'theme_mymobile','colourswatch','light',NULL),(387,0,1359111415,'theme_mymobile','showmobileintro','',NULL),(388,0,1359111415,'theme_mymobile','showsitetopic','topicshow',NULL),(389,0,1359111415,'theme_mymobile','showfullsizeimages','ithumb',NULL),(390,0,1359111415,'theme_mymobile','usetableview','tabshow',NULL),(391,0,1359111415,'theme_mymobile','customcss','',NULL),(392,0,1359111415,'theme_nimble','tagline','',NULL),(393,0,1359111415,'theme_nimble','footerline','',NULL),(394,0,1359111415,'theme_nimble','backgroundcolor','#454545',NULL),(395,0,1359111415,'theme_nimble','linkcolor','#2a65b1',NULL),(396,0,1359111415,'theme_nimble','linkhover','#222222',NULL),(397,0,1359111415,'theme_nonzero','regionprewidth','200',NULL),(398,0,1359111415,'theme_nonzero','regionpostwidth','200',NULL),(399,0,1359111415,'theme_nonzero','customcss','',NULL),(400,0,1359111415,'theme_overlay','linkcolor','#428ab5',NULL),(401,0,1359111415,'theme_overlay','headercolor','#2a4c7b',NULL),(402,0,1359111415,'theme_overlay','footertext','',NULL),(403,0,1359111415,'theme_overlay','customcss','',NULL),(404,0,1359111415,'theme_sky_high','logo','',NULL),(405,0,1359111415,'theme_sky_high','regionwidth','240',NULL),(406,0,1359111415,'theme_sky_high','footnote','',NULL),(407,0,1359111415,'theme_sky_high','customcss','',NULL),(408,0,1359111415,'theme_splash','logo','',NULL),(409,0,1359111415,'theme_splash','tagline','Virtual learning center',NULL),(410,0,1359111415,'theme_splash','hide_tagline','0',NULL),(411,0,1359111415,'theme_splash','footnote','',NULL),(412,0,1359111415,'theme_splash','customcss','',NULL),(413,0,1359111415,NULL,'calendar_adminseesall','0',NULL),(414,0,1359111415,NULL,'calendar_site_timeformat','0',NULL),(415,0,1359111415,NULL,'calendar_startwday','0',NULL),(416,0,1359111415,NULL,'calendar_weekend','65',NULL),(417,0,1359111415,NULL,'calendar_lookahead','21',NULL),(418,0,1359111415,NULL,'calendar_maxevents','10',NULL),(419,0,1359111415,NULL,'enablecalendarexport','1',NULL),(420,0,1359111415,NULL,'calendar_exportsalt','CcVVOSWKWj4nvOjKV42pvjCoVrEpxRWolXzROnRwIKatT537xIl0ebA5ICZS',NULL),(421,0,1359111415,NULL,'useblogassociations','1',NULL),(422,0,1359111415,NULL,'bloglevel','4',NULL),(423,0,1359111415,NULL,'useexternalblogs','1',NULL),(424,0,1359111415,NULL,'externalblogcrontime','86400',NULL),(425,0,1359111415,NULL,'maxexternalblogsperuser','1',NULL),(426,0,1359111415,NULL,'blogusecomments','1',NULL),(427,0,1359111415,NULL,'blogshowcommentscount','1',NULL),(428,0,1359111415,NULL,'defaulthomepage','0',NULL),(429,0,1359111415,NULL,'allowguestmymoodle','1',NULL),(430,0,1359111415,NULL,'navshowcategories','1',NULL),(431,0,1359111415,NULL,'navshowmycoursecategories','0',NULL),(432,0,1359111415,NULL,'navshowallcourses','0',NULL),(433,0,1359111415,NULL,'navcourselimit','20',NULL),(434,0,1359111415,NULL,'usesitenameforsitepages','0',NULL),(435,0,1359111415,NULL,'linkadmincategories','0',NULL),(436,0,1359111415,NULL,'navshowfrontpagemods','1',NULL),(437,0,1359111415,NULL,'navadduserpostslinks','1',NULL),(438,0,1359111415,NULL,'formatstringstriptags','1',NULL),(439,0,1359111415,NULL,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]',NULL),(440,0,1359111415,NULL,'core_media_enable_youtube','1',NULL),(441,0,1359111415,NULL,'core_media_enable_vimeo','0',NULL),(442,0,1359111415,NULL,'core_media_enable_mp3','1',NULL),(443,0,1359111415,NULL,'core_media_enable_flv','1',NULL),(444,0,1359111415,NULL,'core_media_enable_swf','1',NULL),(445,0,1359111415,NULL,'core_media_enable_html5audio','1',NULL),(446,0,1359111415,NULL,'core_media_enable_html5video','1',NULL),(447,0,1359111415,NULL,'core_media_enable_qt','1',NULL),(448,0,1359111415,NULL,'core_media_enable_wmp','1',NULL),(449,0,1359111415,NULL,'core_media_enable_rm','1',NULL),(450,0,1359111416,NULL,'docroot','http://docs.moodle.org',NULL),(451,0,1359111416,NULL,'doctonewwindow','0',NULL),(452,0,1359111416,NULL,'courselistshortnames','0',NULL),(453,0,1359111416,NULL,'coursesperpage','20',NULL),(454,0,1359111416,NULL,'courseswithsummarieslimit','10',NULL),(455,0,1359111416,NULL,'enableajax','1',NULL),(456,0,1359111416,NULL,'useexternalyui','0',NULL),(457,0,1359111416,NULL,'yuicomboloading','1',NULL),(458,0,1359111416,NULL,'cachejs','1',NULL),(459,0,1359111416,NULL,'modchooserdefault','1',NULL),(460,0,1359111416,NULL,'additionalhtmlhead','',NULL),(461,0,1359111416,NULL,'additionalhtmltopofbody','',NULL),(462,0,1359111416,NULL,'additionalhtmlfooter','',NULL),(463,0,1359111416,NULL,'gdversion','0',NULL),(464,0,1359111416,NULL,'pathtodu','',NULL),(465,0,1359111416,NULL,'aspellpath','',NULL),(466,0,1359111416,NULL,'pathtodot','',NULL),(467,0,1359111416,NULL,'supportpage','',NULL),(468,0,1359111416,NULL,'dbsessions','1',NULL),(469,0,1359111416,NULL,'sessioncookie','',NULL),(470,0,1359111416,NULL,'sessioncookiepath','',NULL),(471,0,1359111416,NULL,'sessioncookiedomain','',NULL),(472,0,1359111416,NULL,'statsfirstrun','none',NULL),(473,0,1359111416,NULL,'statsmaxruntime','0',NULL),(474,0,1359111416,NULL,'statsruntimedays','31',NULL),(475,0,1359111416,NULL,'statsruntimestarthour','0',NULL),(476,0,1359111416,NULL,'statsruntimestartminute','0',NULL),(477,0,1359111416,NULL,'statsuserthreshold','0',NULL),(478,0,1359111416,NULL,'slasharguments','1',NULL),(479,0,1359111416,NULL,'getremoteaddrconf','0',NULL),(480,0,1359111416,NULL,'proxyhost','',NULL),(481,0,1359111416,NULL,'proxyport','0',NULL),(482,0,1359111416,NULL,'proxytype','HTTP',NULL),(483,0,1359111416,NULL,'proxyuser','',NULL),(484,0,1359111416,NULL,'proxypassword','',NULL),(485,0,1359111416,NULL,'proxybypass','localhost, 127.0.0.1',NULL),(486,0,1359111416,NULL,'maintenance_enabled','0',NULL),(487,0,1359111416,NULL,'maintenance_message','',NULL),(488,0,1359111416,NULL,'deleteunconfirmed','168',NULL),(489,0,1359111416,NULL,'deleteincompleteusers','0',NULL),(490,0,1359111416,NULL,'logguests','1',NULL),(491,0,1359111416,NULL,'loglifetime','0',NULL),(492,0,1359111416,NULL,'disablegradehistory','0',NULL),(493,0,1359111416,NULL,'gradehistorylifetime','0',NULL),(494,0,1359111416,NULL,'numcoursesincombo','500',NULL),(495,0,1359111416,NULL,'extramemorylimit','512M',NULL),(496,0,1359111416,NULL,'curlcache','120',NULL),(497,0,1359111416,NULL,'curltimeoutkbitrate','56',NULL),(498,0,1359111416,NULL,'updateautocheck','1',NULL),(499,0,1359111416,NULL,'updateautodeploy','0',NULL),(500,0,1359111416,NULL,'updateminmaturity','200',NULL),(501,0,1359111416,NULL,'updatenotifybuilds','0',NULL),(502,0,1359111416,NULL,'enablesafebrowserintegration','0',NULL),(503,0,1359111416,NULL,'enablegroupmembersonly','0',NULL),(504,0,1359111416,NULL,'dndallowtextandlinks','0',NULL),(505,0,1359111416,NULL,'enablecssoptimiser','0',NULL),(506,0,1359111416,NULL,'debug','0',NULL),(507,0,1359111416,NULL,'debugdisplay','1',NULL),(508,0,1359111416,NULL,'debugsmtp','0',NULL),(509,0,1359111416,NULL,'perfdebug','7',NULL),(510,0,1359111416,NULL,'debugstringids','0',NULL),(511,0,1359111416,NULL,'debugvalidators','0',NULL),(512,0,1359111416,NULL,'debugpageinfo','0',NULL),(513,2,1359111433,NULL,'notloggedinroleid','6',NULL),(514,2,1359111433,NULL,'guestroleid','6',NULL),(515,2,1359111433,NULL,'defaultuserroleid','7',NULL),(516,2,1359111433,NULL,'creatornewroleid','3',NULL),(517,2,1359111433,NULL,'restorernewroleid','3',NULL),(518,2,1359111433,NULL,'gradebookroles','5',NULL),(519,2,1359111433,NULL,'smtphosts','',NULL),(520,2,1359111433,NULL,'smtpsecure','',NULL),(521,2,1359111433,NULL,'smtpuser','',NULL),(522,2,1359111433,NULL,'smtppass','',NULL),(523,2,1359111433,NULL,'smtpmaxbulk','1',NULL),(524,2,1359111433,NULL,'noreplyaddress','noreply@9.152.136.232',NULL),(525,2,1359111433,NULL,'sitemailcharset','0',NULL),(526,2,1359111433,NULL,'allowusermailcharset','0',NULL),(527,2,1359111433,NULL,'mailnewline','LF',NULL),(528,2,1359111433,NULL,'jabberhost','',NULL),(529,2,1359111433,NULL,'jabberserver','',NULL),(530,2,1359111433,NULL,'jabberusername','',NULL),(531,2,1359111433,NULL,'jabberpassword','',NULL),(532,2,1359111433,NULL,'jabberport','5222',NULL),(533,2,1359111433,'enrol_cohort','roleid','5',NULL),(534,2,1359111433,'enrol_cohort','unenrolaction','0',NULL),(535,2,1359111433,'enrol_database','defaultrole','5',NULL),(536,2,1359111433,'enrol_database','defaultcategory','1',NULL),(537,2,1359111433,'enrol_flatfile','map_1','manager',NULL),(538,2,1359111433,'enrol_flatfile','map_2','coursecreator',NULL),(539,2,1359111433,'enrol_flatfile','map_3','editingteacher',NULL),(540,2,1359111433,'enrol_flatfile','map_4','teacher',NULL),(541,2,1359111433,'enrol_flatfile','map_5','student',NULL),(542,2,1359111433,'enrol_flatfile','map_6','guest',NULL),(543,2,1359111433,'enrol_flatfile','map_7','user',NULL),(544,2,1359111433,'enrol_flatfile','map_8','frontpage',NULL),(545,2,1359111433,'enrol_imsenterprise','imsrolemap01','5',NULL),(546,2,1359111433,'enrol_imsenterprise','imsrolemap02','3',NULL),(547,2,1359111433,'enrol_imsenterprise','imsrolemap03','3',NULL),(548,2,1359111433,'enrol_imsenterprise','imsrolemap04','5',NULL),(549,2,1359111433,'enrol_imsenterprise','imsrolemap05','0',NULL),(550,2,1359111433,'enrol_imsenterprise','imsrolemap06','4',NULL),(551,2,1359111433,'enrol_imsenterprise','imsrolemap07','0',NULL),(552,2,1359111433,'enrol_imsenterprise','imsrolemap08','4',NULL),(553,2,1359111433,'enrol_manual','roleid','5',NULL),(554,2,1359111433,'enrol_meta','nosyncroleids','',NULL),(555,2,1359111433,'enrol_meta','syncall','1',NULL),(556,2,1359111433,'enrol_meta','unenrolaction','0',NULL),(557,2,1359111433,'enrol_mnet','roleid','5',NULL),(558,2,1359111433,'enrol_mnet','roleid_adv','1',NULL),(559,2,1359111433,'enrol_paypal','roleid','5',NULL),(560,2,1359111433,'enrol_self','roleid','5',NULL),(561,2,1359111433,NULL,'enablemobilewebservice','0',NULL),(562,2,1359111433,NULL,'profileroles','5,4,3',NULL),(563,2,1359111433,NULL,'calendar_exportsalt','6W3Lp6YRcBPqlG6uJezZQzczHF7NfzZ6gDD90mSSL0BqtbUzw2WWI7ynIQnq','CcVVOSWKWj4nvOjKV42pvjCoVrEpxRWolXzROnRwIKatT537xIl0ebA5ICZS'),(564,2,1359111433,NULL,'coursecontact','3',NULL),(565,2,1359111433,NULL,'frontpage','1',NULL),(566,2,1359111433,NULL,'frontpageloggedin','1',NULL),(567,2,1359111433,NULL,'maxcategorydepth','0',NULL),(568,2,1359111433,NULL,'commentsperpage','15',NULL),(569,2,1359111433,NULL,'defaultfrontpageroleid','8',NULL),(570,2,1359111433,NULL,'supportname','Admin User',NULL),(571,2,1359111433,NULL,'supportemail','',NULL),(572,2,1359111433,NULL,'calendar_exportsalt','brQZsTdSb2LHiVMRiQy3yP2nExlIWLX2BiTtpekEHJJG7PuB42DUWvJUkgad','6W3Lp6YRcBPqlG6uJezZQzczHF7NfzZ6gDD90mSSL0BqtbUzw2WWI7ynIQnq'),(573,0,1417538695,'mathjaxloader','filter_active','1','');
/*!40000 ALTER TABLE `mdl_config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=908 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_plugins`
--

LOCK TABLES `mdl_config_plugins` WRITE;
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` VALUES (1,'moodlecourse','format','weeks'),(2,'moodlecourse','maxsections','52'),(3,'moodlecourse','numsections','10'),(4,'moodlecourse','hiddensections','0'),(5,'moodlecourse','newsitems','5'),(6,'moodlecourse','showgrades','1'),(7,'moodlecourse','showreports','0'),(8,'moodlecourse','maxbytes','2097152'),(9,'moodlecourse','coursedisplay','0'),(10,'moodlecourse','groupmode','0'),(11,'moodlecourse','groupmodeforce','0'),(12,'moodlecourse','visible','1'),(13,'moodlecourse','lang',''),(14,'moodlecourse','enablecompletion','0'),(15,'moodlecourse','completionstartonenrol','0'),(16,'backup','loglifetime','30'),(17,'backup','backup_general_users','1'),(18,'backup','backup_general_users_locked','0'),(19,'backup','backup_general_anonymize','0'),(20,'backup','backup_general_anonymize_locked','0'),(21,'backup','backup_general_role_assignments','1'),(22,'backup','backup_general_role_assignments_locked','0'),(23,'backup','backup_general_activities','1'),(24,'backup','backup_general_activities_locked','0'),(25,'backup','backup_general_blocks','1'),(26,'backup','backup_general_blocks_locked','0'),(27,'backup','backup_general_filters','1'),(28,'backup','backup_general_filters_locked','0'),(29,'backup','backup_general_comments','1'),(30,'backup','backup_general_comments_locked','0'),(31,'backup','backup_general_userscompletion','1'),(32,'backup','backup_general_userscompletion_locked','0'),(33,'backup','backup_general_logs','0'),(34,'backup','backup_general_logs_locked','0'),(35,'backup','backup_general_histories','0'),(36,'backup','backup_general_histories_locked','0'),(37,'backup','backup_auto_active','0'),(38,'backup','backup_auto_weekdays','0000000'),(39,'backup','backup_auto_hour','0'),(40,'backup','backup_auto_minute','0'),(41,'backup','backup_auto_storage','0'),(42,'backup','backup_auto_destination',''),(43,'backup','backup_auto_keep','1'),(44,'backup','backup_shortname','0'),(45,'backup','backup_auto_skip_hidden','1'),(46,'backup','backup_auto_skip_modif_days','30'),(47,'backup','backup_auto_skip_modif_prev','0'),(48,'backup','backup_auto_users','1'),(49,'backup','backup_auto_role_assignments','1'),(50,'backup','backup_auto_activities','1'),(51,'backup','backup_auto_blocks','1'),(52,'backup','backup_auto_filters','1'),(53,'backup','backup_auto_comments','1'),(54,'backup','backup_auto_userscompletion','1'),(55,'backup','backup_auto_logs','0'),(56,'backup','backup_auto_histories','0'),(57,'block_course_overview','defaultmaxcourses','10'),(58,'block_course_overview','forcedefaultmaxcourses','0'),(59,'block_course_overview','showchildren','0'),(60,'block_course_overview','showwelcomearea','0'),(65,'enrol_database','dbtype',''),(66,'enrol_database','dbhost','localhost'),(67,'enrol_database','dbuser',''),(68,'enrol_database','dbpass',''),(69,'enrol_database','dbname',''),(70,'enrol_database','dbencoding','utf-8'),(71,'enrol_database','dbsetupsql',''),(72,'enrol_database','dbsybasequoting','0'),(73,'enrol_database','debugdb','0'),(74,'enrol_database','localcoursefield','idnumber'),(75,'enrol_database','localuserfield','idnumber'),(76,'enrol_database','localrolefield','shortname'),(77,'enrol_database','localcategoryfield','id'),(78,'enrol_database','remoteenroltable',''),(79,'enrol_database','remotecoursefield',''),(80,'enrol_database','remoteuserfield',''),(81,'enrol_database','remoterolefield',''),(82,'enrol_database','ignorehiddencourses','0'),(83,'enrol_database','unenrolaction','0'),(84,'enrol_database','newcoursetable',''),(85,'enrol_database','newcoursefullname','fullname'),(86,'enrol_database','newcourseshortname','shortname'),(87,'enrol_database','newcourseidnumber','idnumber'),(88,'enrol_database','newcoursecategory',''),(89,'enrol_database','templatecourse',''),(90,'enrol_flatfile','location',''),(91,'enrol_flatfile','mailstudents','0'),(92,'enrol_flatfile','mailteachers','0'),(93,'enrol_flatfile','mailadmins','0'),(94,'enrol_guest','requirepassword','0'),(95,'enrol_guest','usepasswordpolicy','0'),(96,'enrol_guest','showhint','0'),(97,'enrol_guest','defaultenrol','1'),(98,'enrol_guest','status','1'),(99,'enrol_guest','status_adv','0'),(100,'enrol_imsenterprise','imsfilelocation',''),(101,'enrol_imsenterprise','logtolocation',''),(102,'enrol_imsenterprise','mailadmins','0'),(103,'enrol_imsenterprise','createnewusers','0'),(104,'enrol_imsenterprise','imsdeleteusers','0'),(105,'enrol_imsenterprise','fixcaseusernames','0'),(106,'enrol_imsenterprise','fixcasepersonalnames','0'),(107,'enrol_imsenterprise','imssourcedidfallback','0'),(108,'enrol_imsenterprise','truncatecoursecodes','0'),(109,'enrol_imsenterprise','createnewcourses','0'),(110,'enrol_imsenterprise','createnewcategories','0'),(111,'enrol_imsenterprise','imsunenrol','0'),(112,'enrol_imsenterprise','imsrestricttarget',''),(113,'enrol_imsenterprise','imscapitafix','0'),(114,'enrol_manual','expiredaction','1'),(115,'enrol_manual','expirynotifyhour','6'),(116,'enrol_manual','defaultenrol','1'),(117,'enrol_manual','status','0'),(118,'enrol_manual','enrolperiod','0'),(119,'enrol_manual','expirynotify','0'),(120,'enrol_manual','expirythreshold','86400'),(121,'enrol_paypal','paypalbusiness',''),(122,'enrol_paypal','mailstudents','0'),(123,'enrol_paypal','mailteachers','0'),(124,'enrol_paypal','mailadmins','0'),(125,'enrol_paypal','status','1'),(126,'enrol_paypal','cost','0'),(127,'enrol_paypal','currency','USD'),(128,'enrol_paypal','enrolperiod','0'),(129,'enrol_self','requirepassword','0'),(130,'enrol_self','usepasswordpolicy','0'),(131,'enrol_self','showhint','0'),(132,'enrol_self','expiredaction','1'),(133,'enrol_self','expirynotifyhour','6'),(134,'enrol_self','defaultenrol','1'),(135,'enrol_self','status','1'),(136,'enrol_self','groupkey','0'),(137,'enrol_self','enrolperiod','0'),(138,'enrol_self','expirynotify','0'),(139,'enrol_self','expirythreshold','86400'),(140,'enrol_self','longtimenosee','0'),(141,'enrol_self','maxenrolled','0'),(142,'enrol_self','sendcoursewelcomemessage','1'),(144,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),(145,'editor_tinymce','customconfig',''),(147,'tinymce_moodleemoticon','requireemoticon','1'),(148,'tinymce_spellchecker','spellengine','GoogleSpell'),(149,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),(150,'cachestore_memcache','testservers',''),(151,'cachestore_memcached','testservers',''),(152,'cachestore_mongodb','testserver',''),(153,'theme_afterburner','logo',''),(154,'theme_afterburner','footnote',''),(155,'theme_afterburner','customcss',''),(156,'theme_arialist','logo',''),(157,'theme_arialist','tagline',''),(158,'theme_arialist','linkcolor','#f25f0f'),(159,'theme_arialist','regionwidth','250'),(160,'theme_arialist','customcss',''),(161,'theme_brick','logo',''),(162,'theme_brick','linkcolor','#06365b'),(163,'theme_brick','linkhover','#5487ad'),(164,'theme_brick','maincolor','#8e2800'),(165,'theme_brick','maincolorlink','#fff0a5'),(166,'theme_brick','headingcolor','#5c3500'),(167,'theme_formal_white','fontsizereference','13'),(168,'theme_formal_white','noframe','0'),(169,'theme_formal_white','framemargin','15'),(170,'theme_formal_white','headercontent','1'),(171,'theme_formal_white','customlogourl',''),(172,'theme_formal_white','frontpagelogourl',''),(173,'theme_formal_white','headerbgc','#E3DFD4'),(174,'theme_formal_white','creditstomoodleorg','2'),(175,'theme_formal_white','blockcolumnwidth','200'),(176,'theme_formal_white','blockpadding','8'),(177,'theme_formal_white','blockcontentbgc','#F6F6F6'),(178,'theme_formal_white','lblockcolumnbgc','#E3DFD4'),(179,'theme_formal_white','rblockcolumnbgc',''),(180,'theme_formal_white','footnote',''),(181,'theme_formal_white','customcss',''),(182,'theme_fusion','linkcolor','#2d83d5'),(183,'theme_fusion','tagline',''),(184,'theme_fusion','footertext',''),(185,'theme_fusion','customcss',''),(186,'theme_magazine','background',''),(187,'theme_magazine','logo',''),(188,'theme_magazine','linkcolor','#32529a'),(189,'theme_magazine','linkhover','#4e2300'),(190,'theme_magazine','maincolor','#002f2f'),(191,'theme_magazine','maincoloraccent','#092323'),(192,'theme_magazine','headingcolor','#4e0000'),(193,'theme_magazine','blockcolor','#002f2f'),(194,'theme_magazine','forumback','#e6e2af'),(201,'theme_nimble','tagline',''),(202,'theme_nimble','footerline',''),(203,'theme_nimble','backgroundcolor','#454545'),(204,'theme_nimble','linkcolor','#2a65b1'),(205,'theme_nimble','linkhover','#222222'),(206,'theme_nonzero','regionprewidth','200'),(207,'theme_nonzero','regionpostwidth','200'),(208,'theme_nonzero','customcss',''),(209,'theme_overlay','linkcolor','#428ab5'),(210,'theme_overlay','headercolor','#2a4c7b'),(211,'theme_overlay','footertext',''),(212,'theme_overlay','customcss',''),(213,'theme_sky_high','logo',''),(214,'theme_sky_high','regionwidth','240'),(215,'theme_sky_high','footnote',''),(216,'theme_sky_high','customcss',''),(217,'theme_splash','logo',''),(218,'theme_splash','tagline','Virtual learning center'),(219,'theme_splash','hide_tagline','0'),(220,'theme_splash','footnote',''),(221,'theme_splash','customcss',''),(222,'qtype_calculated','version','2014111000'),(223,'qtype_calculatedmulti','version','2014111000'),(224,'qtype_calculatedsimple','version','2014111000'),(225,'qtype_description','version','2014111000'),(226,'qtype_essay','version','2014111000'),(227,'qtype_match','version','2014111000'),(228,'qtype_missingtype','version','2014111000'),(229,'qtype_multianswer','version','2014111000'),(230,'qtype_multichoice','version','2014111000'),(231,'qtype_numerical','version','2014111000'),(232,'qtype_random','version','2014111000'),(233,'qtype_randomsamatch','version','2014111000'),(234,'qtype_shortanswer','version','2014111000'),(235,'qtype_truefalse','version','2014111000'),(245,'auth_cas','version','2014111000'),(247,'auth_db','version','2014111000'),(249,'auth_email','version','2014111000'),(250,'auth_fc','version','2014111000'),(252,'auth_imap','version','2014111000'),(254,'auth_ldap','version','2014111000'),(256,'auth_manual','version','2014111000'),(257,'auth_mnet','version','2014111000'),(259,'auth_nntp','version','2014111000'),(261,'auth_nologin','version','2014111000'),(262,'auth_none','version','2014111000'),(263,'auth_pam','version','2014111000'),(265,'auth_pop3','version','2014111000'),(267,'auth_radius','version','2014111000'),(269,'auth_shibboleth','version','2014111000'),(271,'auth_webservice','version','2014111000'),(273,'enrol_category','version','2014111000'),(275,'enrol_cohort','version','2014111000'),(276,'enrol_database','version','2014111000'),(278,'enrol_flatfile','version','2014111000'),(279,'enrol_guest','version','2014111000'),(280,'enrol_imsenterprise','version','2014111000'),(282,'enrol_ldap','version','2014111000'),(284,'enrol_manual','version','2014111000'),(286,'enrol_meta','version','2014111000'),(288,'enrol_mnet','version','2014111000'),(289,'enrol_paypal','version','2014111000'),(290,'enrol_self','version','2014111000'),(292,'message_email','version','2014111000'),(297,'message','email_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(298,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedin','email'),(299,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedoff','email'),(300,'message','email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(301,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin','email'),(302,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff','email'),(303,'message','email_provider_enrol_manual_expiry_notification_permitted','permitted'),(304,'message','message_provider_enrol_manual_expiry_notification_loggedin','email'),(305,'message','message_provider_enrol_manual_expiry_notification_loggedoff','email'),(306,'message','email_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(307,'message','message_provider_enrol_paypal_paypal_enrolment_loggedin','email'),(308,'message','message_provider_enrol_paypal_paypal_enrolment_loggedoff','email'),(309,'message','email_provider_enrol_self_expiry_notification_permitted','permitted'),(310,'message','message_provider_enrol_self_expiry_notification_loggedin','email'),(311,'message','message_provider_enrol_self_expiry_notification_loggedoff','email'),(312,'message','email_provider_mod_assign_assign_notification_permitted','permitted'),(313,'message','message_provider_mod_assign_assign_notification_loggedin','email'),(314,'message','message_provider_mod_assign_assign_notification_loggedoff','email'),(315,'message','email_provider_mod_assignment_assignment_updates_permitted','permitted'),(316,'message','message_provider_mod_assignment_assignment_updates_loggedin','email'),(317,'message','message_provider_mod_assignment_assignment_updates_loggedoff','email'),(318,'message','email_provider_mod_feedback_submission_permitted','permitted'),(319,'message','message_provider_mod_feedback_submission_loggedin','email'),(320,'message','message_provider_mod_feedback_submission_loggedoff','email'),(321,'message','email_provider_mod_feedback_message_permitted','permitted'),(322,'message','message_provider_mod_feedback_message_loggedin','email'),(323,'message','message_provider_mod_feedback_message_loggedoff','email'),(324,'message','email_provider_mod_forum_posts_permitted','permitted'),(325,'message','message_provider_mod_forum_posts_loggedin','email'),(326,'message','message_provider_mod_forum_posts_loggedoff','email'),(327,'message','email_provider_mod_lesson_graded_essay_permitted','permitted'),(328,'message','message_provider_mod_lesson_graded_essay_loggedin','email'),(329,'message','message_provider_mod_lesson_graded_essay_loggedoff','email'),(330,'message','email_provider_mod_quiz_submission_permitted','permitted'),(331,'message','message_provider_mod_quiz_submission_loggedin','email'),(332,'message','message_provider_mod_quiz_submission_loggedoff','email'),(333,'message','email_provider_mod_quiz_confirmation_permitted','permitted'),(334,'message','message_provider_mod_quiz_confirmation_loggedin','email'),(335,'message','message_provider_mod_quiz_confirmation_loggedoff','email'),(336,'message','email_provider_mod_quiz_attempt_overdue_permitted','permitted'),(337,'message','message_provider_mod_quiz_attempt_overdue_loggedin','email'),(338,'message','message_provider_mod_quiz_attempt_overdue_loggedoff','email'),(339,'message','email_provider_moodle_notices_permitted','permitted'),(340,'message','message_provider_moodle_notices_loggedin','email'),(341,'message','message_provider_moodle_notices_loggedoff','email'),(342,'message','email_provider_moodle_errors_permitted','permitted'),(343,'message','message_provider_moodle_errors_loggedin','email'),(344,'message','message_provider_moodle_errors_loggedoff','email'),(345,'message','email_provider_moodle_availableupdate_permitted','permitted'),(346,'message','message_provider_moodle_availableupdate_loggedin','email'),(347,'message','message_provider_moodle_availableupdate_loggedoff','email'),(348,'message','email_provider_moodle_instantmessage_permitted','permitted'),(349,'message','message_provider_moodle_instantmessage_loggedoff','popup,email'),(350,'message','email_provider_moodle_backup_permitted','permitted'),(351,'message','message_provider_moodle_backup_loggedin','email'),(352,'message','message_provider_moodle_backup_loggedoff','email'),(353,'message','email_provider_moodle_courserequested_permitted','permitted'),(354,'message','message_provider_moodle_courserequested_loggedin','email'),(355,'message','message_provider_moodle_courserequested_loggedoff','email'),(356,'message','email_provider_moodle_courserequestapproved_permitted','permitted'),(357,'message','message_provider_moodle_courserequestapproved_loggedin','email'),(358,'message','message_provider_moodle_courserequestapproved_loggedoff','email'),(359,'message','email_provider_moodle_courserequestrejected_permitted','permitted'),(360,'message','message_provider_moodle_courserequestrejected_loggedin','email'),(361,'message','message_provider_moodle_courserequestrejected_loggedoff','email'),(362,'message_jabber','version','2014111000'),(365,'message','jabber_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(366,'message','jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(367,'message','jabber_provider_enrol_manual_expiry_notification_permitted','permitted'),(368,'message','jabber_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(369,'message','jabber_provider_enrol_self_expiry_notification_permitted','permitted'),(370,'message','jabber_provider_mod_assign_assign_notification_permitted','permitted'),(371,'message','jabber_provider_mod_assignment_assignment_updates_permitted','permitted'),(372,'message','jabber_provider_mod_feedback_submission_permitted','permitted'),(373,'message','jabber_provider_mod_feedback_message_permitted','permitted'),(374,'message','jabber_provider_mod_forum_posts_permitted','permitted'),(375,'message','jabber_provider_mod_lesson_graded_essay_permitted','permitted'),(376,'message','jabber_provider_mod_quiz_submission_permitted','permitted'),(377,'message','jabber_provider_mod_quiz_confirmation_permitted','permitted'),(378,'message','jabber_provider_mod_quiz_attempt_overdue_permitted','permitted'),(379,'message','jabber_provider_moodle_notices_permitted','permitted'),(380,'message','jabber_provider_moodle_errors_permitted','permitted'),(381,'message','jabber_provider_moodle_availableupdate_permitted','permitted'),(382,'message','jabber_provider_moodle_instantmessage_permitted','permitted'),(383,'message','jabber_provider_moodle_backup_permitted','permitted'),(384,'message','jabber_provider_moodle_courserequested_permitted','permitted'),(385,'message','jabber_provider_moodle_courserequestapproved_permitted','permitted'),(386,'message','jabber_provider_moodle_courserequestrejected_permitted','permitted'),(387,'message_popup','version','2014111000'),(390,'message','popup_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(391,'message','popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(392,'message','popup_provider_enrol_manual_expiry_notification_permitted','permitted'),(393,'message','popup_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(394,'message','popup_provider_enrol_self_expiry_notification_permitted','permitted'),(395,'message','popup_provider_mod_assign_assign_notification_permitted','permitted'),(396,'message','popup_provider_mod_assignment_assignment_updates_permitted','permitted'),(397,'message','popup_provider_mod_feedback_submission_permitted','permitted'),(398,'message','popup_provider_mod_feedback_message_permitted','permitted'),(399,'message','popup_provider_mod_forum_posts_permitted','permitted'),(400,'message','popup_provider_mod_lesson_graded_essay_permitted','permitted'),(401,'message','popup_provider_mod_quiz_submission_permitted','permitted'),(402,'message','popup_provider_mod_quiz_confirmation_permitted','permitted'),(403,'message','popup_provider_mod_quiz_attempt_overdue_permitted','permitted'),(404,'message','popup_provider_moodle_notices_permitted','permitted'),(405,'message','popup_provider_moodle_errors_permitted','permitted'),(406,'message','popup_provider_moodle_availableupdate_permitted','permitted'),(407,'message','popup_provider_moodle_instantmessage_permitted','permitted'),(408,'message','message_provider_moodle_instantmessage_loggedin','popup'),(409,'message','popup_provider_moodle_backup_permitted','permitted'),(410,'message','popup_provider_moodle_courserequested_permitted','permitted'),(411,'message','popup_provider_moodle_courserequestapproved_permitted','permitted'),(412,'message','popup_provider_moodle_courserequestrejected_permitted','permitted'),(414,'filter_activitynames','version','2014111000'),(416,'filter_algebra','version','2014111000'),(417,'filter_censor','version','2014111000'),(418,'filter_data','version','2014111000'),(420,'filter_emailprotect','version','2014111000'),(421,'filter_emoticon','version','2014111000'),(422,'filter_glossary','version','2014111000'),(424,'filter_mediaplugin','version','2014111000'),(426,'filter_multilang','version','2014111000'),(427,'filter_tex','version','2014111000'),(429,'filter_tidy','version','2014111000'),(430,'filter_urltolink','version','2014111000'),(431,'editor_textarea','version','2014111000'),(432,'editor_tinymce','version','2014111000'),(433,'format_scorm','version','2012112900'),(434,'format_social','version','2014111000'),(435,'format_topics','version','2014111000'),(436,'format_weeks','version','2014111000'),(437,'profilefield_checkbox','version','2014111000'),(438,'profilefield_datetime','version','2014111000'),(439,'profilefield_menu','version','2014111000'),(440,'profilefield_text','version','2014111000'),(441,'profilefield_textarea','version','2014111000'),(442,'report_backups','version','2014111000'),(443,'report_completion','version','2014111000'),(445,'report_configlog','version','2014111000'),(446,'report_courseoverview','version','2014111000'),(447,'report_log','version','2014111000'),(449,'report_loglive','version','2014111000'),(450,'report_outline','version','2014111000'),(452,'report_participation','version','2014111000'),(454,'report_progress','version','2014111000'),(456,'report_questioninstances','version','2014111000'),(457,'report_security','version','2014111000'),(458,'report_stats','version','2014111000'),(460,'gradeexport_ods','version','2014111000'),(461,'gradeexport_txt','version','2014111000'),(462,'gradeexport_xls','version','2014111000'),(463,'gradeexport_xml','version','2014111000'),(464,'gradeimport_csv','version','2014111000'),(465,'gradeimport_xml','version','2014111000'),(466,'gradereport_grader','version','2014111000'),(467,'gradereport_outcomes','version','2014111000'),(468,'gradereport_overview','version','2014111000'),(469,'gradereport_user','version','2014111000'),(470,'gradingform_guide','version','2014111000'),(471,'gradingform_rubric','version','2014111000'),(472,'mnetservice_enrol','version','2014111000'),(473,'webservice_amf','version','2014111000'),(474,'webservice_rest','version','2014111000'),(475,'webservice_soap','version','2014111000'),(476,'webservice_xmlrpc','version','2014111000'),(477,'repository_alfresco','version','2014111000'),(478,'repository_boxnet','version','2014111000'),(479,'repository_coursefiles','version','2014111000'),(480,'repository_-- DROPbox','version','2012112900'),(481,'repository_equella','version','2014111000'),(482,'repository_filesystem','version','2014111000'),(483,'repository_flickr','version','2014111000'),(484,'repository_flickr_public','version','2014111000'),(485,'repository_googledocs','version','2014111000'),(486,'repository_local','version','2014111000'),(488,'local','enablecourseinstances','0'),(489,'local','enableuserinstances','0'),(490,'repository_merlot','version','2014111000'),(491,'repository_picasa','version','2014111000'),(492,'repository_recent','version','2014111000'),(494,'recent','enablecourseinstances','0'),(495,'recent','enableuserinstances','0'),(496,'repository_s3','version','2014111000'),(497,'repository_upload','version','2014111000'),(499,'upload','enablecourseinstances','0'),(500,'upload','enableuserinstances','0'),(501,'repository_url','version','2014111000'),(503,'url','enablecourseinstances','0'),(504,'url','enableuserinstances','0'),(505,'repository_user','version','2014111000'),(507,'user','enablecourseinstances','0'),(508,'user','enableuserinstances','0'),(509,'repository_webdav','version','2014111000'),(510,'repository_wikimedia','version','2014111000'),(512,'wikimedia','enablecourseinstances','0'),(513,'wikimedia','enableuserinstances','0'),(514,'repository_youtube','version','2014111000'),(516,'youtube','enablecourseinstances','0'),(517,'youtube','enableuserinstances','0'),(518,'portfolio_boxnet','version','2014111000'),(519,'portfolio_download','version','2014111000'),(520,'portfolio_flickr','version','2014111000'),(521,'portfolio_googledocs','version','2014111000'),(522,'portfolio_mahara','version','2014111000'),(523,'portfolio_picasa','version','2014111000'),(524,'qbehaviour_adaptive','version','2014111000'),(525,'qbehaviour_adaptivenopenalty','version','2014111000'),(526,'qbehaviour_deferredcbm','version','2014111000'),(527,'qbehaviour_deferredfeedback','version','2014111000'),(528,'qbehaviour_immediatecbm','version','2014111000'),(529,'qbehaviour_immediatefeedback','version','2014111000'),(530,'qbehaviour_informationitem','version','2014111000'),(531,'qbehaviour_interactive','version','2014111000'),(532,'qbehaviour_interactivecountback','version','2014111000'),(533,'qbehaviour_manualgraded','version','2014111000'),(534,'qbehaviour_missing','version','2014111000'),(535,'qformat_aiken','version','2014111000'),(537,'qformat_blackboard_six','version','2014111000'),(538,'qformat_examview','version','2014111000'),(539,'qformat_gift','version','2014111000'),(541,'qformat_missingword','version','2014111000'),(542,'qformat_multianswer','version','2014111000'),(543,'qformat_webct','version','2014111000'),(544,'qformat_xhtml','version','2014111000'),(545,'qformat_xml','version','2014111000'),(546,'tool_assignmentupgrade','version','2014111000'),(547,'tool_capability','version','2014111000'),(548,'tool_customlang','version','2014111000'),(550,'tool_dbtransfer','version','2014111000'),(551,'tool_generator','version','2014111000'),(552,'tool_health','version','2014111000'),(553,'tool_innodb','version','2014111000'),(554,'tool_langimport','version','2014111000'),(555,'tool_multilangupgrade','version','2014111000'),(556,'tool_phpunit','version','2014111000'),(557,'tool_profiling','version','2014111000'),(560,'tool_replace','version','2014111000'),(561,'tool_spamcleaner','version','2014111000'),(562,'tool_timezoneimport','version','2014111000'),(563,'tool_unsuproles','version','2014111000'),(565,'tool_uploaduser','version','2014111000'),(566,'tool_xmldb','version','2014111000'),(567,'cachestore_file','version','2014111000'),(568,'cachestore_memcache','version','2014111000'),(569,'cachestore_memcached','version','2014111000'),(570,'cachestore_mongodb','version','2014111000'),(571,'cachestore_session','version','2014111000'),(572,'cachestore_static','version','2014111000'),(573,'theme_afterburner','version','2012112900'),(574,'theme_anomaly','version','2012112900'),(575,'theme_arialist','version','2012112900'),(576,'theme_base','version','2014111000'),(577,'theme_binarius','version','2012112900'),(578,'theme_boxxie','version','2012112900'),(579,'theme_brick','version','2012112900'),(580,'theme_canvas','version','2014111000'),(581,'theme_formal_white','version','2012112900'),(583,'theme_formfactor','version','2012112900'),(584,'theme_fusion','version','2012112900'),(585,'theme_leatherbound','version','2012112900'),(586,'theme_magazine','version','2012112900'),(588,'theme_nimble','version','2012112900'),(589,'theme_nonzero','version','2012112900'),(590,'theme_overlay','version','2012112900'),(591,'theme_serenity','version','2012112900'),(592,'theme_sky_high','version','2012112900'),(593,'theme_splash','version','2012112900'),(594,'theme_standard','version','2012112900'),(595,'theme_standardold','version','2012112900'),(596,'assignsubmission_comments','version','2014111000'),(598,'assignsubmission_file','sortorder','1'),(599,'assignsubmission_comments','sortorder','2'),(600,'assignsubmission_onlinetext','sortorder','0'),(601,'assignsubmission_file','version','2014111000'),(602,'assignsubmission_onlinetext','version','2014111000'),(604,'assignfeedback_comments','version','2014111000'),(606,'assignfeedback_comments','sortorder','0'),(607,'assignfeedback_file','sortorder','2'),(608,'assignfeedback_offline','sortorder','1'),(609,'assignfeedback_file','version','2014111000'),(611,'assignfeedback_offline','version','2014111000'),(612,'assignment_offline','version','2014111000'),(613,'assignment_online','version','2014111000'),(614,'assignment_upload','version','2014111000'),(615,'assignment_uploadsingle','version','2014111000'),(616,'booktool_exportimscp','version','2014111000'),(617,'booktool_importhtml','version','2014111000'),(618,'booktool_print','version','2014111000'),(619,'datafield_checkbox','version','2014111000'),(620,'datafield_date','version','2014111000'),(621,'datafield_file','version','2014111000'),(622,'datafield_latlong','version','2014111000'),(623,'datafield_menu','version','2014111000'),(624,'datafield_multimenu','version','2014111000'),(625,'datafield_number','version','2014111000'),(626,'datafield_picture','version','2014111000'),(627,'datafield_radiobutton','version','2014111000'),(628,'datafield_text','version','2014111000'),(629,'datafield_textarea','version','2014111000'),(630,'datafield_url','version','2014111000'),(631,'datapreset_imagegallery','version','2014111000'),(632,'quiz_grading','version','2014111000'),(633,'quiz_overview','version','2014111000'),(634,'quiz_responses','version','2014111000'),(635,'quiz_statistics','version','2014111000'),(637,'quizaccess_delaybetweenattempts','version','2014111000'),(638,'quizaccess_ipaddress','version','2014111000'),(639,'quizaccess_numattempts','version','2014111000'),(640,'quizaccess_openclosedate','version','2014111000'),(641,'quizaccess_password','version','2014111000'),(642,'quizaccess_safebrowser','version','2014111000'),(643,'quizaccess_securewindow','version','2014111000'),(644,'quizaccess_timelimit','version','2014111000'),(645,'scormreport_basic','version','2014111000'),(646,'scormreport_graphs','version','2014111000'),(647,'scormreport_interactions','version','2014111000'),(648,'workshopform_accumulative','version','2014111000'),(650,'workshopform_comments','version','2014111000'),(652,'workshopform_numerrors','version','2014111000'),(654,'workshopform_rubric','version','2014111000'),(656,'workshopallocation_manual','version','2014111000'),(657,'workshopallocation_random','version','2014111000'),(658,'workshopallocation_scheduled','version','2014111000'),(659,'workshopeval_best','version','2014111000'),(661,'tinymce_moodleemoticon','version','2014111000'),(662,'tinymce_moodleimage','version','2014111000'),(663,'tinymce_moodlemedia','version','2014111000'),(664,'tinymce_moodlenolink','version','2014111000'),(665,'tinymce_spellchecker','version','2014111000'),(667,'enrol_cohort','roleid','5'),(668,'enrol_cohort','unenrolaction','0'),(669,'enrol_database','defaultrole','5'),(670,'enrol_database','defaultcategory','1'),(671,'enrol_flatfile','map_1','manager'),(672,'enrol_flatfile','map_2','coursecreator'),(673,'enrol_flatfile','map_3','editingteacher'),(674,'enrol_flatfile','map_4','teacher'),(675,'enrol_flatfile','map_5','student'),(676,'enrol_flatfile','map_6','guest'),(677,'enrol_flatfile','map_7','user'),(678,'enrol_flatfile','map_8','frontpage'),(679,'enrol_imsenterprise','imsrolemap01','5'),(680,'enrol_imsenterprise','imsrolemap02','3'),(681,'enrol_imsenterprise','imsrolemap03','3'),(682,'enrol_imsenterprise','imsrolemap04','5'),(683,'enrol_imsenterprise','imsrolemap05','0'),(684,'enrol_imsenterprise','imsrolemap06','4'),(685,'enrol_imsenterprise','imsrolemap07','0'),(686,'enrol_imsenterprise','imsrolemap08','4'),(687,'enrol_manual','roleid','5'),(688,'enrol_meta','nosyncroleids',''),(689,'enrol_meta','syncall','1'),(690,'enrol_meta','unenrolaction','0'),(691,'enrol_mnet','roleid','5'),(692,'enrol_mnet','roleid_adv','1'),(693,'enrol_paypal','roleid','5'),(694,'enrol_self','roleid','5'),(695,'mod_assign','version','2014111000'),(696,'mod_assignment','version','2014111000'),(697,'mod_book','version','2014111000'),(698,'mod_chat','version','2014111000'),(699,'mod_choice','version','2014111000'),(700,'mod_data','version','2014111000'),(701,'mod_feedback','version','2014111000'),(702,'mod_folder','version','2014111000'),(703,'mod_forum','version','2014111000'),(704,'mod_glossary','version','2014111000'),(705,'mod_imscp','version','2014111000'),(706,'mod_label','version','2014111000'),(707,'mod_lesson','version','2014111000'),(708,'mod_lti','version','2014111000'),(709,'mod_page','version','2014111000'),(710,'mod_quiz','version','2014111000'),(711,'mod_resource','version','2014111000'),(712,'mod_scorm','version','2014111000'),(713,'mod_survey','version','2014111000'),(714,'mod_url','version','2014111000'),(715,'mod_wiki','version','2014111000'),(716,'mod_workshop','version','2014111000'),(717,'block_activity_modules','version','2014111000'),(718,'block_admin_bookmarks','version','2014111000'),(719,'block_blog_menu','version','2014111000'),(720,'block_blog_recent','version','2014111000'),(721,'block_blog_tags','version','2014111000'),(722,'block_calendar_month','version','2014111000'),(723,'block_calendar_upcoming','version','2014111000'),(724,'block_comments','version','2014111000'),(725,'block_community','version','2014111000'),(726,'block_completionstatus','version','2014111000'),(727,'block_course_list','version','2014111000'),(728,'block_course_overview','version','2014111000'),(729,'block_course_summary','version','2014111000'),(730,'block_feedback','version','2014111000'),(731,'block_glossary_random','version','2014111000'),(732,'block_html','version','2014111000'),(733,'block_login','version','2014111000'),(734,'block_mentees','version','2014111000'),(735,'block_messages','version','2014111000'),(736,'block_mnet_hosts','version','2014111000'),(737,'block_myprofile','version','2014111000'),(738,'block_navigation','version','2014111000'),(739,'block_news_items','version','2014111000'),(740,'block_online_users','version','2014111000'),(741,'block_participants','version','2014111000'),(742,'block_private_files','version','2014111000'),(743,'block_quiz_results','version','2014111000'),(744,'block_recent_activity','version','2014111000'),(745,'block_rss_client','version','2014111000'),(746,'block_search_forums','version','2014111000'),(747,'block_section_links','version','2014111000'),(748,'block_selfcompletion','version','2014111000'),(749,'block_settings','version','2014111000'),(750,'block_site_main_menu','version','2014111000'),(751,'block_social_activities','version','2014111000'),(752,'block_tag_flickr','version','2014111000'),(753,'block_tag_youtube','version','2014111000'),(754,'block_tags','version','2014111000'),(755,'message','email_provider_moodle_badgerecipientnotice_permitted','permitted'),(756,'message','jabber_provider_moodle_badgerecipientnotice_permitted','permitted'),(757,'message','popup_provider_moodle_badgerecipientnotice_permitted','permitted'),(758,'message','message_provider_moodle_badgerecipientnotice_loggedin','popup'),(759,'message','message_provider_moodle_badgerecipientnotice_loggedoff','email,popup'),(760,'message','email_provider_moodle_badgecreatornotice_permitted','permitted'),(761,'message','jabber_provider_moodle_badgecreatornotice_permitted','permitted'),(762,'message','popup_provider_moodle_badgecreatornotice_permitted','permitted'),(763,'message','message_provider_moodle_badgecreatornotice_loggedoff','email'),(764,'availability_completion','version','2014111000'),(765,'availability_date','version','2014111000'),(766,'availability_grade','version','2014111000'),(767,'availability_group','version','2014111000'),(768,'availability_grouping','version','2014111000'),(769,'availability_profile','version','2014111000'),(770,'folder','showexpanded','0'),(771,'lesson','requiremodintro','0'),(772,'scorm','nav_adv','0'),(773,'auth/cas','start_tls','0'),(774,'auth/ldap','start_tls','0'),(775,'calendartype_gregorian','version','2014111000'),(776,'message_airnotifier','version','2014111000'),(778,'message','airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(779,'message','airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(780,'message','airnotifier_provider_enrol_manual_expiry_notification_permitted','permitted'),(781,'message','airnotifier_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(782,'message','airnotifier_provider_enrol_self_expiry_notification_permitted','permitted'),(783,'message','airnotifier_provider_mod_assign_assign_notification_permitted','permitted'),(784,'message','airnotifier_provider_mod_assignment_assignment_updates_permitted','permitted'),(785,'message','airnotifier_provider_mod_feedback_submission_permitted','permitted'),(786,'message','airnotifier_provider_mod_feedback_message_permitted','permitted'),(787,'message','airnotifier_provider_mod_forum_posts_permitted','permitted'),(788,'message','airnotifier_provider_mod_lesson_graded_essay_permitted','permitted'),(789,'message','airnotifier_provider_mod_quiz_submission_permitted','permitted'),(790,'message','airnotifier_provider_mod_quiz_confirmation_permitted','permitted'),(791,'message','airnotifier_provider_mod_quiz_attempt_overdue_permitted','permitted'),(792,'message','airnotifier_provider_moodle_notices_permitted','permitted'),(793,'message','airnotifier_provider_moodle_errors_permitted','permitted'),(794,'message','airnotifier_provider_moodle_availableupdate_permitted','permitted'),(795,'message','airnotifier_provider_moodle_instantmessage_permitted','permitted'),(796,'message','airnotifier_provider_moodle_backup_permitted','permitted'),(797,'message','airnotifier_provider_moodle_courserequested_permitted','permitted'),(798,'message','airnotifier_provider_moodle_courserequestapproved_permitted','permitted'),(799,'message','airnotifier_provider_moodle_courserequestrejected_permitted','permitted'),(800,'message','airnotifier_provider_moodle_badgerecipientnotice_permitted','permitted'),(801,'message','airnotifier_provider_moodle_badgecreatornotice_permitted','permitted'),(802,'block_badges','version','2014111000'),(803,'block_section_links','incby1','2'),(804,'block_section_links','incby2','5'),(805,'block_section_links','numsections1','22'),(806,'block_section_links','numsections2','40'),(807,'filter_mathjaxloader','version','2014111000'),(809,'editor_atto','version','2014111000'),(813,'editor_tinymce','customtoolbar','wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),(814,'format_singleactivity','version','2014111000'),(815,'report_eventlist','version','2014111000'),(816,'report_performance','version','2014111000'),(817,'gradeimport_direct','version','2014111000'),(818,'gradereport_history','version','2014111000'),(819,'gradereport_singleview','version','2014111000'),(820,'repository_areafiles','version','2014111000'),(822,'areafiles','enablecourseinstances','0'),(823,'areafiles','enableuserinstances','0'),(824,'repository_dropbox','version','2014111000'),(825,'repository_skydrive','version','2014111000'),(826,'question','disabledbehaviours','manualgraded'),(827,'tool_availabilityconditions','version','2014111000'),(828,'tool_behat','version','2014111000'),(829,'tool_installaddon','version','2014111000'),(830,'tool_log','version','2014111000'),(832,'tool_log','enabled_stores','logstore_standard'),(833,'tool_messageinbound','version','2014111000'),(834,'message','email_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(835,'message','jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(836,'message','popup_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(837,'message','airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(838,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedin','email'),(839,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff','email'),(840,'message','email_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(841,'message','jabber_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(842,'message','popup_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(843,'message','airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(844,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedin','email'),(845,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedoff','email'),(846,'message','email_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(847,'message','jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(848,'message','popup_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(849,'message','airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(850,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedin','email'),(851,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff','email'),(852,'tool_monitor','version','2014111001'),(853,'message','email_provider_tool_monitor_notification_permitted','permitted'),(854,'message','jabber_provider_tool_monitor_notification_permitted','permitted'),(855,'message','popup_provider_tool_monitor_notification_permitted','permitted'),(856,'message','airnotifier_provider_tool_monitor_notification_permitted','permitted'),(857,'message','message_provider_tool_monitor_notification_loggedin','email'),(858,'message','message_provider_tool_monitor_notification_loggedoff','email'),(859,'tool_task','version','2014111000'),(860,'tool_uploadcourse','version','2014111000'),(861,'cachelock_file','version','2014111000'),(862,'theme_bootstrapbase','version','2014111000'),(863,'theme_clean','version','2014111000'),(864,'theme_more','version','2014111000'),(866,'assignfeedback_editpdf','version','2014111000'),(868,'ltiservice_profile','version','2014111000'),(869,'ltiservice_toolproxy','version','2014111000'),(870,'ltiservice_toolsettings','version','2014111000'),(871,'scormreport_objectives','version','2014111000'),(872,'atto_accessibilitychecker','version','2014111000'),(873,'atto_accessibilityhelper','version','2014111000'),(874,'atto_align','version','2014111000'),(875,'atto_backcolor','version','2014111000'),(876,'atto_bold','version','2014111000'),(877,'atto_charmap','version','2014111000'),(878,'atto_clear','version','2014111000'),(879,'atto_collapse','version','2014111000'),(880,'atto_emoticon','version','2014111000'),(881,'atto_equation','version','2014111000'),(882,'atto_fontcolor','version','2014111000'),(883,'atto_html','version','2014111000'),(884,'atto_image','version','2014111000'),(885,'atto_indent','version','2014111000'),(886,'atto_italic','version','2014111000'),(887,'atto_link','version','2014111000'),(888,'atto_managefiles','version','2014111000'),(889,'atto_media','version','2014111000'),(890,'atto_noautolink','version','2014111000'),(891,'atto_orderedlist','version','2014111000'),(892,'atto_rtl','version','2014111000'),(893,'atto_strike','version','2014111000'),(894,'atto_subscript','version','2014111000'),(895,'atto_superscript','version','2014111000'),(896,'atto_table','version','2014111000'),(897,'atto_title','version','2014111000'),(898,'atto_underline','version','2014111000'),(899,'atto_undo','version','2014111000'),(900,'atto_unorderedlist','version','2014111000'),(901,'tinymce_ctrlhelp','version','2014111000'),(902,'tinymce_managefiles','version','2014111000'),(903,'tinymce_pdw','version','2014111000'),(904,'tinymce_wrap','version','2014111000'),(905,'logstore_database','version','2014111000'),(906,'logstore_legacy','version','2014111000'),(907,'logstore_standard','version','2014111000');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context`
--

LOCK TABLES `mdl_context` WRITE;
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` VALUES (1,10,0,'/1',1),(2,50,1,'/1/2',2),(3,40,1,'/1/3',2),(4,30,1,'/1/4',2),(5,30,2,'/1/5',2),(6,80,1,'/1/2/6',3),(7,80,2,'/1/2/7',3),(8,80,3,'/1/2/8',3),(9,80,4,'/1/9',2),(10,80,5,'/1/10',2),(11,80,6,'/1/11',2),(12,80,7,'/1/12',2),(13,80,8,'/1/13',2),(14,80,9,'/1/14',2),(15,80,10,'/1/15',2),(16,80,11,'/1/16',2);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context_temp`
--

LOCK TABLES `mdl_context_temp` WRITE;
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,0,'','','',NULL,0,'site',1,3,0,0,0,0,0,1,1,0,0,0,'','',1359111413,1359111434,0,0,0,1417538703,'');
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Miscellaneous',NULL,NULL,0,0,10000,0,1,1,1359111413,1,'/1',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `mdl_course_completion_aggr_methd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_aggr_methd`
--

LOCK TABLES `mdl_course_completion_aggr_methd` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

DROP TABLE IF EXISTS `mdl_course_completion_crit_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_crit_compl`
--

LOCK TABLES `mdl_course_completion_crit_compl` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_criteria`
--

DROP TABLE IF EXISTS `mdl_course_completion_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_criteria`
--

LOCK TABLES `mdl_course_completion_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completions`
--

DROP TABLE IF EXISTS `mdl_course_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completions`
--

LOCK TABLES `mdl_course_completions` WRITE;
/*!40000 ALTER TABLE `mdl_course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_format_options`
--

DROP TABLE IF EXISTS `mdl_course_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_format_options`
--

LOCK TABLES `mdl_course_format_options` WRITE;
/*!40000 ALTER TABLE `mdl_course_format_options` DISABLE KEYS */;
INSERT INTO `mdl_course_format_options` VALUES (1,1,'site',0,'numsections','1');
/*!40000 ALTER TABLE `mdl_course_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules`
--

LOCK TABLES `mdl_course_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_completion`
--

DROP TABLE IF EXISTS `mdl_course_modules_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_completion`
--

LOCK TABLES `mdl_course_modules_completion` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_completion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_published`
--

DROP TABLE IF EXISTS `mdl_course_published`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_published`
--

LOCK TABLES `mdl_course_published` WRITE;
/*!40000 ALTER TABLE `mdl_course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_published` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_request`
--

LOCK TABLES `mdl_course_request` WRITE;
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections`
--

LOCK TABLES `mdl_course_sections` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data`
--

LOCK TABLES `mdl_data` WRITE;
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_content`
--

LOCK TABLES `mdl_data_content` WRITE;
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_fields`
--

LOCK TABLES `mdl_data_fields` WRITE;
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_records`
--

LOCK TABLES `mdl_data_records` WRITE;
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_editor_atto_autosave`
--

DROP TABLE IF EXISTS `mdl_editor_atto_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Draft text that is auto-saved every 5 seconds while an edito';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_editor_atto_autosave`
--

LOCK TABLES `mdl_editor_atto_autosave` WRITE;
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol`
--

DROP TABLE IF EXISTS `mdl_enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol`
--

LOCK TABLES `mdl_enrol` WRITE;
/*!40000 ALTER TABLE `mdl_enrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_flatfile`
--

DROP TABLE IF EXISTS `mdl_enrol_flatfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_flatfile`
--

LOCK TABLES `mdl_enrol_flatfile` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_paypal`
--

LOCK TABLES `mdl_enrol_paypal` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event`
--

LOCK TABLES `mdl_event` WRITE;
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event_subscriptions`
--

DROP TABLE IF EXISTS `mdl_event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event_subscriptions`
--

LOCK TABLES `mdl_event_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_handlers`
--

LOCK TABLES `mdl_events_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue`
--

LOCK TABLES `mdl_events_queue` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue_handlers`
--

LOCK TABLES `mdl_events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_functions`
--

DROP TABLE IF EXISTS `mdl_external_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_functions`
--

LOCK TABLES `mdl_external_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_functions` VALUES (1,'moodle_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(2,'core_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(3,'moodle_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(4,'core_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(5,'moodle_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(6,'core_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(7,'moodle_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(8,'core_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(9,'moodle_group_get_groupmembers','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(10,'core_group_get_group_members','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(11,'moodle_group_add_groupmembers','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(12,'core_group_add_group_members','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(13,'moodle_group_delete_groupmembers','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(14,'core_group_delete_group_members','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(15,'core_group_create_groupings','core_group_external','create_groupings','group/externallib.php','moodle',''),(16,'core_group_update_groupings','core_group_external','update_groupings','group/externallib.php','moodle',''),(17,'core_group_get_groupings','core_group_external','get_groupings','group/externallib.php','moodle',''),(18,'core_group_get_course_groupings','core_group_external','get_course_groupings','group/externallib.php','moodle',''),(19,'core_group_delete_groupings','core_group_external','delete_groupings','group/externallib.php','moodle',''),(20,'core_group_assign_grouping','core_group_external','assign_grouping','group/externallib.php','moodle',''),(21,'core_group_unassign_grouping','core_group_external','unassign_grouping','group/externallib.php','moodle',''),(22,'moodle_file_get_files','core_files_external','get_files','files/externallib.php','moodle',''),(23,'core_files_get_files','core_files_external','get_files','files/externallib.php','moodle',''),(24,'moodle_file_upload','core_files_external','upload','files/externallib.php','moodle',''),(25,'core_files_upload','core_files_external','upload','files/externallib.php','moodle',''),(26,'moodle_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(27,'core_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(28,'moodle_user_get_users_by_id','core_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(29,'core_user_get_users_by_id','core_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(30,'moodle_user_get_users_by_courseid','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(31,'moodle_user_get_course_participants_by_id','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(32,'core_user_get_course_user_profiles','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(33,'moodle_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(34,'core_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(35,'moodle_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(36,'core_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(37,'core_enrol_get_enrolled_users_with_capability','core_enrol_external','get_enrolled_users_with_capability','enrol/externallib.php','moodle',''),(38,'moodle_enrol_get_enrolled_users','moodle_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),(39,'core_enrol_get_enrolled_users','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(40,'moodle_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(41,'core_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(42,'moodle_role_assign','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(43,'core_role_assign_roles','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(44,'moodle_role_unassign','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(45,'core_role_unassign_roles','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(46,'core_course_get_contents','core_course_external','get_course_contents','course/externallib.php','moodle','moodle/course:update,moodle/course:viewhiddencourses'),(47,'moodle_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(48,'core_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(49,'moodle_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(50,'core_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(51,'core_course_delete_courses','core_course_external','delete_courses','course/externallib.php','moodle','moodle/course:delete'),(52,'core_course_duplicate_course','core_course_external','duplicate_course','course/externallib.php','moodle','moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),(53,'core_course_get_categories','core_course_external','get_categories','course/externallib.php','moodle','moodle/category:viewhiddencategories'),(54,'core_course_create_categories','core_course_external','create_categories','course/externallib.php','moodle','moodle/category:manage'),(55,'core_course_update_categories','core_course_external','update_categories','course/externallib.php','moodle','moodle/category:manage'),(56,'core_course_delete_categories','core_course_external','delete_categories','course/externallib.php','moodle','moodle/category:manage'),(57,'core_course_import_course','core_course_external','import_course','course/externallib.php','moodle','moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),(58,'moodle_message_send_instantmessages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage'),(59,'core_message_send_instant_messages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage'),(60,'moodle_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(61,'core_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(62,'moodle_webservice_get_siteinfo','core_webservice_external','get_site_info','webservice/externallib.php','moodle',''),(63,'core_webservice_get_site_info','core_webservice_external','get_site_info','webservice/externallib.php','moodle',''),(64,'core_get_string','core_external','get_string','lib/external/externallib.php','moodle',''),(65,'core_get_strings','core_external','get_strings','lib/external/externallib.php','moodle',''),(66,'core_get_component_strings','core_external','get_component_strings','lib/external/externallib.php','moodle',''),(67,'mod_assign_get_grades','mod_assign_external','get_grades','mod/assign/externallib.php','mod_assign',''),(68,'mod_assign_get_assignments','mod_assign_external','get_assignments','mod/assign/externallib.php','mod_assign',''),(69,'moodle_enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol'),(70,'enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol'),(71,'core_cohort_create_cohorts','core_cohort_external','create_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(72,'core_cohort_delete_cohorts','core_cohort_external','delete_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(73,'core_cohort_get_cohorts','core_cohort_external','get_cohorts','cohort/externallib.php','moodle','moodle/cohort:view'),(74,'core_cohort_update_cohorts','core_cohort_external','update_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(75,'core_cohort_add_cohort_members','core_cohort_external','add_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign'),(76,'core_cohort_delete_cohort_members','core_cohort_external','delete_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign'),(77,'core_cohort_get_cohort_members','core_cohort_external','get_cohort_members','cohort/externallib.php','moodle','moodle/cohort:view'),(78,'core_grades_get_grades','core_grades_external','get_grades',NULL,'moodle','moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden'),(79,'core_grades_update_grades','core_grades_external','update_grades',NULL,'moodle',''),(80,'core_user_get_users','core_user_external','get_users','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(81,'core_user_get_users_by_field','core_user_external','get_users_by_field','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(82,'core_user_add_user_device','core_user_external','add_user_device','user/externallib.php','moodle',''),(83,'core_enrol_get_course_enrolment_methods','core_enrol_external','get_course_enrolment_methods','enrol/externallib.php','moodle',''),(84,'core_course_delete_modules','core_course_external','delete_modules','course/externallib.php','moodle','moodle/course:manageactivities'),(85,'core_course_update_courses','core_course_external','update_courses','course/externallib.php','moodle','moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),(86,'core_message_create_contacts','core_message_external','create_contacts','message/externallib.php','moodle',''),(87,'core_message_delete_contacts','core_message_external','delete_contacts','message/externallib.php','moodle',''),(88,'core_message_block_contacts','core_message_external','block_contacts','message/externallib.php','moodle',''),(89,'core_message_unblock_contacts','core_message_external','unblock_contacts','message/externallib.php','moodle',''),(90,'core_message_get_contacts','core_message_external','get_contacts','message/externallib.php','moodle',''),(91,'core_message_search_contacts','core_message_external','search_contacts','message/externallib.php','moodle',''),(92,'core_message_get_messages','core_message_external','get_messages','message/externallib.php','moodle',''),(93,'core_notes_delete_notes','core_notes_external','delete_notes','notes/externallib.php','moodle','moodle/notes:manage'),(94,'core_notes_get_notes','core_notes_external','get_notes','notes/externallib.php','moodle','moodle/notes:view'),(95,'core_notes_update_notes','core_notes_external','update_notes','notes/externallib.php','moodle','moodle/notes:manage'),(96,'core_grading_get_definitions','core_grading_external','get_definitions',NULL,'moodle',''),(97,'core_grade_get_definitions','core_grade_external','get_definitions','grade/externallib.php','moodle',''),(98,'core_grading_save_definitions','core_grading_external','save_definitions',NULL,'moodle',''),(99,'core_grading_get_gradingform_instances','core_grading_external','get_gradingform_instances',NULL,'moodle',''),(100,'core_calendar_delete_calendar_events','core_calendar_external','delete_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(101,'core_calendar_get_calendar_events','core_calendar_external','get_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(102,'core_calendar_create_calendar_events','core_calendar_external','create_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(103,'mod_assign_get_submissions','mod_assign_external','get_submissions','mod/assign/externallib.php','mod_assign',''),(104,'mod_assign_get_user_flags','mod_assign_external','get_user_flags','mod/assign/externallib.php','mod_assign',''),(105,'mod_assign_set_user_flags','mod_assign_external','set_user_flags','mod/assign/externallib.php','mod_assign','mod/assign:grade'),(106,'mod_assign_get_user_mappings','mod_assign_external','get_user_mappings','mod/assign/externallib.php','mod_assign',''),(107,'mod_assign_revert_submissions_to_draft','mod_assign_external','revert_submissions_to_draft','mod/assign/externallib.php','mod_assign',''),(108,'mod_assign_lock_submissions','mod_assign_external','lock_submissions','mod/assign/externallib.php','mod_assign',''),(109,'mod_assign_unlock_submissions','mod_assign_external','unlock_submissions','mod/assign/externallib.php','mod_assign',''),(110,'mod_assign_save_submission','mod_assign_external','save_submission','mod/assign/externallib.php','mod_assign',''),(111,'mod_assign_submit_for_grading','mod_assign_external','submit_for_grading','mod/assign/externallib.php','mod_assign',''),(112,'mod_assign_save_grade','mod_assign_external','save_grade','mod/assign/externallib.php','mod_assign',''),(113,'mod_assign_save_grades','mod_assign_external','save_grades','mod/assign/externallib.php','mod_assign',''),(114,'mod_assign_save_user_extensions','mod_assign_external','save_user_extensions','mod/assign/externallib.php','mod_assign',''),(115,'mod_assign_reveal_identities','mod_assign_external','reveal_identities','mod/assign/externallib.php','mod_assign',''),(116,'mod_forum_get_forums_by_courses','mod_forum_external','get_forums_by_courses','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion'),(117,'mod_forum_get_forum_discussions','mod_forum_external','get_forum_discussions','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),(118,'mod_forum_get_forum_discussion_posts','mod_forum_external','get_forum_discussion_posts','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),(119,'mod_forum_get_forum_discussions_paginated','mod_forum_external','get_forum_discussions_paginated','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),(120,'enrol_self_get_instance_info','enrol_self_external','get_instance_info','enrol/self/externallib.php','enrol_self',''),(121,'message_airnotifier_is_system_configured','message_airnotifier_external','is_system_configured','message/output/airnotifier/externallib.php','message_airnotifier',''),(122,'message_airnotifier_are_notification_preferences_configured','message_airnotifier_external','are_notification_preferences_configured','message/output/airnotifier/externallib.php','message_airnotifier','');
/*!40000 ALTER TABLE `mdl_external_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services`
--

DROP TABLE IF EXISTS `mdl_external_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services`
--

LOCK TABLES `mdl_external_services` WRITE;
/*!40000 ALTER TABLE `mdl_external_services` DISABLE KEYS */;
INSERT INTO `mdl_external_services` VALUES (1,'Moodle mobile web service',0,NULL,0,'moodle',1359111414,1359111433,'moodle_mobile_app',1,1);
/*!40000 ALTER TABLE `mdl_external_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_functions`
--

DROP TABLE IF EXISTS `mdl_external_services_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_functions`
--

LOCK TABLES `mdl_external_services_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_services_functions` VALUES (1,1,'moodle_enrol_get_users_courses'),(2,1,'moodle_enrol_get_enrolled_users'),(3,1,'moodle_user_get_users_by_id'),(4,1,'moodle_webservice_get_siteinfo'),(5,1,'moodle_notes_create_notes'),(6,1,'moodle_user_get_course_participants_by_id'),(7,1,'moodle_user_get_users_by_courseid'),(8,1,'moodle_message_send_instantmessages'),(9,1,'core_course_get_contents'),(10,1,'core_get_component_strings'),(11,1,'core_user_add_user_device'),(12,1,'core_calendar_get_calendar_events'),(13,1,'core_enrol_get_users_courses'),(14,1,'core_enrol_get_enrolled_users'),(15,1,'core_user_get_users_by_id'),(16,1,'core_webservice_get_site_info'),(17,1,'core_notes_create_notes'),(18,1,'core_user_get_course_user_profiles'),(19,1,'core_enrol_get_enrolled_users'),(20,1,'core_message_send_instant_messages'),(21,1,'mod_assign_get_grades'),(22,1,'mod_assign_get_assignments'),(23,1,'mod_assign_get_submissions'),(24,1,'mod_assign_get_user_flags'),(25,1,'mod_assign_set_user_flags'),(26,1,'mod_assign_get_user_mappings'),(27,1,'mod_assign_revert_submissions_to_draft'),(28,1,'mod_assign_lock_submissions'),(29,1,'mod_assign_unlock_submissions'),(30,1,'mod_assign_save_submission'),(31,1,'mod_assign_submit_for_grading'),(32,1,'mod_assign_save_grade'),(33,1,'mod_assign_save_user_extensions'),(34,1,'mod_assign_reveal_identities'),(35,1,'message_airnotifier_is_system_configured'),(36,1,'message_airnotifier_are_notification_preferences_configured'),(37,1,'core_grades_update_grades'),(38,1,'mod_forum_get_forums_by_courses'),(39,1,'mod_forum_get_forum_discussions_paginated'),(40,1,'mod_forum_get_forum_discussion_posts'),(41,1,'core_files_get_files'),(42,1,'core_message_get_messages'),(43,1,'core_message_create_contacts'),(44,1,'core_message_delete_contacts'),(45,1,'core_message_block_contacts'),(46,1,'core_message_unblock_contacts'),(47,1,'core_message_get_contacts'),(48,1,'core_message_search_contacts');
/*!40000 ALTER TABLE `mdl_external_services_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_users`
--

DROP TABLE IF EXISTS `mdl_external_services_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_users`
--

LOCK TABLES `mdl_external_services_users` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_services_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_tokens`
--

DROP TABLE IF EXISTS `mdl_external_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_tokens`
--

LOCK TABLES `mdl_external_tokens` WRITE;
/*!40000 ALTER TABLE `mdl_external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback`
--

DROP TABLE IF EXISTS `mdl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback`
--

LOCK TABLES `mdl_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completed`
--

DROP TABLE IF EXISTS `mdl_feedback_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completed`
--

LOCK TABLES `mdl_feedback_completed` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completedtmp`
--

DROP TABLE IF EXISTS `mdl_feedback_completedtmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completedtmp`
--

LOCK TABLES `mdl_feedback_completedtmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_item`
--

DROP TABLE IF EXISTS `mdl_feedback_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_item`
--

LOCK TABLES `mdl_feedback_item` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `mdl_feedback_sitecourse_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_sitecourse_map`
--

LOCK TABLES `mdl_feedback_sitecourse_map` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_template`
--

DROP TABLE IF EXISTS `mdl_feedback_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_template`
--

LOCK TABLES `mdl_feedback_template` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_tracking`
--

DROP TABLE IF EXISTS `mdl_feedback_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_tracking`
--

LOCK TABLES `mdl_feedback_tracking` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_value`
--

DROP TABLE IF EXISTS `mdl_feedback_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_value`
--

LOCK TABLES `mdl_feedback_value` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_valuetmp`
--

DROP TABLE IF EXISTS `mdl_feedback_valuetmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_valuetmp`
--

LOCK TABLES `mdl_feedback_valuetmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files`
--

DROP TABLE IF EXISTS `mdl_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files`
--

LOCK TABLES `mdl_files` WRITE;
/*!40000 ALTER TABLE `mdl_files` DISABLE KEYS */;
INSERT INTO `mdl_files` VALUES (1,'41cfeee5884a43a4650a851f4f85e7b28316fcc9','a48e186a2cc853a9e94e9305f4e9bc086391212d',1,'theme_more','backgroundimage',0,'/','background.jpg',2,4451,'image/jpeg',0,NULL,NULL,NULL,1417538700,1417538700,0,NULL),(2,'da39a3ee5e6b4b0d3255bfef95601890afd80709','d1da7ab1bb9c08a926037367bf8ce9a838034ead',1,'theme_more','backgroundimage',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1417538700,1417538700,0,NULL),(3,'fb262df98d67c4e2a5c9802403821e00cf2992af','508e674d49c30d4fde325fe6c7f6fd3d56b247e1',1,'assignfeedback_editpdf','stamps',0,'/','smile.png',2,1600,'image/png',0,NULL,NULL,NULL,1417538700,1417538700,0,NULL),(4,'da39a3ee5e6b4b0d3255bfef95601890afd80709','70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5',1,'assignfeedback_editpdf','stamps',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1417538700,1417538700,0,NULL),(5,'a4f146f120e7e00d21291b924e26aaabe9f4297a','68317eab56c67d32aeaee5acf509a0c4aa828b6b',1,'assignfeedback_editpdf','stamps',0,'/','sad.png',2,1702,'image/png',0,NULL,NULL,NULL,1417538700,1417538700,0,NULL),(6,'33957e31ba9c763a74638b825f0a9154acf475e1','695a55ff780e61c9e59428aa425430b0d6bde53b',1,'assignfeedback_editpdf','stamps',0,'/','tick.png',2,1187,'image/png',0,NULL,NULL,NULL,1417538700,1417538700,0,NULL),(7,'d613d55f37bb76d38d4ffb4b7b83e6c694778c30','373e63af262a9b8466ba8632551520be793c37ff',1,'assignfeedback_editpdf','stamps',0,'/','cross.png',2,1230,'image/png',0,NULL,NULL,NULL,1417538700,1417538700,0,NULL);
/*!40000 ALTER TABLE `mdl_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files_reference`
--

DROP TABLE IF EXISTS `mdl_files_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files_reference`
--

LOCK TABLES `mdl_files_reference` WRITE;
/*!40000 ALTER TABLE `mdl_files_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_active`
--

DROP TABLE IF EXISTS `mdl_filter_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_active`
--

LOCK TABLES `mdl_filter_active` WRITE;
/*!40000 ALTER TABLE `mdl_filter_active` DISABLE KEYS */;
INSERT INTO `mdl_filter_active` VALUES (1,'activitynames',1,1,1),(2,'mediaplugin',1,1,3),(3,'mathjaxloader',1,1,2);
/*!40000 ALTER TABLE `mdl_filter_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_config`
--

DROP TABLE IF EXISTS `mdl_filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_config`
--

LOCK TABLES `mdl_filter_config` WRITE;
/*!40000 ALTER TABLE `mdl_filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_folder`
--

DROP TABLE IF EXISTS `mdl_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_folder`
--

LOCK TABLES `mdl_folder` WRITE;
/*!40000 ALTER TABLE `mdl_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum`
--

LOCK TABLES `mdl_forum` WRITE;
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_digests`
--

DROP TABLE IF EXISTS `mdl_forum_digests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_digests`
--

LOCK TABLES `mdl_forum_digests` WRITE;
/*!40000 ALTER TABLE `mdl_forum_digests` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_digests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussion_subs`
--

DROP TABLE IF EXISTS `mdl_forum_discussion_subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussion_subs`
--

LOCK TABLES `mdl_forum_discussion_subs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`),
  KEY `mdl_forudisc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussions`
--

LOCK TABLES `mdl_forum_discussions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_posts`
--

LOCK TABLES `mdl_forum_posts` WRITE;
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_queue`
--

LOCK TABLES `mdl_forum_queue` WRITE;
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_read`
--

LOCK TABLES `mdl_forum_read` WRITE;
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_subscriptions`
--

LOCK TABLES `mdl_forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_track_prefs`
--

LOCK TABLES `mdl_forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary`
--

LOCK TABLES `mdl_glossary` WRITE;
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_alias`
--

LOCK TABLES `mdl_glossary_alias` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_categories`
--

LOCK TABLES `mdl_glossary_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries`
--

LOCK TABLES `mdl_glossary_entries` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries_categories`
--

LOCK TABLES `mdl_glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_formats`
--

LOCK TABLES `mdl_glossary_formats` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `-- DROPlow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories`
--

LOCK TABLES `mdl_grade_categories` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `-- DROPlow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories_history`
--

LOCK TABLES `mdl_grade_categories_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades`
--

LOCK TABLES `mdl_grade_grades` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades_history`
--

LOCK TABLES `mdl_grade_grades_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_newitem`
--

LOCK TABLES `mdl_grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_values`
--

LOCK TABLES `mdl_grade_import_values` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items`
--

LOCK TABLES `mdl_grade_items` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items_history`
--

LOCK TABLES `mdl_grade_items_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_letters`
--

LOCK TABLES `mdl_grade_letters` WRITE;
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes`
--

LOCK TABLES `mdl_grade_outcomes` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_courses`
--

LOCK TABLES `mdl_grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_history`
--

LOCK TABLES `mdl_grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_settings`
--

LOCK TABLES `mdl_grade_settings` WRITE;
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_areas`
--

DROP TABLE IF EXISTS `mdl_grading_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_areas`
--

LOCK TABLES `mdl_grading_areas` WRITE;
/*!40000 ALTER TABLE `mdl_grading_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_definitions`
--

DROP TABLE IF EXISTS `mdl_grading_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_definitions`
--

LOCK TABLES `mdl_grading_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_grading_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_instances`
--

DROP TABLE IF EXISTS `mdl_grading_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_instances`
--

LOCK TABLES `mdl_grading_instances` WRITE;
/*!40000 ALTER TABLE `mdl_grading_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_comments`
--

LOCK TABLES `mdl_gradingform_guide_comments` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_criteria`
--

LOCK TABLES `mdl_gradingform_guide_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_fillings`
--

LOCK TABLES `mdl_gradingform_guide_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_criteria`
--

LOCK TABLES `mdl_gradingform_rubric_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_fillings`
--

LOCK TABLES `mdl_gradingform_rubric_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_levels`
--

LOCK TABLES `mdl_gradingform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings`
--

LOCK TABLES `mdl_groupings` WRITE;
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings_groups`
--

LOCK TABLES `mdl_groupings_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups`
--

LOCK TABLES `mdl_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups_members`
--

LOCK TABLES `mdl_groups_members` WRITE;
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_imscp`
--

DROP TABLE IF EXISTS `mdl_imscp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_imscp`
--

LOCK TABLES `mdl_imscp` WRITE;
/*!40000 ALTER TABLE `mdl_imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_imscp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_label`
--

LOCK TABLES `mdl_label` WRITE;
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson`
--

LOCK TABLES `mdl_lesson` WRITE;
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_answers`
--

LOCK TABLES `mdl_lesson_answers` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_attempts`
--

LOCK TABLES `mdl_lesson_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_branch`
--

LOCK TABLES `mdl_lesson_branch` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_grades`
--

LOCK TABLES `mdl_lesson_grades` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_high_scores`
--

DROP TABLE IF EXISTS `mdl_lesson_high_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='high scores for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_high_scores`
--

LOCK TABLES `mdl_lesson_high_scores` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_pages`
--

LOCK TABLES `mdl_lesson_pages` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_timer`
--

LOCK TABLES `mdl_lesson_timer` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_license`
--

DROP TABLE IF EXISTS `mdl_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_license`
--

LOCK TABLES `mdl_license` WRITE;
/*!40000 ALTER TABLE `mdl_license` DISABLE KEYS */;
INSERT INTO `mdl_license` VALUES (1,'unknown','Unknown license','',1,2010033100),(2,'allrightsreserved','All rights reserved','http://en.wikipedia.org/wiki/All_rights_reserved',1,2010033100),(3,'public','Public Domain','http://creativecommons.org/licenses/publicdomain/',1,2010033100),(4,'cc','Creative Commons','http://creativecommons.org/licenses/by/3.0/',1,2010033100),(5,'cc-nd','Creative Commons - NoDerivs','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(6,'cc-nc-nd','Creative Commons - No Commercial NoDerivs','http://creativecommons.org/licenses/by-nc-nd/3.0/',1,2010033100),(7,'cc-nc','Creative Commons - No Commercial','http://creativecommons.org/licenses/by-nc/3.0/',1,2013051500),(8,'cc-nc-sa','Creative Commons - No Commercial ShareAlike','http://creativecommons.org/licenses/by-nc-sa/3.0/',1,2010033100),(9,'cc-sa','Creative Commons - ShareAlike','http://creativecommons.org/licenses/by-sa/3.0/',1,2010033100);
/*!40000 ALTER TABLE `mdl_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lock_db`
--

DROP TABLE IF EXISTS `mdl_lock_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lock_db` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lock_db`
--

LOCK TABLES `mdl_lock_db` WRITE;
/*!40000 ALTER TABLE `mdl_lock_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lock_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log`
--

LOCK TABLES `mdl_log` WRITE;
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_display`
--

LOCK TABLES `mdl_log_display` WRITE;
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` VALUES (1,'course','user report','user','CONCAT(firstname, \' \', lastname)','moodle'),(2,'course','view','course','fullname','moodle'),(3,'course','view section','course_sections','name','moodle'),(4,'course','update','course','fullname','moodle'),(5,'course','enrol','course','fullname','moodle'),(6,'course','unenrol','course','fullname','moodle'),(7,'course','report log','course','fullname','moodle'),(8,'course','report live','course','fullname','moodle'),(9,'course','report outline','course','fullname','moodle'),(10,'course','report participation','course','fullname','moodle'),(11,'course','report stats','course','fullname','moodle'),(12,'message','write','user','CONCAT(firstname, \' \', lastname)','moodle'),(13,'message','read','user','CONCAT(firstname, \' \', lastname)','moodle'),(14,'message','add contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(15,'message','remove contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(16,'message','block contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(17,'message','unblock contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(18,'group','view','groups','name','moodle'),(19,'tag','update','tag','name','moodle'),(20,'tag','flag','tag','name','moodle'),(21,'user','view','user','CONCAT(firstname, \' \', lastname)','moodle'),(22,'assign','add','assign','name','mod_assign'),(23,'assign','delete mod','assign','name','mod_assign'),(24,'assign','download all submissions','assign','name','mod_assign'),(25,'assign','grade submission','assign','name','mod_assign'),(26,'assign','lock submission','assign','name','mod_assign'),(27,'assign','reveal identities','assign','name','mod_assign'),(28,'assign','revert submission to draft','assign','name','mod_assign'),(29,'assign','submission statement accepted','assign','name','mod_assign'),(30,'assign','submit','assign','name','mod_assign'),(31,'assign','submit for grading','assign','name','mod_assign'),(32,'assign','unlock submission','assign','name','mod_assign'),(33,'assign','update','assign','name','mod_assign'),(34,'assign','upload','assign','name','mod_assign'),(35,'assign','view','assign','name','mod_assign'),(36,'assign','view all','course','fullname','mod_assign'),(37,'assign','view confirm submit assignment form','assign','name','mod_assign'),(38,'assign','view grading form','assign','name','mod_assign'),(39,'assign','view submission','assign','name','mod_assign'),(40,'assign','view submission grading table','assign','name','mod_assign'),(41,'assign','view submit assignment form','assign','name','mod_assign'),(42,'assign','view feedback','assign','name','mod_assign'),(43,'assignment','view','assignment','name','mod_assignment'),(44,'assignment','add','assignment','name','mod_assignment'),(45,'assignment','update','assignment','name','mod_assignment'),(46,'assignment','view submission','assignment','name','mod_assignment'),(47,'assignment','upload','assignment','name','mod_assignment'),(48,'book','add','book','name','mod_book'),(49,'book','update','book','name','mod_book'),(50,'book','view','book','name','mod_book'),(51,'book','add chapter','book_chapters','title','mod_book'),(52,'book','update chapter','book_chapters','title','mod_book'),(53,'book','view chapter','book_chapters','title','mod_book'),(54,'chat','view','chat','name','mod_chat'),(55,'chat','add','chat','name','mod_chat'),(56,'chat','update','chat','name','mod_chat'),(57,'chat','report','chat','name','mod_chat'),(58,'chat','talk','chat','name','mod_chat'),(59,'choice','view','choice','name','mod_choice'),(60,'choice','update','choice','name','mod_choice'),(61,'choice','add','choice','name','mod_choice'),(62,'choice','report','choice','name','mod_choice'),(63,'choice','choose','choice','name','mod_choice'),(64,'choice','choose again','choice','name','mod_choice'),(65,'data','view','data','name','mod_data'),(66,'data','add','data','name','mod_data'),(67,'data','update','data','name','mod_data'),(68,'data','record delete','data','name','mod_data'),(69,'data','fields add','data_fields','name','mod_data'),(70,'data','fields update','data_fields','name','mod_data'),(71,'data','templates saved','data','name','mod_data'),(72,'data','templates def','data','name','mod_data'),(73,'feedback','startcomplete','feedback','name','mod_feedback'),(74,'feedback','submit','feedback','name','mod_feedback'),(75,'feedback','delete','feedback','name','mod_feedback'),(76,'feedback','view','feedback','name','mod_feedback'),(77,'feedback','view all','course','shortname','mod_feedback'),(78,'folder','view','folder','name','mod_folder'),(79,'folder','view all','folder','name','mod_folder'),(80,'folder','update','folder','name','mod_folder'),(81,'folder','add','folder','name','mod_folder'),(82,'forum','add','forum','name','mod_forum'),(83,'forum','update','forum','name','mod_forum'),(84,'forum','add discussion','forum_discussions','name','mod_forum'),(85,'forum','add post','forum_posts','subject','mod_forum'),(86,'forum','update post','forum_posts','subject','mod_forum'),(87,'forum','user report','user','CONCAT(firstname, \' \', lastname)','mod_forum'),(88,'forum','move discussion','forum_discussions','name','mod_forum'),(89,'forum','view subscribers','forum','name','mod_forum'),(90,'forum','view discussion','forum_discussions','name','mod_forum'),(91,'forum','view forum','forum','name','mod_forum'),(92,'forum','subscribe','forum','name','mod_forum'),(93,'forum','unsubscribe','forum','name','mod_forum'),(94,'glossary','add','glossary','name','mod_glossary'),(95,'glossary','update','glossary','name','mod_glossary'),(96,'glossary','view','glossary','name','mod_glossary'),(97,'glossary','view all','glossary','name','mod_glossary'),(98,'glossary','add entry','glossary','name','mod_glossary'),(99,'glossary','update entry','glossary','name','mod_glossary'),(100,'glossary','add category','glossary','name','mod_glossary'),(101,'glossary','update category','glossary','name','mod_glossary'),(102,'glossary','delete category','glossary','name','mod_glossary'),(103,'glossary','approve entry','glossary','name','mod_glossary'),(104,'glossary','view entry','glossary_entries','concept','mod_glossary'),(105,'imscp','view','imscp','name','mod_imscp'),(106,'imscp','view all','imscp','name','mod_imscp'),(107,'imscp','update','imscp','name','mod_imscp'),(108,'imscp','add','imscp','name','mod_imscp'),(109,'label','add','label','name','mod_label'),(110,'label','update','label','name','mod_label'),(111,'lesson','start','lesson','name','mod_lesson'),(112,'lesson','end','lesson','name','mod_lesson'),(113,'lesson','view','lesson_pages','title','mod_lesson'),(114,'lti','view','lti','name','mod_lti'),(115,'lti','launch','lti','name','mod_lti'),(116,'lti','view all','lti','name','mod_lti'),(117,'page','view','page','name','mod_page'),(118,'page','view all','page','name','mod_page'),(119,'page','update','page','name','mod_page'),(120,'page','add','page','name','mod_page'),(121,'quiz','add','quiz','name','mod_quiz'),(122,'quiz','update','quiz','name','mod_quiz'),(123,'quiz','view','quiz','name','mod_quiz'),(124,'quiz','report','quiz','name','mod_quiz'),(125,'quiz','attempt','quiz','name','mod_quiz'),(126,'quiz','submit','quiz','name','mod_quiz'),(127,'quiz','review','quiz','name','mod_quiz'),(128,'quiz','editquestions','quiz','name','mod_quiz'),(129,'quiz','preview','quiz','name','mod_quiz'),(130,'quiz','start attempt','quiz','name','mod_quiz'),(131,'quiz','close attempt','quiz','name','mod_quiz'),(132,'quiz','continue attempt','quiz','name','mod_quiz'),(133,'quiz','edit override','quiz','name','mod_quiz'),(134,'quiz','delete override','quiz','name','mod_quiz'),(135,'resource','view','resource','name','mod_resource'),(136,'resource','view all','resource','name','mod_resource'),(137,'resource','update','resource','name','mod_resource'),(138,'resource','add','resource','name','mod_resource'),(139,'scorm','view','scorm','name','mod_scorm'),(140,'scorm','review','scorm','name','mod_scorm'),(141,'scorm','update','scorm','name','mod_scorm'),(142,'scorm','add','scorm','name','mod_scorm'),(143,'survey','add','survey','name','mod_survey'),(144,'survey','update','survey','name','mod_survey'),(145,'survey','download','survey','name','mod_survey'),(146,'survey','view form','survey','name','mod_survey'),(147,'survey','view graph','survey','name','mod_survey'),(148,'survey','view report','survey','name','mod_survey'),(149,'survey','submit','survey','name','mod_survey'),(150,'url','view','url','name','mod_url'),(151,'url','view all','url','name','mod_url'),(152,'url','update','url','name','mod_url'),(153,'url','add','url','name','mod_url'),(154,'workshop','add','workshop','name','mod_workshop'),(155,'workshop','update','workshop','name','mod_workshop'),(156,'workshop','view','workshop','name','mod_workshop'),(157,'workshop','view all','workshop','name','mod_workshop'),(158,'workshop','add submission','workshop_submissions','title','mod_workshop'),(159,'workshop','update submission','workshop_submissions','title','mod_workshop'),(160,'workshop','view submission','workshop_submissions','title','mod_workshop'),(161,'workshop','add assessment','workshop_submissions','title','mod_workshop'),(162,'workshop','update assessment','workshop_submissions','title','mod_workshop'),(163,'workshop','add example','workshop_submissions','title','mod_workshop'),(164,'workshop','update example','workshop_submissions','title','mod_workshop'),(165,'workshop','view example','workshop_submissions','title','mod_workshop'),(166,'workshop','add reference assessment','workshop_submissions','title','mod_workshop'),(167,'workshop','update reference assessment','workshop_submissions','title','mod_workshop'),(168,'workshop','add example assessment','workshop_submissions','title','mod_workshop'),(169,'workshop','update example assessment','workshop_submissions','title','mod_workshop'),(170,'workshop','update aggregate grades','workshop','name','mod_workshop'),(171,'workshop','update clear aggregated grades','workshop','name','mod_workshop'),(172,'workshop','update clear assessments','workshop','name','mod_workshop'),(173,'book','exportimscp','book','name','booktool_exportimscp'),(174,'book','print','book','name','booktool_print'),(175,'book','print chapter','book_chapters','title','booktool_print'),(176,'course','hide','course','fullname','moodle'),(177,'course','show','course','fullname','moodle'),(178,'course','move','course','fullname','moodle'),(179,'category','add','course_categories','name','moodle'),(180,'category','hide','course_categories','name','moodle'),(181,'category','move','course_categories','name','moodle'),(182,'category','show','course_categories','name','moodle'),(183,'category','update','course_categories','name','moodle'),(184,'assign','set marking workflow state','assign','name','mod_assign'),(185,'assign','view batch set marking workflow state','assign','name','mod_assign'),(186,'glossary','disapprove entry','glossary','name','mod_glossary'),(187,'quiz','view summary','quiz','name','mod_quiz');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_queries`
--

DROP TABLE IF EXISTS `mdl_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_queries`
--

LOCK TABLES `mdl_log_queries` WRITE;
/*!40000 ALTER TABLE `mdl_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_logstore_standard_log`
--

DROP TABLE IF EXISTS `mdl_logstore_standard_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `objecttable` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Standard log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_logstore_standard_log`
--

LOCK TABLES `mdl_logstore_standard_log` WRITE;
/*!40000 ALTER TABLE `mdl_logstore_standard_log` DISABLE KEYS */;
INSERT INTO `mdl_logstore_standard_log` VALUES (1,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,2,0,NULL,0,'a:2:{s:8:\"username\";s:9:\"adminuser\";s:6:\"reason\";i:3;}',1417538815,'web','129.69.210.158',NULL),(2,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,5,30,2,0,0,2,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1417538832,'web','129.69.210.158',NULL),(3,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,5,30,2,0,0,2,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1417538832,'web','129.69.210.158',NULL),(4,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:9:\"adminUser\";}',1417538832,'web','129.69.210.158',NULL);
/*!40000 ALTER TABLE `mdl_logstore_standard_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti`
--

DROP TABLE IF EXISTS `mdl_lti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti`
--

LOCK TABLES `mdl_lti` WRITE;
/*!40000 ALTER TABLE `mdl_lti` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_submission`
--

DROP TABLE IF EXISTS `mdl_lti_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_submission`
--

LOCK TABLES `mdl_lti_submission` WRITE;
/*!40000 ALTER TABLE `mdl_lti_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_proxies`
--

DROP TABLE IF EXISTS `mdl_lti_tool_proxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendorcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capabilityoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `serviceoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `toolproxy` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_proxies`
--

LOCK TABLES `mdl_lti_tool_proxies` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_settings`
--

DROP TABLE IF EXISTS `mdl_lti_tool_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_settings`
--

LOCK TABLES `mdl_lti_tool_settings` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types`
--

DROP TABLE IF EXISTS `mdl_lti_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext COLLATE utf8_unicode_ci,
  `parameter` longtext COLLATE utf8_unicode_ci,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types`
--

LOCK TABLES `mdl_lti_types` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types_config`
--

DROP TABLE IF EXISTS `mdl_lti_types_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types_config`
--

LOCK TABLES `mdl_lti_types_config` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message`
--

LOCK TABLES `mdl_message` WRITE;
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

DROP TABLE IF EXISTS `mdl_message_airnotifier_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store information about the devices registered in Airnotifie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_airnotifier_devices`
--

LOCK TABLES `mdl_message_airnotifier_devices` WRITE;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_contacts`
--

LOCK TABLES `mdl_message_contacts` WRITE;
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_processors`
--

DROP TABLE IF EXISTS `mdl_message_processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_processors`
--

LOCK TABLES `mdl_message_processors` WRITE;
/*!40000 ALTER TABLE `mdl_message_processors` DISABLE KEYS */;
INSERT INTO `mdl_message_processors` VALUES (1,'email',1),(2,'jabber',1),(3,'popup',1),(4,'airnotifier',0);
/*!40000 ALTER TABLE `mdl_message_processors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_providers`
--

DROP TABLE IF EXISTS `mdl_message_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_providers`
--

LOCK TABLES `mdl_message_providers` WRITE;
/*!40000 ALTER TABLE `mdl_message_providers` DISABLE KEYS */;
INSERT INTO `mdl_message_providers` VALUES (1,'notices','moodle','moodle/site:config'),(2,'errors','moodle','moodle/site:config'),(3,'availableupdate','moodle','moodle/site:config'),(4,'instantmessage','moodle',NULL),(5,'backup','moodle','moodle/site:config'),(6,'courserequested','moodle','moodle/site:approvecourse'),(7,'courserequestapproved','moodle','moodle/course:request'),(8,'courserequestrejected','moodle','moodle/course:request'),(9,'assign_notification','mod_assign',NULL),(10,'assignment_updates','mod_assignment',NULL),(11,'submission','mod_feedback',NULL),(12,'message','mod_feedback',NULL),(13,'posts','mod_forum',NULL),(14,'graded_essay','mod_lesson',NULL),(15,'submission','mod_quiz','mod/quiz:emailnotifysubmission'),(16,'confirmation','mod_quiz','mod/quiz:emailconfirmsubmission'),(17,'attempt_overdue','mod_quiz','mod/quiz:emailwarnoverdue'),(19,'flatfile_enrolment','enrol_flatfile',NULL),(20,'imsenterprise_enrolment','enrol_imsenterprise',NULL),(21,'expiry_notification','enrol_manual',NULL),(22,'paypal_enrolment','enrol_paypal',NULL),(23,'expiry_notification','enrol_self',NULL),(24,'badgerecipientnotice','moodle','moodle/badges:earnbadge'),(25,'badgecreatornotice','moodle',NULL),(26,'invalidrecipienthandler','tool_messageinbound',NULL),(27,'messageprocessingerror','tool_messageinbound',NULL),(28,'messageprocessingsuccess','tool_messageinbound',NULL),(29,'notification','tool_monitor','tool/monitor:subscribe');
/*!40000 ALTER TABLE `mdl_message_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_read`
--

LOCK TABLES `mdl_message_read` WRITE;
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_working`
--

DROP TABLE IF EXISTS `mdl_message_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_working`
--

LOCK TABLES `mdl_message_working` WRITE;
/*!40000 ALTER TABLE `mdl_message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

DROP TABLE IF EXISTS `mdl_messageinbound_datakeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_datakeys`
--

LOCK TABLES `mdl_messageinbound_datakeys` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_handlers`
--

DROP TABLE IF EXISTS `mdl_messageinbound_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_handlers`
--

LOCK TABLES `mdl_messageinbound_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` DISABLE KEYS */;
INSERT INTO `mdl_messageinbound_handlers` VALUES (1,'core','\\core\\message\\inbound\\private_files_handler',604800,1,0),(2,'mod_forum','\\mod_forum\\message\\inbound\\reply_handler',604800,1,0),(3,'tool_messageinbound','\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler',604800,0,1);
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

DROP TABLE IF EXISTS `mdl_messageinbound_messagelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_messagelist`
--

LOCK TABLES `mdl_messageinbound_messagelist` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_application`
--

LOCK TABLES `mdl_mnet_application` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` VALUES (1,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php','/auth/mnet/jump.php'),(2,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php','/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host`
--

LOCK TABLES `mdl_mnet_host` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` VALUES (1,0,'http://9.152.136.232:80/moodle','UNKNOWN','','',0,0,0,0,0,0,NULL,1),(2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,1);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host2service`
--

LOCK TABLES `mdl_mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_log`
--

LOCK TABLES `mdl_mnet_log` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

LOCK TABLES `mdl_mnet_remote_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1),(15,'send_content_intent','portfolio/mahara/lib.php/send_content_intent','portfolio','mahara',1),(16,'send_content_ready','portfolio/mahara/lib.php/send_content_ready','portfolio','mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

LOCK TABLES `mdl_mnet_remote_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15),(16,4,16);
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_rpc`
--

LOCK TABLES `mdl_mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1,'Return user data for the provided token, compare with user_agent string.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}','auth.php','auth_plugin_mnet',0),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1,'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1,'The IdP uses this function to kill child sessions on other hosts','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}','auth.php','auth_plugin_mnet',0),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1,'Receives an array of log entries from an SP and adds them to the mnet_log\ntable','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1,'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:84:\"false if user not found, empty array if no picture exists, array with data otherwise\";}}','auth.php','auth_plugin_mnet',0),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1,'Returns the theme information and logo url as strings.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}','auth.php','auth_plugin_mnet',0),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1,'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1,'Poll the IdP server to let it know that a user it has authenticated is still\nonline','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1,'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}','auth.php','auth_plugin_mnet',0),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1,'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1,'This method has never been implemented in Moodle MNet API','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1,'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:14:\"user details {\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1,'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1,'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(15,'fetch_file','portfolio/mahara/lib.php/fetch_file','portfolio','mahara',1,'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','lib.php','portfolio_plugin_mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service`
--

LOCK TABLES `mdl_mnet_service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1),(4,'pf','','1',1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

LOCK TABLES `mdl_mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_session`
--

LOCK TABLES `mdl_mnet_session` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_sso_access_control`
--

LOCK TABLES `mdl_mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_courses`
--

LOCK TABLES `mdl_mnetservice_enrol_courses` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_enrolments`
--

LOCK TABLES `mdl_mnetservice_enrol_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_modules`
--

LOCK TABLES `mdl_modules` WRITE;
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` VALUES (1,'assign',60,0,'',1),(2,'assignment',60,0,'',0),(3,'book',0,0,'',1),(4,'chat',300,0,'',1),(5,'choice',0,0,'',1),(6,'data',0,0,'',1),(7,'feedback',0,0,'',0),(8,'folder',0,0,'',1),(9,'forum',0,0,'',1),(10,'glossary',0,0,'',1),(11,'imscp',0,0,'',1),(12,'label',0,0,'',1),(13,'lesson',0,0,'',1),(14,'lti',0,0,'',1),(15,'page',0,0,'',1),(16,'quiz',60,0,'',1),(17,'resource',0,0,'',1),(18,'scorm',300,0,'',1),(19,'survey',0,0,'',1),(20,'url',0,0,'',1),(21,'wiki',0,0,'',1),(22,'workshop',60,0,'',1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_my_pages`
--

DROP TABLE IF EXISTS `mdl_my_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_my_pages`
--

LOCK TABLES `mdl_my_pages` WRITE;
/*!40000 ALTER TABLE `mdl_my_pages` DISABLE KEYS */;
INSERT INTO `mdl_my_pages` VALUES (1,NULL,'__default',0,0),(2,NULL,'__default',1,0);
/*!40000 ALTER TABLE `mdl_my_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_page`
--

DROP TABLE IF EXISTS `mdl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_page`
--

LOCK TABLES `mdl_page` WRITE;
/*!40000 ALTER TABLE `mdl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance`
--

LOCK TABLES `mdl_portfolio_instance` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_config`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_config`
--

LOCK TABLES `mdl_portfolio_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_user`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_user`
--

LOCK TABLES `mdl_portfolio_instance_user` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_log`
--

DROP TABLE IF EXISTS `mdl_portfolio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_log`
--

LOCK TABLES `mdl_portfolio_log` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `mdl_portfolio_mahara_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_mahara_queue`
--

LOCK TABLES `mdl_portfolio_mahara_queue` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_tempdata`
--

DROP TABLE IF EXISTS `mdl_portfolio_tempdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_tempdata`
--

LOCK TABLES `mdl_portfolio_tempdata` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_post`
--

LOCK TABLES `mdl_post` WRITE;
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_profiling`
--

DROP TABLE IF EXISTS `mdl_profiling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_profiling`
--

LOCK TABLES `mdl_profiling` WRITE;
/*!40000 ALTER TABLE `mdl_profiling` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_profiling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_essay_options`
--

DROP TABLE IF EXISTS `mdl_qtype_essay_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_essay_options`
--

LOCK TABLES `mdl_qtype_essay_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_options`
--

DROP TABLE IF EXISTS `mdl_qtype_match_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines fixed matching questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_options`
--

LOCK TABLES `mdl_qtype_match_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

DROP TABLE IF EXISTS `mdl_qtype_match_subquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the subquestions that make up a matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_subquestions`
--

LOCK TABLES `mdl_qtype_match_subquestions` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

DROP TABLE IF EXISTS `mdl_qtype_multichoice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_multichoice_options`
--

LOCK TABLES `mdl_qtype_multichoice_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

DROP TABLE IF EXISTS `mdl_qtype_randomsamatch_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_randomsamatch_options`
--

LOCK TABLES `mdl_qtype_randomsamatch_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

DROP TABLE IF EXISTS `mdl_qtype_shortanswer_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesshor_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_shortanswer_options`
--

LOCK TABLES `mdl_qtype_shortanswer_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question`
--

LOCK TABLES `mdl_question` WRITE;
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_answers`
--

LOCK TABLES `mdl_question_answers` WRITE;
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_step_data`
--

DROP TABLE IF EXISTS `mdl_question_attempt_step_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

LOCK TABLES `mdl_question_attempt_step_data` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_steps`
--

DROP TABLE IF EXISTS `mdl_question_attempt_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

LOCK TABLES `mdl_question_attempt_steps` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempts`
--

LOCK TABLES `mdl_question_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated`
--

LOCK TABLES `mdl_question_calculated` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated_options`
--

DROP TABLE IF EXISTS `mdl_question_calculated_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated_options`
--

LOCK TABLES `mdl_question_calculated_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_categories`
--

LOCK TABLES `mdl_question_categories` WRITE;
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_definitions`
--

LOCK TABLES `mdl_question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_items`
--

LOCK TABLES `mdl_question_dataset_items` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_datasets`
--

LOCK TABLES `mdl_question_datasets` WRITE;
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_hints`
--

DROP TABLE IF EXISTS `mdl_question_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_hints`
--

LOCK TABLES `mdl_question_hints` WRITE;
/*!40000 ALTER TABLE `mdl_question_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multianswer`
--

LOCK TABLES `mdl_question_multianswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical`
--

LOCK TABLES `mdl_question_numerical` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_options`
--

DROP TABLE IF EXISTS `mdl_question_numerical_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_options`
--

LOCK TABLES `mdl_question_numerical_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_units`
--

LOCK TABLES `mdl_question_numerical_units` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_analysis`
--

DROP TABLE IF EXISTS `mdl_question_response_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichtries` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_analysis`
--

LOCK TABLES `mdl_question_response_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_count`
--

DROP TABLE IF EXISTS `mdl_question_response_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_count` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_count`
--

LOCK TABLES `mdl_question_response_count` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_statistics`
--

DROP TABLE IF EXISTS `mdl_question_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_statistics`
--

LOCK TABLES `mdl_question_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_truefalse`
--

LOCK TABLES `mdl_question_truefalse` WRITE;
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_usages`
--

DROP TABLE IF EXISTS `mdl_question_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_usages`
--

LOCK TABLES `mdl_question_usages` WRITE;
/*!40000 ALTER TABLE `mdl_question_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz`
--

LOCK TABLES `mdl_quiz` WRITE;
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_attempts`
--

LOCK TABLES `mdl_quiz_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_feedback`
--

LOCK TABLES `mdl_quiz_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_grades`
--

LOCK TABLES `mdl_quiz_grades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overrides`
--

DROP TABLE IF EXISTS `mdl_quiz_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overrides`
--

LOCK TABLES `mdl_quiz_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

DROP TABLE IF EXISTS `mdl_quiz_overview_regrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overview_regrades`
--

LOCK TABLES `mdl_quiz_overview_regrades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_reports`
--

DROP TABLE IF EXISTS `mdl_quiz_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_reports`
--

LOCK TABLES `mdl_quiz_reports` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_reports` DISABLE KEYS */;
INSERT INTO `mdl_quiz_reports` VALUES (1,'overview',10000,NULL),(2,'responses',9000,NULL),(3,'grading',6000,'mod/quiz:grade'),(4,'statistics',8000,'quiz/statistics:view');
/*!40000 ALTER TABLE `mdl_quiz_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_slots`
--

DROP TABLE IF EXISTS `mdl_quiz_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizquesinst_qui_ix` (`quizid`),
  KEY `mdl_quizquesinst_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the maximum possible grade (weight) for each question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_slots`
--

LOCK TABLES `mdl_quiz_slots` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_statistics`
--

LOCK TABLES `mdl_quiz_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_rating`
--

DROP TABLE IF EXISTS `mdl_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_rating`
--

LOCK TABLES `mdl_rating` WRITE;
/*!40000 ALTER TABLE `mdl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_registration_hubs`
--

DROP TABLE IF EXISTS `mdl_registration_hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_registration_hubs`
--

LOCK TABLES `mdl_registration_hubs` WRITE;
/*!40000 ALTER TABLE `mdl_registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_registration_hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository`
--

DROP TABLE IF EXISTS `mdl_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository`
--

LOCK TABLES `mdl_repository` WRITE;
/*!40000 ALTER TABLE `mdl_repository` DISABLE KEYS */;
INSERT INTO `mdl_repository` VALUES (1,'local',1,1),(2,'recent',1,2),(3,'upload',1,3),(4,'url',1,4),(5,'user',1,5),(6,'wikimedia',1,6),(7,'youtube',1,7),(8,'areafiles',1,8);
/*!40000 ALTER TABLE `mdl_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instance_config`
--

DROP TABLE IF EXISTS `mdl_repository_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instance_config`
--

LOCK TABLES `mdl_repository_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_repository_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instances`
--

DROP TABLE IF EXISTS `mdl_repository_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instances`
--

LOCK TABLES `mdl_repository_instances` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instances` DISABLE KEYS */;
INSERT INTO `mdl_repository_instances` VALUES (1,'',1,0,1,NULL,NULL,1359111427,1359111427,0),(2,'',2,0,1,NULL,NULL,1359111427,1359111427,0),(3,'',3,0,1,NULL,NULL,1359111427,1359111427,0),(4,'',4,0,1,NULL,NULL,1359111427,1359111427,0),(5,'',5,0,1,NULL,NULL,1359111427,1359111427,0),(6,'',6,0,1,NULL,NULL,1359111428,1359111428,0),(7,'',7,0,1,NULL,NULL,1359111428,1359111428,0),(8,'',8,0,1,NULL,NULL,1417538697,1417538697,0);
/*!40000 ALTER TABLE `mdl_repository_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource`
--

LOCK TABLES `mdl_resource` WRITE;
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource_old`
--

DROP TABLE IF EXISTS `mdl_resource_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource_old`
--

LOCK TABLES `mdl_resource_old` WRITE;
/*!40000 ALTER TABLE `mdl_resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role`
--

LOCK TABLES `mdl_role` WRITE;
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` VALUES (1,'','manager','',1,'manager'),(2,'','coursecreator','',2,'coursecreator'),(3,'','editingteacher','',3,'editingteacher'),(4,'','teacher','',4,'teacher'),(5,'','student','',5,'student'),(6,'','guest','',6,'guest'),(7,'','user','',7,'user'),(8,'','frontpage','',8,'frontpage');
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_assign`
--

LOCK TABLES `mdl_role_allow_assign` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,4),(7,3,5);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_override`
--

LOCK TABLES `mdl_role_allow_override` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,3,4),(10,3,5),(11,3,6);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_switch`
--

DROP TABLE IF EXISTS `mdl_role_allow_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_switch`
--

LOCK TABLES `mdl_role_allow_switch` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_switch` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_switch` VALUES (1,1,3),(2,1,4),(3,1,5),(4,1,6),(5,3,4),(6,3,5),(7,3,6),(8,4,5),(9,4,6);
/*!40000 ALTER TABLE `mdl_role_allow_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_assignments`
--

LOCK TABLES `mdl_role_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_capabilities`
--

LOCK TABLES `mdl_role_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` VALUES (1,1,1,'moodle/site:readallmessages',1,1359111413,0),(2,1,3,'moodle/site:readallmessages',1,1359111413,0),(3,1,1,'moodle/site:sendmessage',1,1359111413,0),(4,1,7,'moodle/site:sendmessage',1,1359111413,0),(5,1,1,'moodle/site:approvecourse',1,1359111413,0),(6,1,3,'moodle/backup:backupcourse',1,1359111413,0),(7,1,1,'moodle/backup:backupcourse',1,1359111413,0),(8,1,3,'moodle/backup:backupsection',1,1359111413,0),(9,1,1,'moodle/backup:backupsection',1,1359111413,0),(10,1,3,'moodle/backup:backupactivity',1,1359111413,0),(11,1,1,'moodle/backup:backupactivity',1,1359111413,0),(12,1,3,'moodle/backup:backuptargethub',1,1359111413,0),(13,1,1,'moodle/backup:backuptargethub',1,1359111413,0),(14,1,3,'moodle/backup:backuptargetimport',1,1359111413,0),(15,1,1,'moodle/backup:backuptargetimport',1,1359111413,0),(16,1,3,'moodle/backup:downloadfile',1,1359111413,0),(17,1,1,'moodle/backup:downloadfile',1,1359111413,0),(18,1,3,'moodle/backup:configure',1,1359111413,0),(19,1,1,'moodle/backup:configure',1,1359111413,0),(20,1,1,'moodle/backup:userinfo',1,1359111413,0),(21,1,1,'moodle/backup:anonymise',1,1359111413,0),(22,1,3,'moodle/restore:restorecourse',1,1359111413,0),(23,1,1,'moodle/restore:restorecourse',1,1359111413,0),(24,1,3,'moodle/restore:restoresection',1,1359111413,0),(25,1,1,'moodle/restore:restoresection',1,1359111413,0),(26,1,3,'moodle/restore:restoreactivity',1,1359111413,0),(27,1,1,'moodle/restore:restoreactivity',1,1359111413,0),(28,1,3,'moodle/restore:restoretargethub',1,1359111413,0),(29,1,1,'moodle/restore:restoretargethub',1,1359111413,0),(30,1,3,'moodle/restore:restoretargetimport',1,1359111413,0),(31,1,1,'moodle/restore:restoretargetimport',1,1359111413,0),(32,1,3,'moodle/restore:uploadfile',1,1359111413,0),(33,1,1,'moodle/restore:uploadfile',1,1359111413,0),(34,1,3,'moodle/restore:configure',1,1359111413,0),(35,1,1,'moodle/restore:configure',1,1359111413,0),(36,1,2,'moodle/restore:rolldates',1,1359111413,0),(37,1,1,'moodle/restore:rolldates',1,1359111413,0),(38,1,1,'moodle/restore:userinfo',1,1359111413,0),(39,1,1,'moodle/restore:createuser',1,1359111413,0),(40,1,3,'moodle/site:manageblocks',1,1359111413,0),(41,1,1,'moodle/site:manageblocks',1,1359111413,0),(42,1,4,'moodle/site:accessallgroups',1,1359111413,0),(43,1,3,'moodle/site:accessallgroups',1,1359111413,0),(44,1,1,'moodle/site:accessallgroups',1,1359111413,0),(45,1,4,'moodle/site:viewfullnames',1,1359111413,0),(46,1,3,'moodle/site:viewfullnames',1,1359111413,0),(47,1,1,'moodle/site:viewfullnames',1,1359111413,0),(48,1,4,'moodle/site:viewuseridentity',1,1359111413,0),(49,1,3,'moodle/site:viewuseridentity',1,1359111413,0),(50,1,1,'moodle/site:viewuseridentity',1,1359111413,0),(51,1,4,'moodle/site:viewreports',1,1359111413,0),(52,1,3,'moodle/site:viewreports',1,1359111413,0),(53,1,1,'moodle/site:viewreports',1,1359111413,0),(54,1,3,'moodle/site:trustcontent',1,1359111413,0),(55,1,1,'moodle/site:trustcontent',1,1359111413,0),(56,1,1,'moodle/site:uploadusers',1,1359111413,0),(57,1,3,'moodle/filter:manage',1,1359111413,0),(58,1,1,'moodle/filter:manage',1,1359111413,0),(59,1,1,'moodle/user:create',1,1359111413,0),(60,1,1,'moodle/user:delete',1,1359111413,0),(61,1,1,'moodle/user:update',1,1359111413,0),(62,1,6,'moodle/user:viewdetails',1,1359111413,0),(63,1,5,'moodle/user:viewdetails',1,1359111413,0),(64,1,4,'moodle/user:viewdetails',1,1359111413,0),(65,1,3,'moodle/user:viewdetails',1,1359111413,0),(66,1,1,'moodle/user:viewdetails',1,1359111413,0),(67,1,1,'moodle/user:viewalldetails',1,1359111413,0),(68,1,4,'moodle/user:viewhiddendetails',1,1359111413,0),(69,1,3,'moodle/user:viewhiddendetails',1,1359111413,0),(70,1,1,'moodle/user:viewhiddendetails',1,1359111413,0),(71,1,1,'moodle/user:loginas',1,1359111413,0),(72,1,1,'moodle/user:managesyspages',1,1359111413,0),(73,1,7,'moodle/user:manageownblocks',1,1359111413,0),(74,1,7,'moodle/user:manageownfiles',1,1359111413,0),(75,1,1,'moodle/my:configsyspages',1,1359111413,0),(76,1,3,'moodle/role:assign',1,1359111413,0),(77,1,1,'moodle/role:assign',1,1359111413,0),(78,1,4,'moodle/role:review',1,1359111413,0),(79,1,3,'moodle/role:review',1,1359111413,0),(80,1,1,'moodle/role:review',1,1359111413,0),(81,1,1,'moodle/role:override',1,1359111413,0),(82,1,3,'moodle/role:safeoverride',1,1359111413,0),(83,1,1,'moodle/role:manage',1,1359111413,0),(84,1,3,'moodle/role:switchroles',1,1359111413,0),(85,1,1,'moodle/role:switchroles',1,1359111413,0),(86,1,1,'moodle/category:manage',1,1359111413,0),(87,1,2,'moodle/category:viewhiddencategories',1,1359111413,0),(88,1,1,'moodle/category:viewhiddencategories',1,1359111413,0),(89,1,1,'moodle/cohort:manage',1,1359111413,0),(90,1,1,'moodle/cohort:assign',1,1359111413,0),(91,1,3,'moodle/cohort:view',1,1359111413,0),(92,1,1,'moodle/cohort:view',1,1359111413,0),(93,1,2,'moodle/course:create',1,1359111413,0),(94,1,1,'moodle/course:create',1,1359111413,0),(95,1,7,'moodle/course:request',1,1359111413,0),(96,1,1,'moodle/course:delete',1,1359111413,0),(97,1,3,'moodle/course:update',1,1359111413,0),(98,1,1,'moodle/course:update',1,1359111413,0),(99,1,1,'moodle/course:view',1,1359111413,0),(100,1,3,'moodle/course:enrolreview',1,1359111413,0),(101,1,1,'moodle/course:enrolreview',1,1359111413,0),(102,1,3,'moodle/course:enrolconfig',1,1359111413,0),(103,1,1,'moodle/course:enrolconfig',1,1359111413,0),(104,1,4,'moodle/course:bulkmessaging',1,1359111413,0),(105,1,3,'moodle/course:bulkmessaging',1,1359111413,0),(106,1,1,'moodle/course:bulkmessaging',1,1359111413,0),(107,1,4,'moodle/course:viewhiddenuserfields',1,1359111413,0),(108,1,3,'moodle/course:viewhiddenuserfields',1,1359111413,0),(109,1,1,'moodle/course:viewhiddenuserfields',1,1359111413,0),(110,1,2,'moodle/course:viewhiddencourses',1,1359111413,0),(111,1,4,'moodle/course:viewhiddencourses',1,1359111413,0),(112,1,3,'moodle/course:viewhiddencourses',1,1359111413,0),(113,1,1,'moodle/course:viewhiddencourses',1,1359111413,0),(114,1,3,'moodle/course:visibility',1,1359111413,0),(115,1,1,'moodle/course:visibility',1,1359111413,0),(116,1,3,'moodle/course:managefiles',1,1359111413,0),(117,1,1,'moodle/course:managefiles',1,1359111413,0),(118,1,3,'moodle/course:manageactivities',1,1359111413,0),(119,1,1,'moodle/course:manageactivities',1,1359111413,0),(120,1,3,'moodle/course:activityvisibility',1,1359111413,0),(121,1,1,'moodle/course:activityvisibility',1,1359111413,0),(122,1,4,'moodle/course:viewhiddenactivities',1,1359111413,0),(123,1,3,'moodle/course:viewhiddenactivities',1,1359111413,0),(124,1,1,'moodle/course:viewhiddenactivities',1,1359111413,0),(125,1,5,'moodle/course:viewparticipants',1,1359111413,0),(126,1,4,'moodle/course:viewparticipants',1,1359111413,0),(127,1,3,'moodle/course:viewparticipants',1,1359111413,0),(128,1,1,'moodle/course:viewparticipants',1,1359111413,0),(129,1,3,'moodle/course:changefullname',1,1359111413,0),(130,1,1,'moodle/course:changefullname',1,1359111413,0),(131,1,3,'moodle/course:changeshortname',1,1359111413,0),(132,1,1,'moodle/course:changeshortname',1,1359111413,0),(133,1,3,'moodle/course:changeidnumber',1,1359111413,0),(134,1,1,'moodle/course:changeidnumber',1,1359111413,0),(135,1,3,'moodle/course:changecategory',1,1359111413,0),(136,1,1,'moodle/course:changecategory',1,1359111413,0),(137,1,3,'moodle/course:changesummary',1,1359111413,0),(138,1,1,'moodle/course:changesummary',1,1359111413,0),(139,1,1,'moodle/site:viewparticipants',1,1359111413,0),(140,1,5,'moodle/course:isincompletionreports',1,1359111413,0),(141,1,5,'moodle/course:viewscales',1,1359111413,0),(142,1,4,'moodle/course:viewscales',1,1359111413,0),(143,1,3,'moodle/course:viewscales',1,1359111413,0),(144,1,1,'moodle/course:viewscales',1,1359111413,0),(145,1,3,'moodle/course:managescales',1,1359111413,0),(146,1,1,'moodle/course:managescales',1,1359111413,0),(147,1,3,'moodle/course:managegroups',1,1359111413,0),(148,1,1,'moodle/course:managegroups',1,1359111413,0),(149,1,3,'moodle/course:reset',1,1359111413,0),(150,1,1,'moodle/course:reset',1,1359111413,0),(151,1,6,'moodle/blog:view',1,1359111413,0),(152,1,7,'moodle/blog:view',1,1359111413,0),(153,1,5,'moodle/blog:view',1,1359111413,0),(154,1,4,'moodle/blog:view',1,1359111413,0),(155,1,3,'moodle/blog:view',1,1359111413,0),(156,1,1,'moodle/blog:view',1,1359111413,0),(157,1,6,'moodle/blog:search',1,1359111413,0),(158,1,7,'moodle/blog:search',1,1359111413,0),(159,1,5,'moodle/blog:search',1,1359111413,0),(160,1,4,'moodle/blog:search',1,1359111413,0),(161,1,3,'moodle/blog:search',1,1359111413,0),(162,1,1,'moodle/blog:search',1,1359111413,0),(163,1,1,'moodle/blog:viewdrafts',1,1359111413,0),(164,1,7,'moodle/blog:create',1,1359111413,0),(165,1,1,'moodle/blog:create',1,1359111413,0),(166,1,4,'moodle/blog:manageentries',1,1359111413,0),(167,1,3,'moodle/blog:manageentries',1,1359111413,0),(168,1,1,'moodle/blog:manageentries',1,1359111413,0),(169,1,5,'moodle/blog:manageexternal',1,1359111413,0),(170,1,7,'moodle/blog:manageexternal',1,1359111413,0),(171,1,4,'moodle/blog:manageexternal',1,1359111413,0),(172,1,3,'moodle/blog:manageexternal',1,1359111413,0),(173,1,1,'moodle/blog:manageexternal',1,1359111413,0),(174,1,5,'moodle/blog:associatecourse',1,1359111413,0),(175,1,7,'moodle/blog:associatecourse',1,1359111413,0),(176,1,4,'moodle/blog:associatecourse',1,1359111413,0),(177,1,3,'moodle/blog:associatecourse',1,1359111413,0),(178,1,1,'moodle/blog:associatecourse',1,1359111413,0),(179,1,5,'moodle/blog:associatemodule',1,1359111413,0),(180,1,7,'moodle/blog:associatemodule',1,1359111413,0),(181,1,4,'moodle/blog:associatemodule',1,1359111413,0),(182,1,3,'moodle/blog:associatemodule',1,1359111413,0),(183,1,1,'moodle/blog:associatemodule',1,1359111413,0),(184,1,7,'moodle/calendar:manageownentries',1,1359111413,0),(185,1,1,'moodle/calendar:manageownentries',1,1359111413,0),(186,1,4,'moodle/calendar:managegroupentries',1,1359111413,0),(187,1,3,'moodle/calendar:managegroupentries',1,1359111413,0),(188,1,1,'moodle/calendar:managegroupentries',1,1359111413,0),(189,1,4,'moodle/calendar:manageentries',1,1359111413,0),(190,1,3,'moodle/calendar:manageentries',1,1359111413,0),(191,1,1,'moodle/calendar:manageentries',1,1359111413,0),(192,1,1,'moodle/user:editprofile',1,1359111413,0),(193,1,6,'moodle/user:editownprofile',-1000,1359111413,0),(194,1,7,'moodle/user:editownprofile',1,1359111413,0),(195,1,1,'moodle/user:editownprofile',1,1359111413,0),(196,1,6,'moodle/user:changeownpassword',-1000,1359111413,0),(197,1,7,'moodle/user:changeownpassword',1,1359111413,0),(198,1,1,'moodle/user:changeownpassword',1,1359111413,0),(199,1,5,'moodle/user:readuserposts',1,1359111413,0),(200,1,4,'moodle/user:readuserposts',1,1359111413,0),(201,1,3,'moodle/user:readuserposts',1,1359111413,0),(202,1,1,'moodle/user:readuserposts',1,1359111413,0),(203,1,5,'moodle/user:readuserblogs',1,1359111413,0),(204,1,4,'moodle/user:readuserblogs',1,1359111413,0),(205,1,3,'moodle/user:readuserblogs',1,1359111413,0),(206,1,1,'moodle/user:readuserblogs',1,1359111413,0),(207,1,1,'moodle/user:editmessageprofile',1,1359111413,0),(208,1,6,'moodle/user:editownmessageprofile',-1000,1359111413,0),(209,1,7,'moodle/user:editownmessageprofile',1,1359111413,0),(210,1,1,'moodle/user:editownmessageprofile',1,1359111413,0),(211,1,3,'moodle/question:managecategory',1,1359111413,0),(212,1,1,'moodle/question:managecategory',1,1359111414,0),(213,1,3,'moodle/question:add',1,1359111414,0),(214,1,1,'moodle/question:add',1,1359111414,0),(215,1,3,'moodle/question:editmine',1,1359111414,0),(216,1,1,'moodle/question:editmine',1,1359111414,0),(217,1,3,'moodle/question:editall',1,1359111414,0),(218,1,1,'moodle/question:editall',1,1359111414,0),(219,1,3,'moodle/question:viewmine',1,1359111414,0),(220,1,1,'moodle/question:viewmine',1,1359111414,0),(221,1,3,'moodle/question:viewall',1,1359111414,0),(222,1,1,'moodle/question:viewall',1,1359111414,0),(223,1,3,'moodle/question:usemine',1,1359111414,0),(224,1,1,'moodle/question:usemine',1,1359111414,0),(225,1,3,'moodle/question:useall',1,1359111414,0),(226,1,1,'moodle/question:useall',1,1359111414,0),(227,1,3,'moodle/question:movemine',1,1359111414,0),(228,1,1,'moodle/question:movemine',1,1359111414,0),(229,1,3,'moodle/question:moveall',1,1359111414,0),(230,1,1,'moodle/question:moveall',1,1359111414,0),(231,1,1,'moodle/question:config',1,1359111414,0),(232,1,5,'moodle/question:flag',1,1359111414,0),(233,1,4,'moodle/question:flag',1,1359111414,0),(234,1,3,'moodle/question:flag',1,1359111414,0),(235,1,1,'moodle/question:flag',1,1359111414,0),(236,1,4,'moodle/site:doclinks',1,1359111414,0),(237,1,3,'moodle/site:doclinks',1,1359111414,0),(238,1,1,'moodle/site:doclinks',1,1359111414,0),(239,1,3,'moodle/course:sectionvisibility',1,1359111414,0),(240,1,1,'moodle/course:sectionvisibility',1,1359111414,0),(241,1,3,'moodle/course:useremail',1,1359111414,0),(242,1,1,'moodle/course:useremail',1,1359111414,0),(243,1,3,'moodle/course:viewhiddensections',1,1359111414,0),(244,1,1,'moodle/course:viewhiddensections',1,1359111414,0),(245,1,3,'moodle/course:setcurrentsection',1,1359111414,0),(246,1,1,'moodle/course:setcurrentsection',1,1359111414,0),(247,1,3,'moodle/course:movesections',1,1359111414,0),(248,1,1,'moodle/course:movesections',1,1359111414,0),(249,1,4,'moodle/grade:viewall',1,1359111414,0),(250,1,3,'moodle/grade:viewall',1,1359111414,0),(251,1,1,'moodle/grade:viewall',1,1359111414,0),(252,1,5,'moodle/grade:view',1,1359111414,0),(253,1,4,'moodle/grade:viewhidden',1,1359111414,0),(254,1,3,'moodle/grade:viewhidden',1,1359111414,0),(255,1,1,'moodle/grade:viewhidden',1,1359111414,0),(256,1,3,'moodle/grade:import',1,1359111414,0),(257,1,1,'moodle/grade:import',1,1359111414,0),(258,1,4,'moodle/grade:export',1,1359111414,0),(259,1,3,'moodle/grade:export',1,1359111414,0),(260,1,1,'moodle/grade:export',1,1359111414,0),(261,1,3,'moodle/grade:manage',1,1359111414,0),(262,1,1,'moodle/grade:manage',1,1359111414,0),(263,1,3,'moodle/grade:edit',1,1359111414,0),(264,1,1,'moodle/grade:edit',1,1359111414,0),(265,1,3,'moodle/grade:managegradingforms',1,1359111414,0),(266,1,1,'moodle/grade:managegradingforms',1,1359111414,0),(267,1,1,'moodle/grade:sharegradingforms',1,1359111414,0),(268,1,1,'moodle/grade:managesharedforms',1,1359111414,0),(269,1,3,'moodle/grade:manageoutcomes',1,1359111414,0),(270,1,1,'moodle/grade:manageoutcomes',1,1359111414,0),(271,1,3,'moodle/grade:manageletters',1,1359111414,0),(272,1,1,'moodle/grade:manageletters',1,1359111414,0),(273,1,3,'moodle/grade:hide',1,1359111414,0),(274,1,1,'moodle/grade:hide',1,1359111414,0),(275,1,3,'moodle/grade:lock',1,1359111414,0),(276,1,1,'moodle/grade:lock',1,1359111414,0),(277,1,3,'moodle/grade:unlock',1,1359111414,0),(278,1,1,'moodle/grade:unlock',1,1359111414,0),(279,1,7,'moodle/my:manageblocks',1,1359111414,0),(280,1,4,'moodle/notes:view',1,1359111414,0),(281,1,3,'moodle/notes:view',1,1359111414,0),(282,1,1,'moodle/notes:view',1,1359111414,0),(283,1,4,'moodle/notes:manage',1,1359111414,0),(284,1,3,'moodle/notes:manage',1,1359111414,0),(285,1,1,'moodle/notes:manage',1,1359111414,0),(286,1,4,'moodle/tag:manage',1,1359111414,0),(287,1,3,'moodle/tag:manage',1,1359111414,0),(288,1,1,'moodle/tag:manage',1,1359111414,0),(289,1,1,'moodle/tag:create',1,1359111414,0),(290,1,7,'moodle/tag:create',1,1359111414,0),(291,1,1,'moodle/tag:edit',1,1359111414,0),(292,1,7,'moodle/tag:edit',1,1359111414,0),(293,1,1,'moodle/tag:flag',1,1359111414,0),(294,1,7,'moodle/tag:flag',1,1359111414,0),(295,1,4,'moodle/tag:editblocks',1,1359111414,0),(296,1,3,'moodle/tag:editblocks',1,1359111414,0),(297,1,1,'moodle/tag:editblocks',1,1359111414,0),(298,1,6,'moodle/block:view',1,1359111414,0),(299,1,7,'moodle/block:view',1,1359111414,0),(300,1,5,'moodle/block:view',1,1359111414,0),(301,1,4,'moodle/block:view',1,1359111414,0),(302,1,3,'moodle/block:view',1,1359111414,0),(303,1,3,'moodle/block:edit',1,1359111414,0),(304,1,1,'moodle/block:edit',1,1359111414,0),(305,1,7,'moodle/portfolio:export',1,1359111414,0),(306,1,5,'moodle/portfolio:export',1,1359111414,0),(307,1,4,'moodle/portfolio:export',1,1359111414,0),(308,1,3,'moodle/portfolio:export',1,1359111414,0),(309,1,8,'moodle/comment:view',1,1359111414,0),(310,1,6,'moodle/comment:view',1,1359111414,0),(311,1,7,'moodle/comment:view',1,1359111414,0),(312,1,5,'moodle/comment:view',1,1359111414,0),(313,1,4,'moodle/comment:view',1,1359111414,0),(314,1,3,'moodle/comment:view',1,1359111414,0),(315,1,1,'moodle/comment:view',1,1359111414,0),(316,1,7,'moodle/comment:post',1,1359111414,0),(317,1,5,'moodle/comment:post',1,1359111414,0),(318,1,4,'moodle/comment:post',1,1359111414,0),(319,1,3,'moodle/comment:post',1,1359111414,0),(320,1,1,'moodle/comment:post',1,1359111414,0),(321,1,3,'moodle/comment:delete',1,1359111414,0),(322,1,1,'moodle/comment:delete',1,1359111414,0),(323,1,1,'moodle/webservice:createtoken',1,1359111414,0),(324,1,7,'moodle/webservice:createmobiletoken',1,1359111414,0),(325,1,7,'moodle/rating:view',1,1359111414,0),(326,1,5,'moodle/rating:view',1,1359111414,0),(327,1,4,'moodle/rating:view',1,1359111414,0),(328,1,3,'moodle/rating:view',1,1359111414,0),(329,1,1,'moodle/rating:view',1,1359111414,0),(330,1,7,'moodle/rating:viewany',1,1359111414,0),(331,1,5,'moodle/rating:viewany',1,1359111414,0),(332,1,4,'moodle/rating:viewany',1,1359111414,0),(333,1,3,'moodle/rating:viewany',1,1359111414,0),(334,1,1,'moodle/rating:viewany',1,1359111414,0),(335,1,7,'moodle/rating:viewall',1,1359111414,0),(336,1,5,'moodle/rating:viewall',1,1359111414,0),(337,1,4,'moodle/rating:viewall',1,1359111414,0),(338,1,3,'moodle/rating:viewall',1,1359111414,0),(339,1,1,'moodle/rating:viewall',1,1359111414,0),(340,1,7,'moodle/rating:rate',1,1359111414,0),(341,1,5,'moodle/rating:rate',1,1359111414,0),(342,1,4,'moodle/rating:rate',1,1359111414,0),(343,1,3,'moodle/rating:rate',1,1359111414,0),(344,1,1,'moodle/rating:rate',1,1359111414,0),(345,1,1,'moodle/course:publish',1,1359111414,0),(346,1,4,'moodle/course:markcomplete',1,1359111414,0),(347,1,3,'moodle/course:markcomplete',1,1359111414,0),(348,1,1,'moodle/course:markcomplete',1,1359111414,0),(349,1,1,'moodle/community:add',1,1359111414,0),(350,1,4,'moodle/community:add',1,1359111414,0),(351,1,3,'moodle/community:add',1,1359111414,0),(352,1,1,'moodle/community:download',1,1359111414,0),(353,1,3,'moodle/community:download',1,1359111414,0),(354,1,6,'mod/assign:view',1,1359111417,0),(355,1,5,'mod/assign:view',1,1359111417,0),(356,1,4,'mod/assign:view',1,1359111417,0),(357,1,3,'mod/assign:view',1,1359111417,0),(358,1,1,'mod/assign:view',1,1359111417,0),(359,1,5,'mod/assign:submit',1,1359111417,0),(360,1,4,'mod/assign:grade',1,1359111417,0),(361,1,3,'mod/assign:grade',1,1359111417,0),(362,1,1,'mod/assign:grade',1,1359111417,0),(363,1,4,'mod/assign:exportownsubmission',1,1359111417,0),(364,1,3,'mod/assign:exportownsubmission',1,1359111417,0),(365,1,1,'mod/assign:exportownsubmission',1,1359111417,0),(366,1,5,'mod/assign:exportownsubmission',1,1359111417,0),(367,1,3,'mod/assign:addinstance',1,1359111417,0),(368,1,1,'mod/assign:addinstance',1,1359111417,0),(369,1,4,'mod/assign:grantextension',1,1359111417,0),(370,1,3,'mod/assign:grantextension',1,1359111417,0),(371,1,1,'mod/assign:grantextension',1,1359111417,0),(372,1,3,'mod/assign:revealidentities',1,1359111417,0),(373,1,1,'mod/assign:revealidentities',1,1359111417,0),(374,1,6,'mod/assignment:view',1,1359111417,0),(375,1,5,'mod/assignment:view',1,1359111417,0),(376,1,4,'mod/assignment:view',1,1359111417,0),(377,1,3,'mod/assignment:view',1,1359111417,0),(378,1,1,'mod/assignment:view',1,1359111417,0),(379,1,3,'mod/assignment:addinstance',1,1359111417,0),(380,1,1,'mod/assignment:addinstance',1,1359111417,0),(381,1,5,'mod/assignment:submit',1,1359111417,0),(382,1,4,'mod/assignment:grade',1,1359111417,0),(383,1,3,'mod/assignment:grade',1,1359111417,0),(384,1,1,'mod/assignment:grade',1,1359111417,0),(385,1,4,'mod/assignment:exportownsubmission',1,1359111417,0),(386,1,3,'mod/assignment:exportownsubmission',1,1359111417,0),(387,1,1,'mod/assignment:exportownsubmission',1,1359111417,0),(388,1,5,'mod/assignment:exportownsubmission',1,1359111417,0),(389,1,3,'mod/book:addinstance',1,1359111417,0),(390,1,1,'mod/book:addinstance',1,1359111417,0),(391,1,6,'mod/book:read',1,1359111417,0),(392,1,8,'mod/book:read',1,1359111417,0),(393,1,5,'mod/book:read',1,1359111417,0),(394,1,4,'mod/book:read',1,1359111417,0),(395,1,3,'mod/book:read',1,1359111417,0),(396,1,1,'mod/book:read',1,1359111417,0),(397,1,4,'mod/book:viewhiddenchapters',1,1359111417,0),(398,1,3,'mod/book:viewhiddenchapters',1,1359111417,0),(399,1,1,'mod/book:viewhiddenchapters',1,1359111417,0),(400,1,3,'mod/book:edit',1,1359111417,0),(401,1,1,'mod/book:edit',1,1359111417,0),(402,1,3,'mod/chat:addinstance',1,1359111417,0),(403,1,1,'mod/chat:addinstance',1,1359111417,0),(404,1,5,'mod/chat:chat',1,1359111417,0),(405,1,4,'mod/chat:chat',1,1359111417,0),(406,1,3,'mod/chat:chat',1,1359111417,0),(407,1,1,'mod/chat:chat',1,1359111417,0),(408,1,5,'mod/chat:readlog',1,1359111417,0),(409,1,4,'mod/chat:readlog',1,1359111417,0),(410,1,3,'mod/chat:readlog',1,1359111417,0),(411,1,1,'mod/chat:readlog',1,1359111417,0),(412,1,4,'mod/chat:deletelog',1,1359111417,0),(413,1,3,'mod/chat:deletelog',1,1359111417,0),(414,1,1,'mod/chat:deletelog',1,1359111417,0),(415,1,4,'mod/chat:exportparticipatedsession',1,1359111417,0),(416,1,3,'mod/chat:exportparticipatedsession',1,1359111417,0),(417,1,1,'mod/chat:exportparticipatedsession',1,1359111417,0),(418,1,4,'mod/chat:exportsession',1,1359111417,0),(419,1,3,'mod/chat:exportsession',1,1359111417,0),(420,1,1,'mod/chat:exportsession',1,1359111417,0),(421,1,3,'mod/choice:addinstance',1,1359111417,0),(422,1,1,'mod/choice:addinstance',1,1359111417,0),(423,1,5,'mod/choice:choose',1,1359111417,0),(424,1,4,'mod/choice:choose',1,1359111417,0),(425,1,3,'mod/choice:choose',1,1359111417,0),(426,1,4,'mod/choice:readresponses',1,1359111417,0),(427,1,3,'mod/choice:readresponses',1,1359111417,0),(428,1,1,'mod/choice:readresponses',1,1359111417,0),(429,1,4,'mod/choice:deleteresponses',1,1359111417,0),(430,1,3,'mod/choice:deleteresponses',1,1359111417,0),(431,1,1,'mod/choice:deleteresponses',1,1359111417,0),(432,1,4,'mod/choice:downloadresponses',1,1359111417,0),(433,1,3,'mod/choice:downloadresponses',1,1359111417,0),(434,1,1,'mod/choice:downloadresponses',1,1359111417,0),(435,1,3,'mod/data:addinstance',1,1359111418,0),(436,1,1,'mod/data:addinstance',1,1359111418,0),(437,1,8,'mod/data:viewentry',1,1359111418,0),(438,1,6,'mod/data:viewentry',1,1359111418,0),(439,1,5,'mod/data:viewentry',1,1359111418,0),(440,1,4,'mod/data:viewentry',1,1359111418,0),(441,1,3,'mod/data:viewentry',1,1359111418,0),(442,1,1,'mod/data:viewentry',1,1359111418,0),(443,1,5,'mod/data:writeentry',1,1359111418,0),(444,1,4,'mod/data:writeentry',1,1359111418,0),(445,1,3,'mod/data:writeentry',1,1359111418,0),(446,1,1,'mod/data:writeentry',1,1359111418,0),(447,1,5,'mod/data:comment',1,1359111418,0),(448,1,4,'mod/data:comment',1,1359111418,0),(449,1,3,'mod/data:comment',1,1359111418,0),(450,1,1,'mod/data:comment',1,1359111418,0),(451,1,4,'mod/data:rate',1,1359111418,0),(452,1,3,'mod/data:rate',1,1359111418,0),(453,1,1,'mod/data:rate',1,1359111418,0),(454,1,4,'mod/data:viewrating',1,1359111418,0),(455,1,3,'mod/data:viewrating',1,1359111418,0),(456,1,1,'mod/data:viewrating',1,1359111418,0),(457,1,4,'mod/data:viewanyrating',1,1359111418,0),(458,1,3,'mod/data:viewanyrating',1,1359111418,0),(459,1,1,'mod/data:viewanyrating',1,1359111418,0),(460,1,4,'mod/data:viewallratings',1,1359111418,0),(461,1,3,'mod/data:viewallratings',1,1359111418,0),(462,1,1,'mod/data:viewallratings',1,1359111418,0),(463,1,4,'mod/data:approve',1,1359111418,0),(464,1,3,'mod/data:approve',1,1359111418,0),(465,1,1,'mod/data:approve',1,1359111418,0),(466,1,4,'mod/data:manageentries',1,1359111418,0),(467,1,3,'mod/data:manageentries',1,1359111418,0),(468,1,1,'mod/data:manageentries',1,1359111418,0),(469,1,4,'mod/data:managecomments',1,1359111418,0),(470,1,3,'mod/data:managecomments',1,1359111418,0),(471,1,1,'mod/data:managecomments',1,1359111418,0),(472,1,3,'mod/data:managetemplates',1,1359111418,0),(473,1,1,'mod/data:managetemplates',1,1359111418,0),(474,1,4,'mod/data:viewalluserpresets',1,1359111418,0),(475,1,3,'mod/data:viewalluserpresets',1,1359111418,0),(476,1,1,'mod/data:viewalluserpresets',1,1359111418,0),(477,1,1,'mod/data:manageuserpresets',1,1359111418,0),(478,1,1,'mod/data:exportentry',1,1359111418,0),(479,1,4,'mod/data:exportentry',1,1359111418,0),(480,1,3,'mod/data:exportentry',1,1359111418,0),(481,1,1,'mod/data:exportownentry',1,1359111418,0),(482,1,4,'mod/data:exportownentry',1,1359111418,0),(483,1,3,'mod/data:exportownentry',1,1359111418,0),(484,1,5,'mod/data:exportownentry',1,1359111418,0),(485,1,1,'mod/data:exportallentries',1,1359111418,0),(486,1,4,'mod/data:exportallentries',1,1359111418,0),(487,1,3,'mod/data:exportallentries',1,1359111418,0),(488,1,1,'mod/data:exportuserinfo',1,1359111418,0),(489,1,4,'mod/data:exportuserinfo',1,1359111418,0),(490,1,3,'mod/data:exportuserinfo',1,1359111418,0),(491,1,3,'mod/feedback:addinstance',1,1359111418,0),(492,1,1,'mod/feedback:addinstance',1,1359111418,0),(493,1,6,'mod/feedback:view',1,1359111418,0),(494,1,5,'mod/feedback:view',1,1359111418,0),(495,1,4,'mod/feedback:view',1,1359111418,0),(496,1,3,'mod/feedback:view',1,1359111418,0),(497,1,1,'mod/feedback:view',1,1359111418,0),(498,1,5,'mod/feedback:complete',1,1359111418,0),(499,1,5,'mod/feedback:viewanalysepage',1,1359111418,0),(500,1,3,'mod/feedback:viewanalysepage',1,1359111418,0),(501,1,1,'mod/feedback:viewanalysepage',1,1359111418,0),(502,1,3,'mod/feedback:deletesubmissions',1,1359111418,0),(503,1,1,'mod/feedback:deletesubmissions',1,1359111418,0),(504,1,1,'mod/feedback:mapcourse',1,1359111418,0),(505,1,3,'mod/feedback:edititems',1,1359111418,0),(506,1,1,'mod/feedback:edititems',1,1359111418,0),(507,1,3,'mod/feedback:createprivatetemplate',1,1359111418,0),(508,1,1,'mod/feedback:createprivatetemplate',1,1359111418,0),(509,1,3,'mod/feedback:createpublictemplate',1,1359111418,0),(510,1,1,'mod/feedback:createpublictemplate',1,1359111418,0),(511,1,3,'mod/feedback:deletetemplate',1,1359111418,0),(512,1,1,'mod/feedback:deletetemplate',1,1359111418,0),(513,1,4,'mod/feedback:viewreports',1,1359111418,0),(514,1,3,'mod/feedback:viewreports',1,1359111418,0),(515,1,1,'mod/feedback:viewreports',1,1359111418,0),(516,1,4,'mod/feedback:receivemail',1,1359111418,0),(517,1,3,'mod/feedback:receivemail',1,1359111418,0),(518,1,3,'mod/folder:addinstance',1,1359111418,0),(519,1,1,'mod/folder:addinstance',1,1359111418,0),(520,1,6,'mod/folder:view',1,1359111418,0),(521,1,7,'mod/folder:view',1,1359111418,0),(522,1,3,'mod/folder:managefiles',1,1359111418,0),(523,1,3,'mod/forum:addinstance',1,1359111418,0),(524,1,1,'mod/forum:addinstance',1,1359111418,0),(525,1,8,'mod/forum:viewdiscussion',1,1359111418,0),(526,1,6,'mod/forum:viewdiscussion',1,1359111418,0),(527,1,5,'mod/forum:viewdiscussion',1,1359111418,0),(528,1,4,'mod/forum:viewdiscussion',1,1359111418,0),(529,1,3,'mod/forum:viewdiscussion',1,1359111418,0),(530,1,1,'mod/forum:viewdiscussion',1,1359111418,0),(531,1,4,'mod/forum:viewhiddentimedposts',1,1359111418,0),(532,1,3,'mod/forum:viewhiddentimedposts',1,1359111418,0),(533,1,1,'mod/forum:viewhiddentimedposts',1,1359111418,0),(534,1,5,'mod/forum:startdiscussion',1,1359111418,0),(535,1,4,'mod/forum:startdiscussion',1,1359111418,0),(536,1,3,'mod/forum:startdiscussion',1,1359111418,0),(537,1,1,'mod/forum:startdiscussion',1,1359111418,0),(538,1,5,'mod/forum:replypost',1,1359111418,0),(539,1,4,'mod/forum:replypost',1,1359111418,0),(540,1,3,'mod/forum:replypost',1,1359111418,0),(541,1,1,'mod/forum:replypost',1,1359111418,0),(542,1,4,'mod/forum:addnews',1,1359111418,0),(543,1,3,'mod/forum:addnews',1,1359111418,0),(544,1,1,'mod/forum:addnews',1,1359111418,0),(545,1,4,'mod/forum:replynews',1,1359111418,0),(546,1,3,'mod/forum:replynews',1,1359111418,0),(547,1,1,'mod/forum:replynews',1,1359111418,0),(548,1,5,'mod/forum:viewrating',1,1359111418,0),(549,1,4,'mod/forum:viewrating',1,1359111418,0),(550,1,3,'mod/forum:viewrating',1,1359111418,0),(551,1,1,'mod/forum:viewrating',1,1359111418,0),(552,1,4,'mod/forum:viewanyrating',1,1359111418,0),(553,1,3,'mod/forum:viewanyrating',1,1359111418,0),(554,1,1,'mod/forum:viewanyrating',1,1359111418,0),(555,1,4,'mod/forum:viewallratings',1,1359111418,0),(556,1,3,'mod/forum:viewallratings',1,1359111418,0),(557,1,1,'mod/forum:viewallratings',1,1359111418,0),(558,1,4,'mod/forum:rate',1,1359111418,0),(559,1,3,'mod/forum:rate',1,1359111418,0),(560,1,1,'mod/forum:rate',1,1359111418,0),(561,1,5,'mod/forum:createattachment',1,1359111418,0),(562,1,4,'mod/forum:createattachment',1,1359111418,0),(563,1,3,'mod/forum:createattachment',1,1359111418,0),(564,1,1,'mod/forum:createattachment',1,1359111418,0),(565,1,5,'mod/forum:deleteownpost',1,1359111418,0),(566,1,4,'mod/forum:deleteownpost',1,1359111418,0),(567,1,3,'mod/forum:deleteownpost',1,1359111418,0),(568,1,1,'mod/forum:deleteownpost',1,1359111418,0),(569,1,4,'mod/forum:deleteanypost',1,1359111418,0),(570,1,3,'mod/forum:deleteanypost',1,1359111418,0),(571,1,1,'mod/forum:deleteanypost',1,1359111418,0),(572,1,4,'mod/forum:splitdiscussions',1,1359111418,0),(573,1,3,'mod/forum:splitdiscussions',1,1359111418,0),(574,1,1,'mod/forum:splitdiscussions',1,1359111418,0),(575,1,4,'mod/forum:movediscussions',1,1359111418,0),(576,1,3,'mod/forum:movediscussions',1,1359111418,0),(577,1,1,'mod/forum:movediscussions',1,1359111418,0),(578,1,4,'mod/forum:editanypost',1,1359111418,0),(579,1,3,'mod/forum:editanypost',1,1359111418,0),(580,1,1,'mod/forum:editanypost',1,1359111418,0),(581,1,4,'mod/forum:viewqandawithoutposting',1,1359111418,0),(582,1,3,'mod/forum:viewqandawithoutposting',1,1359111418,0),(583,1,1,'mod/forum:viewqandawithoutposting',1,1359111418,0),(584,1,4,'mod/forum:viewsubscribers',1,1359111418,0),(585,1,3,'mod/forum:viewsubscribers',1,1359111418,0),(586,1,1,'mod/forum:viewsubscribers',1,1359111418,0),(587,1,4,'mod/forum:managesubscriptions',1,1359111418,0),(588,1,3,'mod/forum:managesubscriptions',1,1359111418,0),(589,1,1,'mod/forum:managesubscriptions',1,1359111418,0),(590,1,4,'mod/forum:postwithoutthrottling',1,1359111418,0),(591,1,3,'mod/forum:postwithoutthrottling',1,1359111418,0),(592,1,1,'mod/forum:postwithoutthrottling',1,1359111418,0),(593,1,4,'mod/forum:exportdiscussion',1,1359111418,0),(594,1,3,'mod/forum:exportdiscussion',1,1359111418,0),(595,1,1,'mod/forum:exportdiscussion',1,1359111418,0),(596,1,4,'mod/forum:exportpost',1,1359111418,0),(597,1,3,'mod/forum:exportpost',1,1359111418,0),(598,1,1,'mod/forum:exportpost',1,1359111418,0),(599,1,4,'mod/forum:exportownpost',1,1359111418,0),(600,1,3,'mod/forum:exportownpost',1,1359111418,0),(601,1,1,'mod/forum:exportownpost',1,1359111418,0),(602,1,5,'mod/forum:exportownpost',1,1359111418,0),(603,1,4,'mod/forum:addquestion',1,1359111418,0),(604,1,3,'mod/forum:addquestion',1,1359111418,0),(605,1,1,'mod/forum:addquestion',1,1359111418,0),(606,1,5,'mod/forum:allowforcesubscribe',1,1359111418,0),(607,1,4,'mod/forum:allowforcesubscribe',1,1359111418,0),(608,1,3,'mod/forum:allowforcesubscribe',1,1359111418,0),(609,1,3,'mod/glossary:addinstance',1,1359111419,0),(610,1,1,'mod/glossary:addinstance',1,1359111419,0),(611,1,8,'mod/glossary:view',1,1359111419,0),(612,1,6,'mod/glossary:view',1,1359111419,0),(613,1,5,'mod/glossary:view',1,1359111419,0),(614,1,4,'mod/glossary:view',1,1359111419,0),(615,1,3,'mod/glossary:view',1,1359111419,0),(616,1,1,'mod/glossary:view',1,1359111419,0),(617,1,5,'mod/glossary:write',1,1359111419,0),(618,1,4,'mod/glossary:write',1,1359111419,0),(619,1,3,'mod/glossary:write',1,1359111419,0),(620,1,1,'mod/glossary:write',1,1359111419,0),(621,1,4,'mod/glossary:manageentries',1,1359111419,0),(622,1,3,'mod/glossary:manageentries',1,1359111419,0),(623,1,1,'mod/glossary:manageentries',1,1359111419,0),(624,1,4,'mod/glossary:managecategories',1,1359111419,0),(625,1,3,'mod/glossary:managecategories',1,1359111419,0),(626,1,1,'mod/glossary:managecategories',1,1359111419,0),(627,1,5,'mod/glossary:comment',1,1359111419,0),(628,1,4,'mod/glossary:comment',1,1359111419,0),(629,1,3,'mod/glossary:comment',1,1359111419,0),(630,1,1,'mod/glossary:comment',1,1359111419,0),(631,1,4,'mod/glossary:managecomments',1,1359111419,0),(632,1,3,'mod/glossary:managecomments',1,1359111419,0),(633,1,1,'mod/glossary:managecomments',1,1359111419,0),(634,1,4,'mod/glossary:import',1,1359111419,0),(635,1,3,'mod/glossary:import',1,1359111419,0),(636,1,1,'mod/glossary:import',1,1359111419,0),(637,1,4,'mod/glossary:export',1,1359111419,0),(638,1,3,'mod/glossary:export',1,1359111419,0),(639,1,1,'mod/glossary:export',1,1359111419,0),(640,1,4,'mod/glossary:approve',1,1359111419,0),(641,1,3,'mod/glossary:approve',1,1359111419,0),(642,1,1,'mod/glossary:approve',1,1359111419,0),(643,1,4,'mod/glossary:rate',1,1359111419,0),(644,1,3,'mod/glossary:rate',1,1359111419,0),(645,1,1,'mod/glossary:rate',1,1359111419,0),(646,1,4,'mod/glossary:viewrating',1,1359111419,0),(647,1,3,'mod/glossary:viewrating',1,1359111419,0),(648,1,1,'mod/glossary:viewrating',1,1359111419,0),(649,1,4,'mod/glossary:viewanyrating',1,1359111419,0),(650,1,3,'mod/glossary:viewanyrating',1,1359111419,0),(651,1,1,'mod/glossary:viewanyrating',1,1359111419,0),(652,1,4,'mod/glossary:viewallratings',1,1359111419,0),(653,1,3,'mod/glossary:viewallratings',1,1359111419,0),(654,1,1,'mod/glossary:viewallratings',1,1359111419,0),(655,1,4,'mod/glossary:exportentry',1,1359111419,0),(656,1,3,'mod/glossary:exportentry',1,1359111419,0),(657,1,1,'mod/glossary:exportentry',1,1359111419,0),(658,1,4,'mod/glossary:exportownentry',1,1359111419,0),(659,1,3,'mod/glossary:exportownentry',1,1359111419,0),(660,1,1,'mod/glossary:exportownentry',1,1359111419,0),(661,1,5,'mod/glossary:exportownentry',1,1359111419,0),(662,1,6,'mod/imscp:view',1,1359111419,0),(663,1,7,'mod/imscp:view',1,1359111419,0),(664,1,3,'mod/imscp:addinstance',1,1359111419,0),(665,1,1,'mod/imscp:addinstance',1,1359111419,0),(666,1,3,'mod/label:addinstance',1,1359111419,0),(667,1,1,'mod/label:addinstance',1,1359111419,0),(668,1,3,'mod/lesson:addinstance',1,1359111419,0),(669,1,1,'mod/lesson:addinstance',1,1359111419,0),(670,1,3,'mod/lesson:edit',1,1359111419,0),(671,1,1,'mod/lesson:edit',1,1359111419,0),(672,1,4,'mod/lesson:manage',1,1359111419,0),(673,1,3,'mod/lesson:manage',1,1359111419,0),(674,1,1,'mod/lesson:manage',1,1359111419,0),(675,1,6,'mod/lti:view',1,1359111419,0),(676,1,5,'mod/lti:view',1,1359111419,0),(677,1,4,'mod/lti:view',1,1359111419,0),(678,1,3,'mod/lti:view',1,1359111419,0),(679,1,1,'mod/lti:view',1,1359111419,0),(680,1,3,'mod/lti:addinstance',1,1359111419,0),(681,1,1,'mod/lti:addinstance',1,1359111419,0),(685,1,4,'mod/lti:manage',1,1359111419,0),(686,1,3,'mod/lti:manage',1,1359111419,0),(687,1,1,'mod/lti:manage',1,1359111419,0),(688,1,4,'mod/lti:addcoursetool',1,1359111419,0),(689,1,3,'mod/lti:addcoursetool',1,1359111419,0),(690,1,1,'mod/lti:addcoursetool',1,1359111419,0),(691,1,4,'mod/lti:requesttooladd',1,1359111419,0),(692,1,3,'mod/lti:requesttooladd',1,1359111419,0),(693,1,1,'mod/lti:requesttooladd',1,1359111419,0),(694,1,6,'mod/page:view',1,1359111419,0),(695,1,7,'mod/page:view',1,1359111419,0),(696,1,3,'mod/page:addinstance',1,1359111419,0),(697,1,1,'mod/page:addinstance',1,1359111419,0),(698,1,6,'mod/quiz:view',1,1359111420,0),(699,1,5,'mod/quiz:view',1,1359111420,0),(700,1,4,'mod/quiz:view',1,1359111420,0),(701,1,3,'mod/quiz:view',1,1359111420,0),(702,1,1,'mod/quiz:view',1,1359111420,0),(703,1,3,'mod/quiz:addinstance',1,1359111420,0),(704,1,1,'mod/quiz:addinstance',1,1359111420,0),(705,1,5,'mod/quiz:attempt',1,1359111420,0),(706,1,5,'mod/quiz:reviewmyattempts',1,1359111420,0),(707,1,3,'mod/quiz:manage',1,1359111420,0),(708,1,1,'mod/quiz:manage',1,1359111420,0),(709,1,3,'mod/quiz:manageoverrides',1,1359111420,0),(710,1,1,'mod/quiz:manageoverrides',1,1359111420,0),(711,1,4,'mod/quiz:preview',1,1359111420,0),(712,1,3,'mod/quiz:preview',1,1359111420,0),(713,1,1,'mod/quiz:preview',1,1359111420,0),(714,1,4,'mod/quiz:grade',1,1359111420,0),(715,1,3,'mod/quiz:grade',1,1359111420,0),(716,1,1,'mod/quiz:grade',1,1359111420,0),(717,1,4,'mod/quiz:regrade',1,1359111420,0),(718,1,3,'mod/quiz:regrade',1,1359111420,0),(719,1,1,'mod/quiz:regrade',1,1359111420,0),(720,1,4,'mod/quiz:viewreports',1,1359111420,0),(721,1,3,'mod/quiz:viewreports',1,1359111420,0),(722,1,1,'mod/quiz:viewreports',1,1359111420,0),(723,1,3,'mod/quiz:deleteattempts',1,1359111420,0),(724,1,1,'mod/quiz:deleteattempts',1,1359111420,0),(725,1,6,'mod/resource:view',1,1359111420,0),(726,1,7,'mod/resource:view',1,1359111420,0),(727,1,3,'mod/resource:addinstance',1,1359111420,0),(728,1,1,'mod/resource:addinstance',1,1359111420,0),(729,1,3,'mod/scorm:addinstance',1,1359111420,0),(730,1,1,'mod/scorm:addinstance',1,1359111420,0),(731,1,4,'mod/scorm:viewreport',1,1359111420,0),(732,1,3,'mod/scorm:viewreport',1,1359111420,0),(733,1,1,'mod/scorm:viewreport',1,1359111420,0),(734,1,5,'mod/scorm:skipview',1,1359111420,0),(735,1,5,'mod/scorm:savetrack',1,1359111420,0),(736,1,4,'mod/scorm:savetrack',1,1359111420,0),(737,1,3,'mod/scorm:savetrack',1,1359111420,0),(738,1,1,'mod/scorm:savetrack',1,1359111420,0),(739,1,5,'mod/scorm:viewscores',1,1359111420,0),(740,1,4,'mod/scorm:viewscores',1,1359111420,0),(741,1,3,'mod/scorm:viewscores',1,1359111420,0),(742,1,1,'mod/scorm:viewscores',1,1359111420,0),(743,1,4,'mod/scorm:deleteresponses',1,1359111420,0),(744,1,3,'mod/scorm:deleteresponses',1,1359111420,0),(745,1,1,'mod/scorm:deleteresponses',1,1359111420,0),(746,1,3,'mod/survey:addinstance',1,1359111420,0),(747,1,1,'mod/survey:addinstance',1,1359111420,0),(748,1,5,'mod/survey:participate',1,1359111420,0),(749,1,4,'mod/survey:participate',1,1359111420,0),(750,1,3,'mod/survey:participate',1,1359111420,0),(751,1,1,'mod/survey:participate',1,1359111420,0),(752,1,4,'mod/survey:readresponses',1,1359111420,0),(753,1,3,'mod/survey:readresponses',1,1359111420,0),(754,1,1,'mod/survey:readresponses',1,1359111420,0),(755,1,4,'mod/survey:download',1,1359111420,0),(756,1,3,'mod/survey:download',1,1359111420,0),(757,1,1,'mod/survey:download',1,1359111420,0),(758,1,6,'mod/url:view',1,1359111420,0),(759,1,7,'mod/url:view',1,1359111420,0),(760,1,3,'mod/url:addinstance',1,1359111420,0),(761,1,1,'mod/url:addinstance',1,1359111420,0),(762,1,3,'mod/wiki:addinstance',1,1359111421,0),(763,1,1,'mod/wiki:addinstance',1,1359111421,0),(764,1,6,'mod/wiki:viewpage',1,1359111421,0),(765,1,5,'mod/wiki:viewpage',1,1359111421,0),(766,1,4,'mod/wiki:viewpage',1,1359111421,0),(767,1,3,'mod/wiki:viewpage',1,1359111421,0),(768,1,1,'mod/wiki:viewpage',1,1359111421,0),(769,1,5,'mod/wiki:editpage',1,1359111421,0),(770,1,4,'mod/wiki:editpage',1,1359111421,0),(771,1,3,'mod/wiki:editpage',1,1359111421,0),(772,1,1,'mod/wiki:editpage',1,1359111421,0),(773,1,5,'mod/wiki:createpage',1,1359111421,0),(774,1,4,'mod/wiki:createpage',1,1359111421,0),(775,1,3,'mod/wiki:createpage',1,1359111421,0),(776,1,1,'mod/wiki:createpage',1,1359111421,0),(777,1,5,'mod/wiki:viewcomment',1,1359111421,0),(778,1,4,'mod/wiki:viewcomment',1,1359111421,0),(779,1,3,'mod/wiki:viewcomment',1,1359111421,0),(780,1,1,'mod/wiki:viewcomment',1,1359111421,0),(781,1,5,'mod/wiki:editcomment',1,1359111421,0),(782,1,4,'mod/wiki:editcomment',1,1359111421,0),(783,1,3,'mod/wiki:editcomment',1,1359111421,0),(784,1,1,'mod/wiki:editcomment',1,1359111421,0),(785,1,4,'mod/wiki:managecomment',1,1359111421,0),(786,1,3,'mod/wiki:managecomment',1,1359111421,0),(787,1,1,'mod/wiki:managecomment',1,1359111421,0),(788,1,4,'mod/wiki:managefiles',1,1359111421,0),(789,1,3,'mod/wiki:managefiles',1,1359111421,0),(790,1,1,'mod/wiki:managefiles',1,1359111421,0),(791,1,4,'mod/wiki:overridelock',1,1359111421,0),(792,1,3,'mod/wiki:overridelock',1,1359111421,0),(793,1,1,'mod/wiki:overridelock',1,1359111421,0),(794,1,4,'mod/wiki:managewiki',1,1359111421,0),(795,1,3,'mod/wiki:managewiki',1,1359111421,0),(796,1,1,'mod/wiki:managewiki',1,1359111421,0),(797,1,6,'mod/workshop:view',1,1359111421,0),(798,1,5,'mod/workshop:view',1,1359111421,0),(799,1,4,'mod/workshop:view',1,1359111421,0),(800,1,3,'mod/workshop:view',1,1359111421,0),(801,1,1,'mod/workshop:view',1,1359111421,0),(802,1,3,'mod/workshop:addinstance',1,1359111421,0),(803,1,1,'mod/workshop:addinstance',1,1359111421,0),(804,1,4,'mod/workshop:switchphase',1,1359111421,0),(805,1,3,'mod/workshop:switchphase',1,1359111421,0),(806,1,1,'mod/workshop:switchphase',1,1359111421,0),(807,1,3,'mod/workshop:editdimensions',1,1359111421,0),(808,1,1,'mod/workshop:editdimensions',1,1359111421,0),(809,1,5,'mod/workshop:submit',1,1359111421,0),(810,1,5,'mod/workshop:peerassess',1,1359111421,0),(811,1,4,'mod/workshop:manageexamples',1,1359111421,0),(812,1,3,'mod/workshop:manageexamples',1,1359111421,0),(813,1,1,'mod/workshop:manageexamples',1,1359111421,0),(814,1,4,'mod/workshop:allocate',1,1359111421,0),(815,1,3,'mod/workshop:allocate',1,1359111421,0),(816,1,1,'mod/workshop:allocate',1,1359111421,0),(817,1,4,'mod/workshop:publishsubmissions',1,1359111421,0),(818,1,3,'mod/workshop:publishsubmissions',1,1359111421,0),(819,1,1,'mod/workshop:publishsubmissions',1,1359111421,0),(820,1,5,'mod/workshop:viewauthornames',1,1359111421,0),(821,1,4,'mod/workshop:viewauthornames',1,1359111421,0),(822,1,3,'mod/workshop:viewauthornames',1,1359111421,0),(823,1,1,'mod/workshop:viewauthornames',1,1359111421,0),(824,1,4,'mod/workshop:viewreviewernames',1,1359111421,0),(825,1,3,'mod/workshop:viewreviewernames',1,1359111421,0),(826,1,1,'mod/workshop:viewreviewernames',1,1359111421,0),(827,1,4,'mod/workshop:viewallsubmissions',1,1359111421,0),(828,1,3,'mod/workshop:viewallsubmissions',1,1359111421,0),(829,1,1,'mod/workshop:viewallsubmissions',1,1359111421,0),(830,1,5,'mod/workshop:viewpublishedsubmissions',1,1359111421,0),(831,1,4,'mod/workshop:viewpublishedsubmissions',1,1359111421,0),(832,1,3,'mod/workshop:viewpublishedsubmissions',1,1359111421,0),(833,1,1,'mod/workshop:viewpublishedsubmissions',1,1359111421,0),(834,1,5,'mod/workshop:viewauthorpublished',1,1359111421,0),(835,1,4,'mod/workshop:viewauthorpublished',1,1359111421,0),(836,1,3,'mod/workshop:viewauthorpublished',1,1359111421,0),(837,1,1,'mod/workshop:viewauthorpublished',1,1359111421,0),(838,1,4,'mod/workshop:viewallassessments',1,1359111421,0),(839,1,3,'mod/workshop:viewallassessments',1,1359111421,0),(840,1,1,'mod/workshop:viewallassessments',1,1359111421,0),(841,1,4,'mod/workshop:overridegrades',1,1359111421,0),(842,1,3,'mod/workshop:overridegrades',1,1359111421,0),(843,1,1,'mod/workshop:overridegrades',1,1359111421,0),(844,1,4,'mod/workshop:ignoredeadlines',1,1359111421,0),(845,1,3,'mod/workshop:ignoredeadlines',1,1359111421,0),(846,1,1,'mod/workshop:ignoredeadlines',1,1359111421,0),(853,1,3,'enrol/cohort:config',1,1359111422,0),(854,1,1,'enrol/cohort:config',1,1359111422,0),(855,1,1,'enrol/cohort:unenrol',1,1359111422,0),(856,1,1,'enrol/database:unenrol',1,1359111422,0),(857,1,1,'enrol/guest:config',1,1359111422,0),(858,1,3,'enrol/guest:config',1,1359111422,0),(859,1,1,'enrol/ldap:manage',1,1359111422,0),(860,1,1,'enrol/manual:config',1,1359111423,0),(861,1,1,'enrol/manual:enrol',1,1359111423,0),(862,1,3,'enrol/manual:enrol',1,1359111423,0),(863,1,1,'enrol/manual:manage',1,1359111423,0),(864,1,3,'enrol/manual:manage',1,1359111423,0),(865,1,1,'enrol/manual:unenrol',1,1359111423,0),(866,1,3,'enrol/manual:unenrol',1,1359111423,0),(867,1,1,'enrol/meta:config',1,1359111423,0),(868,1,3,'enrol/meta:config',1,1359111423,0),(869,1,1,'enrol/meta:selectaslinked',1,1359111423,0),(870,1,1,'enrol/meta:unenrol',1,1359111423,0),(871,1,1,'enrol/paypal:config',1,1359111423,0),(872,1,1,'enrol/paypal:manage',1,1359111423,0),(873,1,3,'enrol/paypal:manage',1,1359111423,0),(874,1,1,'enrol/paypal:unenrol',1,1359111423,0),(875,1,3,'enrol/self:config',1,1359111423,0),(876,1,1,'enrol/self:config',1,1359111423,0),(877,1,3,'enrol/self:manage',1,1359111423,0),(878,1,1,'enrol/self:manage',1,1359111423,0),(879,1,5,'enrol/self:unenrolself',1,1359111423,0),(880,1,3,'enrol/self:unenrol',1,1359111423,0),(881,1,1,'enrol/self:unenrol',1,1359111423,0),(882,1,3,'block/activity_modules:addinstance',1,1359111423,0),(883,1,1,'block/activity_modules:addinstance',1,1359111423,0),(884,1,7,'block/admin_bookmarks:myaddinstance',1,1359111423,0),(885,1,3,'block/admin_bookmarks:addinstance',1,1359111423,0),(886,1,1,'block/admin_bookmarks:addinstance',1,1359111423,0),(887,1,3,'block/blog_menu:addinstance',1,1359111423,0),(888,1,1,'block/blog_menu:addinstance',1,1359111423,0),(889,1,3,'block/blog_recent:addinstance',1,1359111423,0),(890,1,1,'block/blog_recent:addinstance',1,1359111423,0),(891,1,3,'block/blog_tags:addinstance',1,1359111423,0),(892,1,1,'block/blog_tags:addinstance',1,1359111423,0),(893,1,7,'block/calendar_month:myaddinstance',1,1359111423,0),(894,1,3,'block/calendar_month:addinstance',1,1359111423,0),(895,1,1,'block/calendar_month:addinstance',1,1359111423,0),(896,1,7,'block/calendar_upcoming:myaddinstance',1,1359111423,0),(897,1,3,'block/calendar_upcoming:addinstance',1,1359111423,0),(898,1,1,'block/calendar_upcoming:addinstance',1,1359111423,0),(899,1,7,'block/comments:myaddinstance',1,1359111423,0),(900,1,3,'block/comments:addinstance',1,1359111423,0),(901,1,1,'block/comments:addinstance',1,1359111423,0),(902,1,7,'block/community:myaddinstance',1,1359111423,0),(903,1,3,'block/community:addinstance',1,1359111423,0),(904,1,1,'block/community:addinstance',1,1359111423,0),(905,1,3,'block/completionstatus:addinstance',1,1359111423,0),(906,1,1,'block/completionstatus:addinstance',1,1359111423,0),(907,1,7,'block/course_list:myaddinstance',1,1359111424,0),(908,1,3,'block/course_list:addinstance',1,1359111424,0),(909,1,1,'block/course_list:addinstance',1,1359111424,0),(910,1,7,'block/course_overview:myaddinstance',1,1359111424,0),(911,1,3,'block/course_summary:addinstance',1,1359111424,0),(912,1,1,'block/course_summary:addinstance',1,1359111424,0),(913,1,3,'block/feedback:addinstance',1,1359111424,0),(914,1,1,'block/feedback:addinstance',1,1359111424,0),(915,1,3,'block/glossary_random:addinstance',1,1359111424,0),(916,1,1,'block/glossary_random:addinstance',1,1359111424,0),(917,1,7,'block/html:myaddinstance',1,1359111424,0),(918,1,3,'block/html:addinstance',1,1359111424,0),(919,1,1,'block/html:addinstance',1,1359111424,0),(920,1,3,'block/login:addinstance',1,1359111424,0),(921,1,1,'block/login:addinstance',1,1359111424,0),(922,1,3,'block/mentees:addinstance',1,1359111424,0),(923,1,1,'block/mentees:addinstance',1,1359111424,0),(924,1,7,'block/messages:myaddinstance',1,1359111424,0),(925,1,3,'block/messages:addinstance',1,1359111424,0),(926,1,1,'block/messages:addinstance',1,1359111424,0),(927,1,7,'block/mnet_hosts:myaddinstance',1,1359111424,0),(928,1,3,'block/mnet_hosts:addinstance',1,1359111424,0),(929,1,1,'block/mnet_hosts:addinstance',1,1359111424,0),(930,1,7,'block/myprofile:myaddinstance',1,1359111424,0),(931,1,3,'block/myprofile:addinstance',1,1359111424,0),(932,1,1,'block/myprofile:addinstance',1,1359111424,0),(933,1,7,'block/navigation:myaddinstance',1,1359111424,0),(934,1,3,'block/navigation:addinstance',1,1359111424,0),(935,1,1,'block/navigation:addinstance',1,1359111424,0),(936,1,3,'block/news_items:addinstance',1,1359111424,0),(937,1,1,'block/news_items:addinstance',1,1359111424,0),(938,1,3,'block/online_users:addinstance',1,1359111424,0),(939,1,1,'block/online_users:addinstance',1,1359111424,0),(940,1,7,'block/online_users:viewlist',1,1359111424,0),(941,1,6,'block/online_users:viewlist',1,1359111424,0),(942,1,5,'block/online_users:viewlist',1,1359111424,0),(943,1,4,'block/online_users:viewlist',1,1359111424,0),(944,1,3,'block/online_users:viewlist',1,1359111424,0),(945,1,1,'block/online_users:viewlist',1,1359111424,0),(946,1,3,'block/participants:addinstance',1,1359111424,0),(947,1,1,'block/participants:addinstance',1,1359111424,0),(948,1,7,'block/private_files:myaddinstance',1,1359111424,0),(949,1,3,'block/private_files:addinstance',1,1359111424,0),(950,1,1,'block/private_files:addinstance',1,1359111424,0),(951,1,3,'block/quiz_results:addinstance',1,1359111424,0),(952,1,1,'block/quiz_results:addinstance',1,1359111424,0),(953,1,3,'block/recent_activity:addinstance',1,1359111424,0),(954,1,1,'block/recent_activity:addinstance',1,1359111424,0),(955,1,7,'block/rss_client:myaddinstance',1,1359111424,0),(956,1,3,'block/rss_client:addinstance',1,1359111424,0),(957,1,1,'block/rss_client:addinstance',1,1359111424,0),(958,1,4,'block/rss_client:manageownfeeds',1,1359111424,0),(959,1,3,'block/rss_client:manageownfeeds',1,1359111424,0),(960,1,1,'block/rss_client:manageownfeeds',1,1359111424,0),(961,1,1,'block/rss_client:manageanyfeeds',1,1359111424,0),(962,1,3,'block/search_forums:addinstance',1,1359111424,0),(963,1,1,'block/search_forums:addinstance',1,1359111424,0),(964,1,3,'block/section_links:addinstance',1,1359111424,0),(965,1,1,'block/section_links:addinstance',1,1359111424,0),(966,1,3,'block/selfcompletion:addinstance',1,1359111424,0),(967,1,1,'block/selfcompletion:addinstance',1,1359111424,0),(968,1,7,'block/settings:myaddinstance',1,1359111424,0),(969,1,3,'block/settings:addinstance',1,1359111424,0),(970,1,1,'block/settings:addinstance',1,1359111424,0),(971,1,3,'block/site_main_menu:addinstance',1,1359111424,0),(972,1,1,'block/site_main_menu:addinstance',1,1359111424,0),(973,1,3,'block/social_activities:addinstance',1,1359111424,0),(974,1,1,'block/social_activities:addinstance',1,1359111424,0),(975,1,3,'block/tag_flickr:addinstance',1,1359111425,0),(976,1,1,'block/tag_flickr:addinstance',1,1359111425,0),(977,1,3,'block/tag_youtube:addinstance',1,1359111425,0),(978,1,1,'block/tag_youtube:addinstance',1,1359111425,0),(979,1,7,'block/tags:myaddinstance',1,1359111425,0),(980,1,3,'block/tags:addinstance',1,1359111425,0),(981,1,1,'block/tags:addinstance',1,1359111425,0),(982,1,4,'report/completion:view',1,1359111426,0),(983,1,3,'report/completion:view',1,1359111426,0),(984,1,1,'report/completion:view',1,1359111426,0),(985,1,4,'report/courseoverview:view',1,1359111426,0),(986,1,3,'report/courseoverview:view',1,1359111426,0),(987,1,1,'report/courseoverview:view',1,1359111426,0),(988,1,4,'report/log:view',1,1359111426,0),(989,1,3,'report/log:view',1,1359111426,0),(990,1,1,'report/log:view',1,1359111426,0),(991,1,4,'report/log:viewtoday',1,1359111426,0),(992,1,3,'report/log:viewtoday',1,1359111426,0),(993,1,1,'report/log:viewtoday',1,1359111426,0),(994,1,4,'report/loglive:view',1,1359111426,0),(995,1,3,'report/loglive:view',1,1359111426,0),(996,1,1,'report/loglive:view',1,1359111426,0),(997,1,4,'report/outline:view',1,1359111426,0),(998,1,3,'report/outline:view',1,1359111426,0),(999,1,1,'report/outline:view',1,1359111426,0),(1000,1,4,'report/participation:view',1,1359111426,0),(1001,1,3,'report/participation:view',1,1359111426,0),(1002,1,1,'report/participation:view',1,1359111426,0),(1003,1,4,'report/progress:view',1,1359111426,0),(1004,1,3,'report/progress:view',1,1359111426,0),(1005,1,1,'report/progress:view',1,1359111426,0),(1006,1,1,'report/security:view',1,1359111426,0),(1007,1,4,'report/stats:view',1,1359111426,0),(1008,1,3,'report/stats:view',1,1359111426,0),(1009,1,1,'report/stats:view',1,1359111426,0),(1010,1,4,'gradeexport/ods:view',1,1359111426,0),(1011,1,3,'gradeexport/ods:view',1,1359111426,0),(1012,1,1,'gradeexport/ods:view',1,1359111426,0),(1013,1,1,'gradeexport/ods:publish',1,1359111426,0),(1014,1,4,'gradeexport/txt:view',1,1359111426,0),(1015,1,3,'gradeexport/txt:view',1,1359111426,0),(1016,1,1,'gradeexport/txt:view',1,1359111426,0),(1017,1,1,'gradeexport/txt:publish',1,1359111426,0),(1018,1,4,'gradeexport/xls:view',1,1359111426,0),(1019,1,3,'gradeexport/xls:view',1,1359111426,0),(1020,1,1,'gradeexport/xls:view',1,1359111426,0),(1021,1,1,'gradeexport/xls:publish',1,1359111426,0),(1022,1,4,'gradeexport/xml:view',1,1359111426,0),(1023,1,3,'gradeexport/xml:view',1,1359111426,0),(1024,1,1,'gradeexport/xml:view',1,1359111426,0),(1025,1,1,'gradeexport/xml:publish',1,1359111426,0),(1026,1,3,'gradeimport/csv:view',1,1359111426,0),(1027,1,1,'gradeimport/csv:view',1,1359111426,0),(1028,1,3,'gradeimport/xml:view',1,1359111426,0),(1029,1,1,'gradeimport/xml:view',1,1359111426,0),(1030,1,1,'gradeimport/xml:publish',1,1359111426,0),(1031,1,4,'gradereport/grader:view',1,1359111426,0),(1032,1,3,'gradereport/grader:view',1,1359111426,0),(1033,1,1,'gradereport/grader:view',1,1359111426,0),(1034,1,4,'gradereport/outcomes:view',1,1359111426,0),(1035,1,3,'gradereport/outcomes:view',1,1359111426,0),(1036,1,1,'gradereport/outcomes:view',1,1359111426,0),(1037,1,5,'gradereport/overview:view',1,1359111426,0),(1038,1,1,'gradereport/overview:view',1,1359111426,0),(1039,1,5,'gradereport/user:view',1,1359111426,0),(1040,1,4,'gradereport/user:view',1,1359111426,0),(1041,1,3,'gradereport/user:view',1,1359111426,0),(1042,1,1,'gradereport/user:view',1,1359111426,0),(1043,1,7,'repository/alfresco:view',1,1359111427,0),(1044,1,7,'repository/boxnet:view',1,1359111427,0),(1045,1,2,'repository/coursefiles:view',1,1359111427,0),(1046,1,4,'repository/coursefiles:view',1,1359111427,0),(1047,1,3,'repository/coursefiles:view',1,1359111427,0),(1048,1,1,'repository/coursefiles:view',1,1359111427,0),(1049,1,7,'repository/-- DROPbox:view',1,1359111427,0),(1050,1,7,'repository/equella:view',1,1359111427,0),(1051,1,2,'repository/filesystem:view',1,1359111427,0),(1052,1,4,'repository/filesystem:view',1,1359111427,0),(1053,1,3,'repository/filesystem:view',1,1359111427,0),(1054,1,1,'repository/filesystem:view',1,1359111427,0),(1055,1,7,'repository/flickr:view',1,1359111427,0),(1056,1,7,'repository/flickr_public:view',1,1359111427,0),(1057,1,7,'repository/googledocs:view',1,1359111427,0),(1058,1,2,'repository/local:view',1,1359111427,0),(1059,1,4,'repository/local:view',1,1359111427,0),(1060,1,3,'repository/local:view',1,1359111427,0),(1061,1,1,'repository/local:view',1,1359111427,0),(1062,1,7,'repository/merlot:view',1,1359111427,0),(1063,1,7,'repository/picasa:view',1,1359111427,0),(1064,1,7,'repository/recent:view',1,1359111427,0),(1065,1,7,'repository/s3:view',1,1359111427,0),(1066,1,7,'repository/upload:view',1,1359111427,0),(1067,1,7,'repository/url:view',1,1359111427,0),(1068,1,7,'repository/user:view',1,1359111427,0),(1069,1,2,'repository/webdav:view',1,1359111427,0),(1070,1,4,'repository/webdav:view',1,1359111428,0),(1071,1,3,'repository/webdav:view',1,1359111428,0),(1072,1,1,'repository/webdav:view',1,1359111428,0),(1073,1,7,'repository/wikimedia:view',1,1359111428,0),(1074,1,7,'repository/youtube:view',1,1359111428,0),(1075,1,1,'tool/customlang:view',1,1359111429,0),(1076,1,1,'tool/customlang:edit',1,1359111429,0),(1077,1,3,'booktool/importhtml:import',1,1359111431,0),(1078,1,1,'booktool/importhtml:import',1,1359111431,0),(1079,1,6,'booktool/print:print',1,1359111431,0),(1080,1,8,'booktool/print:print',1,1359111431,0),(1081,1,5,'booktool/print:print',1,1359111431,0),(1082,1,4,'booktool/print:print',1,1359111431,0),(1083,1,3,'booktool/print:print',1,1359111431,0),(1084,1,1,'booktool/print:print',1,1359111431,0),(1085,1,4,'quiz/grading:viewstudentnames',1,1359111431,0),(1086,1,3,'quiz/grading:viewstudentnames',1,1359111431,0),(1087,1,1,'quiz/grading:viewstudentnames',1,1359111431,0),(1088,1,4,'quiz/grading:viewidnumber',1,1359111431,0),(1089,1,3,'quiz/grading:viewidnumber',1,1359111431,0),(1090,1,1,'quiz/grading:viewidnumber',1,1359111431,0),(1091,1,4,'quiz/statistics:view',1,1359111431,0),(1092,1,3,'quiz/statistics:view',1,1359111431,0),(1093,1,1,'quiz/statistics:view',1,1359111431,0),(1094,1,1,'moodle/user:viewlastip',1,1417538688,0),(1095,1,3,'moodle/course:reviewotherusers',1,1417538688,0),(1096,1,1,'moodle/course:reviewotherusers',1,1417538688,0),(1097,1,3,'moodle/course:viewsuspendedusers',1,1417538688,0),(1098,1,1,'moodle/course:viewsuspendedusers',1,1417538688,0),(1099,1,1,'moodle/badges:manageglobalsettings',1,1417538688,0),(1100,1,7,'moodle/badges:viewbadges',1,1417538688,0),(1101,1,7,'moodle/badges:manageownbadges',1,1417538688,0),(1102,1,7,'moodle/badges:viewotherbadges',1,1417538688,0),(1103,1,7,'moodle/badges:earnbadge',1,1417538688,0),(1104,1,1,'moodle/badges:createbadge',1,1417538688,0),(1105,1,3,'moodle/badges:createbadge',1,1417538688,0),(1106,1,1,'moodle/badges:deletebadge',1,1417538688,0),(1107,1,3,'moodle/badges:deletebadge',1,1417538688,0),(1108,1,1,'moodle/badges:configuredetails',1,1417538688,0),(1109,1,3,'moodle/badges:configuredetails',1,1417538688,0),(1110,1,1,'moodle/badges:configurecriteria',1,1417538688,0),(1111,1,3,'moodle/badges:configurecriteria',1,1417538688,0),(1112,1,1,'moodle/badges:configuremessages',1,1417538688,0),(1113,1,3,'moodle/badges:configuremessages',1,1417538688,0),(1114,1,1,'moodle/badges:awardbadge',1,1417538688,0),(1115,1,4,'moodle/badges:awardbadge',1,1417538688,0),(1116,1,3,'moodle/badges:awardbadge',1,1417538688,0),(1117,1,1,'moodle/badges:viewawarded',1,1417538688,0),(1118,1,4,'moodle/badges:viewawarded',1,1417538688,0),(1119,1,3,'moodle/badges:viewawarded',1,1417538688,0),(1120,1,3,'mod/assign:reviewgrades',1,1417538690,0),(1121,1,1,'mod/assign:reviewgrades',1,1417538690,0),(1122,1,3,'mod/assign:releasegrades',1,1417538690,0),(1123,1,1,'mod/assign:releasegrades',1,1417538690,0),(1124,1,3,'mod/assign:managegrades',1,1417538690,0),(1125,1,1,'mod/assign:managegrades',1,1417538690,0),(1126,1,3,'mod/assign:manageallocations',1,1417538690,0),(1127,1,1,'mod/assign:manageallocations',1,1417538690,0),(1128,1,3,'mod/assign:viewgrades',1,1417538690,0),(1129,1,1,'mod/assign:viewgrades',1,1417538690,0),(1130,1,4,'mod/assign:viewgrades',1,1417538690,0),(1131,1,1,'mod/assign:viewblinddetails',1,1417538690,0),(1132,1,4,'mod/assign:receivegradernotifications',1,1417538690,0),(1133,1,3,'mod/assign:receivegradernotifications',1,1417538690,0),(1134,1,1,'mod/assign:receivegradernotifications',1,1417538690,0),(1135,1,8,'mod/forum:allowforcesubscribe',1,1417538691,0),(1136,1,4,'mod/lesson:grade',1,1417538691,0),(1137,1,3,'mod/lesson:grade',1,1417538691,0),(1138,1,1,'mod/lesson:grade',1,1417538691,0),(1139,1,1,'enrol/category:config',1,1417538693,0),(1140,1,3,'enrol/category:config',1,1417538693,0),(1141,1,1,'enrol/database:config',1,1417538693,0),(1142,1,3,'enrol/database:config',1,1417538693,0),(1143,1,1,'enrol/imsenterprise:config',1,1417538693,0),(1144,1,3,'enrol/imsenterprise:config',1,1417538693,0),(1145,1,1,'enrol/mnet:config',1,1417538693,0),(1146,1,3,'enrol/mnet:config',1,1417538693,0),(1147,1,7,'message/airnotifier:managedevice',1,1417538693,0),(1148,1,3,'block/badges:addinstance',1,1417538694,0),(1149,1,1,'block/badges:addinstance',1,1417538694,0),(1150,1,7,'block/badges:myaddinstance',1,1417538694,0),(1151,1,3,'block/course_overview:addinstance',1,1417538694,0),(1152,1,1,'block/course_overview:addinstance',1,1417538694,0),(1153,1,7,'block/glossary_random:myaddinstance',1,1417538694,0),(1154,1,7,'block/mentees:myaddinstance',1,1417538694,0),(1155,1,7,'block/news_items:myaddinstance',1,1417538694,0),(1156,1,7,'block/online_users:myaddinstance',1,1417538694,0),(1157,1,7,'block/recent_activity:viewaddupdatemodule',1,1417538694,0),(1158,1,7,'block/recent_activity:viewdeletemodule',1,1417538694,0),(1159,1,1,'report/performance:view',1,1417538696,0),(1160,1,3,'gradeimport/direct:view',1,1417538696,0),(1161,1,1,'gradeimport/direct:view',1,1417538696,0),(1162,1,4,'gradereport/history:view',1,1417538696,0),(1163,1,3,'gradereport/history:view',1,1417538696,0),(1164,1,1,'gradereport/history:view',1,1417538696,0),(1165,1,3,'gradereport/singleview:view',1,1417538696,0),(1166,1,1,'gradereport/singleview:view',1,1417538696,0),(1167,1,7,'repository/areafiles:view',1,1417538697,0),(1168,1,7,'repository/dropbox:view',1,1417538697,0),(1169,1,7,'repository/skydrive:view',1,1417538697,0),(1170,1,4,'tool/monitor:subscribe',1,1417538699,0),(1171,1,3,'tool/monitor:subscribe',1,1417538699,0),(1172,1,1,'tool/monitor:subscribe',1,1417538699,0),(1173,1,4,'tool/monitor:managerules',1,1417538699,0),(1174,1,3,'tool/monitor:managerules',1,1417538699,0),(1175,1,1,'tool/monitor:managerules',1,1417538699,0),(1176,1,1,'tool/monitor:managetool',1,1417538699,0),(1177,1,1,'tool/uploaduser:uploaduserpictures',1,1417538699,0);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_context_levels`
--

DROP TABLE IF EXISTS `mdl_role_context_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_context_levels`
--

LOCK TABLES `mdl_role_context_levels` WRITE;
/*!40000 ALTER TABLE `mdl_role_context_levels` DISABLE KEYS */;
INSERT INTO `mdl_role_context_levels` VALUES (1,1,10),(4,2,10),(2,1,40),(5,2,40),(3,1,50),(6,3,50),(8,4,50),(10,5,50),(7,3,70),(9,4,70),(11,5,70);
/*!40000 ALTER TABLE `mdl_role_context_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_names`
--

LOCK TABLES `mdl_role_names` WRITE;
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_sortorder`
--

LOCK TABLES `mdl_role_sortorder` WRITE;
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale`
--

LOCK TABLES `mdl_scale` WRITE;
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale_history`
--

LOCK TABLES `mdl_scale_history` WRITE;
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm`
--

LOCK TABLES `mdl_scorm` WRITE;
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_aicc_session`
--

DROP TABLE IF EXISTS `mdl_scorm_aicc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_aicc_session`
--

LOCK TABLES `mdl_scorm_aicc_session` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes`
--

LOCK TABLES `mdl_scorm_scoes` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_data`
--

LOCK TABLES `mdl_scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_track`
--

LOCK TABLES `mdl_scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_mapinfo`
--

LOCK TABLES `mdl_scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_objective`
--

LOCK TABLES `mdl_scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprule`
--

LOCK TABLES `mdl_scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprulecond`
--

LOCK TABLES `mdl_scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rulecond`
--

LOCK TABLES `mdl_scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_ruleconds`
--

LOCK TABLES `mdl_scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sessions`
--

DROP TABLE IF EXISTS `mdl_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_sessions`
--

LOCK TABLES `mdl_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_sessions` DISABLE KEYS */;
INSERT INTO `mdl_sessions` VALUES (1,0,'r1p9jo3ejsm5buvij7mbc77tt3',0,'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjozOntzOjQ6ImxhbmciO3M6MjoiZW4iO3M6ODoibmF2Y2FjaGUiO086ODoic3RkQ2xhc3MiOjA6e31zOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6Nzp7czoyOiJpZCI7aTowO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo3OiJzZXNza2V5IjtzOjEwOiJuWkw1V09xbDhjIjtzOjEwOiJwcmVmZXJlbmNlIjthOjA6e31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjY6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjt9czo2OiJhY2Nlc3MiO2E6Nzp7czoyOiJyYSI7YToxOntzOjI6Ii8xIjthOjE6e2k6NjtpOjY7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo2IjthOjI2OntzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO2k6MTtzOjIwOiJib29rdG9vbC9wcmludDpwcmludCI7aToxO3M6MTU6Im1vZC9hc3NpZ246dmlldyI7aToxO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO2k6MTtzOjEzOiJtb2QvYm9vazpyZWFkIjtpOjE7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtpOjE7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO2k6MTtzOjE1OiJtb2QvZm9sZGVyOnZpZXciO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjE3OiJtb2QvZ2xvc3Nhcnk6dmlldyI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMjoibW9kL2x0aTp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTM6Im1vZC9xdWl6OnZpZXciO2k6MTtzOjE3OiJtb2QvcmVzb3VyY2U6dmlldyI7aToxO3M6MTI6Im1vZC91cmw6dmlldyI7aToxO3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtpOjE7czoxNzoibW9kL3dvcmtzaG9wOnZpZXciO2k6MTtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO2k6LTEwMDA7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOi0xMDAwO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtpOi0xMDAwO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtpOjE7fX1zOjEwOiJyZGVmX2NvdW50IjtpOjE7czo4OiJyZGVmX2xjYyI7aToxO3M6NjoibG9hZGVkIjthOjE6e2k6MTtpOjE7fXM6NDoidGltZSI7aToxMzU5MTExNzAxO3M6MzoicnN3IjthOjA6e319czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fX0=',1359111701,1359111701,'9.152.235.216','9.152.235.216'),(4,0,'s64pdrjj0demgj77vut4vunn14',2,'VVNFUnxPOjg6InN0ZENsYXNzIjo1OTp7czoyOiJpZCI7czoxOiIyIjtzOjQ6ImF1dGgiO3M6NjoibWFudWFsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo5OiJhZG1pblVzZXIiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo1OiJBZG1pbiI7czo4OiJsYXN0bmFtZSI7czo0OiJVc2VyIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo5OiJlbWFpbHN0b3AiO3M6MToiMCI7czozOiJpY3EiO3M6MDoiIjtzOjU6InNreXBlIjtzOjA6IiI7czo1OiJ5YWhvbyI7czowOiIiO3M6MzoiYWltIjtzOjA6IiI7czozOiJtc24iO3M6MDoiIjtzOjY6InBob25lMSI7czowOiIiO3M6NjoicGhvbmUyIjtzOjA6IiI7czoxMToiaW5zdGl0dXRpb24iO3M6MDoiIjtzOjEwOiJkZXBhcnRtZW50IjtzOjA6IiI7czo3OiJhZGRyZXNzIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO2k6MTQxNzUzODgzMjtzOjEwOiJsYXN0YWNjZXNzIjtpOjE0MTc1Mzg4MzI7czo5OiJsYXN0bG9naW4iO3M6MToiMCI7czoxMjoiY3VycmVudGxvZ2luIjtpOjE0MTc1Mzg4MzI7czo2OiJsYXN0aXAiO3M6MTQ6IjEyOS42OS4yMTAuMTU4IjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjE6IjAiO3M6MTI6InRpbWVtb2RpZmllZCI7czoxMDoiMTM1OTExMTQxMyI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxNjoibGFzdG5hbWVwaG9uZXRpYyI7TjtzOjE3OiJmaXJzdG5hbWVwaG9uZXRpYyI7TjtzOjEwOiJtaWRkbGVuYW1lIjtOO3M6MTM6ImFsdGVybmF0ZW5hbWUiO047czoxMjoiY2FsZW5kYXJ0eXBlIjtzOjk6ImdyZWdvcmlhbiI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YTowOnt9czoxOToiY3VycmVudGNvdXJzZWFjY2VzcyI7YTowOnt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YTowOnt9czo3OiJzZXNza2V5IjtzOjEwOiJkRktnTWZUTDdTIjtzOjEwOiJwcmVmZXJlbmNlIjthOjI6e3M6MzI6ImxvZ2luX2ZhaWxlZF9jb3VudF9zaW5jZV9zdWNjZXNzIjtzOjE6IjEiO3M6MTE6Il9sYXN0bG9hZGVkIjtpOjE0MTc1Mzg4MzU7fXM6MTc6Im1lc3NhZ2VfbGFzdHBvcHVwIjtpOjA7czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo3OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNWhpZGRlbiI7czo0OiJib29sIjtzOjI3OiJmaWxlcGlja2VyX3JlY2VudHJlcG9zaXRvcnkiO3M6MzoiaW50IjtzOjI0OiJmaWxlcGlja2VyX3JlY2VudGxpY2Vuc2UiO3M6Nzoic2FmZWRpciI7czoyNToiZmlsZXBpY2tlcl9yZWNlbnR2aWV3bW9kZSI7czozOiJpbnQiO319U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo0OntzOjE4OiJjYWNoZXN0b3JlX3Nlc3Npb24iO2E6NDp7czozMDoiZGVmYXVsdF9zZXNzaW9uLWNvcmUvY291cnNlY2F0IjthOjA6e31zOjM1OiJkZWZhdWx0X3Nlc3Npb24tY29yZS91c2Vyc2VsZWN0aW9ucyI7YTowOnt9czo0NDoiZGVmYXVsdF9zZXNzaW9uLWNvcmUvbmF2aWdhdGlvbl9leHBhbmRjb3Vyc2UiO2E6MDp7fXM6NDY6ImRlZmF1bHRfc2Vzc2lvbi1yZXBvc2l0b3J5X3NreWRyaXZlL2ZvbGRlcm5hbWUiO2E6MDp7fX1zOjIwOiJjdXN0b21fYmxvY2tfcmVnaW9ucyI7YToxOntzOjExOiJhZG1pbi1pbmRleCI7YToxOntpOjA7czo5OiJzaWRlLXBvc3QiO319czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YToyOntzOjE2OiJ1c2VyYmxvZ29wdGlvbnMyIjthOjM6e2k6MDtpOjE0MTc1Mzg4MzI7aToxO3M6MToiMiI7aToyO3M6NzExOiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmlldyBhbGwgb2YgbXkgZW50cmllcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6MTU6IjE5Mi4xNjguMjA5LjE5NyI7czo3OiIAKgBwb3J0IjtzOjA6IiI7czo3OiIAKgB1c2VyIjtzOjA6IiI7czo3OiIAKgBwYXNzIjtzOjA6IiI7czo3OiIAKgBwYXRoIjtzOjIyOiIvbW9vZGxlL2Jsb2cvaW5kZXgucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJ1c2VyaWQiO3M6MToiMiI7fX19czozOiJhZGQiO2E6Mjp7czo2OiJzdHJpbmciO3M6MTU6IkFkZCBhIG5ldyBlbnRyeSI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6MTU6IjE5Mi4xNjguMjA5LjE5NyI7czo3OiIAKgBwb3J0IjtzOjA6IiI7czo3OiIAKgB1c2VyIjtzOjA6IiI7czo3OiIAKgBwYXNzIjtzOjA6IiI7czo3OiIAKgBwYXRoIjtzOjIxOiIvbW9vZGxlL2Jsb2cvZWRpdC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6ImFjdGlvbiI7czozOiJhZGQiO319fX0iO31zOjE2OiJjb250ZXh0aGFzcmVwb3M1IjthOjM6e2k6MDtpOjE0MTc1Mzg4MzI7aToxO3M6MToiMiI7aToyO3M6NDoiYjowOyI7fX19czoyMToibG9hZF9uYXZpZ2F0aW9uX2FkbWluIjtpOjE7fQ==',1417538832,1417538835,'129.69.210.158','129.69.210.158');
/*!40000 ALTER TABLE `mdl_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_daily`
--

LOCK TABLES `mdl_stats_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_monthly`
--

LOCK TABLES `mdl_stats_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_daily`
--

LOCK TABLES `mdl_stats_user_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_monthly`
--

LOCK TABLES `mdl_stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_weekly`
--

LOCK TABLES `mdl_stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_weekly`
--

LOCK TABLES `mdl_stats_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey`
--

LOCK TABLES `mdl_survey` WRITE;
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro',0,'25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro',0,'31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro',0,'37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro',0,'65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro',0,'69,70,71,72,73');
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_analysis`
--

LOCK TABLES `mdl_survey_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_answers`
--

LOCK TABLES `mdl_survey_answers` WRITE;
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_questions`
--

LOCK TABLES `mdl_survey_questions` WRITE;
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag`
--

LOCK TABLES `mdl_tag` WRITE;
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_correlation`
--

LOCK TABLES `mdl_tag_correlation` WRITE;
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_instance`
--

LOCK TABLES `mdl_tag_instance` WRITE;
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_adhoc`
--

DROP TABLE IF EXISTS `mdl_task_adhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext COLLATE utf8_unicode_ci,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_adhoc`
--

LOCK TABLES `mdl_task_adhoc` WRITE;
/*!40000 ALTER TABLE `mdl_task_adhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_task_adhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_scheduled`
--

DROP TABLE IF EXISTS `mdl_task_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hour` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `month` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dayofweek` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_scheduled`
--

LOCK TABLES `mdl_task_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_task_scheduled` DISABLE KEYS */;
INSERT INTO `mdl_task_scheduled` VALUES (1,'moodle','\\core\\task\\session_cleanup_task',0,0,0,'*','*','*','*','*',0,0,0),(2,'moodle','\\core\\task\\delete_unconfirmed_users_task',0,0,0,'0','*','*','*','*',0,0,0),(3,'moodle','\\core\\task\\delete_incomplete_users_task',0,0,0,'5','*','*','*','*',0,0,0),(4,'moodle','\\core\\task\\backup_cleanup_task',0,0,0,'10','*','*','*','*',0,0,0),(5,'moodle','\\core\\task\\tag_cron_task',0,0,0,'20','*','*','*','*',0,0,0),(6,'moodle','\\core\\task\\context_cleanup_task',0,0,0,'25','*','*','*','*',0,0,0),(7,'moodle','\\core\\task\\cache_cleanup_task',0,0,0,'30','*','*','*','*',0,0,0),(8,'moodle','\\core\\task\\messaging_cleanup_task',0,0,0,'35','*','*','*','*',0,0,0),(9,'moodle','\\core\\task\\send_new_user_passwords_task',0,0,0,'*','*','*','*','*',0,0,0),(10,'moodle','\\core\\task\\send_failed_login_notifications_task',0,0,0,'*','*','*','*','*',0,0,0),(11,'moodle','\\core\\task\\create_contexts_task',0,0,1,'*','*','*','*','*',0,0,0),(12,'moodle','\\core\\task\\legacy_plugin_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(13,'moodle','\\core\\task\\grade_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(14,'moodle','\\core\\task\\events_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(15,'moodle','\\core\\task\\completion_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(16,'moodle','\\core\\task\\portfolio_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(17,'moodle','\\core\\task\\plagiarism_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(18,'moodle','\\core\\task\\calendar_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(19,'moodle','\\core\\task\\blog_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(20,'moodle','\\core\\task\\question_cron_task',0,0,0,'*','*','*','*','*',0,0,0),(21,'moodle','\\core\\task\\registration_cron_task',0,0,0,'0','3','*','*','*',0,0,0),(22,'moodle','\\core\\task\\check_for_updates_task',0,0,0,'0','*/2','*','*','*',0,0,0),(23,'moodle','\\core\\task\\cache_cron_task',0,0,0,'50','*','*','*','*',0,0,0),(24,'moodle','\\core\\task\\automated_backup_task',0,0,0,'50','*','*','*','*',0,0,0),(25,'moodle','\\core\\task\\badges_cron_task',0,0,0,'*/5','*','*','*','*',0,0,0),(26,'moodle','\\core\\task\\file_temp_cleanup_task',0,0,0,'55','*/6','*','*','*',0,0,0),(27,'moodle','\\core\\task\\file_trash_cleanup_task',0,0,0,'55','*/6','*','*','*',0,0,0),(28,'moodle','\\core\\task\\stats_cron_task',0,0,0,'0','*','*','*','*',0,0,0),(29,'moodle','\\core\\task\\password_reset_cleanup_task',0,0,0,'0','*/6','*','*','*',0,0,0),(30,'mod_forum','\\mod_forum\\task\\cron_task',0,0,0,'*','*','*','*','*',0,0,0),(31,'enrol_imsenterprise','\\enrol_imsenterprise\\task\\cron_task',0,0,0,'10','*','*','*','*',0,0,0),(32,'tool_langimport','\\tool_langimport\\task\\update_langpacks_task',0,0,0,'10','4','*','*','*',0,0,0),(33,'tool_messageinbound','\\tool_messageinbound\\task\\pickup_task',0,0,0,'*','*','*','*','*',0,0,0),(34,'tool_messageinbound','\\tool_messageinbound\\task\\cleanup_task',0,0,0,'55','1','*','*','*',0,0,0),(35,'tool_monitor','\\tool_monitor\\task\\clean_events',0,0,0,'*','*','*','*','*',0,0,0),(36,'logstore_legacy','\\logstore_legacy\\task\\cleanup_task',0,0,0,'*','5','*','*','*',0,0,0),(37,'logstore_standard','\\logstore_standard\\task\\cleanup_task',0,0,0,'*','4','*','*','*',0,0,0);
/*!40000 ALTER TABLE `mdl_task_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_timezone`
--

DROP TABLE IF EXISTS `mdl_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rules for calculating local wall clock time for users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_timezone`
--

LOCK TABLES `mdl_timezone` WRITE;
/*!40000 ALTER TABLE `mdl_timezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang`
--

DROP TABLE IF EXISTS `mdl_tool_customlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang`
--

LOCK TABLES `mdl_tool_customlang` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang_components`
--

DROP TABLE IF EXISTS `mdl_tool_customlang_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang_components`
--

LOCK TABLES `mdl_tool_customlang_components` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_events`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that keeps a log of events related to subscriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_events`
--

LOCK TABLES `mdl_tool_monitor_events` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_history`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store history of message notifications sent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_history`
--

LOCK TABLES `mdl_tool_monitor_history` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_rules`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template` longtext COLLATE utf8_unicode_ci NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_rules`
--

LOCK TABLES `mdl_tool_monitor_rules` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store user subscriptions to various rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_subscriptions`
--

LOCK TABLES `mdl_tool_monitor_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_upgrade_log`
--

DROP TABLE IF EXISTS `mdl_upgrade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_upgrade_log`
--

LOCK TABLES `mdl_upgrade_log` WRITE;
/*!40000 ALTER TABLE `mdl_upgrade_log` DISABLE KEYS */;
INSERT INTO `mdl_upgrade_log` VALUES (1,0,'core','2012120301','2012120301','Upgrade savepoint reached',NULL,'',0,1359111414),(2,0,'core','2012120301','2012120301','Core installed',NULL,'',0,1359111416),(3,0,'qtype_calculated',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(4,0,'qtype_calculated','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(5,0,'qtype_calculated','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(6,0,'qtype_calculatedmulti',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(7,0,'qtype_calculatedmulti','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(8,0,'qtype_calculatedmulti','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(9,0,'qtype_calculatedsimple',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(10,0,'qtype_calculatedsimple','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(11,0,'qtype_calculatedsimple','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(12,0,'qtype_description',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(13,0,'qtype_description','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(14,0,'qtype_description','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(15,0,'qtype_essay',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(16,0,'qtype_essay','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(17,0,'qtype_essay','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(18,0,'qtype_match',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(19,0,'qtype_match','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(20,0,'qtype_match','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(21,0,'qtype_missingtype',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(22,0,'qtype_missingtype','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(23,0,'qtype_missingtype','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(24,0,'qtype_multianswer',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(25,0,'qtype_multianswer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(26,0,'qtype_multianswer','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(27,0,'qtype_multichoice',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(28,0,'qtype_multichoice','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(29,0,'qtype_multichoice','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(30,0,'qtype_numerical',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(31,0,'qtype_numerical','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(32,0,'qtype_numerical','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(33,0,'qtype_random',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(34,0,'qtype_random','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(35,0,'qtype_random','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(36,0,'qtype_randomsamatch',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(37,0,'qtype_randomsamatch','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111416),(38,0,'qtype_randomsamatch','2012112900','2012112900','Plugin installed',NULL,'',0,1359111416),(39,0,'qtype_shortanswer',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111416),(40,0,'qtype_shortanswer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111417),(41,0,'qtype_shortanswer','2012112900','2012112900','Plugin installed',NULL,'',0,1359111417),(42,0,'qtype_truefalse',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111417),(43,0,'qtype_truefalse','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111417),(44,0,'qtype_truefalse','2012112900','2012112900','Plugin installed',NULL,'',0,1359111417),(45,0,'mod_assign',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111417),(46,0,'mod_assign','2012112900','2012112900','Plugin installed',NULL,'',0,1359111417),(47,0,'mod_assignment',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111417),(48,0,'mod_assignment','2012112900','2012112900','Plugin installed',NULL,'',0,1359111417),(49,0,'mod_book',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111417),(50,0,'mod_book','2012112900','2012112900','Plugin installed',NULL,'',0,1359111417),(51,0,'mod_chat',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111417),(52,0,'mod_chat','2012112900','2012112900','Plugin installed',NULL,'',0,1359111417),(53,0,'mod_choice',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111417),(54,0,'mod_choice','2012112900','2012112900','Plugin installed',NULL,'',0,1359111417),(55,0,'mod_data',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111417),(56,0,'mod_data','2012112901','2012112901','Plugin installed',NULL,'',0,1359111418),(57,0,'mod_feedback',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111418),(58,0,'mod_feedback','2012112900','2012112900','Plugin installed',NULL,'',0,1359111418),(59,0,'mod_folder',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111418),(60,0,'mod_folder','2012112900','2012112900','Plugin installed',NULL,'',0,1359111418),(61,0,'mod_forum',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111418),(62,0,'mod_forum','2012112900','2012112900','Plugin installed',NULL,'',0,1359111418),(63,0,'mod_glossary',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111419),(64,0,'mod_glossary','2012112900','2012112900','Plugin installed',NULL,'',0,1359111419),(65,0,'mod_imscp',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111419),(66,0,'mod_imscp','2012112900','2012112900','Plugin installed',NULL,'',0,1359111419),(67,0,'mod_label',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111419),(68,0,'mod_label','2012112900','2012112900','Plugin installed',NULL,'',0,1359111419),(69,0,'mod_lesson',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111419),(70,0,'mod_lesson','2012112900','2012112900','Plugin installed',NULL,'',0,1359111419),(71,0,'mod_lti',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111419),(72,0,'mod_lti','2012112900','2012112900','Plugin installed',NULL,'',0,1359111419),(73,0,'mod_page',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111419),(74,0,'mod_page','2012112900','2012112900','Plugin installed',NULL,'',0,1359111419),(75,0,'mod_quiz',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111419),(76,0,'mod_quiz','2012112900','2012112900','Plugin installed',NULL,'',0,1359111420),(77,0,'mod_resource',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111420),(78,0,'mod_resource','2012112900','2012112900','Plugin installed',NULL,'',0,1359111420),(79,0,'mod_scorm',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111420),(80,0,'mod_scorm','2012112900','2012112900','Plugin installed',NULL,'',0,1359111420),(81,0,'mod_survey',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111420),(82,0,'mod_survey','2012112900','2012112900','Plugin installed',NULL,'',0,1359111420),(83,0,'mod_url',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111420),(84,0,'mod_url','2012112900','2012112900','Plugin installed',NULL,'',0,1359111421),(85,0,'mod_wiki',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111421),(86,0,'mod_wiki','2012112900','2012112900','Plugin installed',NULL,'',0,1359111421),(87,0,'mod_workshop',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111421),(88,0,'mod_workshop','2012112900','2012112900','Plugin installed',NULL,'',0,1359111421),(89,0,'auth_cas',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111421),(90,0,'auth_cas','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111421),(91,0,'auth_cas','2012112900','2012112900','Plugin installed',NULL,'',0,1359111421),(92,0,'auth_db',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111421),(93,0,'auth_db','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111421),(94,0,'auth_db','2012112900','2012112900','Plugin installed',NULL,'',0,1359111421),(95,0,'auth_email',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111421),(96,0,'auth_email','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111421),(97,0,'auth_email','2012112900','2012112900','Plugin installed',NULL,'',0,1359111421),(98,0,'auth_fc',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111421),(99,0,'auth_fc','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111421),(100,0,'auth_fc','2012112900','2012112900','Plugin installed',NULL,'',0,1359111421),(101,0,'auth_imap',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111421),(102,0,'auth_imap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111421),(103,0,'auth_imap','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(104,0,'auth_ldap',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(105,0,'auth_ldap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(106,0,'auth_ldap','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(107,0,'auth_manual',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(108,0,'auth_manual','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(109,0,'auth_manual','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(110,0,'auth_mnet',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(111,0,'auth_mnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(112,0,'auth_mnet','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(113,0,'auth_nntp',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(114,0,'auth_nntp','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(115,0,'auth_nntp','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(116,0,'auth_nologin',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(117,0,'auth_nologin','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(118,0,'auth_nologin','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(119,0,'auth_none',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(120,0,'auth_none','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(121,0,'auth_none','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(122,0,'auth_pam',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(123,0,'auth_pam','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(124,0,'auth_pam','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(125,0,'auth_pop3',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(126,0,'auth_pop3','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(127,0,'auth_pop3','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(128,0,'auth_radius',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(129,0,'auth_radius','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(130,0,'auth_radius','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(131,0,'auth_shibboleth',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(132,0,'auth_shibboleth','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(133,0,'auth_shibboleth','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(134,0,'auth_webservice',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(135,0,'auth_webservice','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(136,0,'auth_webservice','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(137,0,'enrol_authorize',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(138,0,'enrol_authorize','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(139,0,'enrol_authorize','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(140,0,'enrol_category',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(141,0,'enrol_category','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(142,0,'enrol_category','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(143,0,'enrol_cohort',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(144,0,'enrol_cohort','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(145,0,'enrol_cohort','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(146,0,'enrol_database',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(147,0,'enrol_database','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(148,0,'enrol_database','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(149,0,'enrol_flatfile',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(150,0,'enrol_flatfile','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(151,0,'enrol_flatfile','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(152,0,'enrol_guest',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(153,0,'enrol_guest','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(154,0,'enrol_guest','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(155,0,'enrol_imsenterprise',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(156,0,'enrol_imsenterprise','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(157,0,'enrol_imsenterprise','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(158,0,'enrol_ldap',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(159,0,'enrol_ldap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(160,0,'enrol_ldap','2012112900','2012112900','Plugin installed',NULL,'',0,1359111422),(161,0,'enrol_manual',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111422),(162,0,'enrol_manual','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111422),(163,0,'enrol_manual','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(164,0,'enrol_meta',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(165,0,'enrol_meta','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111423),(166,0,'enrol_meta','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(167,0,'enrol_mnet',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(168,0,'enrol_mnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111423),(169,0,'enrol_mnet','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(170,0,'enrol_paypal',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(171,0,'enrol_paypal','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111423),(172,0,'enrol_paypal','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(173,0,'enrol_self',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(174,0,'enrol_self','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111423),(175,0,'enrol_self','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(176,0,'message_email',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(177,0,'message_email','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111423),(178,0,'message_email','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(179,0,'message_jabber',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(180,0,'message_jabber','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111423),(181,0,'message_jabber','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(182,0,'message_popup',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(183,0,'message_popup','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111423),(184,0,'message_popup','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(185,0,'block_activity_modules',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(186,0,'block_activity_modules','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(187,0,'block_admin_bookmarks',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(188,0,'block_admin_bookmarks','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(189,0,'block_blog_menu',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(190,0,'block_blog_menu','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(191,0,'block_blog_recent',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(192,0,'block_blog_recent','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(193,0,'block_blog_tags',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(194,0,'block_blog_tags','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(195,0,'block_calendar_month',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(196,0,'block_calendar_month','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(197,0,'block_calendar_upcoming',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(198,0,'block_calendar_upcoming','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(199,0,'block_comments',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(200,0,'block_comments','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(201,0,'block_community',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111423),(202,0,'block_community','2012112900','2012112900','Plugin installed',NULL,'',0,1359111423),(203,0,'block_completionstatus',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111423),(204,0,'block_completionstatus','2012112901','2012112901','Plugin installed',NULL,'',0,1359111424),(205,0,'block_course_list',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(206,0,'block_course_list','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(207,0,'block_course_overview',NULL,'2012121000','Starting plugin installation',NULL,'',0,1359111424),(208,0,'block_course_overview','2012121000','2012121000','Plugin installed',NULL,'',0,1359111424),(209,0,'block_course_summary',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111424),(210,0,'block_course_summary','2012112901','2012112901','Plugin installed',NULL,'',0,1359111424),(211,0,'block_feedback',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(212,0,'block_feedback','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(213,0,'block_glossary_random',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111424),(214,0,'block_glossary_random','2012112901','2012112901','Plugin installed',NULL,'',0,1359111424),(215,0,'block_html',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(216,0,'block_html','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(217,0,'block_login',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(218,0,'block_login','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(219,0,'block_mentees',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111424),(220,0,'block_mentees','2012112901','2012112901','Plugin installed',NULL,'',0,1359111424),(221,0,'block_messages',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(222,0,'block_messages','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(223,0,'block_mnet_hosts',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(224,0,'block_mnet_hosts','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(225,0,'block_myprofile',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(226,0,'block_myprofile','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(227,0,'block_navigation',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(228,0,'block_navigation','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(229,0,'block_news_items',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111424),(230,0,'block_news_items','2012112901','2012112901','Plugin installed',NULL,'',0,1359111424),(231,0,'block_online_users',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111424),(232,0,'block_online_users','2012112901','2012112901','Plugin installed',NULL,'',0,1359111424),(233,0,'block_participants',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(234,0,'block_participants','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(235,0,'block_private_files',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(236,0,'block_private_files','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(237,0,'block_quiz_results',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(238,0,'block_quiz_results','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(239,0,'block_recent_activity',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(240,0,'block_recent_activity','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(241,0,'block_rss_client',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(242,0,'block_rss_client','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(243,0,'block_search_forums',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(244,0,'block_search_forums','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(245,0,'block_section_links',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(246,0,'block_section_links','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(247,0,'block_selfcompletion',NULL,'2012112901','Starting plugin installation',NULL,'',0,1359111424),(248,0,'block_selfcompletion','2012112901','2012112901','Plugin installed',NULL,'',0,1359111424),(249,0,'block_settings',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(250,0,'block_settings','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(251,0,'block_site_main_menu',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(252,0,'block_site_main_menu','2012112900','2012112900','Plugin installed',NULL,'',0,1359111424),(253,0,'block_social_activities',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111424),(254,0,'block_social_activities','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(255,0,'block_tag_flickr',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(256,0,'block_tag_flickr','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(257,0,'block_tag_youtube',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(258,0,'block_tag_youtube','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(259,0,'block_tags',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(260,0,'block_tags','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(261,0,'filter_activitynames',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(262,0,'filter_activitynames','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(263,0,'filter_activitynames','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(264,0,'filter_algebra',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(265,0,'filter_algebra','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(266,0,'filter_algebra','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(267,0,'filter_censor',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(268,0,'filter_censor','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(269,0,'filter_censor','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(270,0,'filter_data',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(271,0,'filter_data','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(272,0,'filter_data','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(273,0,'filter_emailprotect',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(274,0,'filter_emailprotect','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(275,0,'filter_emailprotect','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(276,0,'filter_emoticon',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(277,0,'filter_emoticon','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(278,0,'filter_emoticon','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(279,0,'filter_glossary',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(280,0,'filter_glossary','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(281,0,'filter_glossary','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(282,0,'filter_mediaplugin',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(283,0,'filter_mediaplugin','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(284,0,'filter_mediaplugin','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(285,0,'filter_multilang',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(286,0,'filter_multilang','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(287,0,'filter_multilang','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(288,0,'filter_tex',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(289,0,'filter_tex','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(290,0,'filter_tex','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(291,0,'filter_tidy',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(292,0,'filter_tidy','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(293,0,'filter_tidy','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(294,0,'filter_urltolink',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(295,0,'filter_urltolink','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(296,0,'filter_urltolink','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(297,0,'editor_textarea',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(298,0,'editor_textarea','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(299,0,'editor_textarea','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(300,0,'editor_tinymce',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(301,0,'editor_tinymce','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(302,0,'editor_tinymce','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(303,0,'format_scorm',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(304,0,'format_scorm','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(305,0,'format_scorm','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(306,0,'format_social',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(307,0,'format_social','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(308,0,'format_social','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(309,0,'format_topics',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(310,0,'format_topics','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(311,0,'format_topics','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(312,0,'format_weeks',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(313,0,'format_weeks','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(314,0,'format_weeks','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(315,0,'profilefield_checkbox',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(316,0,'profilefield_checkbox','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(317,0,'profilefield_checkbox','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(318,0,'profilefield_datetime',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(319,0,'profilefield_datetime','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(320,0,'profilefield_datetime','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(321,0,'profilefield_menu',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(322,0,'profilefield_menu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(323,0,'profilefield_menu','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(324,0,'profilefield_text',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111425),(325,0,'profilefield_text','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111425),(326,0,'profilefield_text','2012112900','2012112900','Plugin installed',NULL,'',0,1359111425),(327,0,'profilefield_textarea',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(328,0,'profilefield_textarea','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(329,0,'profilefield_textarea','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(330,0,'report_backups',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(331,0,'report_backups','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(332,0,'report_backups','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(333,0,'report_completion',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(334,0,'report_completion','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(335,0,'report_completion','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(336,0,'report_configlog',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(337,0,'report_configlog','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(338,0,'report_configlog','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(339,0,'report_courseoverview',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(340,0,'report_courseoverview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(341,0,'report_courseoverview','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(342,0,'report_log',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(343,0,'report_log','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(344,0,'report_log','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(345,0,'report_loglive',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(346,0,'report_loglive','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(347,0,'report_loglive','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(348,0,'report_outline',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(349,0,'report_outline','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(350,0,'report_outline','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(351,0,'report_participation',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(352,0,'report_participation','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(353,0,'report_participation','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(354,0,'report_progress',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(355,0,'report_progress','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(356,0,'report_progress','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(357,0,'report_questioninstances',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(358,0,'report_questioninstances','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(359,0,'report_questioninstances','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(360,0,'report_security',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(361,0,'report_security','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(362,0,'report_security','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(363,0,'report_stats',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(364,0,'report_stats','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(365,0,'report_stats','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(366,0,'gradeexport_ods',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(367,0,'gradeexport_ods','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(368,0,'gradeexport_ods','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(369,0,'gradeexport_txt',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(370,0,'gradeexport_txt','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(371,0,'gradeexport_txt','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(372,0,'gradeexport_xls',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(373,0,'gradeexport_xls','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(374,0,'gradeexport_xls','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(375,0,'gradeexport_xml',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(376,0,'gradeexport_xml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(377,0,'gradeexport_xml','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(378,0,'gradeimport_csv',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(379,0,'gradeimport_csv','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(380,0,'gradeimport_csv','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(381,0,'gradeimport_xml',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(382,0,'gradeimport_xml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(383,0,'gradeimport_xml','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(384,0,'gradereport_grader',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(385,0,'gradereport_grader','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(386,0,'gradereport_grader','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(387,0,'gradereport_outcomes',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(388,0,'gradereport_outcomes','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(389,0,'gradereport_outcomes','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(390,0,'gradereport_overview',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(391,0,'gradereport_overview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(392,0,'gradereport_overview','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(393,0,'gradereport_user',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(394,0,'gradereport_user','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(395,0,'gradereport_user','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(396,0,'gradingform_guide',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111426),(397,0,'gradingform_guide','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111426),(398,0,'gradingform_guide','2012112900','2012112900','Plugin installed',NULL,'',0,1359111426),(399,0,'gradingform_rubric',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(400,0,'gradingform_rubric','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(401,0,'gradingform_rubric','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(402,0,'mnetservice_enrol',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(403,0,'mnetservice_enrol','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(404,0,'mnetservice_enrol','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(405,0,'webservice_amf',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(406,0,'webservice_amf','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(407,0,'webservice_amf','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(408,0,'webservice_rest',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(409,0,'webservice_rest','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(410,0,'webservice_rest','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(411,0,'webservice_soap',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(412,0,'webservice_soap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(413,0,'webservice_soap','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(414,0,'webservice_xmlrpc',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(415,0,'webservice_xmlrpc','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(416,0,'webservice_xmlrpc','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(417,0,'repository_alfresco',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(418,0,'repository_alfresco','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(419,0,'repository_alfresco','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(420,0,'repository_boxnet',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(421,0,'repository_boxnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(422,0,'repository_boxnet','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(423,0,'repository_coursefiles',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(424,0,'repository_coursefiles','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(425,0,'repository_coursefiles','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(426,0,'repository_-- DROPbox',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(427,0,'repository_-- DROPbox','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(428,0,'repository_-- DROPbox','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(429,0,'repository_equella',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(430,0,'repository_equella','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(431,0,'repository_equella','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(432,0,'repository_filesystem',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(433,0,'repository_filesystem','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(434,0,'repository_filesystem','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(435,0,'repository_flickr',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(436,0,'repository_flickr','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(437,0,'repository_flickr','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(438,0,'repository_flickr_public',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(439,0,'repository_flickr_public','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(440,0,'repository_flickr_public','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(441,0,'repository_googledocs',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(442,0,'repository_googledocs','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(443,0,'repository_googledocs','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(444,0,'repository_local',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(445,0,'repository_local','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(446,0,'repository_local','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(447,0,'repository_merlot',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(448,0,'repository_merlot','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(449,0,'repository_merlot','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(450,0,'repository_picasa',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(451,0,'repository_picasa','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(452,0,'repository_picasa','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(453,0,'repository_recent',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(454,0,'repository_recent','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(455,0,'repository_recent','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(456,0,'repository_s3',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(457,0,'repository_s3','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(458,0,'repository_s3','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(459,0,'repository_upload',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(460,0,'repository_upload','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(461,0,'repository_upload','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(462,0,'repository_url',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(463,0,'repository_url','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(464,0,'repository_url','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(465,0,'repository_user',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(466,0,'repository_user','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(467,0,'repository_user','2012112900','2012112900','Plugin installed',NULL,'',0,1359111427),(468,0,'repository_webdav',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111427),(469,0,'repository_webdav','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111427),(470,0,'repository_webdav','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(471,0,'repository_wikimedia',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(472,0,'repository_wikimedia','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(473,0,'repository_wikimedia','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(474,0,'repository_youtube',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(475,0,'repository_youtube','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(476,0,'repository_youtube','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(477,0,'portfolio_boxnet',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(478,0,'portfolio_boxnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(479,0,'portfolio_boxnet','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(480,0,'portfolio_download',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(481,0,'portfolio_download','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(482,0,'portfolio_download','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(483,0,'portfolio_flickr',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(484,0,'portfolio_flickr','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(485,0,'portfolio_flickr','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(486,0,'portfolio_googledocs',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(487,0,'portfolio_googledocs','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(488,0,'portfolio_googledocs','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(489,0,'portfolio_mahara',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(490,0,'portfolio_mahara','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(491,0,'portfolio_mahara','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(492,0,'portfolio_picasa',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(493,0,'portfolio_picasa','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(494,0,'portfolio_picasa','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(495,0,'qbehaviour_adaptive',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(496,0,'qbehaviour_adaptive','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(497,0,'qbehaviour_adaptive','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(498,0,'qbehaviour_adaptivenopenalty',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(499,0,'qbehaviour_adaptivenopenalty','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(500,0,'qbehaviour_adaptivenopenalty','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(501,0,'qbehaviour_deferredcbm',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(502,0,'qbehaviour_deferredcbm','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(503,0,'qbehaviour_deferredcbm','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(504,0,'qbehaviour_deferredfeedback',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(505,0,'qbehaviour_deferredfeedback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(506,0,'qbehaviour_deferredfeedback','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(507,0,'qbehaviour_immediatecbm',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(508,0,'qbehaviour_immediatecbm','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(509,0,'qbehaviour_immediatecbm','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(510,0,'qbehaviour_immediatefeedback',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(511,0,'qbehaviour_immediatefeedback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(512,0,'qbehaviour_immediatefeedback','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(513,0,'qbehaviour_informationitem',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(514,0,'qbehaviour_informationitem','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(515,0,'qbehaviour_informationitem','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(516,0,'qbehaviour_interactive',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(517,0,'qbehaviour_interactive','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(518,0,'qbehaviour_interactive','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(519,0,'qbehaviour_interactivecountback',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(520,0,'qbehaviour_interactivecountback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(521,0,'qbehaviour_interactivecountback','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(522,0,'qbehaviour_manualgraded',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(523,0,'qbehaviour_manualgraded','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(524,0,'qbehaviour_manualgraded','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(525,0,'qbehaviour_missing',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(526,0,'qbehaviour_missing','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(527,0,'qbehaviour_missing','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(528,0,'qformat_aiken',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(529,0,'qformat_aiken','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(530,0,'qformat_aiken','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(531,0,'qformat_blackboard',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(532,0,'qformat_blackboard','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(533,0,'qformat_blackboard','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(534,0,'qformat_blackboard_six',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(535,0,'qformat_blackboard_six','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(536,0,'qformat_blackboard_six','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(537,0,'qformat_examview',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(538,0,'qformat_examview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(539,0,'qformat_examview','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(540,0,'qformat_gift',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(541,0,'qformat_gift','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(542,0,'qformat_gift','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(543,0,'qformat_learnwise',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(544,0,'qformat_learnwise','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(545,0,'qformat_learnwise','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(546,0,'qformat_missingword',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(547,0,'qformat_missingword','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(548,0,'qformat_missingword','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(549,0,'qformat_multianswer',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(550,0,'qformat_multianswer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(551,0,'qformat_multianswer','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(552,0,'qformat_webct',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(553,0,'qformat_webct','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(554,0,'qformat_webct','2012112900','2012112900','Plugin installed',NULL,'',0,1359111428),(555,0,'qformat_xhtml',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111428),(556,0,'qformat_xhtml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111428),(557,0,'qformat_xhtml','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(558,0,'qformat_xml',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(559,0,'qformat_xml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(560,0,'qformat_xml','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(561,0,'tool_assignmentupgrade',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(562,0,'tool_assignmentupgrade','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(563,0,'tool_assignmentupgrade','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(564,0,'tool_capability',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(565,0,'tool_capability','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(566,0,'tool_capability','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(567,0,'tool_customlang',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(568,0,'tool_customlang','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(569,0,'tool_customlang','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(570,0,'tool_dbtransfer',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(571,0,'tool_dbtransfer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(572,0,'tool_dbtransfer','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(573,0,'tool_generator',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(574,0,'tool_generator','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(575,0,'tool_generator','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(576,0,'tool_health',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(577,0,'tool_health','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(578,0,'tool_health','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(579,0,'tool_innodb',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(580,0,'tool_innodb','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(581,0,'tool_innodb','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(582,0,'tool_langimport',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(583,0,'tool_langimport','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(584,0,'tool_langimport','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(585,0,'tool_multilangupgrade',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(586,0,'tool_multilangupgrade','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(587,0,'tool_multilangupgrade','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(588,0,'tool_phpunit',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(589,0,'tool_phpunit','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(590,0,'tool_phpunit','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(591,0,'tool_profiling',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(592,0,'tool_profiling','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(593,0,'tool_profiling','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(594,0,'tool_qeupgradehelper',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(595,0,'tool_qeupgradehelper','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(596,0,'tool_qeupgradehelper','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(597,0,'tool_replace',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(598,0,'tool_replace','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(599,0,'tool_replace','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(600,0,'tool_spamcleaner',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(601,0,'tool_spamcleaner','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(602,0,'tool_spamcleaner','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(603,0,'tool_timezoneimport',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(604,0,'tool_timezoneimport','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(605,0,'tool_timezoneimport','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(606,0,'tool_unsuproles',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(607,0,'tool_unsuproles','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(608,0,'tool_unsuproles','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(609,0,'tool_uploaduser',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(610,0,'tool_uploaduser','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(611,0,'tool_uploaduser','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(612,0,'tool_xmldb',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(613,0,'tool_xmldb','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(614,0,'tool_xmldb','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(615,0,'cachestore_file',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(616,0,'cachestore_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(617,0,'cachestore_file','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(618,0,'cachestore_memcache',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(619,0,'cachestore_memcache','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(620,0,'cachestore_memcache','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(621,0,'cachestore_memcached',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(622,0,'cachestore_memcached','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(623,0,'cachestore_memcached','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(624,0,'cachestore_mongodb',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(625,0,'cachestore_mongodb','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(626,0,'cachestore_mongodb','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(627,0,'cachestore_session',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(628,0,'cachestore_session','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(629,0,'cachestore_session','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(630,0,'cachestore_static',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(631,0,'cachestore_static','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(632,0,'cachestore_static','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(633,0,'theme_afterburner',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(634,0,'theme_afterburner','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(635,0,'theme_afterburner','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(636,0,'theme_anomaly',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(637,0,'theme_anomaly','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(638,0,'theme_anomaly','2012112900','2012112900','Plugin installed',NULL,'',0,1359111429),(639,0,'theme_arialist',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111429),(640,0,'theme_arialist','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111429),(641,0,'theme_arialist','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(642,0,'theme_base',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(643,0,'theme_base','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(644,0,'theme_base','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(645,0,'theme_binarius',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(646,0,'theme_binarius','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(647,0,'theme_binarius','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(648,0,'theme_boxxie',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(649,0,'theme_boxxie','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(650,0,'theme_boxxie','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(651,0,'theme_brick',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(652,0,'theme_brick','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(653,0,'theme_brick','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(654,0,'theme_canvas',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(655,0,'theme_canvas','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(656,0,'theme_canvas','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(657,0,'theme_formal_white',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(658,0,'theme_formal_white','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(659,0,'theme_formal_white','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(660,0,'theme_formfactor',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(661,0,'theme_formfactor','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(662,0,'theme_formfactor','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(663,0,'theme_fusion',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(664,0,'theme_fusion','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(665,0,'theme_fusion','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(666,0,'theme_leatherbound',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(667,0,'theme_leatherbound','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(668,0,'theme_leatherbound','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(669,0,'theme_magazine',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(670,0,'theme_magazine','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(671,0,'theme_magazine','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(672,0,'theme_mymobile',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(673,0,'theme_mymobile','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(674,0,'theme_mymobile','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(675,0,'theme_nimble',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(676,0,'theme_nimble','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(677,0,'theme_nimble','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(678,0,'theme_nonzero',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(679,0,'theme_nonzero','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(680,0,'theme_nonzero','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(681,0,'theme_overlay',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(682,0,'theme_overlay','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(683,0,'theme_overlay','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(684,0,'theme_serenity',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(685,0,'theme_serenity','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(686,0,'theme_serenity','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(687,0,'theme_sky_high',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(688,0,'theme_sky_high','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(689,0,'theme_sky_high','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(690,0,'theme_splash',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(691,0,'theme_splash','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(692,0,'theme_splash','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(693,0,'theme_standard',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(694,0,'theme_standard','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(695,0,'theme_standard','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(696,0,'theme_standardold',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(697,0,'theme_standardold','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(698,0,'theme_standardold','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(699,0,'assignsubmission_comments',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(700,0,'assignsubmission_comments','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(701,0,'assignsubmission_comments','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(702,0,'assignsubmission_file',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(703,0,'assignsubmission_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(704,0,'assignsubmission_file','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(705,0,'assignsubmission_onlinetext',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(706,0,'assignsubmission_onlinetext','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(707,0,'assignsubmission_onlinetext','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(708,0,'assignfeedback_comments',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(709,0,'assignfeedback_comments','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111430),(710,0,'assignfeedback_comments','2012112900','2012112900','Plugin installed',NULL,'',0,1359111430),(711,0,'assignfeedback_file',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111430),(712,0,'assignfeedback_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(713,0,'assignfeedback_file','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(714,0,'assignfeedback_offline',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(715,0,'assignfeedback_offline','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(716,0,'assignfeedback_offline','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(717,0,'assignment_offline',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(718,0,'assignment_offline','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(719,0,'assignment_offline','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(720,0,'assignment_online',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(721,0,'assignment_online','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(722,0,'assignment_online','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(723,0,'assignment_upload',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(724,0,'assignment_upload','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(725,0,'assignment_upload','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(726,0,'assignment_uploadsingle',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(727,0,'assignment_uploadsingle','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(728,0,'assignment_uploadsingle','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(729,0,'booktool_exportimscp',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(730,0,'booktool_exportimscp','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(731,0,'booktool_exportimscp','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(732,0,'booktool_importhtml',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(733,0,'booktool_importhtml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(734,0,'booktool_importhtml','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(735,0,'booktool_print',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(736,0,'booktool_print','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(737,0,'booktool_print','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(738,0,'datafield_checkbox',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(739,0,'datafield_checkbox','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(740,0,'datafield_checkbox','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(741,0,'datafield_date',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(742,0,'datafield_date','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(743,0,'datafield_date','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(744,0,'datafield_file',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(745,0,'datafield_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(746,0,'datafield_file','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(747,0,'datafield_latlong',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(748,0,'datafield_latlong','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(749,0,'datafield_latlong','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(750,0,'datafield_menu',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(751,0,'datafield_menu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(752,0,'datafield_menu','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(753,0,'datafield_multimenu',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(754,0,'datafield_multimenu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(755,0,'datafield_multimenu','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(756,0,'datafield_number',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(757,0,'datafield_number','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(758,0,'datafield_number','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(759,0,'datafield_picture',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(760,0,'datafield_picture','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(761,0,'datafield_picture','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(762,0,'datafield_radiobutton',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(763,0,'datafield_radiobutton','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(764,0,'datafield_radiobutton','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(765,0,'datafield_text',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(766,0,'datafield_text','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(767,0,'datafield_text','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(768,0,'datafield_textarea',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(769,0,'datafield_textarea','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(770,0,'datafield_textarea','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(771,0,'datafield_url',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(772,0,'datafield_url','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(773,0,'datafield_url','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(774,0,'datapreset_imagegallery',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(775,0,'datapreset_imagegallery','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(776,0,'datapreset_imagegallery','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(777,0,'quiz_grading',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(778,0,'quiz_grading','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(779,0,'quiz_grading','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(780,0,'quiz_overview',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(781,0,'quiz_overview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(782,0,'quiz_overview','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(783,0,'quiz_responses',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(784,0,'quiz_responses','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(785,0,'quiz_responses','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(786,0,'quiz_statistics',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(787,0,'quiz_statistics','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(788,0,'quiz_statistics','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(789,0,'quizaccess_delaybetweenattempts',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(790,0,'quizaccess_delaybetweenattempts','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111431),(791,0,'quizaccess_delaybetweenattempts','2012112900','2012112900','Plugin installed',NULL,'',0,1359111431),(792,0,'quizaccess_ipaddress',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111431),(793,0,'quizaccess_ipaddress','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(794,0,'quizaccess_ipaddress','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(795,0,'quizaccess_numattempts',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(796,0,'quizaccess_numattempts','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(797,0,'quizaccess_numattempts','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(798,0,'quizaccess_openclosedate',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(799,0,'quizaccess_openclosedate','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(800,0,'quizaccess_openclosedate','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(801,0,'quizaccess_password',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(802,0,'quizaccess_password','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(803,0,'quizaccess_password','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(804,0,'quizaccess_safebrowser',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(805,0,'quizaccess_safebrowser','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(806,0,'quizaccess_safebrowser','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(807,0,'quizaccess_securewindow',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(808,0,'quizaccess_securewindow','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(809,0,'quizaccess_securewindow','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(810,0,'quizaccess_timelimit',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(811,0,'quizaccess_timelimit','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(812,0,'quizaccess_timelimit','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(813,0,'scormreport_basic',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(814,0,'scormreport_basic','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(815,0,'scormreport_basic','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(816,0,'scormreport_graphs',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(817,0,'scormreport_graphs','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(818,0,'scormreport_graphs','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(819,0,'scormreport_interactions',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(820,0,'scormreport_interactions','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(821,0,'scormreport_interactions','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(822,0,'workshopform_accumulative',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(823,0,'workshopform_accumulative','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(824,0,'workshopform_accumulative','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(825,0,'workshopform_comments',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(826,0,'workshopform_comments','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(827,0,'workshopform_comments','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(828,0,'workshopform_numerrors',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(829,0,'workshopform_numerrors','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(830,0,'workshopform_numerrors','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(831,0,'workshopform_rubric',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(832,0,'workshopform_rubric','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(833,0,'workshopform_rubric','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(834,0,'workshopallocation_manual',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(835,0,'workshopallocation_manual','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(836,0,'workshopallocation_manual','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(837,0,'workshopallocation_random',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(838,0,'workshopallocation_random','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(839,0,'workshopallocation_random','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(840,0,'workshopallocation_scheduled',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(841,0,'workshopallocation_scheduled','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(842,0,'workshopallocation_scheduled','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(843,0,'workshopeval_best',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(844,0,'workshopeval_best','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(845,0,'workshopeval_best','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(846,0,'tinymce_dragmath',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(847,0,'tinymce_dragmath','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(848,0,'tinymce_dragmath','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(849,0,'tinymce_moodleemoticon',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(850,0,'tinymce_moodleemoticon','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(851,0,'tinymce_moodleemoticon','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(852,0,'tinymce_moodleimage',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(853,0,'tinymce_moodleimage','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(854,0,'tinymce_moodleimage','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(855,0,'tinymce_moodlemedia',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(856,0,'tinymce_moodlemedia','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(857,0,'tinymce_moodlemedia','2012112900','2012112900','Plugin installed',NULL,'',0,1359111432),(858,0,'tinymce_moodlenolink',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111432),(859,0,'tinymce_moodlenolink','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111432),(860,0,'tinymce_moodlenolink','2012112900','2012112900','Plugin installed',NULL,'',0,1359111433),(861,0,'tinymce_spellchecker',NULL,'2012112900','Starting plugin installation',NULL,'',0,1359111433),(862,0,'tinymce_spellchecker','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1359111433),(863,0,'tinymce_spellchecker','2012112900','2012112900','Plugin installed',NULL,'',0,1359111433),(864,0,'core','2012120301','2014111001.02','Starting core upgrade',NULL,'',0,1417538686),(865,0,'core','2012123000','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(866,0,'core','2013021100.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(867,0,'core','2013021800','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(868,0,'core','2013021801','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(869,0,'core','2013021801.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(870,0,'core','2013021902','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(871,0,'core','2013022600','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(872,0,'core','2013030400','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(873,0,'core','2013030400.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(874,0,'core','2013032200.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(875,0,'core','2013032600.03','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(876,0,'core','2013032600.04','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(877,0,'core','2013040200','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(878,0,'core','2013040201','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(879,0,'core','2013040300.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(880,0,'core','2013041200','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(881,0,'core','2013041600','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(882,0,'core','2013041601','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(883,0,'core','2013041601.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(884,0,'core','2013041900','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(885,0,'core','2013042300','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(886,0,'core','2013051400.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(887,0,'core','2013061400.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(888,0,'core','2013061700','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(889,0,'core','2013070800','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538686),(890,0,'core','2013070800.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(891,0,'core','2013071500.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(892,0,'core','2013071500.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(893,0,'core','2013072600.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(894,0,'core','2013081200','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(895,0,'core','2013082300.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(896,0,'core','2013082700','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(897,0,'core','2013090500.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(898,0,'core','2013091000.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(899,0,'core','2013091000.03','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(900,0,'core','2013091300.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(901,0,'core','2013092000.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(902,0,'core','2013092001.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(903,0,'core','2013092001.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(904,0,'core','2013092700.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(905,0,'core','2013100400.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(906,0,'core','2013100800','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(907,0,'core','2013100800.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(908,0,'core','2013100800.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(909,0,'core','2013100900','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(910,0,'core','2013100901','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(911,0,'core','2013102100','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(912,0,'core','2013102201','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(913,0,'core','2013102500.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(914,0,'core','2013110500.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(915,0,'core','2013110600.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(916,0,'core','2013110600.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(917,0,'core','2013111800.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(918,0,'core','2013122400.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(919,0,'core','2014011000.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(920,0,'core','2014011701','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(921,0,'core','2014012300.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(922,0,'core','2014012400','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(923,0,'core','2014021300.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538687),(924,0,'core','2014021300.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(925,0,'core','2014021800','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(926,0,'core','2014021900.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(927,0,'core','2014021900.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(928,0,'core','2014021900.03','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(929,0,'core','2014022600','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(930,0,'core','2014031400.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(931,0,'core','2014031400.03','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(932,0,'core','2014031400.04','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(933,0,'core','2014032600','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(934,0,'core','2014032600.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(935,0,'core','2014032700.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(936,0,'core','2014032700.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(937,0,'core','2014040800','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(938,0,'core','2014041500.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(939,0,'core','2014050100','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(940,0,'core','2014051200.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(941,0,'core','2014060300','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(942,0,'core','2014061000','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(943,0,'core','2014062600.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(944,0,'core','2014070100','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(945,0,'core','2014070101','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(946,0,'core','2014072400.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(947,0,'core','2014080801','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(948,0,'core','2014082900.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(949,0,'core','2014082900.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(950,0,'core','2014100100','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(951,0,'core','2014100600.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(952,0,'core','2014100600.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(953,0,'core','2014100600.03','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(954,0,'core','2014100600.04','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(955,0,'core','2014100700','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(956,0,'core','2014100700.01','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(957,0,'core','2014100800','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(958,0,'core','2014101001','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(959,0,'core','2014102000','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(960,0,'core','2014110300','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(961,0,'core','2014111001.02','2014111001.02','Upgrade savepoint reached',NULL,'',0,1417538688),(962,0,'core','2014111001.02','2014111001.02','Core upgraded',NULL,'',0,1417538689),(963,0,'availability_completion',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538689),(964,0,'availability_completion','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(965,0,'availability_completion','2014111000','2014111000','Plugin installed',NULL,'',0,1417538689),(966,0,'availability_date',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538689),(967,0,'availability_date','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(968,0,'availability_date','2014111000','2014111000','Plugin installed',NULL,'',0,1417538689),(969,0,'availability_grade',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538689),(970,0,'availability_grade','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(971,0,'availability_grade','2014111000','2014111000','Plugin installed',NULL,'',0,1417538689),(972,0,'availability_group',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538689),(973,0,'availability_group','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(974,0,'availability_group','2014111000','2014111000','Plugin installed',NULL,'',0,1417538689),(975,0,'availability_grouping',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538689),(976,0,'availability_grouping','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(977,0,'availability_grouping','2014111000','2014111000','Plugin installed',NULL,'',0,1417538689),(978,0,'availability_profile',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538689),(979,0,'availability_profile','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(980,0,'availability_profile','2014111000','2014111000','Plugin installed',NULL,'',0,1417538689),(981,0,'qtype_calculated','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(982,0,'qtype_calculated','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(983,0,'qtype_calculated','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(984,0,'qtype_calculatedmulti','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(985,0,'qtype_calculatedmulti','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(986,0,'qtype_calculatedmulti','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(987,0,'qtype_calculatedsimple','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(988,0,'qtype_calculatedsimple','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(989,0,'qtype_calculatedsimple','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(990,0,'qtype_description','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(991,0,'qtype_description','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(992,0,'qtype_description','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(993,0,'qtype_essay','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(994,0,'qtype_essay','2013011800','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(995,0,'qtype_essay','2013021700','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(996,0,'qtype_essay','2014011300','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(997,0,'qtype_essay','2014011301','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(998,0,'qtype_essay','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(999,0,'qtype_essay','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(1000,0,'qtype_match','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(1001,0,'qtype_match','2013012099','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1002,0,'qtype_match','2013012100','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1003,0,'qtype_match','2013012101','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1004,0,'qtype_match','2013012102','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1005,0,'qtype_match','2013012103','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1006,0,'qtype_match','2013012104','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1007,0,'qtype_match','2013012105','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1008,0,'qtype_match','2013012106','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1009,0,'qtype_match','2013012107','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1010,0,'qtype_match','2013012108','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1011,0,'qtype_match','2013012109','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1012,0,'qtype_match','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1013,0,'qtype_match','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(1014,0,'qtype_missingtype','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(1015,0,'qtype_missingtype','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1016,0,'qtype_missingtype','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(1017,0,'qtype_multianswer','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(1018,0,'qtype_multianswer','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1019,0,'qtype_multianswer','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538689),(1020,0,'qtype_multichoice','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538689),(1021,0,'qtype_multichoice','2013092300','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1022,0,'qtype_multichoice','2013092301','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1023,0,'qtype_multichoice','2013092302','2014111000','Upgrade savepoint reached',NULL,'',0,1417538689),(1024,0,'qtype_multichoice','2013092303','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1025,0,'qtype_multichoice','2013092304','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1026,0,'qtype_multichoice','2013092305','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1027,0,'qtype_multichoice','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1028,0,'qtype_multichoice','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1029,0,'qtype_numerical','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1030,0,'qtype_numerical','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1031,0,'qtype_numerical','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1032,0,'qtype_random','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1033,0,'qtype_random','2014060200','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1034,0,'qtype_random','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1035,0,'qtype_random','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1036,0,'qtype_randomsamatch','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1037,0,'qtype_randomsamatch','2013110501','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1038,0,'qtype_randomsamatch','2013110502','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1039,0,'qtype_randomsamatch','2013110503','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1040,0,'qtype_randomsamatch','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1041,0,'qtype_randomsamatch','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1042,0,'qtype_shortanswer','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1043,0,'qtype_shortanswer','2013011799','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1044,0,'qtype_shortanswer','2013011800','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1045,0,'qtype_shortanswer','2013011801','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1046,0,'qtype_shortanswer','2013011802','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1047,0,'qtype_shortanswer','2013011803','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1048,0,'qtype_shortanswer','2013011804','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1049,0,'qtype_shortanswer','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1050,0,'qtype_shortanswer','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1051,0,'qtype_truefalse','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1052,0,'qtype_truefalse','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1053,0,'qtype_truefalse','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1054,0,'mod_assign','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1055,0,'mod_assign','2013030600','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1056,0,'mod_assign','2013061101','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1057,0,'mod_assign','2014010801','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1058,0,'mod_assign','2014051201','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1059,0,'mod_assign','2014072400','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1060,0,'mod_assign','2014072401','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1061,0,'mod_assign','2014072405','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1062,0,'mod_assign','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1063,0,'mod_assign','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1064,0,'mod_assignment','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1065,0,'mod_assignment','2013121900','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1066,0,'mod_assignment','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1067,0,'mod_assignment','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1068,0,'mod_book','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1069,0,'mod_book','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1070,0,'mod_book','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1071,0,'mod_chat','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1072,0,'mod_chat','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1073,0,'mod_chat','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538690),(1074,0,'mod_choice','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538690),(1075,0,'mod_choice','2014051201','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1076,0,'mod_choice','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538690),(1077,0,'mod_choice','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1078,0,'mod_data','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1079,0,'mod_data','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1080,0,'mod_data','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1081,0,'mod_feedback','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1082,0,'mod_feedback','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1083,0,'mod_feedback','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1084,0,'mod_folder','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1085,0,'mod_folder','2013012100','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1086,0,'mod_folder','2013031500','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1087,0,'mod_folder','2013040700','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1088,0,'mod_folder','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1089,0,'mod_folder','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1090,0,'mod_forum','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1091,0,'mod_forum','2013020500','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1092,0,'mod_forum','2013021200','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1093,0,'mod_forum','2013071000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1094,0,'mod_forum','2014040400','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1095,0,'mod_forum','2014051201','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1096,0,'mod_forum','2014081500','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1097,0,'mod_forum','2014081900','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1098,0,'mod_forum','2014103000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1099,0,'mod_forum','2014110300','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1100,0,'mod_forum','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1101,0,'mod_forum','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1102,0,'mod_glossary','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1103,0,'mod_glossary','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1104,0,'mod_glossary','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1105,0,'mod_imscp','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1106,0,'mod_imscp','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1107,0,'mod_imscp','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1108,0,'mod_label','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1109,0,'mod_label','2013021400','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1110,0,'mod_label','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1111,0,'mod_label','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1112,0,'mod_lesson','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1113,0,'mod_lesson','2014091001','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1114,0,'mod_lesson','2014100600','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1115,0,'mod_lesson','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1116,0,'mod_lesson','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1117,0,'mod_lti','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1118,0,'mod_lti','2014060201','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1119,0,'mod_lti','2014061200','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1120,0,'mod_lti','2014100300','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1121,0,'mod_lti','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1122,0,'mod_lti','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1123,0,'mod_page','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1124,0,'mod_page','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1125,0,'mod_page','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538691),(1126,0,'mod_quiz','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538691),(1127,0,'mod_quiz','2013031900','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1128,0,'mod_quiz','2014011300','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1129,0,'mod_quiz','2014011301','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1130,0,'mod_quiz','2014011302','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1131,0,'mod_quiz','2014011303','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1132,0,'mod_quiz','2014011304','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1133,0,'mod_quiz','2014011305','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1134,0,'mod_quiz','2014011306','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1135,0,'mod_quiz','2014021300','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1136,0,'mod_quiz','2014022000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1137,0,'mod_quiz','2014022001','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1138,0,'mod_quiz','2014022002','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1139,0,'mod_quiz','2014022003','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1140,0,'mod_quiz','2014022004','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1141,0,'mod_quiz','2014022005','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1142,0,'mod_quiz','2014022006','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1143,0,'mod_quiz','2014022007','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1144,0,'mod_quiz','2014022008','2014111000','Upgrade savepoint reached',NULL,'',0,1417538691),(1145,0,'mod_quiz','2014052800','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1146,0,'mod_quiz','2014052801','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1147,0,'mod_quiz','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1148,0,'mod_quiz','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1149,0,'mod_resource','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1150,0,'mod_resource','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1151,0,'mod_resource','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1152,0,'mod_scorm','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1153,0,'mod_scorm','2013081301','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1154,0,'mod_scorm','2013081302','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1155,0,'mod_scorm','2013081303','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1156,0,'mod_scorm','2013090100','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1157,0,'mod_scorm','2013110501','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1158,0,'mod_scorm','2014031700','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1159,0,'mod_scorm','2014040200','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1160,0,'mod_scorm','2014072500','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1161,0,'mod_scorm','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1162,0,'mod_scorm','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1163,0,'mod_survey','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1164,0,'mod_survey','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1165,0,'mod_survey','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1166,0,'mod_url','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1167,0,'mod_url','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1168,0,'mod_url','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1169,0,'mod_wiki','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1170,0,'mod_wiki','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1171,0,'mod_wiki','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1172,0,'mod_workshop','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1173,0,'mod_workshop','2013032500','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1174,0,'mod_workshop','2013032501','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1175,0,'mod_workshop','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1176,0,'mod_workshop','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1177,0,'auth_cas','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1178,0,'auth_cas','2013052100','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1179,0,'auth_cas','2013091700','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1180,0,'auth_cas','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1181,0,'auth_cas','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1182,0,'auth_db','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1183,0,'auth_db','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1184,0,'auth_db','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1185,0,'auth_email','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1186,0,'auth_email','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1187,0,'auth_email','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1188,0,'auth_fc','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1189,0,'auth_fc','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1190,0,'auth_fc','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1191,0,'auth_imap','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1192,0,'auth_imap','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1193,0,'auth_imap','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1194,0,'auth_ldap','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1195,0,'auth_ldap','2013052100','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1196,0,'auth_ldap','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1197,0,'auth_ldap','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1198,0,'auth_manual','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1199,0,'auth_manual','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1200,0,'auth_manual','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1201,0,'auth_mnet','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1202,0,'auth_mnet','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1203,0,'auth_mnet','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1204,0,'auth_nntp','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1205,0,'auth_nntp','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1206,0,'auth_nntp','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1207,0,'auth_nologin','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1208,0,'auth_nologin','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1209,0,'auth_nologin','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538692),(1210,0,'auth_none','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538692),(1211,0,'auth_none','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538692),(1212,0,'auth_none','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1213,0,'auth_pam','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1214,0,'auth_pam','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1215,0,'auth_pam','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1216,0,'auth_pop3','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1217,0,'auth_pop3','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1218,0,'auth_pop3','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1219,0,'auth_radius','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1220,0,'auth_radius','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1221,0,'auth_radius','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1222,0,'auth_shibboleth','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1223,0,'auth_shibboleth','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1224,0,'auth_shibboleth','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1225,0,'auth_webservice','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1226,0,'auth_webservice','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1227,0,'auth_webservice','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1228,0,'calendartype_gregorian',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538693),(1229,0,'calendartype_gregorian','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1230,0,'calendartype_gregorian','2014111000','2014111000','Plugin installed',NULL,'',0,1417538693),(1231,0,'enrol_category','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1232,0,'enrol_category','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1233,0,'enrol_category','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1234,0,'enrol_cohort','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1235,0,'enrol_cohort','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1236,0,'enrol_cohort','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1237,0,'enrol_database','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1238,0,'enrol_database','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1239,0,'enrol_database','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1240,0,'enrol_flatfile','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1241,0,'enrol_flatfile','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1242,0,'enrol_flatfile','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1243,0,'enrol_guest','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1244,0,'enrol_guest','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1245,0,'enrol_guest','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1246,0,'enrol_imsenterprise','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1247,0,'enrol_imsenterprise','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1248,0,'enrol_imsenterprise','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1249,0,'enrol_ldap','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1250,0,'enrol_ldap','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1251,0,'enrol_ldap','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1252,0,'enrol_manual','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1253,0,'enrol_manual','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1254,0,'enrol_manual','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1255,0,'enrol_meta','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1256,0,'enrol_meta','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1257,0,'enrol_meta','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1258,0,'enrol_mnet','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1259,0,'enrol_mnet','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1260,0,'enrol_mnet','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1261,0,'enrol_paypal','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1262,0,'enrol_paypal','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1263,0,'enrol_paypal','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1264,0,'enrol_self','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1265,0,'enrol_self','2012120600','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1266,0,'enrol_self','2013112100','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1267,0,'enrol_self','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1268,0,'enrol_self','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1269,0,'message_airnotifier',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538693),(1270,0,'message_airnotifier','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1271,0,'message_airnotifier','2014111000','2014111000','Plugin installed',NULL,'',0,1417538693),(1272,0,'message_email','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1273,0,'message_email','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1274,0,'message_email','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1275,0,'message_jabber','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1276,0,'message_jabber','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538693),(1277,0,'message_jabber','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538693),(1278,0,'message_popup','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538693),(1279,0,'message_popup','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1280,0,'message_popup','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1281,0,'block_activity_modules','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1282,0,'block_activity_modules','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1283,0,'block_activity_modules','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1284,0,'block_admin_bookmarks','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1285,0,'block_admin_bookmarks','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1286,0,'block_admin_bookmarks','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1287,0,'block_badges',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538694),(1288,0,'block_badges','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1289,0,'block_badges','2014111000','2014111000','Plugin installed',NULL,'',0,1417538694),(1290,0,'block_blog_menu','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1291,0,'block_blog_menu','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1292,0,'block_blog_menu','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1293,0,'block_blog_recent','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1294,0,'block_blog_recent','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1295,0,'block_blog_recent','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1296,0,'block_blog_tags','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1297,0,'block_blog_tags','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1298,0,'block_blog_tags','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1299,0,'block_calendar_month','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1300,0,'block_calendar_month','2014062600','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1301,0,'block_calendar_month','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1302,0,'block_calendar_month','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1303,0,'block_calendar_upcoming','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1304,0,'block_calendar_upcoming','2014062600','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1305,0,'block_calendar_upcoming','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1306,0,'block_calendar_upcoming','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1307,0,'block_comments','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1308,0,'block_comments','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1309,0,'block_comments','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1310,0,'block_community','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1311,0,'block_community','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1312,0,'block_community','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1313,0,'block_completionstatus','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1314,0,'block_completionstatus','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1315,0,'block_completionstatus','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1316,0,'block_course_list','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1317,0,'block_course_list','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1318,0,'block_course_list','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1319,0,'block_course_overview','2012121000','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1320,0,'block_course_overview','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1321,0,'block_course_overview','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1322,0,'block_course_summary','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1323,0,'block_course_summary','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1324,0,'block_course_summary','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1325,0,'block_feedback','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1326,0,'block_feedback','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1327,0,'block_feedback','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1328,0,'block_glossary_random','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1329,0,'block_glossary_random','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1330,0,'block_glossary_random','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1331,0,'block_html','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1332,0,'block_html','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1333,0,'block_html','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1334,0,'block_login','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1335,0,'block_login','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1336,0,'block_login','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1337,0,'block_mentees','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1338,0,'block_mentees','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1339,0,'block_mentees','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1340,0,'block_messages','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1341,0,'block_messages','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1342,0,'block_messages','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1343,0,'block_mnet_hosts','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1344,0,'block_mnet_hosts','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1345,0,'block_mnet_hosts','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1346,0,'block_myprofile','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1347,0,'block_myprofile','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1348,0,'block_myprofile','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1349,0,'block_navigation','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1350,0,'block_navigation','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1351,0,'block_navigation','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1352,0,'block_news_items','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1353,0,'block_news_items','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1354,0,'block_news_items','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1355,0,'block_online_users','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1356,0,'block_online_users','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1357,0,'block_online_users','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1358,0,'block_participants','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1359,0,'block_participants','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1360,0,'block_participants','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1361,0,'block_private_files','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1362,0,'block_private_files','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1363,0,'block_private_files','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1364,0,'block_quiz_results','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1365,0,'block_quiz_results','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1366,0,'block_quiz_results','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1367,0,'block_recent_activity','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538694),(1368,0,'block_recent_activity','2014012000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1369,0,'block_recent_activity','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538694),(1370,0,'block_recent_activity','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538694),(1371,0,'block_rss_client','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1372,0,'block_rss_client','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1373,0,'block_rss_client','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1374,0,'block_search_forums','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1375,0,'block_search_forums','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1376,0,'block_search_forums','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1377,0,'block_section_links','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1378,0,'block_section_links','2013012200','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1379,0,'block_section_links','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1380,0,'block_section_links','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1381,0,'block_selfcompletion','2012112901','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1382,0,'block_selfcompletion','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1383,0,'block_selfcompletion','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1384,0,'block_settings','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1385,0,'block_settings','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1386,0,'block_settings','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1387,0,'block_site_main_menu','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1388,0,'block_site_main_menu','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1389,0,'block_site_main_menu','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1390,0,'block_social_activities','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1391,0,'block_social_activities','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1392,0,'block_social_activities','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1393,0,'block_tag_flickr','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1394,0,'block_tag_flickr','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1395,0,'block_tag_flickr','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1396,0,'block_tag_youtube','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1397,0,'block_tag_youtube','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1398,0,'block_tag_youtube','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1399,0,'block_tags','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1400,0,'block_tags','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1401,0,'block_tags','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1402,0,'filter_activitynames','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1403,0,'filter_activitynames','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1404,0,'filter_activitynames','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1405,0,'filter_algebra','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1406,0,'filter_algebra','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1407,0,'filter_algebra','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1408,0,'filter_censor','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1409,0,'filter_censor','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1410,0,'filter_censor','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1411,0,'filter_data','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1412,0,'filter_data','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1413,0,'filter_data','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1414,0,'filter_emailprotect','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1415,0,'filter_emailprotect','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1416,0,'filter_emailprotect','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1417,0,'filter_emoticon','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1418,0,'filter_emoticon','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1419,0,'filter_emoticon','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1420,0,'filter_glossary','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1421,0,'filter_glossary','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1422,0,'filter_glossary','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1423,0,'filter_mathjaxloader',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538695),(1424,0,'filter_mathjaxloader','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1425,0,'filter_mathjaxloader','2014111000','2014111000','Plugin installed',NULL,'',0,1417538695),(1426,0,'filter_mediaplugin','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1427,0,'filter_mediaplugin','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1428,0,'filter_mediaplugin','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1429,0,'filter_multilang','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1430,0,'filter_multilang','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1431,0,'filter_multilang','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1432,0,'filter_tex','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1433,0,'filter_tex','2013120300','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1434,0,'filter_tex','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1435,0,'filter_tex','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1436,0,'filter_tidy','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1437,0,'filter_tidy','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1438,0,'filter_tidy','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1439,0,'filter_urltolink','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1440,0,'filter_urltolink','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1441,0,'filter_urltolink','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1442,0,'editor_atto',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538695),(1443,0,'editor_atto','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1444,0,'editor_atto','2014111000','2014111000','Plugin installed',NULL,'',0,1417538695),(1445,0,'editor_textarea','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1446,0,'editor_textarea','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1447,0,'editor_textarea','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1448,0,'editor_tinymce','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1449,0,'editor_tinymce','2013061400','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1450,0,'editor_tinymce','2013070500','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1451,0,'editor_tinymce','2013102900','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1452,0,'editor_tinymce','2013110600','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1453,0,'editor_tinymce','2014062900','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1454,0,'editor_tinymce','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1455,0,'editor_tinymce','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1456,0,'format_singleactivity',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538695),(1457,0,'format_singleactivity','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1458,0,'format_singleactivity','2014111000','2014111000','Plugin installed',NULL,'',0,1417538695),(1459,0,'format_social','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1460,0,'format_social','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1461,0,'format_social','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1462,0,'format_topics','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1463,0,'format_topics','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1464,0,'format_topics','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538695),(1465,0,'format_weeks','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538695),(1466,0,'format_weeks','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538695),(1467,0,'format_weeks','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1468,0,'profilefield_checkbox','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1469,0,'profilefield_checkbox','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1470,0,'profilefield_checkbox','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1471,0,'profilefield_datetime','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1472,0,'profilefield_datetime','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1473,0,'profilefield_datetime','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1474,0,'profilefield_menu','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1475,0,'profilefield_menu','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1476,0,'profilefield_menu','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1477,0,'profilefield_text','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1478,0,'profilefield_text','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1479,0,'profilefield_text','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1480,0,'profilefield_textarea','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1481,0,'profilefield_textarea','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1482,0,'profilefield_textarea','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1483,0,'report_backups','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1484,0,'report_backups','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1485,0,'report_backups','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1486,0,'report_completion','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1487,0,'report_completion','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1488,0,'report_completion','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1489,0,'report_configlog','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1490,0,'report_configlog','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1491,0,'report_configlog','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1492,0,'report_courseoverview','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1493,0,'report_courseoverview','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1494,0,'report_courseoverview','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1495,0,'report_eventlist',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538696),(1496,0,'report_eventlist','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1497,0,'report_eventlist','2014111000','2014111000','Plugin installed',NULL,'',0,1417538696),(1498,0,'report_log','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1499,0,'report_log','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1500,0,'report_log','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1501,0,'report_loglive','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1502,0,'report_loglive','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1503,0,'report_loglive','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1504,0,'report_outline','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1505,0,'report_outline','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1506,0,'report_outline','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1507,0,'report_participation','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1508,0,'report_participation','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1509,0,'report_participation','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1510,0,'report_performance',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538696),(1511,0,'report_performance','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1512,0,'report_performance','2014111000','2014111000','Plugin installed',NULL,'',0,1417538696),(1513,0,'report_progress','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1514,0,'report_progress','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1515,0,'report_progress','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1516,0,'report_questioninstances','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1517,0,'report_questioninstances','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1518,0,'report_questioninstances','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1519,0,'report_security','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1520,0,'report_security','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1521,0,'report_security','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1522,0,'report_stats','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1523,0,'report_stats','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1524,0,'report_stats','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1525,0,'gradeexport_ods','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1526,0,'gradeexport_ods','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1527,0,'gradeexport_ods','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1528,0,'gradeexport_txt','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1529,0,'gradeexport_txt','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1530,0,'gradeexport_txt','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1531,0,'gradeexport_xls','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1532,0,'gradeexport_xls','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1533,0,'gradeexport_xls','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1534,0,'gradeexport_xml','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1535,0,'gradeexport_xml','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1536,0,'gradeexport_xml','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1537,0,'gradeimport_csv','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1538,0,'gradeimport_csv','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1539,0,'gradeimport_csv','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1540,0,'gradeimport_direct',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538696),(1541,0,'gradeimport_direct','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1542,0,'gradeimport_direct','2014111000','2014111000','Plugin installed',NULL,'',0,1417538696),(1543,0,'gradeimport_xml','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1544,0,'gradeimport_xml','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1545,0,'gradeimport_xml','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1546,0,'gradereport_grader','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1547,0,'gradereport_grader','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1548,0,'gradereport_grader','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1549,0,'gradereport_history',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538696),(1550,0,'gradereport_history','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1551,0,'gradereport_history','2014111000','2014111000','Plugin installed',NULL,'',0,1417538696),(1552,0,'gradereport_outcomes','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1553,0,'gradereport_outcomes','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1554,0,'gradereport_outcomes','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1555,0,'gradereport_overview','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1556,0,'gradereport_overview','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1557,0,'gradereport_overview','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538696),(1558,0,'gradereport_singleview',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538696),(1559,0,'gradereport_singleview','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538696),(1560,0,'gradereport_singleview','2014111000','2014111000','Plugin installed',NULL,'',0,1417538696),(1561,0,'gradereport_user','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538696),(1562,0,'gradereport_user','2014101500','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1563,0,'gradereport_user','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1564,0,'gradereport_user','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1565,0,'gradingform_guide','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1566,0,'gradingform_guide','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1567,0,'gradingform_guide','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1568,0,'gradingform_rubric','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1569,0,'gradingform_rubric','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1570,0,'gradingform_rubric','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1571,0,'mnetservice_enrol','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1572,0,'mnetservice_enrol','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1573,0,'mnetservice_enrol','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1574,0,'webservice_amf','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1575,0,'webservice_amf','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1576,0,'webservice_amf','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1577,0,'webservice_rest','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1578,0,'webservice_rest','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1579,0,'webservice_rest','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1580,0,'webservice_soap','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1581,0,'webservice_soap','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1582,0,'webservice_soap','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1583,0,'webservice_xmlrpc','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1584,0,'webservice_xmlrpc','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1585,0,'webservice_xmlrpc','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1586,0,'repository_alfresco','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1587,0,'repository_alfresco','2014020301','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1588,0,'repository_alfresco','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1589,0,'repository_alfresco','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1590,0,'repository_areafiles',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538697),(1591,0,'repository_areafiles','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1592,0,'repository_areafiles','2014111000','2014111000','Plugin installed',NULL,'',0,1417538697),(1593,0,'repository_boxnet','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1594,0,'repository_boxnet','2013110503','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1595,0,'repository_boxnet','2013110700','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1596,0,'repository_boxnet','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1597,0,'repository_boxnet','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1598,0,'repository_coursefiles','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1599,0,'repository_coursefiles','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1600,0,'repository_coursefiles','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1601,0,'repository_dropbox',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538697),(1602,0,'repository_dropbox','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1603,0,'repository_dropbox','2014111000','2014111000','Plugin installed',NULL,'',0,1417538697),(1604,0,'repository_equella','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1605,0,'repository_equella','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1606,0,'repository_equella','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1607,0,'repository_filesystem','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1608,0,'repository_filesystem','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1609,0,'repository_filesystem','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1610,0,'repository_flickr','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1611,0,'repository_flickr','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1612,0,'repository_flickr','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1613,0,'repository_flickr_public','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1614,0,'repository_flickr_public','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1615,0,'repository_flickr_public','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1616,0,'repository_googledocs','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1617,0,'repository_googledocs','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1618,0,'repository_googledocs','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1619,0,'repository_local','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1620,0,'repository_local','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1621,0,'repository_local','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1622,0,'repository_merlot','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1623,0,'repository_merlot','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1624,0,'repository_merlot','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1625,0,'repository_picasa','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1626,0,'repository_picasa','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1627,0,'repository_picasa','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1628,0,'repository_recent','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1629,0,'repository_recent','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1630,0,'repository_recent','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1631,0,'repository_s3','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1632,0,'repository_s3','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1633,0,'repository_s3','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1634,0,'repository_skydrive',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538697),(1635,0,'repository_skydrive','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1636,0,'repository_skydrive','2014111000','2014111000','Plugin installed',NULL,'',0,1417538697),(1637,0,'repository_upload','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1638,0,'repository_upload','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1639,0,'repository_upload','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1640,0,'repository_url','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1641,0,'repository_url','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1642,0,'repository_url','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538697),(1643,0,'repository_user','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538697),(1644,0,'repository_user','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538697),(1645,0,'repository_user','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1646,0,'repository_webdav','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1647,0,'repository_webdav','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1648,0,'repository_webdav','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1649,0,'repository_wikimedia','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1650,0,'repository_wikimedia','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1651,0,'repository_wikimedia','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1652,0,'repository_youtube','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1653,0,'repository_youtube','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1654,0,'repository_youtube','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1655,0,'portfolio_boxnet','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1656,0,'portfolio_boxnet','2013110602','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1657,0,'portfolio_boxnet','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1658,0,'portfolio_boxnet','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1659,0,'portfolio_download','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1660,0,'portfolio_download','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1661,0,'portfolio_download','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1662,0,'portfolio_flickr','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1663,0,'portfolio_flickr','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1664,0,'portfolio_flickr','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1665,0,'portfolio_googledocs','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1666,0,'portfolio_googledocs','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1667,0,'portfolio_googledocs','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1668,0,'portfolio_mahara','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1669,0,'portfolio_mahara','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1670,0,'portfolio_mahara','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1671,0,'portfolio_picasa','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1672,0,'portfolio_picasa','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1673,0,'portfolio_picasa','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1674,0,'qbehaviour_adaptive','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1675,0,'qbehaviour_adaptive','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1676,0,'qbehaviour_adaptive','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1677,0,'qbehaviour_adaptivenopenalty','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1678,0,'qbehaviour_adaptivenopenalty','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1679,0,'qbehaviour_adaptivenopenalty','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1680,0,'qbehaviour_deferredcbm','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1681,0,'qbehaviour_deferredcbm','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1682,0,'qbehaviour_deferredcbm','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1683,0,'qbehaviour_deferredfeedback','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1684,0,'qbehaviour_deferredfeedback','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1685,0,'qbehaviour_deferredfeedback','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1686,0,'qbehaviour_immediatecbm','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1687,0,'qbehaviour_immediatecbm','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1688,0,'qbehaviour_immediatecbm','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1689,0,'qbehaviour_immediatefeedback','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1690,0,'qbehaviour_immediatefeedback','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1691,0,'qbehaviour_immediatefeedback','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1692,0,'qbehaviour_informationitem','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1693,0,'qbehaviour_informationitem','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1694,0,'qbehaviour_informationitem','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1695,0,'qbehaviour_interactive','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1696,0,'qbehaviour_interactive','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1697,0,'qbehaviour_interactive','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1698,0,'qbehaviour_interactivecountback','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1699,0,'qbehaviour_interactivecountback','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1700,0,'qbehaviour_interactivecountback','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1701,0,'qbehaviour_manualgraded','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1702,0,'qbehaviour_manualgraded','2013050200','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1703,0,'qbehaviour_manualgraded','2013050800','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1704,0,'qbehaviour_manualgraded','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1705,0,'qbehaviour_manualgraded','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1706,0,'qbehaviour_missing','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1707,0,'qbehaviour_missing','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1708,0,'qbehaviour_missing','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1709,0,'qformat_aiken','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1710,0,'qformat_aiken','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1711,0,'qformat_aiken','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1712,0,'qformat_blackboard_six','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1713,0,'qformat_blackboard_six','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1714,0,'qformat_blackboard_six','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1715,0,'qformat_examview','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1716,0,'qformat_examview','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1717,0,'qformat_examview','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1718,0,'qformat_gift','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1719,0,'qformat_gift','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1720,0,'qformat_gift','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1721,0,'qformat_missingword','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1722,0,'qformat_missingword','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1723,0,'qformat_missingword','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1724,0,'qformat_multianswer','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1725,0,'qformat_multianswer','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1726,0,'qformat_multianswer','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1727,0,'qformat_webct','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1728,0,'qformat_webct','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1729,0,'qformat_webct','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1730,0,'qformat_xhtml','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1731,0,'qformat_xhtml','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1732,0,'qformat_xhtml','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1733,0,'qformat_xml','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1734,0,'qformat_xml','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1735,0,'qformat_xml','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1736,0,'tool_assignmentupgrade','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1737,0,'tool_assignmentupgrade','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1738,0,'tool_assignmentupgrade','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1739,0,'tool_availabilityconditions',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538698),(1740,0,'tool_availabilityconditions','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1741,0,'tool_availabilityconditions','2014111000','2014111000','Plugin installed',NULL,'',0,1417538698),(1742,0,'tool_behat',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538698),(1743,0,'tool_behat','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1744,0,'tool_behat','2014111000','2014111000','Plugin installed',NULL,'',0,1417538698),(1745,0,'tool_capability','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1746,0,'tool_capability','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1747,0,'tool_capability','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1748,0,'tool_customlang','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538698),(1749,0,'tool_customlang','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538698),(1750,0,'tool_customlang','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538698),(1751,0,'tool_dbtransfer','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1752,0,'tool_dbtransfer','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1753,0,'tool_dbtransfer','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1754,0,'tool_generator','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1755,0,'tool_generator','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1756,0,'tool_generator','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1757,0,'tool_health','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1758,0,'tool_health','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1759,0,'tool_health','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1760,0,'tool_innodb','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1761,0,'tool_innodb','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1762,0,'tool_innodb','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1763,0,'tool_installaddon',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538699),(1764,0,'tool_installaddon','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1765,0,'tool_installaddon','2014111000','2014111000','Plugin installed',NULL,'',0,1417538699),(1766,0,'tool_langimport','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1767,0,'tool_langimport','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1768,0,'tool_langimport','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1769,0,'tool_log',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538699),(1770,0,'tool_log','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1771,0,'tool_log','2014111000','2014111000','Plugin installed',NULL,'',0,1417538699),(1772,0,'tool_messageinbound',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538699),(1773,0,'tool_messageinbound','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1774,0,'tool_messageinbound','2014111000','2014111000','Plugin installed',NULL,'',0,1417538699),(1775,0,'tool_monitor',NULL,'2014111001','Starting plugin installation',NULL,'',0,1417538699),(1776,0,'tool_monitor','2014111001','2014111001','Upgrade savepoint reached',NULL,'',0,1417538699),(1777,0,'tool_monitor','2014111001','2014111001','Plugin installed',NULL,'',0,1417538699),(1778,0,'tool_multilangupgrade','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1779,0,'tool_multilangupgrade','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1780,0,'tool_multilangupgrade','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1781,0,'tool_phpunit','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1782,0,'tool_phpunit','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1783,0,'tool_phpunit','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1784,0,'tool_profiling','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1785,0,'tool_profiling','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1786,0,'tool_profiling','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1787,0,'tool_replace','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1788,0,'tool_replace','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1789,0,'tool_replace','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1790,0,'tool_spamcleaner','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1791,0,'tool_spamcleaner','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1792,0,'tool_spamcleaner','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1793,0,'tool_task',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538699),(1794,0,'tool_task','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1795,0,'tool_task','2014111000','2014111000','Plugin installed',NULL,'',0,1417538699),(1796,0,'tool_timezoneimport','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1797,0,'tool_timezoneimport','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1798,0,'tool_timezoneimport','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1799,0,'tool_unsuproles','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1800,0,'tool_unsuproles','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1801,0,'tool_unsuproles','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1802,0,'tool_uploadcourse',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538699),(1803,0,'tool_uploadcourse','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1804,0,'tool_uploadcourse','2014111000','2014111000','Plugin installed',NULL,'',0,1417538699),(1805,0,'tool_uploaduser','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1806,0,'tool_uploaduser','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1807,0,'tool_uploaduser','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1808,0,'tool_xmldb','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1809,0,'tool_xmldb','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1810,0,'tool_xmldb','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1811,0,'cachestore_file','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1812,0,'cachestore_file','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1813,0,'cachestore_file','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1814,0,'cachestore_memcache','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1815,0,'cachestore_memcache','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1816,0,'cachestore_memcache','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1817,0,'cachestore_memcached','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1818,0,'cachestore_memcached','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1819,0,'cachestore_memcached','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1820,0,'cachestore_mongodb','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1821,0,'cachestore_mongodb','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1822,0,'cachestore_mongodb','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1823,0,'cachestore_session','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1824,0,'cachestore_session','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1825,0,'cachestore_session','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538699),(1826,0,'cachestore_static','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538699),(1827,0,'cachestore_static','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538699),(1828,0,'cachestore_static','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1829,0,'cachelock_file',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538700),(1830,0,'cachelock_file','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1831,0,'cachelock_file','2014111000','2014111000','Plugin installed',NULL,'',0,1417538700),(1832,0,'theme_base','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1833,0,'theme_base','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1834,0,'theme_base','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1835,0,'theme_bootstrapbase',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538700),(1836,0,'theme_bootstrapbase','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1837,0,'theme_bootstrapbase','2014111000','2014111000','Plugin installed',NULL,'',0,1417538700),(1838,0,'theme_canvas','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1839,0,'theme_canvas','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1840,0,'theme_canvas','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1841,0,'theme_clean',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538700),(1842,0,'theme_clean','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1843,0,'theme_clean','2014111000','2014111000','Plugin installed',NULL,'',0,1417538700),(1844,0,'theme_more',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538700),(1845,0,'theme_more','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1846,0,'theme_more','2014111000','2014111000','Plugin installed',NULL,'',0,1417538700),(1847,0,'assignsubmission_comments','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1848,0,'assignsubmission_comments','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1849,0,'assignsubmission_comments','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1850,0,'assignsubmission_file','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1851,0,'assignsubmission_file','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1852,0,'assignsubmission_file','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1853,0,'assignsubmission_onlinetext','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1854,0,'assignsubmission_onlinetext','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1855,0,'assignsubmission_onlinetext','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1856,0,'assignfeedback_comments','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1857,0,'assignfeedback_comments','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1858,0,'assignfeedback_comments','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1859,0,'assignfeedback_editpdf',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538700),(1860,0,'assignfeedback_editpdf','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1861,0,'assignfeedback_editpdf','2014111000','2014111000','Plugin installed',NULL,'',0,1417538700),(1862,0,'assignfeedback_file','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1863,0,'assignfeedback_file','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1864,0,'assignfeedback_file','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1865,0,'assignfeedback_offline','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1866,0,'assignfeedback_offline','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1867,0,'assignfeedback_offline','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1868,0,'assignment_offline','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1869,0,'assignment_offline','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1870,0,'assignment_offline','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1871,0,'assignment_online','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1872,0,'assignment_online','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1873,0,'assignment_online','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1874,0,'assignment_upload','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1875,0,'assignment_upload','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1876,0,'assignment_upload','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1877,0,'assignment_uploadsingle','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1878,0,'assignment_uploadsingle','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1879,0,'assignment_uploadsingle','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1880,0,'booktool_exportimscp','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1881,0,'booktool_exportimscp','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1882,0,'booktool_exportimscp','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1883,0,'booktool_importhtml','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1884,0,'booktool_importhtml','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1885,0,'booktool_importhtml','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1886,0,'booktool_print','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1887,0,'booktool_print','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1888,0,'booktool_print','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1889,0,'datafield_checkbox','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1890,0,'datafield_checkbox','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1891,0,'datafield_checkbox','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1892,0,'datafield_date','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1893,0,'datafield_date','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1894,0,'datafield_date','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1895,0,'datafield_file','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1896,0,'datafield_file','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1897,0,'datafield_file','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1898,0,'datafield_latlong','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1899,0,'datafield_latlong','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1900,0,'datafield_latlong','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1901,0,'datafield_menu','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1902,0,'datafield_menu','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1903,0,'datafield_menu','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1904,0,'datafield_multimenu','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1905,0,'datafield_multimenu','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1906,0,'datafield_multimenu','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1907,0,'datafield_number','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1908,0,'datafield_number','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1909,0,'datafield_number','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1910,0,'datafield_picture','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1911,0,'datafield_picture','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1912,0,'datafield_picture','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1913,0,'datafield_radiobutton','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1914,0,'datafield_radiobutton','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1915,0,'datafield_radiobutton','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1916,0,'datafield_text','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1917,0,'datafield_text','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538700),(1918,0,'datafield_text','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538700),(1919,0,'datafield_textarea','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538700),(1920,0,'datafield_textarea','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1921,0,'datafield_textarea','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1922,0,'datafield_url','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1923,0,'datafield_url','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1924,0,'datafield_url','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1925,0,'datapreset_imagegallery','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1926,0,'datapreset_imagegallery','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1927,0,'datapreset_imagegallery','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1928,0,'ltiservice_profile',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538701),(1929,0,'ltiservice_profile','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1930,0,'ltiservice_profile','2014111000','2014111000','Plugin installed',NULL,'',0,1417538701),(1931,0,'ltiservice_toolproxy',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538701),(1932,0,'ltiservice_toolproxy','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1933,0,'ltiservice_toolproxy','2014111000','2014111000','Plugin installed',NULL,'',0,1417538701),(1934,0,'ltiservice_toolsettings',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538701),(1935,0,'ltiservice_toolsettings','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1936,0,'ltiservice_toolsettings','2014111000','2014111000','Plugin installed',NULL,'',0,1417538701),(1937,0,'quiz_grading','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1938,0,'quiz_grading','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1939,0,'quiz_grading','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1940,0,'quiz_overview','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1941,0,'quiz_overview','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1942,0,'quiz_overview','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1943,0,'quiz_responses','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1944,0,'quiz_responses','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1945,0,'quiz_responses','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1946,0,'quiz_statistics','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1947,0,'quiz_statistics','2013092000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1948,0,'quiz_statistics','2013093000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1949,0,'quiz_statistics','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1950,0,'quiz_statistics','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1951,0,'quizaccess_delaybetweenattempts','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1952,0,'quizaccess_delaybetweenattempts','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1953,0,'quizaccess_delaybetweenattempts','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1954,0,'quizaccess_ipaddress','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1955,0,'quizaccess_ipaddress','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1956,0,'quizaccess_ipaddress','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1957,0,'quizaccess_numattempts','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1958,0,'quizaccess_numattempts','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1959,0,'quizaccess_numattempts','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1960,0,'quizaccess_openclosedate','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1961,0,'quizaccess_openclosedate','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1962,0,'quizaccess_openclosedate','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1963,0,'quizaccess_password','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1964,0,'quizaccess_password','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1965,0,'quizaccess_password','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1966,0,'quizaccess_safebrowser','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1967,0,'quizaccess_safebrowser','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1968,0,'quizaccess_safebrowser','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1969,0,'quizaccess_securewindow','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1970,0,'quizaccess_securewindow','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1971,0,'quizaccess_securewindow','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1972,0,'quizaccess_timelimit','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1973,0,'quizaccess_timelimit','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1974,0,'quizaccess_timelimit','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1975,0,'scormreport_basic','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1976,0,'scormreport_basic','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1977,0,'scormreport_basic','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1978,0,'scormreport_graphs','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1979,0,'scormreport_graphs','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1980,0,'scormreport_graphs','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1981,0,'scormreport_interactions','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1982,0,'scormreport_interactions','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1983,0,'scormreport_interactions','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1984,0,'scormreport_objectives',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538701),(1985,0,'scormreport_objectives','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1986,0,'scormreport_objectives','2014111000','2014111000','Plugin installed',NULL,'',0,1417538701),(1987,0,'workshopform_accumulative','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1988,0,'workshopform_accumulative','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1989,0,'workshopform_accumulative','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1990,0,'workshopform_comments','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1991,0,'workshopform_comments','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1992,0,'workshopform_comments','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1993,0,'workshopform_numerrors','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1994,0,'workshopform_numerrors','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1995,0,'workshopform_numerrors','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1996,0,'workshopform_rubric','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(1997,0,'workshopform_rubric','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(1998,0,'workshopform_rubric','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(1999,0,'workshopallocation_manual','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(2000,0,'workshopallocation_manual','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(2001,0,'workshopallocation_manual','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(2002,0,'workshopallocation_random','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(2003,0,'workshopallocation_random','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(2004,0,'workshopallocation_random','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(2005,0,'workshopallocation_scheduled','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(2006,0,'workshopallocation_scheduled','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(2007,0,'workshopallocation_scheduled','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(2008,0,'workshopeval_best','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538701),(2009,0,'workshopeval_best','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(2010,0,'workshopeval_best','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538701),(2011,0,'atto_accessibilitychecker',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538701),(2012,0,'atto_accessibilitychecker','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538701),(2013,0,'atto_accessibilitychecker','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2014,0,'atto_accessibilityhelper',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2015,0,'atto_accessibilityhelper','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2016,0,'atto_accessibilityhelper','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2017,0,'atto_align',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2018,0,'atto_align','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2019,0,'atto_align','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2020,0,'atto_backcolor',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2021,0,'atto_backcolor','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2022,0,'atto_backcolor','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2023,0,'atto_bold',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2024,0,'atto_bold','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2025,0,'atto_bold','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2026,0,'atto_charmap',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2027,0,'atto_charmap','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2028,0,'atto_charmap','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2029,0,'atto_clear',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2030,0,'atto_clear','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2031,0,'atto_clear','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2032,0,'atto_collapse',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2033,0,'atto_collapse','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2034,0,'atto_collapse','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2035,0,'atto_emoticon',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2036,0,'atto_emoticon','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2037,0,'atto_emoticon','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2038,0,'atto_equation',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2039,0,'atto_equation','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2040,0,'atto_equation','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2041,0,'atto_fontcolor',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2042,0,'atto_fontcolor','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2043,0,'atto_fontcolor','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2044,0,'atto_html',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2045,0,'atto_html','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2046,0,'atto_html','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2047,0,'atto_image',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2048,0,'atto_image','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2049,0,'atto_image','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2050,0,'atto_indent',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2051,0,'atto_indent','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2052,0,'atto_indent','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2053,0,'atto_italic',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2054,0,'atto_italic','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2055,0,'atto_italic','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2056,0,'atto_link',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2057,0,'atto_link','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2058,0,'atto_link','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2059,0,'atto_managefiles',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2060,0,'atto_managefiles','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2061,0,'atto_managefiles','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2062,0,'atto_media',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2063,0,'atto_media','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2064,0,'atto_media','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2065,0,'atto_noautolink',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2066,0,'atto_noautolink','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2067,0,'atto_noautolink','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2068,0,'atto_orderedlist',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2069,0,'atto_orderedlist','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2070,0,'atto_orderedlist','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2071,0,'atto_rtl',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2072,0,'atto_rtl','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2073,0,'atto_rtl','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2074,0,'atto_strike',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2075,0,'atto_strike','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2076,0,'atto_strike','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2077,0,'atto_subscript',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2078,0,'atto_subscript','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2079,0,'atto_subscript','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2080,0,'atto_superscript',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2081,0,'atto_superscript','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2082,0,'atto_superscript','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2083,0,'atto_table',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2084,0,'atto_table','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2085,0,'atto_table','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2086,0,'atto_title',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2087,0,'atto_title','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2088,0,'atto_title','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2089,0,'atto_underline',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2090,0,'atto_underline','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2091,0,'atto_underline','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2092,0,'atto_undo',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2093,0,'atto_undo','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2094,0,'atto_undo','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2095,0,'atto_unorderedlist',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2096,0,'atto_unorderedlist','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2097,0,'atto_unorderedlist','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2098,0,'tinymce_ctrlhelp',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2099,0,'tinymce_ctrlhelp','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2100,0,'tinymce_ctrlhelp','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2101,0,'tinymce_managefiles',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2102,0,'tinymce_managefiles','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2103,0,'tinymce_managefiles','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2104,0,'tinymce_moodleemoticon','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538702),(2105,0,'tinymce_moodleemoticon','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2106,0,'tinymce_moodleemoticon','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538702),(2107,0,'tinymce_moodleimage','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538702),(2108,0,'tinymce_moodleimage','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2109,0,'tinymce_moodleimage','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538702),(2110,0,'tinymce_moodlemedia','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538702),(2111,0,'tinymce_moodlemedia','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2112,0,'tinymce_moodlemedia','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538702),(2113,0,'tinymce_moodlenolink','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538702),(2114,0,'tinymce_moodlenolink','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2115,0,'tinymce_moodlenolink','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538702),(2116,0,'tinymce_pdw',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538702),(2117,0,'tinymce_pdw','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2118,0,'tinymce_pdw','2014111000','2014111000','Plugin installed',NULL,'',0,1417538702),(2119,0,'tinymce_spellchecker','2012112900','2014111000','Starting plugin upgrade',NULL,'',0,1417538702),(2120,0,'tinymce_spellchecker','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538702),(2121,0,'tinymce_spellchecker','2014111000','2014111000','Plugin upgraded',NULL,'',0,1417538703),(2122,0,'tinymce_wrap',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538703),(2123,0,'tinymce_wrap','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538703),(2124,0,'tinymce_wrap','2014111000','2014111000','Plugin installed',NULL,'',0,1417538703),(2125,0,'logstore_database',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538703),(2126,0,'logstore_database','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538703),(2127,0,'logstore_database','2014111000','2014111000','Plugin installed',NULL,'',0,1417538703),(2128,0,'logstore_legacy',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538703),(2129,0,'logstore_legacy','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538703),(2130,0,'logstore_legacy','2014111000','2014111000','Plugin installed',NULL,'',0,1417538703),(2131,0,'logstore_standard',NULL,'2014111000','Starting plugin installation',NULL,'',0,1417538703),(2132,0,'logstore_standard','2014111000','2014111000','Upgrade savepoint reached',NULL,'',0,1417538703),(2133,0,'logstore_standard','2014111000','2014111000','Plugin installed',NULL,'',0,1417538703);
/*!40000 ALTER TABLE `mdl_upgrade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_url`
--

DROP TABLE IF EXISTS `mdl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_url`
--

LOCK TABLES `mdl_url` WRITE;
/*!40000 ALTER TABLE `mdl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternatename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gregorian',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user`
--

LOCK TABLES `mdl_user` WRITE;
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` VALUES (1,'manual',1,0,0,0,1,'guest','084e0343a0486ff05530df6c705c8bb4','','Guest user',' ','root@localhost',0,'','','','','','','','','','','','','en','','99',0,0,0,0,'','',0,'','This user is a special user that allows read-only access to some courses.',0,1,0,2,1,0,0,1359111413,0,NULL,NULL,NULL,NULL,NULL,'gregorian'),(2,'manual',1,0,0,0,1,'ADMINUSERNAME','ADMINUSERPASSWORD','','Admin','User','',0,'','','','','','','','','','','','','en','','99',1417538832,1417538832,0,1417538832,'129.69.210.158','',0,'',NULL,0,1,0,1,1,0,0,1359111413,0,NULL,NULL,NULL,NULL,NULL,'gregorian');
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_devices`
--

DROP TABLE IF EXISTS `mdl_user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_devices`
--

LOCK TABLES `mdl_user_devices` WRITE;
/*!40000 ALTER TABLE `mdl_user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_enrolments`
--

DROP TABLE IF EXISTS `mdl_user_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_enrolments`
--

LOCK TABLES `mdl_user_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_user_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_category`
--

LOCK TABLES `mdl_user_info_category` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_data`
--

LOCK TABLES `mdl_user_info_data` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_field`
--

LOCK TABLES `mdl_user_info_field` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_lastaccess`
--

LOCK TABLES `mdl_user_lastaccess` WRITE;
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_password_resets`
--

DROP TABLE IF EXISTS `mdl_user_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_password_resets`
--

LOCK TABLES `mdl_user_password_resets` WRITE;
/*!40000 ALTER TABLE `mdl_user_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_preferences`
--

LOCK TABLES `mdl_user_preferences` WRITE;
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` VALUES (1,2,'login_failed_count_since_success','1');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_private_key`
--

LOCK TABLES `mdl_user_private_key` WRITE;
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_webdav_locks`
--

DROP TABLE IF EXISTS `mdl_webdav_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource locks for WebDAV users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_webdav_locks`
--

LOCK TABLES `mdl_webdav_locks` WRITE;
/*!40000 ALTER TABLE `mdl_webdav_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_webdav_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki`
--

LOCK TABLES `mdl_wiki` WRITE;
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_links`
--

DROP TABLE IF EXISTS `mdl_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_links`
--

LOCK TABLES `mdl_wiki_links` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_locks`
--

LOCK TABLES `mdl_wiki_locks` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_pages`
--

LOCK TABLES `mdl_wiki_pages` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_subwikis`
--

DROP TABLE IF EXISTS `mdl_wiki_subwikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_subwikis`
--

LOCK TABLES `mdl_wiki_subwikis` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_synonyms`
--

DROP TABLE IF EXISTS `mdl_wiki_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_synonyms`
--

LOCK TABLES `mdl_wiki_synonyms` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_versions`
--

DROP TABLE IF EXISTS `mdl_wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_versions`
--

LOCK TABLES `mdl_wiki_versions` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop`
--

LOCK TABLES `mdl_workshop` WRITE;
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_aggregations`
--

DROP TABLE IF EXISTS `mdl_workshop_aggregations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_aggregations`
--

LOCK TABLES `mdl_workshop_aggregations` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments`
--

LOCK TABLES `mdl_workshop_assessments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be -- DROPped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments_old`
--

LOCK TABLES `mdl_workshop_assessments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_comments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_comments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be -- DROPped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_comments_old`
--

LOCK TABLES `mdl_workshop_comments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_elements_old`
--

DROP TABLE IF EXISTS `mdl_workshop_elements_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be -- DROPped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_elements_old`
--

LOCK TABLES `mdl_workshop_elements_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades`
--

LOCK TABLES `mdl_workshop_grades` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades_old`
--

DROP TABLE IF EXISTS `mdl_workshop_grades_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be -- DROPped later in Moodle 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades_old`
--

LOCK TABLES `mdl_workshop_grades_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_old`
--

DROP TABLE IF EXISTS `mdl_workshop_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be -- DROPped later in Moodle 2.x';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_old`
--

LOCK TABLES `mdl_workshop_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be -- DROPped later in Moodle ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_rubrics_old`
--

LOCK TABLES `mdl_workshop_rubrics_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be -- DROPped later in M';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_stockcomments_old`
--

LOCK TABLES `mdl_workshop_stockcomments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions`
--

LOCK TABLES `mdl_workshop_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions_old`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be -- DROPped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions_old`
--

LOCK TABLES `mdl_workshop_submissions_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

DROP TABLE IF EXISTS `mdl_workshopallocation_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopallocation_scheduled`
--

LOCK TABLES `mdl_workshopallocation_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

DROP TABLE IF EXISTS `mdl_workshopeval_best_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopeval_best_settings`
--

LOCK TABLES `mdl_workshopeval_best_settings` WRITE;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_accumulative`
--

DROP TABLE IF EXISTS `mdl_workshopform_accumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_accumulative`
--

LOCK TABLES `mdl_workshopform_accumulative` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_comments`
--

DROP TABLE IF EXISTS `mdl_workshopform_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_comments`
--

LOCK TABLES `mdl_workshopform_comments` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors`
--

LOCK TABLES `mdl_workshopform_numerrors` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors_map`
--

LOCK TABLES `mdl_workshopform_numerrors_map` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric`
--

LOCK TABLES `mdl_workshopform_rubric` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_config`
--

LOCK TABLES `mdl_workshopform_rubric_config` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_levels`
--

LOCK TABLES `mdl_workshopform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-02 16:54:13
