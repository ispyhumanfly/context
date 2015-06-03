
BEGIN TRANSACTION;

DROP TABLE content;

CREATE TABLE content (
  id INTEGER PRIMARY KEY NOT NULL,
  author varchar(100),
  title varchar(100),
  body varchar(100000),
  tags varchar(100000),
  objects varchar(1000000000000),
  sku varchar(100),
  stock int(1000000),
  price varchar(50),
  create_datetime datetime(50) NOT NULL,
  modified_datetime datetime(50),
  start_datetime datetime(100),
  stop_datetime datetime(100),
  venue varchar(50),
  address varchar(100),
  lat float(50),
  lng float(50),
  impressions int(1000000000000),
  clicks int(1000000000000)
);

COMMIT;
