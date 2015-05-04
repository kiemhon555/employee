-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2015 at 12:02 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE IF NOT EXISTS `career` (
`id` int(11) NOT NULL,
  `job_position` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `work_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `worked_project` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `technology_used` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `platform` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `career`
--

INSERT INTO `career` (`id`, `job_position`, `work_description`, `worked_project`, `technology_used`, `platform`, `startTime`, `endTime`, `employee_id`) VALUES
(1, 'coder', 'user module', 'Cake Shop', 'PHP Core', 'PHP', '2013-06-10', '2013-07-22', 2),
(2, 'main coder', 'payment details', 'OnlineShoppingCart', 'ASP.NET', '.NET', '2014-11-30', '2014-12-30', 3),
(4, 'support', 'Help', 'e-Administration', 'J2EE', 'Java', '2015-03-09', '2015-04-09', 4),
(10, 'Coder', 'Main', 'PJ', 'Java', 'Java', '2013-08-21', '2013-09-21', 18),
(12, 'unknown', 'sure', 'non', 'html', 'web', '2012-01-11', '2012-02-21', 24);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
`id` int(11) NOT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `fullname`, `email`, `phone`, `imageUrl`) VALUES
(1, 'test employee', 'test@gmail.com', '123456', 'images/grey-wolf_565_600x450.jpg'),
(2, 'checked12', 'chk@mail.com.jp', '013579', ''),
(3, 'hello', 'hi@mail.com', '12345', ''),
(4, 'final', 'final@hmail.com', '1234567890', ''),
(5, 'last', 'last@desmail.com', '12345', ''),
(15, 'msn', 'noname_@', '12345', ''),
(18, 'Test New', 't@mail.com', '126', ''),
(21, 'hgrty', 'yhrt', 'hrtghrtf', ''),
(22, 'testsearch', 'search@gmail', '12345', ''),
(23, 'newcomer', 'new@mail.com', '12345-6708', ''),
(24, 'yay', 'y@mail.com', '09-0123-56', ''),
(25, 'checked12', 'chk@mail.com.jp', '013579', ''),
(26, 'new', 'mail@mail.com', '2345', ''),
(27, 'te', 'h@mail.com', '123', ''),
(28, 'testImage', 'image@mail.com', '12345', 'images/love-bird.jpg'),
(29, 'upload', 'up@mail.com', '0123456', 'images/great-white.jpg'),
(30, 'end', 'en@gmail.com', '012345', 'images/Black-Dragon.jpg'),
(31, 'new', 'new@hmail.org', '1234-567-890', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

CREATE TABLE IF NOT EXISTS `skillset` (
`id` int(11) NOT NULL,
  `technology` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `experiencedYears` int(11) NOT NULL,
  `recentDate` date NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skillset`
--

INSERT INTO `skillset` (`id`, `technology`, `experiencedYears`, `recentDate`, `employee_id`) VALUES
(2, 'SQL Server', 3, '2015-04-01', 5),
(3, 'PHP', 2, '2014-11-10', 4),
(4, 'MySQL', 2, '2014-06-16', 5),
(16, 'C#', 2, '2014-08-25', 3),
(19, 'Java Core', 2, '2013-01-01', 2),
(20, 'C', 3, '2012-08-19', 1),
(21, 'HTML', 2, '2015-02-20', 1),
(22, 'ASP.NET', 1, '2014-11-13', 18),
(28, 'Test', 1, '2014-09-20', 15),
(29, 'JavaEE', 2, '2015-04-09', 22),
(31, 'Java Swing', 1, '2013-11-20', 3),
(37, 'chk', 1, '2015-04-08', 3),
(38, 'jk', 2, '2015-04-07', 24),
(39, 'non', 2, '2015-04-01', 24),
(40, 'test', 0, '2015-04-09', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `career`
--
ALTER TABLE `career`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skillset`
--
ALTER TABLE `skillset`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `career`
--
ALTER TABLE `career`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `skillset`
--
ALTER TABLE `skillset`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `career`
--
ALTER TABLE `career`
ADD CONSTRAINT `career_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skillset`
--
ALTER TABLE `skillset`
ADD CONSTRAINT `skillset_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
