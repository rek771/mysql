-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_24
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Москва',1),(2,'Санкт-Петербург',1),(3,'Берлин',2),(4,'Гамбург',2);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise`
--

DROP TABLE IF EXISTS `enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `city_id` bigint(20) unsigned NOT NULL,
  `manufactory_type_id` bigint(20) unsigned NOT NULL,
  `max_employees` bigint(20) unsigned NOT NULL,
  `warehouse_size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `city_id` (`city_id`),
  KEY `manufactory_type_id` (`manufactory_type_id`),
  CONSTRAINT `enterprise_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enterprise_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enterprise_ibfk_3` FOREIGN KEY (`manufactory_type_id`) REFERENCES `manufactory_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise`
--

LOCK TABLES `enterprise` WRITE;
/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;
INSERT INTO `enterprise` VALUES (1,1,1,1,6,125),(2,2,2,2,124727,362604911),(3,3,3,3,33,0),(4,1,4,4,304,93956875),(5,2,1,5,54,5),(6,3,2,1,424680134,69),(7,1,3,2,749339,3888915),(8,2,4,3,3825,951349922),(9,3,1,4,7396020,2341),(10,1,2,5,751,133667),(11,2,3,1,767083,0),(12,3,4,2,0,0),(13,1,1,3,7,5291),(14,2,2,4,4,296969316),(15,3,3,5,46774752,3),(16,1,4,1,1,6),(17,2,1,2,32,8872470),(18,3,2,3,1943,57),(19,1,3,4,118500207,0),(20,2,4,5,5,0),(21,3,1,1,7,8),(22,1,2,2,0,830420722),(23,2,3,3,0,88444476),(24,3,4,4,9285934,0),(25,1,1,5,5,1),(26,2,2,1,0,16043),(27,3,3,2,6627479,186571102),(28,1,4,3,8408434,6221),(29,2,1,4,50144357,106796914),(30,3,2,5,58,0),(31,1,3,1,75135769,66130),(32,2,4,2,2376,6389619),(33,3,1,3,62,9082),(34,1,2,4,72804,553804),(35,2,3,5,0,91),(36,3,4,1,442439446,541499850),(37,1,1,2,68718402,26014852),(38,2,2,3,0,6876362),(39,3,3,4,670004,33052792),(40,1,4,5,6,55065),(41,2,1,1,957267,2),(42,3,2,2,8645871,21),(43,1,3,3,115,0),(44,2,4,4,0,913358729),(45,3,1,5,8782989,827),(46,1,2,1,0,686),(47,2,3,2,106602,62),(48,3,4,3,4345935,61933378),(49,1,1,4,11229,9251),(50,2,2,5,84468014,5211383),(51,3,3,1,63252842,82212),(52,1,4,2,687838196,4758),(53,2,1,3,89492520,603887672),(54,3,2,4,915571880,5233),(55,1,3,5,933552180,604),(56,2,4,1,81615861,3052),(57,3,1,2,2487,416278026),(58,1,2,3,5,7),(59,2,3,4,8310661,95605),(60,3,4,5,32,85155507),(61,1,1,1,5104204,803512),(62,2,2,2,2,377598711),(63,3,3,3,94805,390),(64,1,4,4,476,72298246),(65,2,1,5,63,26),(66,3,2,1,6533,0),(67,1,3,2,8327,952028952),(68,2,4,3,7249,774),(69,3,1,4,48805,2796),(70,1,2,5,0,5295),(71,2,3,1,957,30),(72,3,4,2,6345234,3724383),(73,1,1,3,2,163978),(74,2,2,4,4211412,81262),(75,3,3,5,22365,1133410),(76,1,4,1,64761,91499500),(77,2,1,2,8,16109),(78,3,2,3,465,873),(79,1,3,4,531094,3855917),(80,2,4,5,7392040,2219622),(81,3,1,1,99278,58507),(82,1,2,2,62173,508345),(83,2,3,3,34642,78502),(84,3,4,4,338,526334),(85,1,1,5,2681191,5470314),(86,2,2,1,3881826,0),(87,3,3,2,3592,1771),(88,1,4,3,81716,275979),(89,2,1,4,4374618,5655887),(90,3,2,5,17327,2),(91,1,3,1,548916,757500403),(92,2,4,2,0,5562),(93,3,1,3,602,3),(94,1,2,4,3,0),(95,2,3,5,0,365),(96,3,4,1,175243,80740383),(97,1,1,2,0,1207),(98,2,2,3,0,74333),(99,3,3,4,11,5988),(100,1,4,5,33224829,3);
/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_workers`
--

DROP TABLE IF EXISTS `enterprise_workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_workers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `enterprise_id` bigint(20) unsigned NOT NULL,
  `people_id` bigint(20) unsigned NOT NULL,
  `salary` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_id` (`enterprise_id`),
  KEY `people_id` (`people_id`),
  CONSTRAINT `enterprise_workers_ibfk_1` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enterprise_workers_ibfk_2` FOREIGN KEY (`people_id`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_workers`
--

LOCK TABLES `enterprise_workers` WRITE;
/*!40000 ALTER TABLE `enterprise_workers` DISABLE KEYS */;
INSERT INTO `enterprise_workers` VALUES (1,1,1,4827832),(2,2,2,67415),(3,3,3,81985570),(4,4,4,678473),(5,5,5,0),(6,6,6,0),(7,7,7,0),(8,8,8,643603),(9,9,9,499668007),(10,10,10,3618609),(11,11,11,3401730),(12,12,12,38472),(13,13,13,601405),(14,14,14,81213),(15,15,15,39),(16,16,16,9),(17,17,17,0),(18,18,18,1964203),(19,19,19,43906),(20,20,20,54791440),(21,21,21,2401),(22,22,22,82),(23,23,23,29836),(24,24,24,218515212),(25,25,25,198602),(26,26,26,23267552),(27,27,27,978359391),(28,28,28,664126017),(29,29,29,0),(30,30,30,394302804),(31,31,31,782),(32,32,32,287673957),(33,33,33,1296829),(34,34,34,0),(35,35,35,5),(36,36,36,8),(37,37,37,367100746),(38,38,38,56139),(39,39,39,8307),(40,40,40,159702),(41,41,41,75),(42,42,42,79079),(43,43,43,99356),(44,44,44,0),(45,45,45,9933023),(46,46,46,5811819),(47,47,47,59472650),(48,48,48,559),(49,49,49,114450),(50,50,50,116180),(51,51,51,8140731),(52,52,52,91589381),(53,53,53,38147),(54,54,54,0),(55,55,55,33743770),(56,56,56,98721),(57,57,57,92),(58,58,58,1),(59,59,59,555475),(60,60,60,836644311),(61,61,61,4671508),(62,62,62,768),(63,63,63,0),(64,64,64,14881),(65,65,65,5),(66,66,66,0),(67,67,67,1093),(68,68,68,4568),(69,69,69,192),(70,70,70,495),(71,71,71,5070553),(72,72,72,7178834),(73,73,73,1605),(74,74,74,9650449),(75,75,75,948),(76,76,76,697883130),(77,77,77,3221421),(78,78,78,49105827),(79,79,79,12192),(80,80,80,8941),(81,81,81,5469054),(82,82,82,361050826),(83,83,83,210321),(84,84,84,0),(85,85,85,3116292),(86,86,86,0),(87,87,87,216227321),(88,88,88,2),(89,89,89,995),(90,90,90,0),(91,91,91,1932725),(92,92,92,0),(93,93,93,203383508),(94,94,94,756),(95,95,95,8199),(96,96,96,888),(97,97,97,3356860),(98,98,98,0),(99,99,99,75890),(100,100,100,423440);
/*!40000 ALTER TABLE `enterprise_workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactory_product_needed`
--

DROP TABLE IF EXISTS `manufactory_product_needed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactory_product_needed` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `manufactory_sub_type_id` bigint(20) unsigned NOT NULL,
  `product_type_id` bigint(20) unsigned NOT NULL,
  `count_product_need` float NOT NULL COMMENT 'Необходимо для производства 1 товара',
  PRIMARY KEY (`id`),
  KEY `manufactory_sub_type_id` (`manufactory_sub_type_id`),
  KEY `product_type_id` (`product_type_id`),
  CONSTRAINT `manufactory_product_needed_ibfk_1` FOREIGN KEY (`manufactory_sub_type_id`) REFERENCES `manufactory_sub_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manufactory_product_needed_ibfk_2` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactory_product_needed`
--

LOCK TABLES `manufactory_product_needed` WRITE;
/*!40000 ALTER TABLE `manufactory_product_needed` DISABLE KEYS */;
INSERT INTO `manufactory_product_needed` VALUES (1,1,8,3),(2,1,9,0.5),(3,2,8,3),(4,3,9,50),(5,3,1,4),(6,4,9,150),(7,4,1,4),(8,5,7,1),(9,6,7,1.2);
/*!40000 ALTER TABLE `manufactory_product_needed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactory_sub_type`
--

DROP TABLE IF EXISTS `manufactory_sub_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactory_sub_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufactory_type_id` bigint(20) unsigned NOT NULL,
  `result_product_id` bigint(20) unsigned NOT NULL,
  `count_per_worker` float NOT NULL COMMENT 'Количество продукции на одного сотрудника в день',
  PRIMARY KEY (`id`),
  KEY `manufactory_type_id` (`manufactory_type_id`),
  KEY `result_product_id` (`result_product_id`),
  CONSTRAINT `manufactory_sub_type_ibfk_1` FOREIGN KEY (`manufactory_type_id`) REFERENCES `manufactory_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manufactory_sub_type_ibfk_2` FOREIGN KEY (`result_product_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactory_sub_type`
--

LOCK TABLES `manufactory_sub_type` WRITE;
/*!40000 ALTER TABLE `manufactory_sub_type` DISABLE KEYS */;
INSERT INTO `manufactory_sub_type` VALUES (1,'Завод зимних шин',1,1,2),(2,'Завод летних шин',1,2,2),(3,'Завод автомобилей',2,3,0.4),(4,'Завод грузовиков',2,4,0.2),(5,'Пекарня (хлеб)',3,5,100),(6,'Пекарня (булка)',3,6,100),(7,'Плантация ржи',4,7,1000);
/*!40000 ALTER TABLE `manufactory_sub_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactory_type`
--

DROP TABLE IF EXISTS `manufactory_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactory_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactory_type`
--

LOCK TABLES `manufactory_type` WRITE;
/*!40000 ALTER TABLE `manufactory_type` DISABLE KEYS */;
INSERT INTO `manufactory_type` VALUES (1,'Завод шин'),(2,'Автозавод'),(3,'Пекарня'),(4,'Сельское хозяйство'),(5,'Магазин');
/*!40000 ALTER TABLE `manufactory_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_earnings`
--

DROP TABLE IF EXISTS `people_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_earnings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `people_id` bigint(20) unsigned NOT NULL,
  `change_balance` float NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `people_id` (`people_id`),
  CONSTRAINT `people_earnings_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_earnings`
--

LOCK TABLES `people_earnings` WRITE;
/*!40000 ALTER TABLE `people_earnings` DISABLE KEYS */;
INSERT INTO `people_earnings` VALUES (1,1,646.545,'1984-09-21 05:52:09'),(2,2,293.02,'1983-06-27 08:02:33'),(3,3,676.02,'2007-09-20 14:57:50'),(4,4,44.8541,'2014-07-01 13:14:54'),(5,5,3.48931,'1988-12-22 11:02:14'),(6,6,5,'1992-08-15 01:44:42'),(7,7,3072760,'1984-01-21 06:02:01'),(8,8,5266,'2006-04-08 09:20:35'),(9,9,0,'2008-12-22 13:08:56'),(10,10,54992500,'2011-01-26 05:11:23'),(11,11,2.17211,'1993-04-15 11:11:33'),(12,12,35848600,'1977-11-01 20:29:50'),(13,13,61.2373,'2004-09-25 09:01:37'),(14,14,9027.3,'1983-11-11 13:00:41'),(15,15,3606280,'2012-12-03 09:15:40'),(16,16,197938,'1981-11-13 22:12:51'),(17,17,2216,'1994-08-25 00:15:24'),(18,18,29603.3,'2012-04-12 02:30:13'),(19,19,7226,'1983-02-02 04:54:14'),(20,20,61.1232,'2001-09-27 18:28:02'),(21,21,9.80492,'1973-08-26 07:31:04'),(22,22,52.2445,'1970-03-13 06:31:33'),(23,23,6608.8,'2006-08-30 05:54:59'),(24,24,79777.4,'1971-09-29 04:07:42'),(25,25,2855710,'1971-09-06 06:51:49'),(26,26,1.64,'1986-10-23 05:39:10'),(27,27,2.87,'1974-04-12 08:29:17'),(28,28,164808,'2006-09-24 05:36:22'),(29,29,192678,'1996-09-03 05:03:22'),(30,30,2994.36,'1981-01-30 08:02:19'),(31,31,6594.84,'1976-01-10 10:47:12'),(32,32,4.98,'1978-06-27 18:26:05'),(33,33,31413100,'1987-03-10 02:33:44'),(34,34,118982,'1981-06-29 10:15:31'),(35,35,138935,'1977-12-02 14:30:15'),(36,36,0.2478,'1981-12-28 06:08:33'),(37,37,11051700,'1982-10-04 22:47:09'),(38,38,543629,'2013-05-25 00:50:08'),(39,39,10931.1,'1979-07-11 05:37:03'),(40,40,3715520,'1993-06-19 20:58:14'),(41,41,628538000,'1970-05-05 17:37:12'),(42,42,2.41206,'2005-11-03 04:00:02'),(43,43,269918,'2004-03-05 10:07:34'),(44,44,18345.7,'1993-12-06 16:12:48'),(45,45,3.78266,'1979-10-16 17:49:04'),(46,46,789901,'1989-04-24 18:51:42'),(47,47,0,'2009-11-07 13:36:01'),(48,48,47998200,'1984-04-12 22:31:31'),(49,49,19852.8,'2015-04-08 23:34:42'),(50,50,11,'1998-10-26 22:42:02'),(51,51,51031.7,'2008-07-05 14:12:52'),(52,52,4325.01,'1984-11-23 05:11:24'),(53,53,449071,'2004-06-03 12:59:02'),(54,54,69423.3,'2000-10-19 01:49:05'),(55,55,134189,'1971-05-09 16:47:50'),(56,56,210.767,'2007-10-25 19:19:51'),(57,57,7.96612,'2018-12-07 18:43:42'),(58,58,286878000,'1997-02-03 14:35:34'),(59,59,0.05301,'2004-07-19 18:04:32'),(60,60,6912.94,'2020-08-24 20:21:20'),(61,61,0,'1993-03-12 11:37:28'),(62,62,90316.8,'2017-08-05 04:57:39'),(63,63,1622870,'2017-06-07 05:26:59'),(64,64,67.5381,'1984-01-03 15:23:52'),(65,65,193.56,'2002-07-01 18:49:18'),(66,66,705647000,'1979-11-02 17:41:01'),(67,67,70,'2018-08-09 01:39:04'),(68,68,811.54,'2007-09-07 22:23:42'),(69,69,0,'1970-12-15 16:04:37'),(70,70,1431810,'1991-08-03 11:10:51'),(71,71,5.41692,'1991-05-27 23:00:23'),(72,72,139627000,'2001-09-29 13:45:24'),(73,73,214220,'2000-12-19 15:54:34'),(74,74,171.8,'1978-03-14 05:50:11'),(75,75,2607130,'2004-06-21 13:17:10'),(76,76,374.6,'1979-04-07 05:53:07'),(77,77,157273,'1970-07-08 10:55:07'),(78,78,515891000,'2000-05-31 10:09:33'),(79,79,3338.31,'2018-04-10 00:45:35'),(80,80,234113000,'1994-06-07 02:28:14'),(81,81,0,'2007-07-10 11:22:55'),(82,82,19726800,'1986-04-05 10:59:00'),(83,83,39687,'2002-05-27 23:24:03'),(84,84,1959.83,'2013-07-05 04:15:43'),(85,85,5368130,'1995-04-21 15:10:35'),(86,86,32.1858,'1974-05-21 03:11:59'),(87,87,491.4,'2015-03-07 12:50:22'),(88,88,8617.23,'1985-12-16 08:21:04'),(89,89,26.1644,'2017-07-14 08:15:13'),(90,90,4345960,'1996-08-19 15:10:42'),(91,91,11437100,'1996-05-27 01:36:02'),(92,92,0,'2019-03-20 18:22:40'),(93,93,53973000,'1987-01-26 11:59:27'),(94,94,3.71756,'1992-03-16 13:39:13'),(95,95,37.2783,'2009-04-04 21:26:35'),(96,96,55162.5,'2004-06-21 04:48:14'),(97,97,46461.5,'2000-11-19 06:01:10'),(98,98,533404,'2009-04-30 12:02:49'),(99,99,63996.1,'2014-03-18 05:54:11'),(100,100,3206.67,'1975-03-28 02:52:34');
/*!40000 ALTER TABLE `people_earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_needs`
--

DROP TABLE IF EXISTS `people_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_needs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `people_id` bigint(20) unsigned NOT NULL,
  `product_type_id` bigint(20) unsigned NOT NULL,
  `count_need` bigint(20) unsigned NOT NULL,
  `health_important_reduction` float NOT NULL DEFAULT 0,
  `health_important_recovery` float NOT NULL DEFAULT 0,
  `health_reduction` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `people_id` (`people_id`),
  CONSTRAINT `people_needs_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `people_needs_ibfk_2` FOREIGN KEY (`people_id`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_needs`
--

LOCK TABLES `people_needs` WRITE;
/*!40000 ALTER TABLE `people_needs` DISABLE KEYS */;
INSERT INTO `people_needs` VALUES (1,1,1,76124,7,2,5),(2,2,2,1,9,8,0),(3,3,3,88751,1,7,3),(4,4,4,16,5,3,9),(5,5,5,81948080,3,3,9),(6,6,6,0,3,2,0),(7,7,7,96044556,2,9,9),(8,8,8,0,0,3,9),(9,9,9,1,0,7,5),(10,10,1,185,1,2,3),(11,11,2,495556578,6,4,0),(12,12,3,377089695,6,7,4),(13,13,4,9659874,8,0,3),(14,14,5,4,4,0,8),(15,15,6,0,0,7,4),(16,16,7,820233,9,1,5),(17,17,8,2481,6,7,7),(18,18,9,527936,4,1,3),(19,19,1,623,2,8,9),(20,20,2,165841195,1,6,8),(21,21,3,24579011,4,2,1),(22,22,4,7,7,8,3),(23,23,5,373658376,8,4,3),(24,24,6,7839738,1,9,7),(25,25,7,80,9,7,4),(26,26,8,45560,1,9,3),(27,27,9,61098,6,0,4),(28,28,1,265,4,3,3),(29,29,2,1320,9,9,9),(30,30,3,72379,5,4,8),(31,31,4,8,7,9,5),(32,32,5,98246,5,6,5),(33,33,6,465932,7,5,6),(34,34,7,173,5,7,5),(35,35,8,106097537,8,7,9),(36,36,9,2082647,6,3,7),(37,37,1,953951347,7,8,3),(38,38,2,2665435,5,4,6),(39,39,3,893810,7,9,3),(40,40,4,4608336,4,0,8),(41,41,5,0,9,5,1),(42,42,6,2707,3,6,0),(43,43,7,303563,5,3,0),(44,44,8,81353256,1,0,3),(45,45,9,3,3,8,2),(46,46,1,0,5,4,7),(47,47,2,0,6,2,0),(48,48,3,283496385,3,5,1),(49,49,4,24831652,1,8,9),(50,50,5,562810833,5,2,3),(51,51,6,431012371,0,5,7),(52,52,7,74554,2,2,0),(53,53,8,162,1,3,6),(54,54,9,0,6,9,2),(55,55,1,15336341,1,3,2),(56,56,2,7,1,5,9),(57,57,3,7411151,1,5,7),(58,58,4,97306812,0,6,3),(59,59,5,4615944,9,2,4),(60,60,6,692978,5,6,7),(61,61,7,9829367,6,7,4),(62,62,8,525,4,5,9),(63,63,9,32,7,0,6),(64,64,1,842,0,6,0),(65,65,2,29192228,3,5,4),(66,66,3,759550144,5,6,6),(67,67,4,343881,3,1,0),(68,68,5,636038,2,6,9),(69,69,6,7932351,2,5,6),(70,70,7,564961,0,4,5),(71,71,8,37,1,1,9),(72,72,9,4921948,1,8,0),(73,73,1,7,4,0,9),(74,74,2,0,8,7,0),(75,75,3,27,1,0,2),(76,76,4,166,0,0,0),(77,77,5,416694,9,9,0),(78,78,6,510507,1,1,8),(79,79,7,7529849,6,3,7),(80,80,8,713130,9,0,3),(81,81,9,0,3,0,3),(82,82,1,0,7,0,3),(83,83,2,98272805,6,2,5),(84,84,3,0,0,6,2),(85,85,4,9730550,6,4,2),(86,86,5,3,8,3,3),(87,87,6,1110764,1,8,3),(88,88,7,0,6,1,6),(89,89,8,8,0,9,6),(90,90,9,0,7,0,6),(91,91,1,919,7,4,6),(92,92,2,99384304,5,2,0),(93,93,3,45,2,6,1),(94,94,4,2,6,2,7),(95,95,5,29132760,6,5,0),(96,96,6,136,7,5,3),(97,97,7,2882179,9,3,1),(98,98,8,95513277,0,3,0),(99,99,9,39402690,1,2,1),(100,100,1,479767163,2,2,4);
/*!40000 ALTER TABLE `people_needs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_specification`
--

DROP TABLE IF EXISTS `people_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_specification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `people_id` bigint(20) unsigned NOT NULL,
  `specification_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `people_id` (`people_id`),
  KEY `specification_id` (`specification_id`),
  CONSTRAINT `people_specification_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `people_specification_ibfk_2` FOREIGN KEY (`specification_id`) REFERENCES `specification_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_specification`
--

LOCK TABLES `people_specification` WRITE;
/*!40000 ALTER TABLE `people_specification` DISABLE KEYS */;
INSERT INTO `people_specification` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,2),(5,5,1),(6,6,2),(7,7,1),(8,8,2),(9,9,1),(10,10,2),(11,11,1),(12,12,2),(13,13,1),(14,14,2),(15,15,1),(16,16,2),(17,17,1),(18,18,2),(19,19,1),(20,20,2),(21,21,1),(22,22,2),(23,23,1),(24,24,2),(25,25,1),(26,26,2),(27,27,1),(28,28,2),(29,29,1),(30,30,2),(31,31,1),(32,32,2),(33,33,1),(34,34,2),(35,35,1),(36,36,2),(37,37,1),(38,38,2),(39,39,1),(40,40,2),(41,41,1),(42,42,2),(43,43,1),(44,44,2),(45,45,1),(46,46,2),(47,47,1),(48,48,2),(49,49,1),(50,50,2),(51,51,1),(52,52,2),(53,53,1),(54,54,2),(55,55,1),(56,56,2),(57,57,1),(58,58,2),(59,59,1),(60,60,2),(61,61,1),(62,62,2),(63,63,1),(64,64,2),(65,65,1),(66,66,2),(67,67,1),(68,68,2),(69,69,1),(70,70,2),(71,71,1),(72,72,2),(73,73,1),(74,74,2),(75,75,1),(76,76,2),(77,77,1),(78,78,2),(79,79,1),(80,80,2),(81,81,1),(82,82,2),(83,83,1),(84,84,2),(85,85,1),(86,86,2),(87,87,1),(88,88,2),(89,89,1),(90,90,2),(91,91,1),(92,92,2),(93,93,1),(94,94,2),(95,95,1),(96,96,2),(97,97,1),(98,98,2),(99,99,1),(100,100,2);
/*!40000 ALTER TABLE `people_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peoples`
--

DROP TABLE IF EXISTS `peoples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peoples` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `life_cycle` bigint(20) unsigned NOT NULL DEFAULT 80,
  `life_cycle_reduction` bigint(20) unsigned NOT NULL DEFAULT 0,
  `life_cycle_important_reduction` bigint(20) unsigned NOT NULL DEFAULT 0,
  `is_died` bit(1) DEFAULT b'0',
  `city_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `peoples_life_cycle_idx` (`life_cycle`),
  KEY `peoples_life_cycle_reduction_idx` (`life_cycle_reduction`),
  KEY `peoples_life_cycle_important_reduction_idx` (`life_cycle_important_reduction`),
  CONSTRAINT `peoples_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peoples`
--

LOCK TABLES `peoples` WRITE;
/*!40000 ALTER TABLE `peoples` DISABLE KEYS */;
INSERT INTO `peoples` VALUES (1,'Mallie Jenkins',4295,2,5,'',1),(2,'Jeffrey Grady',115522277,8,7,'\0',2),(3,'Otilia Parker Jr.',785288881,0,1,'\0',3),(4,'Jaylan Hilll',967,4,6,'',4),(5,'Richmond Wehner',765891,6,6,'\0',1),(6,'Jose Ortiz',3310644,6,8,'',2),(7,'Danyka Ryan',49141,0,4,'',3),(8,'Queenie Weimann',592288347,0,6,'',4),(9,'Lucile Stanton',992,8,7,'',1),(10,'Miss Elfrieda Lynch PhD',87,5,8,'\0',2),(11,'Mrs. Anna Legros DDS',0,9,3,'',3),(12,'Ryan Heathcote',784,5,7,'',4),(13,'Flossie Barton',95,8,2,'',1),(14,'Kim Russel DDS',6,2,6,'\0',2),(15,'Kelsi Keeling',2987,7,3,'\0',3),(16,'Gabe Strosin',495877,3,0,'',4),(17,'Emelie Gulgowski',18,5,9,'',1),(18,'Mrs. Audra Brakus I',2,0,7,'',2),(19,'Mr. Myron Bradtke II',666,0,0,'\0',3),(20,'Zelda Jakubowski III',4895188,0,6,'',4),(21,'Angela Thiel PhD',0,3,1,'\0',1),(22,'Mr. Justus Streich III',3,8,6,'\0',2),(23,'Douglas D\'Amore',0,6,0,'\0',3),(24,'Mekhi Hodkiewicz',17077,4,9,'\0',4),(25,'Rosalee Towne',464788318,7,9,'\0',1),(26,'Dr. Annette Blick DVM',80526753,5,7,'\0',2),(27,'Dangelo Reichel',3237041,6,9,'\0',3),(28,'Stefan Goyette',9299090,2,5,'\0',4),(29,'Arvel Gottlieb',847,4,9,'',1),(30,'Lois Turcotte',91,5,7,'\0',2),(31,'Gay Trantow',211,5,2,'\0',3),(32,'Ms. Cleta Abernathy',3,6,1,'\0',4),(33,'Jerrell Marks',64252,5,0,'',1),(34,'Davion Wuckert',52,8,2,'',2),(35,'Dr. Autumn Schamberger',4801167,9,2,'\0',3),(36,'Halie Hackett',59,6,2,'\0',4),(37,'Prof. Murray Dietrich MD',51321,3,8,'\0',1),(38,'Miss Elaina Botsford',3978434,1,8,'\0',2),(39,'Mrs. Kitty Runolfsson DDS',8123,4,8,'',3),(40,'Leonor Gibson',2749,7,9,'\0',4),(41,'Jason Kling',150,5,6,'\0',1),(42,'Brandyn Rutherford',2529,8,3,'\0',2),(43,'Brandi Jerde',2,6,7,'',3),(44,'Ms. Eulalia Dietrich',7200,0,8,'',4),(45,'Dr. Melvin Powlowski II',9057512,4,7,'\0',1),(46,'Mateo Willms',8,6,8,'\0',2),(47,'Letitia Zulauf PhD',858573635,9,8,'\0',3),(48,'Dr. Marcelle Lakin PhD',8475359,2,2,'',4),(49,'Garret Jenkins I',0,6,6,'\0',1),(50,'Bethany Adams',59706830,8,6,'',2),(51,'Prof. Leland Mraz DVM',22,1,1,'\0',3),(52,'Loma Bernhard',328,2,1,'\0',4),(53,'Nels Bruen',4675,5,3,'',1),(54,'Mrs. Christiana Ziemann II',61,5,0,'',2),(55,'Teagan Runolfsson',983,8,4,'',3),(56,'Brianne Friesen DDS',47941459,6,7,'',4),(57,'Miss Anita Stracke DVM',0,7,8,'',1),(58,'Anthony Schaefer',0,6,8,'\0',2),(59,'Isobel Wyman',36530,1,2,'\0',3),(60,'Alexandrine Cassin',29107671,1,5,'',4),(61,'Carlo Ratke',878953737,4,9,'',1),(62,'Cleta Upton',33,6,4,'',2),(63,'Ms. Dariana Franecki PhD',12987,0,3,'\0',3),(64,'Jena Hammes',417,9,1,'\0',4),(65,'Dr. Ramiro Schumm',950679,2,7,'',1),(66,'Houston Pacocha',462456,7,9,'',2),(67,'Isabelle Watsica',89190,4,7,'',3),(68,'Marvin Reinger',515,4,9,'\0',4),(69,'Mr. Jovany Dach',5,1,6,'\0',1),(70,'Dr. Roger Williamson',0,4,5,'',2),(71,'Mrs. Dixie Hagenes',7578,8,9,'\0',3),(72,'Ozella Bernier',41,2,5,'',4),(73,'Jared Kozey',91,2,8,'\0',1),(74,'Mr. Quinton Lesch PhD',0,7,2,'',2),(75,'Haven Little',622961204,6,3,'',3),(76,'Scotty Kovacek',4029,8,2,'\0',4),(77,'Bernadette Osinski',166377,9,7,'\0',1),(78,'Jessica Tremblay',1021,9,0,'',2),(79,'Alejandra Kihn',686736,6,3,'\0',3),(80,'Mr. Davon Bashirian DDS',33,8,4,'\0',4),(81,'Mrs. Maia Pollich DVM',0,0,4,'',1),(82,'Elouise Tremblay',5420,6,0,'',2),(83,'Alysha Kuhn I',9409,2,1,'',3),(84,'Dr. Ricky Gulgowski',8,5,0,'',4),(85,'Chloe Ernser',22,1,3,'\0',1),(86,'Tiana Ortiz V',1688215,1,4,'\0',2),(87,'Kenyon Rau',5,2,8,'\0',3),(88,'Mr. Keenan Dickens I',7,4,5,'',4),(89,'Dr. Enrique Zieme',66928,5,7,'\0',1),(90,'Bryana Cruickshank',44924267,7,4,'',2),(91,'Eldred Hammes DVM',7039077,3,2,'\0',3),(92,'Vicky Bergnaum',9836,8,9,'',4),(93,'Silas Schmeler',803606,5,7,'',1),(94,'Mittie Gutmann',103950,3,7,'',2),(95,'Mrs. Dawn Klein',258,1,7,'',3),(96,'Emelie Cormier',9,4,0,'\0',4),(97,'Raina Reichert',81485650,0,2,'\0',1),(98,'Prof. Zion Harris III',9945890,0,8,'\0',2),(99,'Edgar Deckow',0,4,7,'',3),(100,'Lois Walker',931,8,7,'',4);
/*!40000 ALTER TABLE `peoples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peouple_purchases`
--

DROP TABLE IF EXISTS `peouple_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peouple_purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `people_id` bigint(20) unsigned NOT NULL,
  `products_id` bigint(20) unsigned NOT NULL,
  `enterprise_id` bigint(20) unsigned NOT NULL,
  `sale_price` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `people_id` (`people_id`),
  KEY `products_id` (`products_id`),
  KEY `enterprise_id` (`enterprise_id`),
  CONSTRAINT `peouple_purchases_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peouple_purchases_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peouple_purchases_ibfk_3` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peouple_purchases`
--

LOCK TABLES `peouple_purchases` WRITE;
/*!40000 ALTER TABLE `peouple_purchases` DISABLE KEYS */;
INSERT INTO `peouple_purchases` VALUES (1,1,1,1,1,'1983-10-12 14:51:45'),(2,2,2,2,262847683,'1989-03-21 06:56:19'),(3,3,3,3,2019704,'2013-06-05 23:04:50'),(4,4,4,4,49,'1982-08-22 19:32:48'),(5,5,5,5,0,'1996-10-16 21:38:53'),(6,6,6,6,451824940,'1971-06-03 07:01:45'),(7,7,7,7,493534303,'1983-12-29 09:40:22'),(8,8,8,8,5625,'2001-05-05 22:55:02'),(9,9,9,9,0,'1971-11-23 01:42:22'),(10,10,10,10,637958,'1979-02-22 21:22:40'),(11,11,11,11,12916652,'2006-11-02 17:49:02'),(12,12,12,12,91564771,'2007-05-19 04:53:21'),(13,13,13,13,49037,'2011-02-23 06:57:52'),(14,14,14,14,0,'1995-07-22 12:34:17'),(15,15,15,15,499,'2019-10-13 05:53:55'),(16,16,16,16,50616620,'1975-05-23 06:33:36'),(17,17,17,17,11502186,'2014-11-07 05:54:22'),(18,18,18,18,0,'1972-05-27 17:36:38'),(19,19,19,19,2,'2017-09-18 12:24:35'),(20,20,20,20,586853636,'2017-12-23 20:21:14'),(21,21,21,21,212376081,'1988-09-17 12:31:04'),(22,22,22,22,0,'1986-04-04 09:12:17'),(23,23,23,23,577,'1986-12-01 16:57:48'),(24,24,24,24,564160,'2003-03-12 16:19:15'),(25,25,25,25,170211231,'2017-09-08 02:41:09'),(26,26,26,26,4,'2014-02-22 14:12:41'),(27,27,27,27,0,'1978-05-14 13:15:34'),(28,28,28,28,11,'2004-10-18 03:44:43'),(29,29,29,29,36444,'1991-06-06 04:58:50'),(30,30,30,30,162223,'2004-12-25 17:31:44'),(31,31,31,31,38,'1999-05-11 13:02:55'),(32,32,32,32,41053,'1975-07-18 12:38:42'),(33,33,33,33,0,'2000-03-28 01:02:08'),(34,34,34,34,6198,'2020-03-25 08:23:32'),(35,35,35,35,5338,'2009-07-22 03:35:15'),(36,36,36,36,37165783,'2013-02-20 03:51:03'),(37,37,37,37,46,'1999-05-02 17:30:52'),(38,38,38,38,156896774,'1985-04-14 03:16:14'),(39,39,39,39,455322,'1999-11-16 16:26:58'),(40,40,40,40,6,'1993-09-07 02:25:28'),(41,41,41,41,2,'1983-03-25 08:20:55'),(42,42,42,42,0,'1994-09-09 06:55:00'),(43,43,43,43,1,'2014-12-18 14:41:13'),(44,44,44,44,1501393,'2007-03-18 14:51:34'),(45,45,45,45,3375,'2005-03-01 12:03:56'),(46,46,46,46,23,'2002-06-18 17:06:18'),(47,47,47,47,38870,'2018-10-09 15:55:33'),(48,48,48,48,21105,'2019-09-07 17:48:43'),(49,49,49,49,12718165,'1971-01-25 03:47:42'),(50,50,50,50,6671,'1985-11-12 03:23:56'),(51,51,51,51,255900,'1971-12-24 04:44:00'),(52,52,52,52,2,'1990-09-04 07:32:21'),(53,53,53,53,43343,'2002-02-03 22:14:41'),(54,54,54,54,657,'2009-10-24 06:12:52'),(55,55,55,55,35793699,'2015-11-04 14:44:52'),(56,56,56,56,17330,'2015-08-21 05:30:53'),(57,57,57,57,988,'2005-03-09 11:18:45'),(58,58,58,58,8397,'2020-04-01 18:50:37'),(59,59,59,59,912,'2005-04-07 07:27:43'),(60,60,60,60,15,'2016-03-10 03:55:44'),(61,61,61,61,6030,'2009-04-11 09:31:19'),(62,62,62,62,247,'2004-03-09 23:36:05'),(63,63,63,63,1864,'2020-10-12 21:13:53'),(64,64,64,64,22456175,'1998-11-02 04:01:33'),(65,65,65,65,418301029,'1988-01-01 14:02:07'),(66,66,66,66,0,'2005-04-12 09:13:51'),(67,67,67,67,0,'2011-08-15 16:20:16'),(68,68,68,68,2,'1993-07-21 04:32:08'),(69,69,69,69,4,'2005-01-14 17:29:55'),(70,70,70,70,477295,'1997-09-30 20:07:48'),(71,71,71,71,0,'2003-02-26 23:20:33'),(72,72,72,72,62,'1971-02-19 02:49:12'),(73,73,73,73,0,'1986-03-28 17:39:57'),(74,74,74,74,9228279,'2014-01-28 04:11:15'),(75,75,75,75,6139676,'2013-06-15 15:52:53'),(76,76,76,76,30695762,'1981-06-20 08:09:14'),(77,77,77,77,3183511,'2001-06-07 03:07:33'),(78,78,78,78,452,'1987-07-02 23:14:55'),(79,79,79,79,1953644,'1998-06-01 01:18:54'),(80,80,80,80,2069,'2018-09-20 05:43:20'),(81,81,81,81,5,'2010-07-21 12:16:55'),(82,82,82,82,3541255,'2012-07-18 20:55:45'),(83,83,83,83,8,'2012-11-24 00:57:35'),(84,84,84,84,0,'1994-01-10 22:25:55'),(85,85,85,85,9,'2014-09-13 04:10:31'),(86,86,86,86,2032,'1985-01-21 20:34:05'),(87,87,87,87,89,'2001-09-12 09:41:28'),(88,88,88,88,4304,'1978-09-06 10:34:53'),(89,89,89,89,2,'1996-07-05 07:46:31'),(90,90,90,90,5152196,'1993-06-10 18:23:37'),(91,91,91,91,941004,'1983-07-14 17:25:51'),(92,92,92,92,313086,'2006-01-30 00:15:53'),(93,93,93,93,0,'2007-02-07 22:27:01'),(94,94,94,94,25461843,'2020-03-26 12:33:50'),(95,95,95,95,420433975,'2011-03-14 00:31:01'),(96,96,96,96,15769,'2015-09-08 01:56:58'),(97,97,97,97,1,'1987-09-15 01:43:04'),(98,98,98,98,3472,'1985-02-19 11:19:26'),(99,99,99,99,12419160,'1975-01-16 04:38:36'),(100,100,100,100,0,'1977-07-28 07:41:24');
/*!40000 ALTER TABLE `peouple_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `take_warehouse` float DEFAULT NULL COMMENT 'Сколько вм м занимают на складе',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'Зимние шины',1),(2,'Летние шины',1),(3,'Автомобиль',10),(4,'Грузовик',20),(5,'Хлеб',0.05),(6,'Булка',0.05),(7,'Рожь',0.001),(8,'Резина',0.01),(9,'Сталь',0.1);
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_type_id` bigint(20) unsigned NOT NULL,
  `enterprise_id` bigint(20) unsigned NOT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `is_destroyed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `enterprise_id` (`enterprise_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,1,3396,''),(2,2,2,513577,'\0'),(3,3,3,2681,'\0'),(4,4,4,0,'\0'),(5,5,5,4100,''),(6,6,6,0,'\0'),(7,7,7,107153642,''),(8,8,8,138585737,'\0'),(9,9,9,8523,'\0'),(10,1,10,688,'\0'),(11,2,11,144770,'\0'),(12,3,12,1,''),(13,4,13,410,'\0'),(14,5,14,763305,'\0'),(15,6,15,151549475,''),(16,7,16,576018,''),(17,8,17,434704,''),(18,9,18,3474,'\0'),(19,1,19,62479214,''),(20,2,20,571937370,'\0'),(21,3,21,319883,'\0'),(22,4,22,352,''),(23,5,23,0,'\0'),(24,6,24,713455022,''),(25,7,25,2220838,'\0'),(26,8,26,5,'\0'),(27,9,27,4727,''),(28,1,28,68,'\0'),(29,2,29,382,''),(30,3,30,1,'\0'),(31,4,31,0,'\0'),(32,5,32,361901,''),(33,6,33,71,''),(34,7,34,25333,''),(35,8,35,3,''),(36,9,36,28,''),(37,1,37,2,''),(38,2,38,1248,'\0'),(39,3,39,0,'\0'),(40,4,40,62353,'\0'),(41,5,41,4913249,'\0'),(42,6,42,16,''),(43,7,43,0,'\0'),(44,8,44,2736,''),(45,9,45,1153,'\0'),(46,1,46,72,'\0'),(47,2,47,38,'\0'),(48,3,48,61,'\0'),(49,4,49,6153,''),(50,5,50,5367394,''),(51,6,51,8,'\0'),(52,7,52,1,'\0'),(53,8,53,0,''),(54,9,54,41137,''),(55,1,55,25029668,''),(56,2,56,95,'\0'),(57,3,57,0,''),(58,4,58,0,'\0'),(59,5,59,878,'\0'),(60,6,60,30885,''),(61,7,61,11,'\0'),(62,8,62,35577457,''),(63,9,63,50516875,''),(64,1,64,103436,''),(65,2,65,593729266,'\0'),(66,3,66,6640278,'\0'),(67,4,67,4927,'\0'),(68,5,68,4,'\0'),(69,6,69,80393,'\0'),(70,7,70,9771359,''),(71,8,71,34865,'\0'),(72,9,72,0,'\0'),(73,1,73,0,'\0'),(74,2,74,3022002,''),(75,3,75,0,''),(76,4,76,168,''),(77,5,77,4194583,'\0'),(78,6,78,381994902,'\0'),(79,7,79,633957579,'\0'),(80,8,80,208,''),(81,9,81,72,''),(82,1,82,0,'\0'),(83,2,83,5,'\0'),(84,3,84,18618,'\0'),(85,4,85,45815,'\0'),(86,5,86,2298,'\0'),(87,6,87,225,'\0'),(88,7,88,36333,''),(89,8,89,2,'\0'),(90,9,90,11539906,'\0'),(91,1,91,210,''),(92,2,92,62021698,'\0'),(93,3,93,2639351,''),(94,4,94,0,''),(95,5,95,1651,'\0'),(96,6,96,9188370,'\0'),(97,7,97,2492,''),(98,8,98,5873434,''),(99,9,99,22431,''),(100,1,100,456,'');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Россия'),(2,'Германия');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specification_type`
--

DROP TABLE IF EXISTS `specification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specification_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specification_type`
--

LOCK TABLES `specification_type` WRITE;
/*!40000 ALTER TABLE `specification_type` DISABLE KEYS */;
INSERT INTO `specification_type` VALUES (1,'Рабочий'),(2,'Продавец');
/*!40000 ALTER TABLE `specification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint(20) unsigned NOT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `balance` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `type_id` (`type_id`),
  KEY `users_login_idx` (`login`),
  KEY `users_email_idx` (`email`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `users_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@biteconomika.ru',1,'$2y$10$SYCPZJevzViQOfQ4UHpsI.Zq8qtRh3LT7NfO8nMZZySJBy6oepMiS','\0',1000),(2,'test_user1','test_user1@biteconomika.ru',2,'$2y$10$5Z0Wh4Lw00VsM9LOxTgOoOWFAaUf4OuOgK0pA5FBfqCNb6J944mkm','\0',1000),(3,'test_user2','test_user2@biteconomika.ru',2,'$2y$10$C5eMC0HGF2fnCX6z9AJHYe.F1PB4grV21Pzaf9FzN0yscBhl63X6C','\0',1000);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_balance`
--

DROP TABLE IF EXISTS `users_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_balance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount_change` bigint(20) unsigned NOT NULL,
  `type_operation` enum('increase','decrease') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_balance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_balance`
--

LOCK TABLES `users_balance` WRITE;
/*!40000 ALTER TABLE `users_balance` DISABLE KEYS */;
INSERT INTO `users_balance` VALUES (1,1,10,'increase','fugiat','2015-04-15 06:12:25'),(2,2,291067,'increase','ipsum','2012-07-01 05:49:20'),(3,3,10861024,'decrease','labore','1974-12-24 05:59:49'),(4,1,3765,'increase','sed','1994-12-18 17:19:16'),(5,2,72616043,'decrease','aliquid','1982-10-05 13:55:21'),(6,3,15,'increase','aut','1993-04-25 14:34:20'),(7,1,6,'decrease','tenetur','1974-06-05 12:27:02'),(8,2,1898,'decrease','doloribus','1990-05-27 07:53:27'),(9,3,2502,'increase','omnis','1994-03-14 23:28:37'),(10,1,20146,'increase','accusantium','1987-10-02 04:10:25'),(11,2,4227,'decrease','voluptas','2002-02-14 07:41:45'),(12,3,10481613,'decrease','quisquam','1990-12-16 02:52:18'),(13,1,96,'decrease','id','1974-08-15 15:01:13'),(14,2,119,'increase','aperiam','2019-05-26 01:57:30'),(15,3,5,'decrease','voluptatem','1977-05-27 21:18:38'),(16,1,5059,'decrease','quo','1971-06-11 15:10:07'),(17,2,85087508,'decrease','nulla','2001-10-30 02:15:05'),(18,3,539,'decrease','aliquam','1984-05-10 18:20:41'),(19,1,342,'decrease','recusandae','1972-01-30 21:20:17'),(20,2,0,'decrease','adipisci','1970-10-25 18:05:36'),(21,3,716167324,'decrease','enim','2017-02-04 14:27:09'),(22,1,5,'decrease','id','2012-09-27 04:50:28'),(23,2,739594,'decrease','molestiae','2010-01-25 06:10:56'),(24,3,2641886,'increase','reprehenderit','1971-12-25 05:17:47'),(25,1,1175851,'decrease','aut','1999-12-11 00:48:51'),(26,2,1024,'increase','fugit','1997-08-18 07:05:04'),(27,3,125754334,'decrease','aut','2015-04-01 21:48:43'),(28,1,319,'increase','et','2016-10-25 20:46:46'),(29,2,7,'increase','soluta','1979-11-17 12:01:10'),(30,3,744400685,'decrease','aperiam','1987-10-17 18:26:45'),(31,1,21,'increase','repellat','2014-02-01 03:43:22'),(32,2,445,'increase','omnis','1990-02-05 03:02:11'),(33,3,6166094,'decrease','doloremque','2005-06-18 20:54:32'),(34,1,0,'increase','a','1971-04-27 01:44:43'),(35,2,4482,'decrease','voluptatem','2013-03-01 12:55:00'),(36,3,0,'increase','dolor','1992-07-31 14:53:06'),(37,1,18898212,'increase','beatae','2010-12-26 04:36:12'),(38,2,0,'decrease','omnis','1978-07-08 23:48:32'),(39,3,168901,'increase','vitae','2015-02-20 21:05:35'),(40,1,0,'increase','consectetur','2008-04-26 05:12:25'),(41,2,43823,'increase','deserunt','1991-07-22 21:45:30'),(42,3,0,'increase','aperiam','2008-02-24 03:21:36'),(43,1,9703650,'increase','aut','2004-08-18 17:36:07'),(44,2,0,'decrease','culpa','2004-03-05 18:23:49'),(45,3,5,'decrease','omnis','1991-04-30 07:26:39'),(46,1,1,'increase','et','1980-10-13 22:03:00'),(47,2,547,'decrease','qui','2006-09-14 12:51:17'),(48,3,97,'increase','ut','2009-05-02 02:46:02'),(49,1,3,'decrease','qui','2013-08-27 05:07:10'),(50,2,98044848,'decrease','aut','1994-07-07 18:43:32'),(51,3,3,'decrease','ad','1997-06-19 06:16:43'),(52,1,79899,'decrease','omnis','2018-05-30 21:21:46'),(53,2,1210868,'increase','facere','1990-08-29 05:35:27'),(54,3,274,'decrease','occaecati','2000-05-24 17:20:09'),(55,1,27482,'increase','est','1973-07-18 15:25:41'),(56,2,61794768,'decrease','vitae','1987-12-16 21:56:29'),(57,3,128366451,'increase','suscipit','1991-12-14 13:55:41'),(58,1,420437,'increase','eligendi','1982-01-26 11:20:33'),(59,2,0,'increase','incidunt','1977-11-30 12:14:19'),(60,3,15,'decrease','odio','2006-02-08 23:03:55'),(61,1,147,'increase','quis','2015-11-06 12:17:34'),(62,2,64,'increase','dolorem','1987-12-29 10:20:17'),(63,3,30643,'decrease','quam','1970-08-13 13:46:35'),(64,1,32,'increase','ipsam','1983-02-01 01:52:31'),(65,2,31,'increase','reiciendis','2003-12-12 11:26:23'),(66,3,209557914,'decrease','ut','2004-06-23 17:10:38'),(67,1,563167915,'increase','in','1995-06-25 17:08:43'),(68,2,4,'decrease','autem','2001-07-16 02:24:14'),(69,3,64487474,'decrease','reprehenderit','1985-08-31 14:01:26'),(70,1,57,'increase','non','1976-05-29 03:04:00'),(71,2,4842411,'increase','consectetur','2013-08-26 22:49:51'),(72,3,1028550,'decrease','omnis','2013-04-25 18:55:05'),(73,1,5445,'decrease','totam','2011-03-10 08:03:42'),(74,2,0,'increase','saepe','1982-04-07 09:46:01'),(75,3,9756,'increase','voluptatibus','2014-12-30 19:32:13'),(76,1,18921432,'decrease','voluptatem','1996-09-28 05:40:23'),(77,2,6465,'increase','ducimus','2014-12-26 04:53:33'),(78,3,16,'decrease','odio','2017-11-26 01:12:07'),(79,1,947,'decrease','aut','1976-09-15 14:07:32'),(80,2,8,'increase','dignissimos','2015-12-15 01:49:32'),(81,3,89804801,'decrease','et','2003-11-24 11:46:03'),(82,1,257995491,'decrease','autem','2005-04-22 23:15:34'),(83,2,58,'increase','et','1981-09-23 00:28:21'),(84,3,261,'increase','qui','2013-06-17 01:48:06'),(85,1,198,'increase','consequatur','1999-11-26 21:41:34'),(86,2,30879,'increase','fuga','1992-03-18 07:37:29'),(87,3,1216,'decrease','rerum','1990-04-09 02:43:40'),(88,1,0,'increase','dolores','1994-10-25 01:51:31'),(89,2,611468,'increase','unde','1994-05-24 04:07:21'),(90,3,2107514,'increase','sequi','1978-08-12 19:19:52'),(91,1,304701,'increase','quae','1978-02-07 23:52:51'),(92,2,2377,'decrease','distinctio','1970-11-28 23:58:20'),(93,3,1256912,'increase','aut','1992-08-07 04:58:52'),(94,1,34392551,'decrease','illo','1973-03-28 07:16:02'),(95,2,424745,'increase','alias','1988-11-23 05:54:48'),(96,3,0,'increase','saepe','1980-02-20 00:19:31'),(97,1,71264219,'decrease','dolore','2016-01-03 14:02:49'),(98,2,64,'decrease','quod','1984-01-27 20:15:45'),(99,3,732482,'increase','pariatur','1987-01-05 02:13:50'),(100,1,583383,'increase','ad','1998-02-03 05:36:41');
/*!40000 ALTER TABLE `users_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_type`
--

DROP TABLE IF EXISTS `users_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_type`
--

LOCK TABLES `users_type` WRITE;
/*!40000 ALTER TABLE `users_type` DISABLE KEYS */;
INSERT INTO `users_type` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `users_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-20 19:24:20
