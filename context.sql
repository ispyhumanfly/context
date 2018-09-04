BEGIN TRANSACTION;

DROP TABLE content;

CREATE TABLE content (
  id INTEGER PRIMARY KEY NOT NULL,
  create_datetime varchar(50) NOT NULL,
  modified_datetime datetime(50),
  data TEXT,
  tags varchar(100),
  views int(1000000000000),
  clicks int(1000000000000)
);

COMMIT;