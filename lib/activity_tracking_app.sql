-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2015 at 12:23 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `activity_tracking_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cts_clientdetails`
--

CREATE TABLE IF NOT EXISTS `cts_clientdetails` (
  `cts_clinetID` int(11) NOT NULL,
  `cts_clinetName` varchar(200) NOT NULL,
  `cts_clinetManagerID` int(11) NOT NULL,
  `cts_clinetManagername` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cts_commentdetails`
--

CREATE TABLE IF NOT EXISTS `cts_commentdetails` (
  `cts_commentID` int(11) NOT NULL,
  `cts_commentDescription` text NOT NULL,
  `cts_commentFrom` int(11) NOT NULL,
  `cts_commentDate` date NOT NULL,
  `cts_taskID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cts_commentdetails`
--

INSERT INTO `cts_commentdetails` (`cts_commentID`, `cts_commentDescription`, `cts_commentFrom`, `cts_commentDate`, `cts_taskID`) VALUES
(18, 'Hi....i would like to join this activity.Please assign some task to me.', 406650, '2015-08-26', 1),
(20, 'Hi....i would like to join this activity.Please assign some task to me.', 406650, '2015-08-26', 2),
(21, 'Any one om', 406649, '2015-08-27', 2),
(22, 'Hey Guys!!!!!!!!!!Lets rock have Fun', 488033, '2015-08-28', 6),
(23, 'Poda panni ', 406649, '2015-08-28', 6),
(24, 'Please refer to the deck we shared', 233640, '2015-09-02', 7),
(25, 'Yes Muthu, I can start. I checked the deck. I wanted to check if we need to use role name of role discussion portion?', 425633, '2015-09-02', 7),
(26, 'Please use role name', 233640, '2015-09-02', 7),
(27, 'done, please check and close.', 425633, '2015-09-02', 7);

-- --------------------------------------------------------

--
-- Table structure for table `cts_employeedetails`
--

CREATE TABLE IF NOT EXISTS `cts_employeedetails` (
  `cts_EmployeeID` int(11) NOT NULL,
  `cts_EmployeeName` varchar(200) DEFAULT NULL,
  `cts_ManagerID` int(11) NOT NULL DEFAULT '0',
  `cts_projecctID` varchar(200) DEFAULT NULL,
  `cts_employeeLocID` int(11) NOT NULL DEFAULT '0',
  `cts_employeePhone` double(20,0) DEFAULT NULL,
  `cts_employeeMobile` double(20,0) DEFAULT NULL,
  `cts_employeeShore` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cts_employeedetails`
--

INSERT INTO `cts_employeedetails` (`cts_EmployeeID`, `cts_EmployeeName`, `cts_ManagerID`, `cts_projecctID`, `cts_employeeLocID`, `cts_employeePhone`, `cts_employeeMobile`, `cts_employeeShore`) VALUES
(233640, 'Muthu', 406649, '1162', 0, 0, 0, NULL),
(402123, 'Sample!', 488033, '1-555455445', 0, 989745, 988744551, NULL),
(406612, 'NaveenSample', 406649, '1212121', 0, 0, 0, NULL),
(406649, 'Naveenkumar', 406649, '11000013322-966', 0, 476918, 7299040692, NULL),
(406650, 'Sharath', 406649, '12200-LM', 0, 0, 0, NULL),
(406651, 'Sudharsan', 406649, '11-123456', 0, 476918, 0, NULL),
(406652, 'Maris', 406649, '1-23214556', 0, 0, 0, NULL),
(406653, 'Joffy', 406652, '1-12345', 0, 476911, 9876543210, NULL),
(425633, 'Rajendra', 233640, '', 0, 0, 0, NULL),
(488033, 'Mariappan', 406649, '134036', 0, 476912, 9788940965, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cts_projectdetails`
--

CREATE TABLE IF NOT EXISTS `cts_projectdetails` (
  `cts_projectID` int(11) NOT NULL,
  `cts_projectName` varchar(200) NOT NULL,
  `cts_projectClientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cts_replydetails`
--

CREATE TABLE IF NOT EXISTS `cts_replydetails` (
  `cts_replyID` int(11) NOT NULL,
  `cts_replyDescription` text NOT NULL,
  `cts_replyFrom` int(11) NOT NULL,
  `cts_replyDate` date NOT NULL,
  `cts_commentID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cts_replydetails`
--

INSERT INTO `cts_replydetails` (`cts_replyID`, `cts_replyDescription`, `cts_replyFrom`, `cts_replyDate`, `cts_commentID`) VALUES
(5, 'Great Sharath!!!!we will add and let you know.....', 406649, '2015-08-26', 18),
(6, 'Sorry Sharath!!!!your skills doenot meet with our requirement.We will let you know if we have any assignment that meets your skills', 406649, '2015-08-26', 20),
(7, 'Hi Sharath!!! we need a css skilled resouce.Confirm us if you are intrested..', 406649, '2015-08-26', 20),
(8, 'I''m intrested on this ', 406650, '2015-08-26', 20),
(9, 'Great!!! i will add you to the Activity and shrae the details soon.....', 406649, '2015-08-26', 20),
(10, 'Hey Shrath!!!you were added..Start work on it ....', 406650, '2015-08-26', 18),
(11, 'OH', 406649, '2015-08-27', 21),
(12, 'poda panni !!!!', 406649, '2015-08-28', 22);

-- --------------------------------------------------------

--
-- Table structure for table `cts_taskassignment`
--

CREATE TABLE IF NOT EXISTS `cts_taskassignment` (
  `cts_taskID` int(11) NOT NULL,
  `cts_employeeID` int(11) NOT NULL,
  `cts_updatedBy` int(11) NOT NULL,
  `cts_assignmentStatus` int(11) NOT NULL DEFAULT '0' COMMENT '0-assigned,1-completed,2-withdrawn',
  `cts_completeComments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cts_taskassignment`
--

INSERT INTO `cts_taskassignment` (`cts_taskID`, `cts_employeeID`, `cts_updatedBy`, `cts_assignmentStatus`, `cts_completeComments`) VALUES
(1, 406650, 406652, 1, ''),
(1, 406651, 406652, 1, ''),
(1, 406653, 406652, 2, ''),
(2, 406612, 406649, 2, ''),
(2, 406649, 406649, 2, ''),
(2, 406650, 406649, 2, ''),
(2, 406651, 406649, 1, ''),
(2, 406652, 406649, 1, ''),
(2, 406653, 406649, 1, ''),
(4, 406652, 406649, 0, ''),
(6, 406652, 488033, 0, ''),
(6, 406653, 488033, 0, ''),
(6, 488033, 488033, 0, ''),
(7, 425633, 233640, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `cts_taskinfo`
--

CREATE TABLE IF NOT EXISTS `cts_taskinfo` (
  `cts_taskID` int(11) NOT NULL,
  `cts_taskName` varchar(200) NOT NULL,
  `cts_taskDescription` text NOT NULL,
  `cts_taskStatus` varchar(200) NOT NULL DEFAULT '0' COMMENT '0-Created(Default),1-completed,2-withdrawn',
  `cts_taskOwnerID` int(11) NOT NULL,
  `cts_startDate` date NOT NULL,
  `cts_endDate` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cts_taskinfo`
--

INSERT INTO `cts_taskinfo` (`cts_taskID`, `cts_taskName`, `cts_taskDescription`, `cts_taskStatus`, `cts_taskOwnerID`, `cts_startDate`, `cts_endDate`) VALUES
(1, 'PDF to HTML5 conversion', 'PDF to HTML5 conversion using JAVA / Spring framework', '2', 406652, '2015-08-26', '2015-08-29'),
(2, ' HTML5  to PDF conversion', ' HTML5  to PDF conversion using PHP', '1', 406649, '2015-08-18', '2015-08-31'),
(3, 'Activity tracking App', 'Activity tracking App in java', '0', 406652, '2015-08-20', '2015-08-28'),
(4, 'Automation of Decompiling bulk jar file', 'Automation of Decompiling bulk jar file using jadeclipse and java', '0', 406649, '2015-08-28', '2015-09-30'),
(5, 'xc', 'zxc', '0', 406649, '2015-08-14', '2015-08-05'),
(6, 'Dating', 'Dating Many Girls', '0', 488033, '2015-08-27', '2044-01-05'),
(7, 'collectivity - UI update', 'Update as discussed', '1', 233640, '2015-09-02', '2015-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `cts_userlogin`
--

CREATE TABLE IF NOT EXISTS `cts_userlogin` (
  `cts_employeeID` int(11) NOT NULL,
  `cts_employeePassword` varchar(200) NOT NULL,
  `cts_employeeEmail` varchar(200) NOT NULL,
  `cts_employeeRole` int(11) NOT NULL DEFAULT '0' COMMENT '0-user(Default),1-manager,9-Admin',
  `cts_employeeStatus` int(11) NOT NULL DEFAULT '0' COMMENT '0-pending(Default),1-Active,2-Disabled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cts_userlogin`
--

INSERT INTO `cts_userlogin` (`cts_employeeID`, `cts_employeePassword`, `cts_employeeEmail`, `cts_employeeRole`, `cts_employeeStatus`) VALUES
(233640, 'ccmsd', '406649@cognizant.com', 1, 1),
(402123, '1234', 'Sample!@cognizant.com', 0, 0),
(406612, '1234', 'NaveenSample@cognizant.com', 0, 1),
(406649, 'ccmsd', 'Naveenkumar.Palaninathan@cognizant.com', 9, 1),
(406650, '1234', 'Sharath@cognizant.com', 0, 1),
(406651, '1234', 'Sudharsan@cognizant.com', 0, 0),
(406652, '1234', 'Maris@cognizant.com', 1, 1),
(406653, '1234', 'Joffy@cognizant.com', 1, 0),
(425633, 'ccmsd', '406649@cognizant.com', 0, 1),
(488033, 'M@rish2015', 'mariappan.p@cognizant.com', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cts_clientdetails`
--
ALTER TABLE `cts_clientdetails`
  ADD PRIMARY KEY (`cts_clinetID`);

--
-- Indexes for table `cts_commentdetails`
--
ALTER TABLE `cts_commentdetails`
  ADD PRIMARY KEY (`cts_commentID`), ADD KEY `cts_commentID` (`cts_commentID`), ADD KEY `cts_commentID_2` (`cts_commentID`);

--
-- Indexes for table `cts_employeedetails`
--
ALTER TABLE `cts_employeedetails`
  ADD PRIMARY KEY (`cts_EmployeeID`);

--
-- Indexes for table `cts_projectdetails`
--
ALTER TABLE `cts_projectdetails`
  ADD PRIMARY KEY (`cts_projectID`);

--
-- Indexes for table `cts_replydetails`
--
ALTER TABLE `cts_replydetails`
  ADD PRIMARY KEY (`cts_replyID`), ADD KEY `cts_commentID` (`cts_replyID`), ADD KEY `cts_commentID_2` (`cts_replyID`);

--
-- Indexes for table `cts_taskassignment`
--
ALTER TABLE `cts_taskassignment`
  ADD PRIMARY KEY (`cts_taskID`,`cts_employeeID`);

--
-- Indexes for table `cts_taskinfo`
--
ALTER TABLE `cts_taskinfo`
  ADD PRIMARY KEY (`cts_taskID`);

--
-- Indexes for table `cts_userlogin`
--
ALTER TABLE `cts_userlogin`
  ADD PRIMARY KEY (`cts_employeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cts_commentdetails`
--
ALTER TABLE `cts_commentdetails`
  MODIFY `cts_commentID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `cts_replydetails`
--
ALTER TABLE `cts_replydetails`
  MODIFY `cts_replyID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `cts_taskinfo`
--
ALTER TABLE `cts_taskinfo`
  MODIFY `cts_taskID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
