-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: startkladde
-- ------------------------------------------------------
-- Server version	5.5.38-0+wheezy1

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
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pilot_id` int(11) DEFAULT NULL,
  `copilot_id` int(11) DEFAULT NULL,
  `departure_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landing_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_landings` int(11) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `landing_time` datetime DEFAULT NULL,
  `launch_method_id` int(11) DEFAULT NULL,
  `towflight_landing_time` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_id` int(11) DEFAULT NULL,
  `plane_id` int(11) DEFAULT NULL,
  `departed` tinyint(1) DEFAULT NULL,
  `landed` tinyint(1) DEFAULT NULL,
  `towflight_landed` tinyint(1) DEFAULT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pilot_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pilot_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `copilot_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `copilot_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `towflight_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `towflight_landing_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `towplane_id` int(11) DEFAULT NULL,
  `towpilot_id` int(11) DEFAULT NULL,
  `towpilot_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `towpilot_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plane_id_index` (`plane_id`),
  KEY `pilot_id_index` (`pilot_id`),
  KEY `copilot_id_index` (`copilot_id`),
  KEY `launch_method_id_index` (`launch_method_id`),
  KEY `towplane_id_index` (`towplane_id`),
  KEY `towpilot_id_index` (`towpilot_id`),
  KEY `type_index` (`type`),
  KEY `mode_index` (`mode`),
  KEY `towflight_mode_index` (`towflight_mode`),
  KEY `departed_index` (`departed`),
  KEY `landed_index` (`landed`),
  KEY `towflight_landed_index` (`towflight_landed`),
  KEY `status_index` (`departed`,`landed`,`towflight_landed`),
  KEY `departure_time_index` (`departure_time`),
  KEY `landing_time_index` (`landing_time`),
  KEY `towflight_landing_time_index` (`towflight_landing_time`),
  KEY `departure_location_index` (`departure_location`),
  KEY `landing_location_index` (`landing_location`),
  KEY `towflight_landing_location_index` (`towflight_landing_location`),
  KEY `accounting_notes_index` (`accounting_notes`)
) ENGINE=InnoDB AUTO_INCREMENT=69272 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `launch_methods`
--

DROP TABLE IF EXISTS `launch_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `launch_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyboard_shortcut` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `towplane_registration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_required` tinyint(1) DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `club` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `club_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medical_validity` date DEFAULT NULL,
  `check_medical_validity` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_index` (`club`),
  KEY `club_id_index` (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2678 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `registration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `club` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_seats` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callsign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_index` (`registration`),
  KEY `club_index` (`club`)
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `perm_club_admin` tinyint(1) DEFAULT NULL,
  `club` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `perm_read_flight_db` tinyint(1) DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `username_index` (`username`),
  KEY `person_id_index` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
