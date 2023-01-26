# --- !Ups

ALTER TABLE `medication_measurement_units`
CHANGE COLUMN `unit_name` `name` VARCHAR(45) NOT NULL ,
ADD COLUMN `description` VARCHAR(45) NULL DEFAULT NULL AFTER `name`,
ADD COLUMN `isDeleted` BIT(1) NULL DEFAULT 0 AFTER `description`;

# --- !Downs

ALTER TABLE `medication_measurement_units`
DROP COLUMN `isDeleted`,
DROP COLUMN `description`,
CHANGE COLUMN `name` `unit_name` VARCHAR(45) NOT NULL ;