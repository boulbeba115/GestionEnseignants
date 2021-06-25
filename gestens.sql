-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 25, 2021 at 12:32 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestens`
--

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `ens_responsable_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr7a7uk9ynxt391dqlqj77uxdi` (`ens_responsable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`id`, `libelle`, `ens_responsable_id`) VALUES
(1, 'Departement Informatique', 1),
(2, 'Departement génie civil', 2);

-- --------------------------------------------------------

--
-- Table structure for table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `cin` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `departement_id` bigint(20) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKojyp6w14d0f9w4r1vrddgnisu` (`departement_id`),
  KEY `FK6t4t4c4gsai3sqdpxfl09mqu8` (`grade_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enseignant`
--

INSERT INTO `enseignant` (`id`, `adresse`, `cin`, `email`, `login`, `nom`, `password`, `phone`, `prenom`, `departement_id`, `grade_id`) VALUES
(1, '12 rue cambodia cité el habib sfax 3052', 11068452, 'boulbeba115@gmail.com', 'boulbeba thezz', 'bouaziz', '11068795', 23180612, 'boulbeba', 1, 1),
(2, '12 rue cambodia cité el habib sfax 3052', 11068452, 'mahdi@yahoo.fr', 'boulbeba', 'mahdi', '11068797', 55180612, 'mtibaa', 2, 1),
(5, '12 rue cambodia cité el habib sfax 3052', 12345678, 'ali@gmail.com', 'ali', 'ali', 'chabchoub', 55180612, 'chabchoub', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `prixc` float NOT NULL,
  `prix_td` float NOT NULL,
  `prix_tp` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `libelle`, `prixc`, `prix_td`, `prix_tp`) VALUES
(1, 'assistant', 30, 25, 25),
(2, 'maitre assisatant', 40, 30, 30),
(3, 'Maître de conférences', 40, 40, 40);

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `charge_cours` float NOT NULL,
  `charge_td` float NOT NULL,
  `charge_tp` float NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `niveau_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK64gxylfx9u5wnmddn6x07anwr` (`niveau_id`),
  KEY `FKcvxv96uol5mek60wqa5fm2a17` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matiere`
--

INSERT INTO `matiere` (`id`, `charge_cours`, `charge_td`, `charge_tp`, `libelle`, `niveau_id`, `department_id`) VALUES
(1, 20, 8, 2, 'MATIERE 1', 1, 1),
(4, 2, 2, 3, 'ghggg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`id`, `libelle`) VALUES
(1, '1 ere année'),
(2, '2 eme anné'),
(3, '3 eme Génie Info');

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `duree` float NOT NULL,
  `heure_debut` datetime DEFAULT NULL,
  `type` int(8) DEFAULT NULL,
  `valide` bit(1) NOT NULL,
  `enseignant_id` bigint(20) DEFAULT NULL,
  `matiere_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2o5dfw98jhfa4jcarkc6apqh2` (`enseignant_id`),
  KEY `FK9eedfu684k5y0jec0yafew0mv` (`matiere_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seance`
--

INSERT INTO `seance` (`id`, `date`, `duree`, `heure_debut`, `type`, `valide`, `enseignant_id`, `matiere_id`) VALUES
(1, '2021-06-16 00:14:27', 1, '2021-06-24 16:13:43', 0, b'1', 1, 1),
(2, '2021-06-23 00:00:00', 6, '1970-01-02 00:33:00', 1, b'1', 1, 1),
(6, '2021-05-31 00:00:00', 5, '1970-01-01 17:27:00', 0, b'1', 2, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
