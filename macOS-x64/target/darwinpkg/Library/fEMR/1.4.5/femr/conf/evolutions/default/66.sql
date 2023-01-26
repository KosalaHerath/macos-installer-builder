# --- !Ups

ALTER TABLE `medication_forms`
CHANGE COLUMN `form_name` `name` VARCHAR(45) NOT NULL ,
ADD COLUMN `description` VARCHAR(45) NULL DEFAULT NULL AFTER `name`,
ADD COLUMN `isDeleted` BIT(1) NULL DEFAULT 0 AFTER `description`;

# --- !Downs

ALTER TABLE `medication_forms`
DROP COLUMN `isDeleted`,
DROP COLUMN `description`,
CHANGE COLUMN `name` `form_name` VARCHAR(45) NOT NULL ;