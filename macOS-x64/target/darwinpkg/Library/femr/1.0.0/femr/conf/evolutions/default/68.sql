# --- !Ups

CREATE TABLE `patient_age_classifications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `isDeleted` BIT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `description_UNIQUE` (`description` ASC));

ALTER TABLE `patient_encounters`
ADD COLUMN `patient_age_classification_id` INT(11) NULL AFTER `user_id_pharmacy`,
ADD INDEX `fk_patient_encounter_patient_age_classification_id_idx` (`patient_age_classification_id` ASC);
ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounter_patient_age_classification_id`
FOREIGN KEY (`patient_age_classification_id`)
REFERENCES `patient_age_classifications` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `patients`
CHANGE COLUMN `age` `age` DATE NULL ;

# --- !Downs

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounter_patient_age_classification_id`;
ALTER TABLE `patient_encounters`
DROP COLUMN `patient_age_classification_id`,
DROP INDEX `fk_patient_encounter_patient_age_classification_id_idx` ;

DROP TABLE `patient_age_classifications`;

ALTER TABLE `patients`
CHANGE COLUMN `age` `age` DATE NOT NULL ;