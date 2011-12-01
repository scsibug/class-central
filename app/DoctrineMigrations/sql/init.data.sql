-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 26, 2011 at 11:35 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cc_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `stream_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses.stream_id` (`stream_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `stream_id`) VALUES
(1, 'Introduction to Artificial Intelligence', 1),
(2, 'Introduction to Machine Learning', 1),
(3, 'Introduction to Databases', 1),
(4, 'CS 101', 1),
(5, 'Software as a Service', 1),
(6, 'Human-Computer Interaction', 1),
(7, 'Natural Language Processing', 1),
(8, 'Game Theory', 1),
(9, 'Probabilistic Graphical Models', 1),
(10, 'Cryptography', 1),
(11, 'Design and Analysis of Algorithms I', 1),
(12, 'Lean Launchpad', 2),
(13, 'Technology Entrepreneurship', 2),
(14, 'Anatomy', 5),
(15, 'Making Green Buildings', 3),
(16, 'Information Theory', 4);


-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE IF NOT EXISTS `instructors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `homepage` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `name`, `homepage`) VALUES
(1, 'Sebastian Thrun', NULL),
(2, 'Peter Norvig', NULL),
(3, 'Jennifer Widom', NULL),
(4, 'Andrew Ng', NULL),
(5, 'Nick Parlante', NULL),
(6, 'Armando Fox', NULL),
(7, 'David Patterson', NULL),
(8, 'Scott Klemmer', NULL),
(9, 'Chris Manning', NULL),
(10, 'Dan Jurafsky', NULL),
(11, 'Matthew Jackson', NULL),
(12, 'Yoav Shoham', NULL),
(13, 'Daphne Koller', NULL),
(14, 'Dan Boneh', NULL),
(15, 'Tim Roughgarden', NULL),
(16, 'Steve Blank', NULL),
(17, 'Chuck Eesley', NULL),
(18, 'Sakti Srivastava', NULL),
(19, 'Martin Fischer', NULL),
(20, 'Tsachy Weissman', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses_instructors`
--

CREATE TABLE IF NOT EXISTS `courses_instructors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_instructors.course_id` (`course_id`),
  KEY `courses_instructors.instructor_id` (`instructor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `courses_instructors`
--

INSERT INTO `courses_instructors` (`id`, `course_id`, `instructor_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 4),
(4, 3, 3),
(5, 4, 5),
(6, 5, 6),
(7, 5, 7),
(8, 6, 8),
(9, 7, 9),
(10, 7, 10),
(11, 8, 11),
(12, 8, 12),
(13, 9, 13),
(14, 10, 14),
(15, 11, 15),
(16, 12, 16),
(17, 13, 17),
(18, 14, 18),
(19, 15, 19),
(20, 16, 20);



-- --------------------------------------------------------

--
-- Table structure for table `offerings`
--

CREATE TABLE IF NOT EXISTS `offerings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `exact_dates_know` tinyint(1) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` text,
  PRIMARY KEY (`id`),
  KEY `offerings.course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `offerings`
--

INSERT INTO `offerings` (`id`, `course_id`, `start_date`, `end_date`, `exact_dates_know`, `created`, `modified`, `url`) VALUES
(1, 1, '2011-10-01', NULL, 0, NULL, '2011-11-26 23:17:18', 'https://www.ai-class.com/'),
(2, 2, '2011-10-01', NULL, 0, NULL, '2011-11-26 23:17:48', 'http://www.ml-class.org/'),
(3, 3, '2011-10-01', NULL, 0, NULL, '2011-11-26 23:18:18', 'http://www.db-class.org/'),
(4, 4, '2012-02-15', NULL, 0, NULL, '2011-11-26 23:19:16', 'http://www.cs101-class.org/'),
(6, 2, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:19:47', 'http://jan2012.ml-class.org/'),
(7, 5, '2012-02-20', NULL, 0, NULL, '2011-11-26 23:20:20', 'http://www.saas-class.org/'),
(8, 6, '2012-02-20', NULL, 0, NULL, '2011-11-26 23:20:48', 'http://www.hci-class.org/'),
(9, 7, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:21:28', 'http://www.nlp-class.org/'),
(10, 8, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:22:08', 'http://www.game-theory-class.org/'),
(11, 9, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:22:42', 'http://www.pgm-class.org/'),
(12, 10, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:23:35', 'http://www.crypto-class.org/'),
(13, 11, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:24:00', 'http://www.algo-class.org/'),
(14, 12, '2012-02-20', NULL, 0, NULL, '2011-11-26 23:24:32', 'http://www.launchpad-class.org/'),
(15, 13, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:25:01', 'http://www.venture-class.org/'),
(16, 14, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:25:32', 'http://www.anatomy-class.org/'),
(17, 15, '2012-01-20', NULL, 0, NULL, '2011-11-26 23:26:15', 'http://www.greenbuilding-class.org/'),
(18, 16, '2012-03-20', NULL, 0, NULL, '2011-11-26 23:26:54', 'http://www.infotheory-class.org/');

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE IF NOT EXISTS `streams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `streams`
--

INSERT INTO `streams` (`id`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Entrepreneurship'),
(3, 'Civil Engineering'),
(4, 'Electrical Engineering'),
(5, 'Medicine');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses.stream_id` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `courses_instructors`
--
ALTER TABLE `courses_instructors`
  ADD CONSTRAINT `courses_instructors.course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `courses_instructors.instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `offerings`
--
ALTER TABLE `offerings`
  ADD CONSTRAINT `offerings.course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


DELIMITER $$


CREATE TRIGGER offerings_OnInsert BEFORE INSERT ON `offerings`
    FOR EACH ROW SET NEW.created = IFNULL(NEW.created, NOW());

$$


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
