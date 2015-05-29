
BEGIN TRANSACTION;

DROP TABLE content;

CREATE TABLE content (
  id INTEGER PRIMARY KEY NOT NULL,
  author varchar(100),
  title varchar(100),
  body varchar(10000),
  tags varchar(10000),
  photos varchar(1000000),
  videos varchar(1000000),
  files varchar(1000000),
  create_datetime datetime(50) NOT NULL,
  modified_datetime datetime(50),
  start_datetime datetime(100),
  stop_datetime datetime(100),
  venue varchar(200),
  address varchar(100),
  lat float(50),
  lng float(50),
  link varchar(1000),
  impressions int(1000000000000),
  clicks int(1000000000000)
);

COMMIT;
