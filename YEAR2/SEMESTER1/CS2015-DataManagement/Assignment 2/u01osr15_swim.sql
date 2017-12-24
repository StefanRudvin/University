-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: mysql.abdn.ac.uk:3306
-- Generation Time: Nov 11, 2016 at 03:26 PM
-- Server version: 5.5.21-log
-- PHP Version: 5.6.25

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u01osr15_swim`
--

-- --------------------------------------------------------

--
-- Table structure for table `courseName`
--

CREATE TABLE IF NOT EXISTS `courseName` (
  `courseID` varchar(6) NOT NULL,
  `courseName` varchar(30) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseName`
--

INSERT INTO `courseName` (`courseID`, `courseName`) VALUES
('C0001', 'beginner'),
('C0002', 'intermediate'),
('C0003', 'advanced'),
('C0004', 'olympic');

-- --------------------------------------------------------

--
-- Table structure for table `Courses`
--

CREATE TABLE IF NOT EXISTS `Courses` (
  `courseID` varchar(6) NOT NULL,
  `teamID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Courses`
--

INSERT INTO `Courses` (`courseID`, `teamID`) VALUES
('C0001', 'T0001'),
('C0002', 'T0002'),
('C0003', 'T0003'),
('C0004', 'T0004');

-- --------------------------------------------------------

--
-- Table structure for table `Instructors`
--

CREATE TABLE IF NOT EXISTS `Instructors` (
  `instructorID` varchar(6) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `phoneNumber` int(10) NOT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Instructors`
--

INSERT INTO `Instructors` (`instructorID`, `firstName`, `lastName`, `phoneNumber`) VALUES
('L0001', 'Lil', 'Wayne', 707654321),
('L0002', 'Sir', 'Lancelot', 701234568),
('L0003', 'Sir', 'Lancelot', 701234568),
('L0004', 'Donald', 'Trump', 701234568),
('L0005', 'Ariana', 'Grande', 701234569),
('L0006', 'Ted', 'Mosby', 701234569),
('L0007', 'Alice', 'Cooper', 701234569),
('L0008', 'Michael', 'Jackson', 701234569),
('L0009', 'Mahatma', 'Gandhi', 701234567),
('L0010', 'Sir', 'Lancelot', 701234568),
('L0011', 'Mahatma', 'Gandhi', 701234567),
('L0013', 'Lil', 'Wayne', 707654321),
('L0014', 'Hillary', 'Clinton', 408998775),
('L0015', 'Hillary', 'Clinton', 408998775);

-- --------------------------------------------------------

--
-- Table structure for table `JoinDate`
--

CREATE TABLE IF NOT EXISTS `JoinDate` (
  `traineeID` varchar(6) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`traineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `JoinDate`
--

INSERT INTO `JoinDate` (`traineeID`, `date`) VALUES
('T0001', '2016-11-02'),
('T0002', '2016-11-02'),
('T0003', '2016-11-02'),
('T0004', '2016-11-02'),
('T0005', '2016-11-02'),
('T0006', '2016-11-02'),
('T0007', '2016-11-02'),
('T0008', '2016-11-02'),
('T0009', '2016-11-02'),
('T0010', '2016-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `Supervisors`
--

CREATE TABLE IF NOT EXISTS `Supervisors` (
  `instructorID` varchar(6) NOT NULL,
  `sessionID` varchar(6) NOT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Supervisors`
--

INSERT INTO `Supervisors` (`instructorID`, `sessionID`) VALUES
('L0001', 'S0001'),
('L0002', 'S0002'),
('L0003', 'S0003'),
('L0004', 'S0004'),
('L0005', 'S0005'),
('L0006', 'S0006'),
('L0007', 'S0007');

-- --------------------------------------------------------

--
-- Table structure for table `Trainees`
--

CREATE TABLE IF NOT EXISTS `Trainees` (
  `traineeID` varchar(6) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `phoneNumber` int(10) NOT NULL,
  PRIMARY KEY (`traineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Trainees`
--

INSERT INTO `Trainees` (`traineeID`, `firstName`, `lastName`, `phoneNumber`) VALUES
('T0001', 'Lil', 'Wayne', 707654321),
('T0002', 'Sir', 'Lancelot', 701234568),
('T0003', 'Lil', 'Wayne', 707654321),
('T0004', 'Donald', 'Trump', 701234568),
('T0005', 'Ariana', 'Grande', 701234569),
('T0006', 'Ted', 'Mosby', 701234569),
('T0007', 'Alice', 'Cooper', 701234569),
('T0008', 'Michael', 'Jackson', 701234569),
('T0009', 'Mahatma', 'Gandhi', 701234567),
('T0010', 'Sir', 'Lancelot', 701234568);

-- --------------------------------------------------------

--
-- Table structure for table `TrainingSession`
--

CREATE TABLE IF NOT EXISTS `TrainingSession` (
  `sessionID` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `courseID` varchar(6) NOT NULL,
  PRIMARY KEY (`sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainingSession`
--

INSERT INTO `TrainingSession` (`sessionID`, `date`, `courseID`) VALUES
('S0001', '2016-11-22', 'C0001'),
('S0002', '2016-11-24', 'C0001'),
('S0003', '2016-11-26', 'C0002'),
('S0004', '2016-11-28', 'C0002'),
('S0005', '2016-11-22', 'C0003'),
('S0006', '2016-11-23', 'C0003'),
('S0007', '2016-11-27', 'C0004');

-- --------------------------------------------------------

--
-- Table structure for table `TrainingSessionInstructors`
--

CREATE TABLE IF NOT EXISTS `TrainingSessionInstructors` (
  `instructorID` varchar(6) NOT NULL,
  `sessionID` varchar(6) NOT NULL,
  `teamID` varchar(6) NOT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainingSessionInstructors`
--

INSERT INTO `TrainingSessionInstructors` (`instructorID`, `sessionID`, `teamID`) VALUES
('L0001', 'S0002', 'T0001'),
('L0002', 'S0004', 'T0002'),
('L0003', 'S0001', 'T0001'),
('L0004', 'S0003', 'T0002'),
('L0005', 'S0006', 'T0003'),
('L0006', 'S0005', 'T0003'),
('L0007', 'S0005', 'T0003'),
('L0008', 'S0003', 'T0002'),
('L0009', 'S0007', 'T0004'),
('L0010', 'S0007', 'T0004'),
('L0011', 'S0001', 'T0001'),
('L0013', 'S0002', 'T0001'),
('L0014', 'S0004', 'T0002'),
('L0015', 'S0006', 'T0003');

-- --------------------------------------------------------

--
-- Table structure for table `TrainingSessionTrainees`
--

CREATE TABLE IF NOT EXISTS `TrainingSessionTrainees` (
  `traineeID` varchar(6) NOT NULL,
  `sessionID` varchar(6) NOT NULL,
  PRIMARY KEY (`traineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainingSessionTrainees`
--

INSERT INTO `TrainingSessionTrainees` (`traineeID`, `sessionID`) VALUES
('T0001', 'S0001'),
('T0002', 'S0002'),
('T0003', 'S0003'),
('T0004', 'S0004'),
('T0005', 'S0005'),
('T0006', 'S0006'),
('T0007', 'S0007'),
('T0008', 'S0001'),
('T0009', 'S0002'),
('T0010', 'S0003');

-- --------------------------------------------------------

--
-- Table structure for table `TrainingTeams`
--

CREATE TABLE IF NOT EXISTS `TrainingTeams` (
  `instructorID` varchar(6) NOT NULL,
  `teamID` varchar(6) NOT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainingTeams`
--

INSERT INTO `TrainingTeams` (`instructorID`, `teamID`) VALUES
('L0001', 'T0001'),
('L0002', 'T0002'),
('L0003', 'T0001'),
('L0004', 'T0002'),
('L0005', 'T0003'),
('L0006', 'T0003'),
('L0007', 'T0003'),
('L0008', 'T0002'),
('L0009', 'T0004'),
('L0010', 'T0004'),
('L0011', 'T0001'),
('L0013', 'T0001'),
('L0014', 'T0002'),
('L0015', 'T0003');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Transaction1`
--
CREATE TABLE IF NOT EXISTS `Transaction1` (
`traineeID` varchar(6)
,`sessionID` varchar(6)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `Transaction2`
--
CREATE TABLE IF NOT EXISTS `Transaction2` (
`instructorID` varchar(6)
,`teamID` varchar(6)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `Transaction3`
--
CREATE TABLE IF NOT EXISTS `Transaction3` (
`instructorID` varchar(6)
,`courseID` varchar(6)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `Transaction4`
--
CREATE TABLE IF NOT EXISTS `Transaction4` (
`instructorID` varchar(6)
,`phoneNumber` int(10)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `Transaction5`
--
CREATE TABLE IF NOT EXISTS `Transaction5` (
`instructorID` varchar(6)
,`sessionID` varchar(6)
,`date` date
);
-- --------------------------------------------------------

--
-- Structure for view `Transaction1`
--
DROP TABLE IF EXISTS `Transaction1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u01osr15_swim`@`%.abdn.ac.uk` SQL SECURITY DEFINER VIEW `Transaction1` AS select `TrainingSessionTrainees`.`traineeID` AS `traineeID`,`TrainingSessionTrainees`.`sessionID` AS `sessionID` from `TrainingSessionTrainees` where (`TrainingSessionTrainees`.`sessionID` = 'S0001');

-- --------------------------------------------------------

--
-- Structure for view `Transaction2`
--
DROP TABLE IF EXISTS `Transaction2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u01osr15_swim`@`%.abdn.ac.uk` SQL SECURITY DEFINER VIEW `Transaction2` AS select `TrainingTeams`.`instructorID` AS `instructorID`,`TrainingTeams`.`teamID` AS `teamID` from `TrainingTeams` where (`TrainingTeams`.`teamID` = 'T0001');

-- --------------------------------------------------------

--
-- Structure for view `Transaction3`
--
DROP TABLE IF EXISTS `Transaction3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u01osr15_swim`@`%.abdn.ac.uk` SQL SECURITY DEFINER VIEW `Transaction3` AS select `T`.`instructorID` AS `instructorID`,`C`.`courseID` AS `courseID` from (`Courses` `C` join `TrainingTeams` `T`) where ((`T`.`instructorID` = 'L0001') and (`C`.`teamID` = `T`.`teamID`));

-- --------------------------------------------------------

--
-- Structure for view `Transaction4`
--
DROP TABLE IF EXISTS `Transaction4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u01osr15_swim`@`%.abdn.ac.uk` SQL SECURITY DEFINER VIEW `Transaction4` AS select `Instructors`.`instructorID` AS `instructorID`,`Instructors`.`phoneNumber` AS `phoneNumber` from `Instructors` where (`Instructors`.`instructorID` = 'L0001');

-- --------------------------------------------------------

--
-- Structure for view `Transaction5`
--
DROP TABLE IF EXISTS `Transaction5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u01osr15_swim`@`%.abdn.ac.uk` SQL SECURITY DEFINER VIEW `Transaction5` AS select `S`.`instructorID` AS `instructorID`,`S`.`sessionID` AS `sessionID`,`T`.`date` AS `date` from (`TrainingSession` `T` join `TrainingSessionInstructors` `S`) where ((`T`.`date` = '2016-11-24') and (`S`.`instructorID` = 'L0001'));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
