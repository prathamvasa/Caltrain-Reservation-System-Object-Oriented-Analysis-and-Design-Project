-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2015 at 11:59 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `caltrainreservationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `caltrain1`
--

CREATE TABLE IF NOT EXISTS `caltrain1` (
  `caltrain1_id` int(11) NOT NULL,
  `caltrain1_name` varchar(30) NOT NULL,
  `caltrain1_source` varchar(30) NOT NULL,
  `caltrain1_depart_time` int(11) NOT NULL,
  `caltrain1_availability` int(11) NOT NULL,
  `caltrain1_running_on` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caltrain1`
--

INSERT INTO `caltrain1` (`caltrain1_id`, `caltrain1_name`, `caltrain1_source`, `caltrain1_depart_time`, `caltrain1_availability`, `caltrain1_running_on`) VALUES
(1001, 'SJSF10WD', 'San Jose', 10, 4, 'Weekday'),
(1002, 'SJSF11WD', 'San Jose', 11, 18, 'Weekday'),
(1003, 'SJSF12WD', 'San Jose', 12, 19, 'Weekday'),
(1004, 'SFSJ10WD', 'San Francisco', 10, 2, 'Weekday'),
(1005, 'SFSJ11WD', 'San Francisco', 11, 25, 'Weekday'),
(1006, 'SFSJ12WD', 'San Francisco', 12, 24, 'Weekday'),
(1007, 'SJSF12WE', 'San Jose', 12, 25, 'Weekend'),
(1008, 'SFSJ12WE', 'San Francisco', 12, 30, 'Weekend'),
(1009, 'SJSF13WD', 'San Jose', 13, 30, 'Weekday'),
(1010, 'SJSF14WD', 'San Jose', 14, 30, 'Weekday'),
(1011, 'SJSF15WD', 'San Jose', 15, 30, 'Weekday'),
(1012, 'SJSF16WD', 'San Jose', 16, 30, 'Weekday'),
(1013, 'SFSJ13WD', 'San Francisco', 13, 30, 'Weekday'),
(1014, 'SFSJ14WD', 'San Francisco', 14, 30, 'Weekday'),
(1015, 'SFSJ15WD', 'San Francisco', 15, 30, 'Weekday'),
(1016, 'SFSJ16WD', 'San Francisco', 16, 30, 'Weekday'),
(1017, 'SJSF14WE', 'San Jose', 14, 25, 'Weekend'),
(1018, 'SJSF16WE', 'San Jose', 16, 27, 'Weekend'),
(1019, 'SFSJ14WE', 'San Francisco', 14, 25, 'Weekend'),
(1020, 'SFSJ16WE', 'San Francisco', 16, 30, 'Weekend'),
(1021, 'SJSF17WD', 'San Jose', 17, 0, 'Weekday'),
(1022, 'SJSF18WD', 'San Jose', 18, 30, 'Weekday'),
(1023, 'SFSJ17WD', 'San Francisco', 17, 23, 'Weekday'),
(1024, 'SFSJ18WD', 'San Francisco', 18, 30, 'Weekday');

-- --------------------------------------------------------

--
-- Table structure for table `caltraindetails`
--

