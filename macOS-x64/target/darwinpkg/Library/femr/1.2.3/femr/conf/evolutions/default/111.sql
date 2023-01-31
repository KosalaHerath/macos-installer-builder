# --- !Ups

ALTER TABLE patients
  ADD dm_first_name VARCHAR(255),
  ADD dm_last_name VARCHAR(255);

SET SQL_SAFE_UPDATES=0;
UPDATE patients
SET dm_first_name = dm(first_name);

UPDATE patients
SET dm_last_name = dm(last_name);
SET SQL_SAFE_UPDATES=1;

# --- !Downs

ALTER TABLE patients
DROP COLUMN dm_first_name;

ALTER TABLE patients
DROP COLUMN dm_last_name;