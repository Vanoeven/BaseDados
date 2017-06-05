-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 05, 2017 at 10:00 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prisão`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividade`
--

CREATE TABLE IF NOT EXISTS `actividade` (
  `nome_act` varchar(255) NOT NULL,
  `local_a` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `bloco_id` int(11) NOT NULL,
  `gid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bloco`
--

CREATE TABLE IF NOT EXISTS `bloco` (
  `bloco_id` int(11) NOT NULL,
  `ncelas` int(11) DEFAULT NULL,
  `morada` varchar(255) DEFAULT NULL,
  `gid` int(11) NOT NULL,
  `nome_act` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `celas`
--

CREATE TABLE IF NOT EXISTS `celas` (
  `celas_id` int(11) DEFAULT NULL,
  `bloco_id` int(11) NOT NULL,
  `npresos` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guarda`
--

CREATE TABLE IF NOT EXISTS `guarda` (
  `gid` int(11) NOT NULL,
  `nomeguar` varchar(255) DEFAULT NULL,
  `nome_act` varchar(255) NOT NULL,
  `bloco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patios`
--

CREATE TABLE IF NOT EXISTS `patios` (
  `patios_id` int(11) DEFAULT NULL,
  `bloco_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preso`
--

CREATE TABLE IF NOT EXISTS `preso` (
  `pid` int(11) NOT NULL,
  `reicidencia` int(11) DEFAULT NULL,
  `sentença` int(11) DEFAULT NULL,
  `nome_preso` varchar(255) DEFAULT NULL,
  `local_de_origem` varchar(255) DEFAULT NULL,
  `comportamento` varchar(255) DEFAULT NULL,
  `nome_act` varchar(255) NOT NULL,
  `bloco_i` int(11) NOT NULL,
  `bloco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prisao`
--

CREATE TABLE IF NOT EXISTS `prisao` (
  `morada` varchar(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `nivel_de_segurança` varchar(255) DEFAULT NULL,
  `error` int(11) NOT NULL,
  `bloco_id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `nome_act` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actividade`
--
ALTER TABLE `actividade`
  ADD PRIMARY KEY (`nome_act`),
  ADD KEY `pid` (`pid`),
  ADD KEY `bloco_id` (`bloco_id`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `bloco`
--
ALTER TABLE `bloco`
  ADD PRIMARY KEY (`bloco_id`),
  ADD KEY `morada` (`morada`),
  ADD KEY `gid` (`gid`),
  ADD KEY `nome_act` (`nome_act`);

--
-- Indexes for table `celas`
--
ALTER TABLE `celas`
  ADD PRIMARY KEY (`bloco_id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `guarda`
--
ALTER TABLE `guarda`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `nome_act` (`nome_act`),
  ADD KEY `bloco_id` (`bloco_id`);

--
-- Indexes for table `patios`
--
ALTER TABLE `patios`
  ADD PRIMARY KEY (`bloco_id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `preso`
--
ALTER TABLE `preso`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `nome_act` (`nome_act`),
  ADD KEY `bloco_id` (`bloco_i`),
  ADD KEY `bloco_id_2` (`bloco_id`);

--
-- Indexes for table `prisao`
--
ALTER TABLE `prisao`
  ADD PRIMARY KEY (`morada`),
  ADD KEY `bloco_id` (`error`),
  ADD KEY `bloco_id_2` (`bloco_id`),
  ADD KEY `gid` (`gid`),
  ADD KEY `nome_act` (`nome_act`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actividade`
--
ALTER TABLE `actividade`
  ADD CONSTRAINT `actividade_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `preso` (`pid`),
  ADD CONSTRAINT `actividade_ibfk_2` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`),
  ADD CONSTRAINT `actividade_ibfk_3` FOREIGN KEY (`gid`) REFERENCES `guarda` (`gid`);

--
-- Constraints for table `bloco`
--
ALTER TABLE `bloco`
  ADD CONSTRAINT `bloco_ibfk_1` FOREIGN KEY (`morada`) REFERENCES `prisao` (`morada`),
  ADD CONSTRAINT `bloco_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `guarda` (`gid`),
  ADD CONSTRAINT `bloco_ibfk_3` FOREIGN KEY (`nome_act`) REFERENCES `actividade` (`nome_act`);

--
-- Constraints for table `celas`
--
ALTER TABLE `celas`
  ADD CONSTRAINT `celas_ibfk_1` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`),
  ADD CONSTRAINT `celas_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `preso` (`pid`);

--
-- Constraints for table `guarda`
--
ALTER TABLE `guarda`
  ADD CONSTRAINT `guarda_ibfk_1` FOREIGN KEY (`nome_act`) REFERENCES `actividade` (`nome_act`),
  ADD CONSTRAINT `guarda_ibfk_2` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`);

--
-- Constraints for table `patios`
--
ALTER TABLE `patios`
  ADD CONSTRAINT `patios_ibfk_1` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`),
  ADD CONSTRAINT `patios_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `preso` (`pid`);

--
-- Constraints for table `preso`
--
ALTER TABLE `preso`
  ADD CONSTRAINT `preso_ibfk_1` FOREIGN KEY (`nome_act`) REFERENCES `actividade` (`nome_act`),
  ADD CONSTRAINT `preso_ibfk_2` FOREIGN KEY (`bloco_i`) REFERENCES `celas` (`bloco_id`),
  ADD CONSTRAINT `preso_ibfk_3` FOREIGN KEY (`bloco_id`) REFERENCES `patios` (`bloco_id`);

--
-- Constraints for table `prisao`
--
ALTER TABLE `prisao`
  ADD CONSTRAINT `prisao_ibfk_1` FOREIGN KEY (`error`) REFERENCES `bloco` (`bloco_id`),
  ADD CONSTRAINT `prisao_ibfk_2` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`),
  ADD CONSTRAINT `prisao_ibfk_3` FOREIGN KEY (`gid`) REFERENCES `guarda` (`gid`),
  ADD CONSTRAINT `prisao_ibfk_4` FOREIGN KEY (`nome_act`) REFERENCES `actividade` (`nome_act`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
