-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Mon Oct 24 20:38:49 2011
-- 

BEGIN TRANSACTION;

--
-- Table: ads
--
DROP TABLE ads;

CREATE TABLE ads (
  id INTEGER PRIMARY KEY NOT NULL,
  title varchar(100) NOT NULL,
  price int(10) NOT NULL,
  datetime datetime(50) NOT NULL
);

--
-- Table: content
--
DROP TABLE content;

CREATE TABLE content (
  id INTEGER PRIMARY KEY NOT NULL,
  datetime datetime(50) NOT NULL,
  type varchar(100) NOT NULL,
  tags varchar(100) NOT NULL,
  cities varchar(100) NOT NULL,
  title varchar(100) NOT NULL,
  body varchar(5000) NOT NULL,
  start_time datetime(50),
  end_time datetime(50),
  lat float(100),
  lng float(100)
);

--
-- Table: settings
--
DROP TABLE settings;

CREATE TABLE settings (
  id INTEGER PRIMARY KEY NOT NULL,
  admin varchar(32) NOT NULL,
  password varchar(1000) NOT NULL,
  about varchar(10000) NOT NULL,
  datetime datetime(50) NOT NULL
);

COMMIT;
