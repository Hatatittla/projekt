-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Sun 20.Nov 2022, 21:51
-- Verzia serveru: 10.4.24-MariaDB
-- Verzia PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `portalove-riesenia`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `path` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `category`
--

INSERT INTO `category` (`id`, `title`, `path`, `description`) VALUES
(3, 'Prvá kategória', '#', 'kategória'),
(5, 'Druhá kategória', '#', 'Popis kategórie 2'),
(6, 'Tretia kategoria', '#', 'aaa');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `client`
--

CREATE TABLE `client` (
  `idclient` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `absolved` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `course`
--

CREATE TABLE `course` (
  `idcourse` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `img_url` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `meeting`
--

CREATE TABLE `meeting` (
  `idmeeting` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `img_url` varchar(45) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  `sys_name` varchar(45) NOT NULL,
  `path` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `registration_course`
--

CREATE TABLE `registration_course` (
  `course_idcourse` int(11) NOT NULL,
  `client_idclient` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `payd` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `registration_meeting`
--

CREATE TABLE `registration_meeting` (
  `meeting_idmeeting` int(11) NOT NULL,
  `client_idclient` int(11) NOT NULL,
  `payd` tinyint(4) NOT NULL,
  `absolved` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idclient`);

--
-- Indexy pre tabuľku `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`idcourse`);

--
-- Indexy pre tabuľku `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`idmeeting`),
  ADD KEY `fk_meeting_category_idx` (`category_id`);

--
-- Indexy pre tabuľku `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sys_name_UNIQUE` (`sys_name`),
  ADD KEY `sys_name` (`sys_name`);

--
-- Indexy pre tabuľku `registration_course`
--
ALTER TABLE `registration_course`
  ADD PRIMARY KEY (`course_idcourse`,`client_idclient`),
  ADD KEY `fk_course_has_client_client1_idx` (`client_idclient`),
  ADD KEY `fk_course_has_client_course1_idx` (`course_idcourse`);

--
-- Indexy pre tabuľku `registration_meeting`
--
ALTER TABLE `registration_meeting`
  ADD PRIMARY KEY (`meeting_idmeeting`,`client_idclient`),
  ADD KEY `fk_meeting_has_client_client1_idx` (`client_idclient`),
  ADD KEY `fk_meeting_has_client_meeting1_idx` (`meeting_idmeeting`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pre tabuľku `client`
--
ALTER TABLE `client`
  MODIFY `idclient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `course`
--
ALTER TABLE `course`
  MODIFY `idcourse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `meeting`
--
ALTER TABLE `meeting`
  MODIFY `idmeeting` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `fk_meeting_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `registration_course`
--
ALTER TABLE `registration_course`
  ADD CONSTRAINT `fk_course_has_client_client1` FOREIGN KEY (`client_idclient`) REFERENCES `client` (`idclient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_course_has_client_course1` FOREIGN KEY (`course_idcourse`) REFERENCES `course` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `registration_meeting`
--
ALTER TABLE `registration_meeting`
  ADD CONSTRAINT `fk_meeting_has_client_client1` FOREIGN KEY (`client_idclient`) REFERENCES `client` (`idclient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_meeting_has_client_meeting1` FOREIGN KEY (`meeting_idmeeting`) REFERENCES `meeting` (`idmeeting`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
