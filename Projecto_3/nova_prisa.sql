-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2017 at 10:16 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nova_prisa`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividades`
--

CREATE TABLE IF NOT EXISTS `actividades` (
  `nome_act` varchar(255) NOT NULL,
  `local_a` varchar(255) NOT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bloco`
--

CREATE TABLE IF NOT EXISTS `bloco` (
  `bloco_id` int(11) NOT NULL,
  `ncelas` int(11) NOT NULL,
  `morada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `celas`
--

CREATE TABLE IF NOT EXISTS `celas` (
  `bloco_id` int(11) NOT NULL,
  `celas_id` int(11) NOT NULL DEFAULT '0',
  `n_presos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disfruta`
--

CREATE TABLE IF NOT EXISTS `disfruta` (
  `pid` int(11) DEFAULT NULL,
  `bloco_id` int(11) DEFAULT NULL,
  `patio_id` int(11) DEFAULT NULL,
  `n_horas` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guarda`
--

CREATE TABLE IF NOT EXISTS `guarda` (
  `gid` int(11) NOT NULL,
  `nomeguar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patios`
--

CREATE TABLE IF NOT EXISTS `patios` (
  `bloco_id` int(11) NOT NULL,
  `patio_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preso`
--

CREATE TABLE IF NOT EXISTS `preso` (
  `pid` int(11) NOT NULL,
  `reicidencia` int(11) NOT NULL,
  `sentenca` int(11) NOT NULL,
  `nome_preso` varchar(255) NOT NULL,
  `local_de_origem` varchar(255) NOT NULL,
  `comportamento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preso_in`
--

CREATE TABLE IF NOT EXISTS `preso_in` (
  `pid` int(11) DEFAULT NULL,
  `morada` varchar(255) DEFAULT NULL,
  `bloco_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `celas_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prisao`
--

CREATE TABLE IF NOT EXISTS `prisao` (
  `morada` varchar(255) NOT NULL,
  `nome_pris` varchar(255) NOT NULL,
  `nivel_de_seguranca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `turno`
--

CREATE TABLE IF NOT EXISTS `turno` (
  `gid` int(11) DEFAULT NULL,
  `nome_act` varchar(255) DEFAULT NULL,
  `bloco_id` int(11) DEFAULT NULL,
  `nguardas` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `works_in`
--

CREATE TABLE IF NOT EXISTS `works_in` (
  `morada` varchar(255) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `treino` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`nome_act`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `bloco`
--
ALTER TABLE `bloco`
  ADD PRIMARY KEY (`ncelas`),
  ADD KEY `morada` (`morada`),
  ADD KEY `bloco_id` (`bloco_id`);

--
-- Indexes for table `celas`
--
ALTER TABLE `celas`
  ADD PRIMARY KEY (`celas_id`),
  ADD KEY `bloco_id` (`bloco_id`);

--
-- Indexes for table `disfruta`
--
ALTER TABLE `disfruta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `bloco_id` (`bloco_id`),
  ADD KEY `patio_id` (`patio_id`);

--
-- Indexes for table `guarda`
--
ALTER TABLE `guarda`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `patios`
--
ALTER TABLE `patios`
  ADD PRIMARY KEY (`patio_id`),
  ADD KEY `bloco_id` (`bloco_id`);

--
-- Indexes for table `preso`
--
ALTER TABLE `preso`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `preso_in`
--
ALTER TABLE `preso_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `morada` (`morada`),
  ADD KEY `bloco_id` (`bloco_id`),
  ADD KEY `celas_id` (`celas_id`);

--
-- Indexes for table `prisao`
--
ALTER TABLE `prisao`
  ADD PRIMARY KEY (`morada`);

--
-- Indexes for table `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`),
  ADD KEY `nome_act` (`nome_act`),
  ADD KEY `bloco_id` (`bloco_id`);

--
-- Indexes for table `works_in`
--
ALTER TABLE `works_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`),
  ADD KEY `morada` (`morada`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disfruta`
--
ALTER TABLE `disfruta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `preso_in`
--
ALTER TABLE `preso_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `turno`
--
ALTER TABLE `turno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `works_in`
--
ALTER TABLE `works_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `preso` (`pid`);

--
-- Constraints for table `bloco`
--
ALTER TABLE `bloco`
  ADD CONSTRAINT `bloco_ibfk_1` FOREIGN KEY (`morada`) REFERENCES `prisao` (`morada`);

--
-- Constraints for table `celas`
--
ALTER TABLE `celas`
  ADD CONSTRAINT `celas_ibfk_1` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`);

--
-- Constraints for table `disfruta`
--
ALTER TABLE `disfruta`
  ADD CONSTRAINT `disfruta_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `preso` (`pid`),
  ADD CONSTRAINT `disfruta_ibfk_2` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`),
  ADD CONSTRAINT `disfruta_ibfk_3` FOREIGN KEY (`patio_id`) REFERENCES `patios` (`patio_id`);

--
-- Constraints for table `patios`
--
ALTER TABLE `patios`
  ADD CONSTRAINT `patios_ibfk_1` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`);

--
-- Constraints for table `preso_in`
--
ALTER TABLE `preso_in`
  ADD CONSTRAINT `preso_in_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `preso` (`pid`),
  ADD CONSTRAINT `preso_in_ibfk_2` FOREIGN KEY (`morada`) REFERENCES `prisao` (`morada`),
  ADD CONSTRAINT `preso_in_ibfk_3` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`),
  ADD CONSTRAINT `preso_in_ibfk_4` FOREIGN KEY (`celas_id`) REFERENCES `celas` (`celas_id`);

--
-- Constraints for table `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `guarda` (`gid`),
  ADD CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`nome_act`) REFERENCES `actividades` (`nome_act`),
  ADD CONSTRAINT `turno_ibfk_3` FOREIGN KEY (`bloco_id`) REFERENCES `bloco` (`bloco_id`);

--
-- Constraints for table `works_in`
--
ALTER TABLE `works_in`
  ADD CONSTRAINT `works_in_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `guarda` (`gid`),
  ADD CONSTRAINT `works_in_ibfk_2` FOREIGN KEY (`morada`) REFERENCES `prisao` (`morada`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
