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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `stream_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses.stream_id` (`stream_id`),
  CONSTRAINT `courses.stream_id` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Introduction to Artificial Intelligence',1),(2,'Introduction to Machine Learning',1),(3,'Introduction to Databases',1),(4,'CS 101',1),(5,'Software as a Service',1),(6,'Human-Computer Interaction',1),(7,'Natural Language Processing',1),(8,'Game Theory',1),(9,'Probabilistic Graphical Models',1),(10,'Cryptography',1),(11,'Design and Analysis of Algorithms I',1),(12,'Lean Launchpad',2),(13,'Technology Entrepreneurship',2),(14,'Anatomy',5),(15,'Making Green Buildings',3),(16,'Information Theory',4),(17,'Model Thinking',6),(18,'Computer Security',1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_instructors`
--

DROP TABLE IF EXISTS `courses_instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_instructors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_instructors.course_id` (`course_id`),
  KEY `courses_instructors.instructor_id` (`instructor_id`),
  CONSTRAINT `courses_instructors.course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `courses_instructors.instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_instructors`
--

LOCK TABLES `courses_instructors` WRITE;
/*!40000 ALTER TABLE `courses_instructors` DISABLE KEYS */;
INSERT INTO `courses_instructors` VALUES (1,1,1),(2,1,2),(3,2,4),(4,3,3),(5,4,5),(6,5,6),(7,5,7),(8,6,8),(9,7,9),(10,7,10),(11,8,11),(12,8,12),(13,9,13),(14,10,14),(15,11,15),(16,12,16),(17,13,17),(18,14,18),(19,15,19),(20,16,20),(21,17,21),(22,18,14),(23,18,22),(24,18,23);
/*!40000 ALTER TABLE `courses_instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `homepage` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'Sebastian Thrun',NULL),(2,'Peter Norvig',NULL),(3,'Jennifer Widom',NULL),(4,'Andrew Ng',NULL),(5,'Nick Parlante',NULL),(6,'Armando Fox',NULL),(7,'David Patterson',NULL),(8,'Scott Klemmer',NULL),(9,'Chris Manning',NULL),(10,'Dan Jurafsky',NULL),(11,'Matthew Jackson',NULL),(12,'Yoav Shoham',NULL),(13,'Daphne Koller',NULL),(14,'Dan Boneh',NULL),(15,'Tim Roughgarden',NULL),(16,'Steve Blank',NULL),(17,'Chuck Eesley',NULL),(18,'Sakti Srivastava',NULL),(19,'Martin Fischer',NULL),(20,'Tsachy Weissman',NULL),(21,'Scott E Page',NULL),(22,'John Mitchell',NULL),(23,'Dawn Song',NULL);
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerings`
--

DROP TABLE IF EXISTS `offerings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offerings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `exact_dates_know` tinyint(1) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` text,
  `video_intro` text,
  `length` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offerings.course_id` (`course_id`),
  CONSTRAINT `offerings.course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerings`
--

