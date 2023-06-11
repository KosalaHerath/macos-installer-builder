# --- !Ups

ALTER TABLE `patient_prescriptions`
CHANGE COLUMN `replacement_id` `replacement_id` INT(11) NULL DEFAULT NULL AFTER `date_taken`,
ADD COLUMN `special_instructions` TEXT NULL DEFAULT NULL AFTER `medication_name`;

ALTER TABLE `patient_prescriptions`
ADD COLUMN `medication_id` INT(11) NULL AFTER `encounter_id`;

ALTER TABLE `patient_prescriptions`
ADD INDEX `fk_patient_prescriptions_medications_idx` (`medication_id` ASC);
ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_medications`
FOREIGN KEY (`medication_id`)
REFERENCES `medications` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `medications` (`name`)
  SELECT `medication_name`
  FROM `patient_prescriptions`;

UPDATE `patient_prescriptions` as pp
  JOIN `medications` as m ON pp.`medication_name` = m.`name`
SET pp.`medication_id` = m.`id`;

ALTER TABLE `patient_prescriptions`
DROP COLUMN `medication_name`,
CHANGE COLUMN `medication_id` `medication_id` INT(11) NOT NULL ;

CREATE TABLE `medication_administrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `patient_prescriptions`
ADD COLUMN `medication_administrations_id` INT(11) NULL AFTER `medication_id`;

ALTER TABLE `patient_prescriptions`
CHANGE COLUMN `medication_administrations_id` `medication_administrations_id` INT(11) UNSIGNED NULL DEFAULT NULL ,
ADD INDEX `fk_patient_prescriptions_medication_administrations_idx` (`medication_administrations_id` ASC);
ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_medication_administrations`
FOREIGN KEY (`medication_administrations_id`)
REFERENCES `medication_administrations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

ALTER TABLE `patient_prescriptions`
ADD COLUMN `medication_name` VARCHAR(255) NOT NULL AFTER `replacement_id`;

UPDATE `patient_prescriptions` as pp
  JOIN `medications` as m ON pp.`medication_id` = m.`id`
SET pp.`medication_name` = m.`name`;

ALTER TABLE `patient_prescriptions`
DROP FOREIGN KEY `fk_patient_prescriptions_medication_administrations`;
ALTER TABLE `patient_prescriptions`
DROP INDEX `fk_patient_prescriptions_medication_administrations_idx`;

DROP TABLE `medication_administrations`;

ALTER TABLE `patient_prescriptions`
DROP FOREIGN KEY `fk_patient_prescriptions_medications`;

ALTER TABLE `patient_prescriptions`
DROP COLUMN `medication_id`;

ALTER TABLE `patient_prescriptions`
DROP COLUMN `medication_administrations_id`;

ALTER TABLE `patient_prescriptions`
DROP COLUMN `special_instructions`;