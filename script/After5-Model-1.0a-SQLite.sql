-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Tue Dec  6 05:38:16 2011
-- 

BEGIN TRANSACTION;

--
-- Table: content
--
DROP TABLE content;

CREATE TABLE content (
  id INTEGER PRIMARY KEY NOT NULL,
  datetime datetime(50) NOT NULL,
  author varchar(100) NOT NULL,
  title varchar(100) NOT NULL,
  types varchar(100),
  tags varchar(100),
  cities varchar(100),
  interests varchar(100),
  pages varchar(50),
  photos varchar(10000),
  body varchar(5000),
  start_datetime datetime(100),
  stop_datetime datetime(100),
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
