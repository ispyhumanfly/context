-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Sat Apr 28 12:28:27 2012
-- 

BEGIN TRANSACTION;

--
-- Table: content
--
DROP TABLE content;

CREATE TABLE content (
  id INTEGER PRIMARY KEY NOT NULL,
  create_datetime varchar(50) NOT NULL,
  modified_datetime datetime(50),
  author varchar(100),
  title varchar(100),
  types varchar(100),
  tags varchar(100),
  cities varchar(100),
  interests varchar(100),
  pages varchar(50),
  photos varchar(10000),
  videos varchar(10000),
  body varchar(5000),
  start_datetime datetime(100),
  stop_datetime datetime(100),
  venue varchar(200),
  address varchar(100),
  lat float(50),
  lng float(50),
  position int(10),
  link varchar(1000),
  views int(1000000000000),
  clicks int(1000000000000)
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
  create_datetime datetime(50) NOT NULL
);

COMMIT;
