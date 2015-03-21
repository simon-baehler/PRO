-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 21 Mars 2015 à 16:13
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `msc`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `album`
--

INSERT INTO `album` (`id`, `name`) VALUES
(1, 'circus in the sky'),
(2, 'running on air');

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
(1, 'Bliss n eso'),
(2, 'NAS');

-- --------------------------------------------------------

--
-- Structure de la table `music`
--

CREATE TABLE IF NOT EXISTS `music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `year_creation` int(11) DEFAULT NULL,
  `music_type` int(11) NOT NULL,
  `up_year` int(11) DEFAULT NULL,
  `up_weekint` tinyint(4) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploaded_by` (`uploaded_by`),
  KEY `music_type` (`music_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `music`
--

INSERT INTO `music` (`id`, `name`, `year_creation`, `music_type`, `up_year`, `up_weekint`, `uploaded_by`) VALUES
(1, 'i''m somebody', 2014, 1, 2015, 3, 1),
(2, 'addicted', 2010, 2, 2015, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `music_album`
--

CREATE TABLE IF NOT EXISTS `music_album` (
  `music_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`music_id`,`album_id`),
  KEY `album_id` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `music_album`
--

INSERT INTO `music_album` (`music_id`, `album_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `music_artist`
--

CREATE TABLE IF NOT EXISTS `music_artist` (
  `music_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`music_id`,`artist_id`),
  KEY `artist_id` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `music_artist`
--

INSERT INTO `music_artist` (`music_id`, `artist_id`) VALUES
(1, 1),
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `music_playlist`
--

CREATE TABLE IF NOT EXISTS `music_playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `music_id` (`music_id`),
  KEY `playlist_id` (`playlist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `music_playlist`
--

INSERT INTO `music_playlist` (`id`, `music_id`, `playlist_id`, `ordering`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `music_type`
--

CREATE TABLE IF NOT EXISTS `music_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `music_type`
--

INSERT INTO `music_type` (`id`, `name`) VALUES
(1, 'hip-hop'),
(2, 'rap');

-- --------------------------------------------------------

--
-- Structure de la table `playlist`
--

CREATE TABLE IF NOT EXISTS `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) DEFAULT '0',
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `playlist`
--

INSERT INTO `playlist` (`id`, `name`, `public`, `owner_id`) VALUES
(1, 'austiHipHop', 0, 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `playlist_user`
--
CREATE TABLE IF NOT EXISTS `playlist_user` (
`playlist` varchar(25)
,`Title` varchar(100)
,`year_creation` int(11)
,`Type` varchar(255)
,`Artist` varchar(100)
,`Album` varchar(100)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `type_artist`
--
CREATE TABLE IF NOT EXISTS `type_artist` (
`artist` varchar(100)
,`type` varchar(255)
);
-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `userName`, `passwd`, `name`, `lastname`, `admin`) VALUES
(1, 'xaaram', '1830cb03414200bff26f37ddfe3381e520eaf181', 'simon', 'baehler', 1),
(2, 'Xaaram2', '1830cb03414200bff26f37ddfe3381e520eaf181', 'simon', 'baehler', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_playlist_follow`
--

CREATE TABLE IF NOT EXISTS `user_playlist_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `playlist_id` (`playlist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `user_playlist_follow`
--

INSERT INTO `user_playlist_follow` (`id`, `user_id`, `playlist_id`) VALUES
(1, 2, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la vue `playlist_user`
--
DROP TABLE IF EXISTS `playlist_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `playlist_user` AS select distinct `playlist`.`name` AS `playlist`,`music`.`name` AS `Title`,`music`.`year_creation` AS `year_creation`,`music_type`.`name` AS `Type`,`artist`.`name` AS `Artist`,`album`.`name` AS `Album` from ((((((((`playlist` join `music_playlist` on((`playlist`.`id` = `music_playlist`.`playlist_id`))) join `music` on((`music_playlist`.`music_id` = `music`.`id`))) join `music_album` on((`music`.`id` = `music_album`.`music_id`))) join `album` on((`album`.`id` = `music_album`.`album_id`))) join `music_artist` on((`music`.`id` = `music_artist`.`music_id`))) join `artist` on((`music_artist`.`artist_id` = `artist`.`id`))) join `music_type` on((`music`.`music_type` = `music_type`.`id`))) join `user_playlist_follow` on((`playlist`.`id` = `user_playlist_follow`.`playlist_id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `type_artist`
--
DROP TABLE IF EXISTS `type_artist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `type_artist` AS select `artist`.`name` AS `artist`,`music_type`.`name` AS `type` from (((`artist` join `music_artist` on((`music_artist`.`artist_id` = `artist`.`id`))) join `music` on((`music`.`id` = `music_artist`.`music_id`))) join `music_type` on((`music_type`.`id` = `music`.`music_type`)));

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `music`
--
ALTER TABLE `music`
  ADD CONSTRAINT `music_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `music_ibfk_2` FOREIGN KEY (`music_type`) REFERENCES `music_type` (`id`);

--
-- Contraintes pour la table `music_album`
--
ALTER TABLE `music_album`
  ADD CONSTRAINT `music_album_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`),
  ADD CONSTRAINT `music_album_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`);

--
-- Contraintes pour la table `music_artist`
--
ALTER TABLE `music_artist`
  ADD CONSTRAINT `music_artist_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`),
  ADD CONSTRAINT `music_artist_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`);

--
-- Contraintes pour la table `music_playlist`
--
ALTER TABLE `music_playlist`
  ADD CONSTRAINT `music_playlist_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`),
  ADD CONSTRAINT `music_playlist_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);

--
-- Contraintes pour la table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_playlist_follow`
--
ALTER TABLE `user_playlist_follow`
  ADD CONSTRAINT `user_playlist_follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_playlist_follow_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
