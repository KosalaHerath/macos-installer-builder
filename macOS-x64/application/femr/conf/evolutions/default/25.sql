# --- !Ups

ALTER TABLE `patients`
CHANGE COLUMN `age` `age`
VARCHAR(255) NOT NULL  ;

UPDATE `patients`
SET age = '9999/05/05'
WHERE age IS NOT NULL;

ALTER TABLE `patients`
CHANGE COLUMN `age` `age`
DATE NOT NULL;




# --- !Downs

ALTER TABLE `patients`
CHANGE COLUMN `age` `age`
VARCHAR(255) NOT NULL  ;

UPDATE `patients`
SET age = '99'
WHERE age IS NOT NULL;

ALTER TABLE `patients`
CHANGE COLUMN `age` `age`
int(11) NOT NULL;