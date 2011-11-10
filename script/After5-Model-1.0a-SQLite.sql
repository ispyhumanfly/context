-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Thu Nov 10 00:16:13 2011
-- 

BEGIN TRANSACTION;

--
-- Table: ads
--
DROP TABLE ads;

CREATE TABLE ads (
  id INTEGER PRIMARY KEY NOT NULL,
  title varchar(100) NOT NULL,
  pages varchar(50) NOT NULL,
  photo varchar(500) NOT NULL,
  datetime datetime(50) NOT NULL
);

--
-- Table: content
--
DROP TABLE content;

CREATE TABLE content (
  id INTEGER PRIMARY KEY NOT NULL,
  datetime datetime(50) NOT NULL,
  types varchar(100) NOT NULL,
  tags varchar(100) NOT NULL,
  cities varchar(100) NOT NULL,
  interests varchar(100) NOT NULL,
  pages varchar(50),
  photos varchar(10000),
  title varchar(100) NOT NULL,
  body varchar(5000) NOT NULL,
  start_datetime datetime(50),
  stop_datetime datetime(50),
  address varchar(100),
  lat float(50),
  lng float(50),
  position int(10)
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
