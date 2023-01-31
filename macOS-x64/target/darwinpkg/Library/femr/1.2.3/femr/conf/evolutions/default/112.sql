# --- !Ups

CREATE TRIGGER insertDmFirst
BEFORE INSERT
ON patients
FOR EACH ROW
SET new.dm_first_name = dm(new.first_name);

CREATE TRIGGER updateDmFirst
BEFORE UPDATE
ON patients
FOR EACH ROW
SET new.dm_first_name = dm(new.first_name);

CREATE TRIGGER insertDmLast
BEFORE INSERT
ON patients
FOR EACH ROW
SET new.dm_last_name = dm(new.last_name);

CREATE TRIGGER updateDmLast
BEFORE UPDATE
ON patients
FOR EACH ROW
SET new.dm_last_name = dm(new.last_name);


# --- !Downs

DROP TRIGGER insertDmFirst;
DROP TRIGGER updateDmFirst;
DROP TRIGGER insertDmLast;
DROP TRIGGER updateDmLast;