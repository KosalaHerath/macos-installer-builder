# --- !Ups

ALTER TABLE `medications`
ADD COLUMN `quantity_current` INT(255) NULL DEFAULT NULL AFTER `name`,
ADD COLUMN `quantity_initial` INT(255) NULL DEFAULT NULL AFTER `quantity_current`;

ALTER TABLE `medications`
ADD COLUMN `isDeleted` BIT(1) NULL DEFAULT 0 AFTER `quantity_initial` ,
DROP INDEX `name_UNIQUE` ;

ALTER TABLE `patient_prescriptions`
DROP COLUMN `reason`,
DROP COLUMN `replaced`;

ALTER TABLE `patient_encounters`
DROP COLUMN `is_pregnant`;

ALTER TABLE `patient_encounters`
ADD COLUMN `date_of_medical_visit` DATETIME NULL DEFAULT NULL AFTER `weeks_pregnant`,
ADD COLUMN `date_of_pharmacy_visit` DATETIME NULL AFTER `date_of_medical_visit`;

UPDATE `patient_encounters`
SET `date_of_medical_visit` = "1000-01-01 00:00:00"
WHERE id is not null;

UPDATE `patient_encounters`
SET `date_of_pharmacy_visit` = "1000-01-01 00:00:00"
WHERE id is not null;



# --- !Downs

ALTER TABLE `medications`
DROP COLUMN `quantity_initial`,
DROP COLUMN `quantity_current`;

ALTER TABLE `medications`
DROP COLUMN `isDeleted`,
ADD UNIQUE INDEX `name_UNIQUE` (`name` ASC);

ALTER TABLE `patient_prescriptions`
ADD COLUMN `replaced` BIT(1) NULL AFTER `date_taken`;

ALTER TABLE `patient_encounters`
ADD COLUMN `is_pregnant` TINYINT(1) NULL DEFAULT NULL AFTER `weeks_pregnant`;

ALTER TABLE `patient_encounters`
DROP COLUMN `date_of_pharmacy_visit`,
DROP COLUMN `date_of_medical_visit`;
