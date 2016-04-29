-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 29 Avril 2016 à 11:02
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `phpforum`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `idMembre` int(11) DEFAULT NULL,
  `nomCategorie` varchar(25) DEFAULT NULL,
  `dateCreationCategorie` date DEFAULT NULL,
  `descriptionCategorie` varchar(255) DEFAULT NULL,
  `nombreSousCategorie` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `idMembre`, `nomCategorie`, `dateCreationCategorie`, `descriptionCategorie`, `nombreSousCategorie`) VALUES
(4, 2, 'GÃ©nÃ©ral', '2015-01-24', 'Forum destinÃ© aux rÃ¨gles, avis, annonces importantes.', 5),
(5, 2, 'Le coin dÃ©tente', '2015-01-24', 'Ici on aura tout ce qui est en rapport avec la dÃ©tente', 3),
(6, 2, 'Musculation', '2015-01-24', 'Forum destinÃ© Ã  la musculation', 2),
(7, 2, 'Fitness', '2015-01-24', 'Forum destinÃ© aux fitness', 1);

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `idGrade` int(11) NOT NULL AUTO_INCREMENT,
  `idMembre` int(11) NOT NULL COMMENT 'Celui qui a crée le grade',
  `nomGrade` varchar(25) DEFAULT NULL,
  `dateCreationGrade` date DEFAULT NULL,
  PRIMARY KEY (`idGrade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `grade`
--

INSERT INTO `grade` (`idGrade`, `idMembre`, `nomGrade`, `dateCreationGrade`) VALUES
(1, 1, 'Administrateur', '2015-01-22'),
(2, 1, 'Membre Lambda', '2015-01-22');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
  `idMembre` int(11) NOT NULL AUTO_INCREMENT,
  `idGrade` int(11) DEFAULT NULL,
  `mailMembre` varchar(35) DEFAULT NULL,
  `mdpMembre` varchar(50) DEFAULT NULL,
  `pseudoMembre` varchar(30) DEFAULT NULL,
  `nomMembre` varchar(25) DEFAULT NULL,
  `prenomMembre` varchar(25) DEFAULT NULL,
  `adresseMembre` varchar(25) DEFAULT NULL,
  `cpMembre` int(5) DEFAULT NULL,
  `villeMembre` varchar(25) DEFAULT NULL,
  `estAdminMembre` enum('oui','non') DEFAULT NULL,
  `dateInscriptionMembre` date DEFAULT NULL,
  `nbMessageMembre` int(11) NOT NULL DEFAULT '0',
  `lienAvatarMembre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMembre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`idMembre`, `idGrade`, `mailMembre`, `mdpMembre`, `pseudoMembre`, `nomMembre`, `prenomMembre`, `adresseMembre`, `cpMembre`, `villeMembre`, `estAdminMembre`, `dateInscriptionMembre`, `nbMessageMembre`, `lienAvatarMembre`) VALUES
(14, 2, 'admin@live.fr', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'nomAdmin', 'prenomAdmin', '', 0, '', 'non', '2015-01-24', 15, 'avatar/14.png'),
(28, 2, 'test@test.com', '9e577cabb7b4bd8688a610d044059088', 'MasterSinge', '', '', '', 0, '', 'non', '2016-04-29', 0, NULL),
(29, 1, 'rajekevin@hotmail.fr', '123456', 'admin', 'Sedouramane', 'Kevin', 'test@wedo.com', 93800, 'Epinay', 'non', '2016-04-29', 0, NULL),
(30, 1, 'test@wedo.com', 'e10adc3949ba59abbe56e057f20f883e', 'test', NULL, NULL, NULL, NULL, NULL, 'non', '2016-04-29', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
  `idReponse` int(11) NOT NULL AUTO_INCREMENT,
  `idSousCategorie` int(11) DEFAULT NULL,
  `idSujet` int(11) DEFAULT NULL,
  `idMembre` int(11) DEFAULT NULL,
  `dateCreationReponse` date DEFAULT NULL,
  `messageReponse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idReponse`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Structure de la table `souscategorie`
--

CREATE TABLE IF NOT EXISTS `souscategorie` (
  `idSousCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `idCategorie` int(11) DEFAULT NULL,
  `idMembre` int(11) DEFAULT NULL,
  `dateCreationSousCategorie` date DEFAULT NULL,
  `nomSousCategorie` varchar(25) DEFAULT NULL,
  `descriptionSousCategorie` varchar(100) DEFAULT NULL,
  `nombreSujetSousCategorie` int(11) NOT NULL DEFAULT '0',
  `nombreReponseSousCategorie` int(11) NOT NULL DEFAULT '0',
  `dateDernierMessage` date DEFAULT NULL,
  `pseudoDernierMessage` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idSousCategorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `souscategorie`
--

INSERT INTO `souscategorie` (`idSousCategorie`, `idCategorie`, `idMembre`, `dateCreationSousCategorie`, `nomSousCategorie`, `descriptionSousCategorie`, `nombreSujetSousCategorie`, `nombreReponseSousCategorie`, `dateDernierMessage`, `pseudoDernierMessage`) VALUES
(5, 4, 2, '2015-01-24', 'RÃ¨gles/Informations', 'Toutes les rÃ¨gles et informations ici.', 3, 6, '2015-01-27', 'admin'),
(6, 4, 2, '2015-01-24', 'PrÃ©sentation', 'Vous Ãªtes nouvelle? Nouveau?', 2, 3, '2015-01-25', 'Tintin'),
(7, 4, 2, '2015-01-24', 'Avis', 'Des suggestions, avis ou critiques.', 3, 1, '2015-01-29', 'admin'),
(8, 5, 2, '2015-01-24', 'CafÃ©', 'Pour parler de tout et de rien.', 0, 0, NULL, NULL),
(9, 5, 2, '2015-01-24', 'Humour/Insolite', 'Toutes vos histoires, liens, vidÃ©os.', 0, 0, NULL, NULL),
(11, 6, 2, '2015-01-24', 'Programme Musculation', 'Discussions autour des différents entrainement de musculation', 0, 0, NULL, NULL),
(12, 6, 2, '2015-01-24', 'Vous debutez la musculati', 'Vous ne savez pas par où commencer, posez votre question ici...', 0, 0, NULL, NULL),
(13, 6, 2, '2015-01-24', 'Tutoriels', 'Tous vos tutoriels relatifs Ã  l''informatique', 0, 0, NULL, NULL),
(14, 7, 2, '2015-01-24', 'Sports,Cardio,Fitness', 'Divers sports, cardio pour la musculation, fitness et cours collectifs.', 0, 0, NULL, NULL),
(15, 7, 2, '2015-01-24', 'Galerie', 'Vos galeries d''images ici! Montrez nous vos talents!', 0, 0, '2015-01-24', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE IF NOT EXISTS `sujet` (
  `idSujet` int(11) NOT NULL AUTO_INCREMENT,
  `idSousCategorie` int(1) DEFAULT NULL,
  `idMembre` int(11) DEFAULT NULL,
  `nomSujet` varchar(100) DEFAULT NULL,
  `messageSujet` varchar(255) DEFAULT NULL,
  `dateCreationSujet` date DEFAULT NULL,
  `statutSujet` enum('ouvert','clos') DEFAULT NULL,
  `nombreReponseSujet` int(11) NOT NULL DEFAULT '0',
  `dateDernierMessage` date DEFAULT NULL,
  `pseudoDernierMessage` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idSujet`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
