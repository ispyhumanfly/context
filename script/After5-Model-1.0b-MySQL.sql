-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sat Mar 17 22:45:50 2012
-- 
SET foreign_key_checks=0;

DROP TABLE IF EXISTS `content`;

--
-- Table: `content`
--
CREATE TABLE `content` (
  `id` integer NOT NULL auto_increment,
  `create_datetime` varchar(50) NOT NULL,
  `modified_datetime` datetime,
  `author` varchar(100),
  `title` varchar(100),
  `types` varchar(100),
  `tags` varchar(100),
  `cities` varchar(100),
  `interests` varchar(100),
  `pages` varchar(50),
  `photos` text,
  `videos` text,
  `body` text,
  `start_datetime` datetime,
  `stop_datetime` datetime,
  `venue` varchar(200),
  `address` varchar(100),
  `lat` float(50, 0),
  `lng` float(50, 0),
  `position` integer(10),
  `link` text,
  `views` integer(1000000000000),
  `clicks` integer(1000000000000),
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `settings`;

--
-- Table: `settings`
--
CREATE TABLE `settings` (
  `id` integer NOT NULL auto_increment,
  `admin` varchar(32) NOT NULL,
  `password` text NOT NULL,
  `about` text NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

SET foreign_key_checks=1;