LOCK TABLES `offerings` WRITE;
/*!40000 ALTER TABLE `offerings` DISABLE KEYS */;
INSERT INTO `offerings` VALUES (1,1,'2011-10-01',NULL,0,NULL,'2011-12-05 03:50:41','https://www.ai-class.com/','http://www.youtube.com/watch?feature=player_embedded&v=BnIJ7Ba5Sr4',10),(2,2,'2011-10-01',NULL,0,NULL,'2011-12-05 03:50:55','http://www.ml-class.org/','http://www.youtube.com/watch?v=e0WKJLovaZg&feature=player_embedded',10),(3,3,'2011-10-01',NULL,0,NULL,'2011-12-05 03:52:38','http://www.db-class.org/','http://www.youtube.com/watch?v=ShjrtAQmIVg&feature=player_embedded',9),(4,4,'2012-02-15',NULL,0,NULL,'2011-12-02 00:58:43','http://www.cs101-class.org/','http://www.youtube.com/watch?v=nnBbf8FG5Hw&feature=player_embedded',NULL),(6,2,'2012-01-20',NULL,0,NULL,'2011-12-05 03:53:09','http://jan2012.ml-class.org/','http://www.youtube.com/watch?v=e0WKJLovaZg&feature=player_embedded',10),(7,5,'2012-02-20',NULL,0,NULL,'2011-12-02 00:57:58','http://www.saas-class.org/','http://www.youtube.com/watch?v=4PZD0rOlWH8&feature=player_embedded',NULL),(8,6,'2012-02-20',NULL,0,NULL,'2011-12-02 00:57:36','http://www.hci-class.org/','http://www.youtube.com/watch?v=GBwLAqOjbrA&feature=player_embedded',NULL),(9,7,'2012-01-23',NULL,1,NULL,'2011-12-05 03:53:57','http://www.nlp-class.org/','http://www.youtube.com/watch?v=Fnr4A0tcU-M&feature=player_embedded',8),(10,8,'2012-01-20',NULL,0,NULL,'2011-12-02 00:56:47','http://www.game-theory-class.org/','http://www.youtube.com/watch?v=_UcRbnJoDKc&feature=player_embedded',NULL),(11,9,'2012-01-20',NULL,0,NULL,'2011-12-05 03:54:54','http://www.pgm-class.org/','http://www.youtube.com/watch?v=S1r6nZjMQC8&feature=player_embedded',10),(12,10,'2012-01-20',NULL,0,NULL,'2011-12-02 00:56:05','http://www.crypto-class.org/','http://www.youtube.com/watch?v=QVL1gjS20XU&feature=player_embedded',NULL),(13,11,'2012-01-23',NULL,1,NULL,'2011-12-05 03:55:12','http://www.algo-class.org/','http://www.youtube.com/watch?v=_gr7o5ynhnw&feature=player_embedded',5),(14,12,'2012-02-20',NULL,0,NULL,'2011-12-02 00:55:18','http://www.launchpad-class.org/','http://www.youtube.com/watch?v=AINJpHoefDc&feature=player_embedded',NULL),(15,13,'2012-01-20',NULL,0,NULL,'2011-12-02 00:54:58','http://www.venture-class.org/','http://www.youtube.com/watch?v=Muy9vyHPUAM&feature=player_embedded',NULL),(16,14,'2012-01-20',NULL,0,NULL,'2011-12-02 00:54:31','http://www.anatomy-class.org/','http://www.youtube.com/watch?v=mvXOZK5IdDs&feature=player_embedded',NULL),(17,15,'2012-01-20',NULL,0,NULL,'2011-12-02 00:54:11','http://www.greenbuilding-class.org/','http://www.youtube.com/watch?v=uoyzbgx3iTo&feature=player_embedded',NULL),(18,16,'2012-03-20',NULL,0,NULL,'2011-12-02 00:53:50','http://www.infotheory-class.org/','http://www.youtube.com/watch?v=6M3Ych6nkTk&feature=player_embedded',NULL),(19,17,'2012-01-20',NULL,0,NULL,'2011-12-02 00:53:27','http://www.modelthinker-class.org/','http://www.youtube.com/watch?v=y7CPoSeYQaQ&feature=player_embedded',NULL),(20,18,'2012-02-20',NULL,0,NULL,'2011-12-02 00:48:58','http://www.security-class.org/','http://www.youtube.com/watch?v=esxpFYJqEUg&feature=player_embedded',NULL);
/*!40000 ALTER TABLE `offerings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams`
--

LOCK TABLES `streams` WRITE;
/*!40000 ALTER TABLE `streams` DISABLE KEYS */;
INSERT INTO `streams` VALUES (1,'Computer Science'),(2,'Entrepreneurship'),(3,'Civil Engineering'),(4,'Electrical Engineering'),(5,'Medicine'),(6,'Complex Systems');
/*!40000 ALTER TABLE `streams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-12-05  6:39:32
