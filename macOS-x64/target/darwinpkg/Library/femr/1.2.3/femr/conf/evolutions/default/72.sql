# --- !Ups

CREATE TABLE `diagnoses` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `diagnoses`
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;



# --- !Downs

DROP TABLE `diagnoses`;