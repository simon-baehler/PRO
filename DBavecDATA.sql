-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 16 Mars 2015 à 14:48
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `thorbjörn`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `album`
--

INSERT INTO `album` (`id`, `name`) VALUES
(1, 'Circus in the sky');

-- --------------------------------------------------------

--
-- Structure de la table `artist`
--

CREATE TABLE IF NOT EXISTS `artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `artist`
--

INSERT INTO `artist` (`id`, `name`) VALUES
(1, 'Bliss n Eso'),
(2, 'NAS');

-- --------------------------------------------------------

--
-- Structure de la table `music`
--

CREATE TABLE IF NOT EXISTS `music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `music`
--

INSERT INTO `music` (`id`, `name`, `year`, `type`, `path`) VALUES
(1, 'i m sombody', 2014, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `musicalbum`
--

CREATE TABLE IF NOT EXISTS `musicalbum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `music` (`music`),
  KEY `album` (`album`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `musicalbum`
--

INSERT INTO `musicalbum` (`id`, `music`, `album`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `musicartist`
--

CREATE TABLE IF NOT EXISTS `musicartist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music` int(11) NOT NULL,
  `artist` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `music` (`music`),
  KEY `artist` (`artist`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `musicartist`
--

INSERT INTO `musicartist` (`id`, `music`, `artist`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `musicplaylist`
--

CREATE TABLE IF NOT EXISTS `musicplaylist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music` int(11) NOT NULL,
  `playlist` int(11) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `music` (`music`),
  KEY `playlist` (`playlist`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `musicplaylist`
--

INSERT INTO `musicplaylist` (`id`, `music`, `playlist`, `adddate`) VALUES
(1, 1, 1, '2015-03-16 14:04:24');

-- --------------------------------------------------------

--
-- Structure de la table `playlist`
--

CREATE TABLE IF NOT EXISTS `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) DEFAULT '0',
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playlist`
--

INSERT INTO `playlist` (`id`, `name`, `public`, `creator`) VALUES
(1, 'Austi hip-pop', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Hip-pop');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `passwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eMail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `userName`, `passwd`, `eMail`, `admin`) VALUES
(1, 'simon', 'd41d8cd98f00b204e9800998ecf8427e', 'simon.baehler@heig.ch', 1);

-- --------------------------------------------------------

--
-- Structure de la table `userplaylistfollow`
--

CREATE TABLE IF NOT EXISTS `userplaylistfollow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `playlist_id` (`playlist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `userplaylistfollow`
--

INSERT INTO `userplaylistfollow` (`id`, `user_id`, `playlist_id`) VALUES
(1, 1, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `music`
--
ALTER TABLE `music`
  ADD CONSTRAINT `music_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`);

--
-- Contraintes pour la table `musicalbum`
--
ALTER TABLE `musicalbum`
  ADD CONSTRAINT `musicalbum_ibfk_1` FOREIGN KEY (`music`) REFERENCES `music` (`id`),
  ADD CONSTRAINT `musicalbum_ibfk_2` FOREIGN KEY (`album`) REFERENCES `album` (`id`);

--
-- Contraintes pour la table `musicartist`
--
ALTER TABLE `musicartist`
  ADD CONSTRAINT `musicartist_ibfk_1` FOREIGN KEY (`music`) REFERENCES `music` (`id`),
  ADD CONSTRAINT `musicartist_ibfk_2` FOREIGN KEY (`artist`) REFERENCES `artist` (`id`);

--
-- Contraintes pour la table `musicplaylist`
--
ALTER TABLE `musicplaylist`
  ADD CONSTRAINT `musicplaylist_ibfk_1` FOREIGN KEY (`music`) REFERENCES `music` (`id`),
  ADD CONSTRAINT `musicplaylist_ibfk_2` FOREIGN KEY (`playlist`) REFERENCES `playlist` (`id`);

--
-- Contraintes pour la table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `userplaylistfollow`
--
ALTER TABLE `userplaylistfollow`
  ADD CONSTRAINT `userplaylistfollow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userplaylistfollow_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT music.name,music.year,type.name,AR.name,album.name,musicplaylist.adddate FROM `playlist` 
	INNER JOIN musicplaylist ON playlist.id = musicplaylist.playlist 
    INNER JOIN music ON musicplaylist.music = music.id 
    INNER JOIN musicalbum ON music.id = musicalbum.music 
    INNER JOIN album ON album.id = musicalbum.album 
    INNER JOIN musicartist ON music.id = musicalbum.music 
    INNER JOIN artist AS AR ON musicartist.artist = AR.id 
    INNER JOIN type ON music.type = type.id
    INNER JOIN userplaylistfollow ON userplaylistfollow.playlist_id = playlist.id
    INNER JOIN user ON user.id = userplaylistfollow.user_id
	