CREATE TABLE IF NOT EXISTS `caltraindetails` (
  `cd_id` int(11) NOT NULL,
  `caltrain1_id` int(11) NOT NULL,
  `cd_destination` varchar(30) NOT NULL,
  `cd_arrival` int(11) NOT NULL,
  `cd_duration` int(11) NOT NULL,
  `cd_cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caltraindetails`
--

INSERT INTO `caltraindetails` (`cd_id`, `caltrain1_id`, `cd_destination`, `cd_arrival`, `cd_duration`, `cd_cost`) VALUES
(1, 1001, 'Santa Clara', 11, 1, 5),
(2, 1001, 'Sunnyvale', 12, 2, 10),
(3, 1001, 'Palo Alto', 13, 3, 15),
(4, 1001, 'San Mateo', 14, 4, 20),
(5, 1001, 'Broadway', 15, 5, 25),
(6, 1001, 'San Francisco', 16, 6, 30),
(7, 1002, 'Santa Clara', 12, 1, 5),
(8, 1002, 'Sunnyvale', 13, 2, 10),
(9, 1002, 'Palo Alto', 14, 3, 15),
(10, 1002, 'San Mateo', 15, 4, 20),
(11, 1002, 'Broadway', 16, 5, 25),
(12, 1002, 'San Francisco', 17, 6, 30),
(13, 1003, 'Santa Clara', 13, 1, 5),
(14, 1003, 'Sunnyvale', 14, 2, 10),
(15, 1003, 'Palo Alto', 15, 3, 15),
(16, 1003, 'San Mateo', 16, 4, 20),
(17, 1003, 'Broadway', 17, 5, 25),
(18, 1003, 'San Francisco', 18, 6, 30),
(19, 1004, 'Broadway', 11, 1, 5),
(20, 1004, 'San Mateo', 12, 2, 10),
(21, 1004, 'Palo Alto', 13, 3, 15),
(22, 1004, 'Sunnyvale', 14, 4, 20),
(23, 1004, 'Santa Clara', 15, 5, 25),
(24, 1004, 'San Jose', 16, 6, 30),
(25, 1005, 'Broadway', 12, 1, 5),
(26, 1005, 'San Mateo', 13, 2, 10),
(27, 1005, 'Palo Alto', 14, 3, 15),
(28, 1005, 'Sunnyvale', 15, 4, 20),
(29, 1005, 'Santa Clara', 16, 5, 25),
(30, 1005, 'San Jose', 17, 6, 30),
(31, 1006, 'Broadway', 13, 1, 5),
(32, 1006, 'San Mateo', 14, 2, 10),
(33, 1006, 'Palo Alto', 15, 3, 15),
(34, 1006, 'Sunnyvale', 16, 4, 20),
(35, 1006, 'Santa Clara', 17, 5, 25),
(36, 1006, 'San Jose', 18, 6, 30),
(37, 1007, 'Santa Clara', 13, 1, 5),
(38, 1007, 'Sunnyvale', 14, 2, 10),
(39, 1007, 'Palo Alto', 15, 3, 15),
(40, 1007, 'San Mateo', 16, 4, 20),
(41, 1007, 'Broadway', 17, 5, 25),
(42, 1007, 'San Francisco', 18, 6, 30),
(43, 1008, 'Broadway', 13, 1, 5),
(44, 1008, 'San Mateo', 14, 2, 10),
(45, 1008, 'Palo Alto', 15, 3, 15),
(46, 1008, 'Sunnyvale', 16, 4, 20),
(47, 1008, 'Santa Clara', 17, 5, 25),
(48, 1008, 'San Jose', 18, 6, 30),
(49, 1001, 'San Jose', 10, 0, 0),
(50, 1002, 'San Jose', 11, 0, 0),
(51, 1003, 'San Jose', 12, 0, 0),
(52, 1004, 'San Francisco', 10, 0, 0),
(53, 1005, 'San Francisco', 11, 0, 0),
(54, 1006, 'San Francisco', 12, 0, 0),
(55, 1007, 'San Jose', 12, 0, 0),
(56, 1008, 'San Francisco', 12, 0, 0),
(57, 1021, 'San Jose', 17, 0, 0),
(58, 1021, 'Santa Clara', 18, 1, 5),
(59, 1021, 'Sunnyvale', 19, 2, 10),
(60, 1021, 'Palo Alto', 20, 3, 15),
(61, 1021, 'San Mateo', 21, 4, 20),
(62, 1021, 'Broadway', 22, 5, 25),
(63, 1021, 'San Francisco', 23, 6, 30),
(64, 1022, 'San Jose', 18, 0, 0),
(65, 1022, 'Santa Clara', 19, 1, 5),
(66, 1022, 'Sunnyvale', 20, 2, 10),
(67, 1022, 'Palo Alto', 21, 3, 15),
(68, 1022, 'San Mateo', 22, 4, 20),
(69, 1022, 'Broadway', 23, 5, 25),
(70, 1022, 'San Francisco', 24, 6, 30),
(71, 1023, 'San Francisco', 17, 0, 0),
(72, 1023, 'Broadway', 18, 1, 5),
(73, 1023, 'San Mateo', 19, 2, 10),
(74, 1023, 'Palo Alto', 20, 3, 15),
(75, 1023, 'Sunnyvale', 21, 4, 20),
(76, 1023, 'Santa Clara', 22, 5, 25),
(77, 1023, 'San Jose', 23, 6, 30),
(78, 1024, 'San Francisco', 18, 0, 0),
(79, 1024, 'Broadway', 19, 1, 5),
(80, 1024, 'San Mateo', 20, 2, 10),
(81, 1024, 'Palo Alto', 21, 3, 15),
(82, 1024, 'Sunnyvale', 22, 4, 20),
(83, 1024, 'Santa Clara', 23, 5, 25),
(84, 1024, 'San Jose', 24, 6, 30),
(85, 1017, 'San Jose', 14, 0, 0),
(86, 1017, 'Santa Clara', 15, 1, 5),
(87, 1017, 'Sunnyvale', 16, 2, 10),
(88, 1017, 'Palo Alto', 17, 3, 15),
(89, 1017, 'San Mateo', 18, 4, 20),
(90, 1017, 'Broadway', 19, 5, 25),
(91, 1017, 'San Francisco', 20, 6, 30),
(92, 1018, 'San Jose', 16, 0, 0),
(93, 1018, 'Santa Clara', 17, 1, 5),
(94, 1018, 'Sunnyvale', 18, 2, 10),
(95, 1018, 'Palo Alto', 19, 3, 15),
(96, 1018, 'San Mateo', 20, 4, 20),
(97, 1018, 'Broadway', 21, 5, 25),
(98, 1018, 'San Francisco', 22, 6, 30),
(99, 1019, 'San Francisco', 14, 0, 0),
(100, 1019, 'Broadway', 15, 1, 5),
(101, 1019, 'San Mateo', 16, 2, 10),
(102, 1019, 'Palo Alto', 17, 3, 15),
(103, 1019, 'Sunnyvale', 18, 4, 20),
(104, 1019, 'Santa Clara', 19, 5, 25),
(105, 1019, 'San Jose', 20, 6, 30),
(106, 1020, 'San Francisco', 16, 0, 0),
(107, 1020, 'Broadway', 17, 1, 5),
(108, 1020, 'San Mateo', 18, 2, 10),
(109, 1020, 'Palo Alto', 19, 3, 15),
(110, 1020, 'Sunnyvale', 20, 4, 20),
(111, 1020, 'Santa Clara', 21, 5, 25),
(112, 1020, 'San Jose', 22, 6, 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_address` varchar(75) DEFAULT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_contact` varchar(20) DEFAULT NULL,
  `user_gender` varchar(10) DEFAULT NULL,
  `user_birthdate` varchar(20) DEFAULT NULL,
  `security_question1` varchar(60) DEFAULT NULL,
  `security_answer1` varchar(30) DEFAULT NULL,
  `security_question2` varchar(60) DEFAULT NULL,
  `security_answer2` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `user_name`, `user_password`, `user_address`, `user_email`, `user_contact`, `user_gender`, `user_birthdate`, `security_question1`, `security_answer1`, `security_question2`, `security_answer2`) VALUES
(1, 'Pratham', 'Vasa', 'prathamvasa99', 'mangalya', 'Santa Clara, California, 95050', 'prathamvasa9@gmail.com', '6692378242', 'Male', '22-09-1992', 'What was your childhood nickname ?', 'babloo', 'Which city were you born ?', 'Bombay'),
(2, 'Rachna', 'Mitikar', 'rmitikar23', 'indiaisbest', 'San Jose, California, 95055', 'rmitikar@scu.edu', '6692378299', 'Female', '14-04-1992', 'In which city or town was your first job ?', 'Pune', 'What is your favourite food ?', 'Bhaakarwadi'),
(3, 'Adit', 'Vira', 'avira5555', 'gobroncos', 'San Francisco, California, 95053', 'avira@scu.edu', '6506913704', 'Male', '03-09-1990', 'What is your favourite color ?', 'White', 'What school did you attend for sixth grade ?', 'LEMS'),
(4, 'Abhijit', 'Palve', 'apalve', 'abcd', 'Mumbai, Maharashtra, India.', 'apalve@scu.edu', '6692376655', 'Male', '03-03-1990', 'What was your childhood nickname ?', 'chotey', 'Which city were you born ?', 'Bengal'),
(5, 'Vishesh', 'Kamdar', 'vkamdar22', 'hodor', 'Santa Clara, California, 95050.', 'vkamdar@scu.edu', '6692378244', 'Male', '02-05-1990', 'What was your childhood nickname ?', 'Teddy', 'What is your favourite food ?', 'Everything'),
(6, 'Richard', 'Charles', 'rcharles1111', 'realmadrid123', 'Freemont, California, 95050.', 'rcharles@scu.edu', '6507137650', 'Male', '03-05-1992', 'What is your favourite color ?', 'Red', 'What is your favourite food ?', 'Sausage'),
(7, 'Suteekshan', 'Bhat', 'suttabhai', 'bhabhi', 'Jammu, India.', 'sbhat@scu.edu', '6693356262', 'Male', '05-06-1990', 'What was your childhood nickname ?', 'Sutta', 'Which city were you born ?', 'Jammu'),
(8, 'Nishant', 'Phatangare', 'nphatangare', 'nnnn', 'Pune, Maharashtra, India.', 'nphatangare@scu.edu', '6506678956', 'Male', '29-11-1889', 'What is your favourite color ?', 'Black', 'What is your favourite food ?', 'Bhaji'),
(9, 'Trupti', 'Raut', 'traut11', 'hellopeople', 'Mumbai, Maharashtra, India.', 'traut@scu.edu', '6678956675', 'Female', '02-03-1992', 'In which city or town was your first job ?', 'New Bombay', 'What school did you attend for sixth grade ? ', 'St Marys'),
(10, 'Ketan', 'Rajput', 'rajputana23', 'photography', 'New Bombay, Mumbai, India.', 'krajput@scu.edu', '', 'Male', '04-08-1992', 'What is your favourite color ?', 'Red', 'Which city were you born ?', 'Mumbai'),
(11, 'Venkatesh', 'Malhotra', 'venky11', 'abcdef', '', 'vmalhotra@scu.edu', '', 'Male', 'Day-Month-Year', 'What is your favourite color ?', 'blue', 'What is your favourite food ?', 'pasta'),
(12, 'Rahul', 'Urmania', 'ponyexpress', 'armani', 'Kalyan, Mumbai, India.', 'rurmania@scu.edu', '', 'Male', '16-08-1995', 'What is your favourite color ?', 'white', 'What school did you attend for sixth grade ?', 'Somaiya'),
(13, 'Vipul', 'Patil', 'vpatil22', 'arsenal', 'Mumbai, Maharashtra, India.', 'vpatil@scu.edu', '', 'Male', '12-05-1993', 'What is your favourite color ?', 'black', 'What is your favourite food ?', 'chapati');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caltrain1`
--
ALTER TABLE `caltrain1`
 ADD PRIMARY KEY (`caltrain1_id`);

--
-- Indexes for table `caltraindetails`
--
ALTER TABLE `caltraindetails`
 ADD PRIMARY KEY (`cd_id`), ADD KEY `caltrain1_id` (`caltrain1_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
