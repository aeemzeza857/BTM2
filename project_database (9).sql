-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2020 at 05:59 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `App_ID` char(6) CHARACTER SET tis620 NOT NULL,
  `App_place` varchar(50) CHARACTER SET tis620 NOT NULL,
  `App_time` varchar(50) CHARACTER SET tis620 NOT NULL,
  `App_detail` varchar(50) CHARACTER SET tis620 NOT NULL,
  `Ins_ID` char(6) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `Stu_ID` char(6) CHARACTER SET tis620 NOT NULL,
  `App_request` enum('รอการอนุมัติ','ไม่อนุมัติ','อนุมัติ','ยกเลิกการเข้าพบ') CHARACTER SET tis620 NOT NULL DEFAULT 'รอการอนุมัติ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`App_ID`, `App_place`, `App_time`, `App_detail`, `Ins_ID`, `Stu_ID`, `App_request`) VALUES
('400002', 'ห้อง 209', '12:30', 'การถอนวิชาเรียน', '200003', '601524', 'อนุมัติ'),
('400003', 'ห้อง 2011', '15:30', 'ลงทะเบียนเพื่ม', '200001', '601524', 'อนุมัติ'),
('400004', 'ห้อง สาขา', '09:30', 'การถอนวิชาเรียน', '200002', '601522', 'รอการอนุมัติ'),
('400005', 'ห้อง สาขา', '09:30', 'การถอนวิชาเรียน', '200002', '601522', 'ไม่อนุมัติ');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `Ins_ID` char(6) NOT NULL DEFAULT 'No id',
  `Ins_img` varchar(255) NOT NULL,
  `Ins_username` varchar(255) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Ins_password` varchar(255) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Ins_firstname` varchar(30) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Ins_lastname` varchar(30) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Ins_tel` char(30) DEFAULT 'ไม่มีข้อมูล',
  `Ins_sex` varchar(15) NOT NULL,
  `Ins_status` varchar(255) NOT NULL DEFAULT 'อาจารย์',
  `Ins_use` enum('ว่าง','ไม่ว่าง') NOT NULL DEFAULT 'ว่าง',
  `Userlevel` enum('T') NOT NULL DEFAULT 'T',
  `Ins_sat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`Ins_ID`, `Ins_img`, `Ins_username`, `Ins_password`, `Ins_firstname`, `Ins_lastname`, `Ins_tel`, `Ins_sex`, `Ins_status`, `Ins_use`, `Userlevel`, `Ins_sat`) VALUES
('200001', 'img5e1b5372172ed.jpg', 's123', '123456', 'สุรัต', 'หาญกล้า', '0835815723', 'หญิง', 'อาจารย์', 'ว่าง', 'T', ''),
('200002', 'img5e0879877f092.jpg', 'lukkana2882', 'luk123', 'ลักขณา', 'สำราญใจ', '0915722485', 'ชาย', 'อาจารย์', 'ว่าง', 'T', ''),
('200003', 'img5e1b4e2cab08d.jpg', 't123 ', '123456', 'วิรัตน์', 'บุตรวาปี', 'aaa', 'ชาย', '	 อาจารย์', 'ไม่ว่าง', 'T', '');

-- --------------------------------------------------------

--
-- Table structure for table `scheduled`
--

CREATE TABLE `scheduled` (
  `Sch_ID` char(6) NOT NULL,
  `Sch_day` varchar(555) NOT NULL,
  `Sch_room` varchar(255) NOT NULL,
  `Sch_teachtime` varchar(255) NOT NULL,
  `Ins_ID` char(6) NOT NULL,
  `Sub_ID` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Stu_ID` char(6) NOT NULL DEFAULT '000000',
  `Stu_img` varchar(255) NOT NULL,
  `Stu_username` varchar(255) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Stu_password` varchar(255) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Stu_firstname` varchar(30) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Stu_lastname` varchar(30) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Stu_sex` enum('ชาย','หญิง','ไม่ระบุเพศ') NOT NULL DEFAULT 'ชาย',
  `Stu_class` varchar(50) NOT NULL DEFAULT 'ไม่มีข้อมูล',
  `Stu_tel` char(50) DEFAULT 'ไม่มีข้อมูล',
  `Stu_status` enum('นักศึกษา','พ้นสภาพ','admin') NOT NULL DEFAULT 'นักศึกษา',
  `Userlevel` enum('A','M') NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Stu_ID`, `Stu_img`, `Stu_username`, `Stu_password`, `Stu_firstname`, `Stu_lastname`, `Stu_sex`, `Stu_class`, `Stu_tel`, `Stu_status`, `Userlevel`) VALUES
('601521', 'img5e0882e44a9c3.jpg', 'apichok ', 'man123', 'อภิโชค', 'อบอุ่น', 'ชาย', 'IS3/4 A', '0834567895', 'นักศึกษา', 'M'),
('601522', 'img5e0990bf93297.jpg', 'green123  ', '123456', 'พีรเมธ', 'มิ่งเมือง', 'ชาย', 'IS3/4 A', '0834567895', 'นักศึกษา', 'M'),
('601523', 'img5e0860056be65.png', 'admin   ', 'admin', 'ผู้ดูแล', 'ระบบ', 'ชาย', '0/0', '000-000-00001', 'admin', 'A'),
('601524', 'img5e0ae2b7b44a3.jpg', 'aeemzeza857', '123456', 'ทัตตพันธุ์', 'หวังอ้อมกลาง', 'ชาย', 'IS3/4 A', '1234567890', 'นักศึกษา', 'M'),
('601525', 'img5e2093f670ee8.jpg', 'toey', '1234', 'ณัฐพล', 'เจริญสิริ', 'ชาย', 'IS3/4 A', '1234567890', 'นักศึกษา', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `Sub_ID` char(6) NOT NULL,
  `Sub_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Sub_ID`, `Sub_name`) VALUES
('503456', 'Network'),
('503467', 'Database'),
('503477', 'System Analyst'),
('503487', '\r\nOperating System');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`App_ID`),
  ADD KEY `Ins_ID` (`Ins_ID`),
  ADD KEY `Stu_ID` (`Stu_ID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`Ins_ID`);

--
-- Indexes for table `scheduled`
--
ALTER TABLE `scheduled`
  ADD PRIMARY KEY (`Sch_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Stu_ID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`Sub_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
