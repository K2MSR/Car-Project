-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2019 at 03:27 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fixtdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `acceptingassistant`
--

CREATE TABLE `acceptingassistant` (
  `id` int(11) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `auid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assistant`
--

CREATE TABLE `assistant` (
  `uid` varchar(20) NOT NULL,
  `curlatitude` decimal(9,6) NOT NULL,
  `curlongitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `recuid` varchar(20) NOT NULL,
  `senuid` varchar(20) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `serviceuid` varchar(20) NOT NULL,
  `clientuid` varchar(20) NOT NULL,
  `rtext` varchar(200) DEFAULT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servicerequest`
--

CREATE TABLE `servicerequest` (
  `id` int(11) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `cat` varchar(20) NOT NULL,
  `reqdesc` varchar(500) DEFAULT NULL,
  `loclatitude` decimal(9,6) NOT NULL,
  `loclongitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servicerequestgranted`
--

CREATE TABLE `servicerequestgranted` (
  `cat` varchar(20) NOT NULL,
  `reqdesc` varchar(200) NOT NULL,
  `loclatitude` decimal(9,6) NOT NULL,
  `loclongitude` decimal(9,6) NOT NULL,
  `servuid` varchar(20) NOT NULL,
  `uid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `uid` varchar(30) NOT NULL,
  `cardnum` int(11) NOT NULL,
  `cardcvv` int(11) NOT NULL,
  `cardexpiry` varchar(14) NOT NULL,
  `nameoncard` varchar(30) NOT NULL,
  `renewedon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `senuid` varchar(20) NOT NULL,
  `recuid` varchar(20) NOT NULL,
  `amount` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` varchar(20) NOT NULL,
  `upassword` varchar(64) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `pimage` varchar(30) DEFAULT NULL,
  `atype` varchar(16) NOT NULL,
  `randsalt` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `upassword`, `fname`, `lname`, `email`, `dob`, `pimage`, `atype`, `randsalt`) VALUES
('longusername', '2f10bb103ed3809ffd20436bc92b59b8c125db4f5bbb741edf5a63c2e214e8', 'longusername', 'longusername', 'longusername@longusername.com', '1982-10-06', NULL, 'Customer', '[B@43561058'),
('longusername5', '61d975d3a94b511dcdddfd107f2c1d8ec32e3858bf8dfda76a43804be42d8', 'longusernamee', 'longusernamee', 'longusername5@longusername5.com', '1991-06-05', NULL, 'Customer', '[B@71676f60'),
('longusername52', '34ef7e15773f1ff532a4cb7f973ca03ca5759a13ffdeda67747ee189e43b81d', 'longusername', 'longusername', 'longusername52@longusername52.com', '1999-08-27', NULL, 'Customer', '[B@7f4f582c'),
('username11', 'b6a9286fbb8e271e2199acbf58a3c77c0ff5ac9a6fbab852e26929a7032398d', 'namename', 'surnamesurname', 'username11@gmail.com', '1986-09-28', NULL, 'Customer', '[B@3cc219e3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`recuid`,`senuid`),
  ADD KEY `mail_FK2` (`senuid`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`serviceuid`,`clientuid`);

--
-- Indexes for table `servicerequest`
--
ALTER TABLE `servicerequest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `servicerequestgranted`
--
ALTER TABLE `servicerequestgranted`
  ADD KEY `servicerequest_FK2` (`servuid`),
  ADD KEY `servicerequest_FK1` (`uid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`senuid`,`recuid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `id` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `servicerequest`
--
ALTER TABLE `servicerequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_FK1` FOREIGN KEY (`recuid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `mail_FK2` FOREIGN KEY (`senuid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `servicerequestgranted`
--
ALTER TABLE `servicerequestgranted`
  ADD CONSTRAINT `servicerequest_FK1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `servicerequest_FK2` FOREIGN KEY (`servuid`) REFERENCES `user` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
