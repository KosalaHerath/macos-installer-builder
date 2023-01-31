# --- !Ups

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounter_patient_age_classification_id`;

ALTER TABLE `patient_age_classifications`
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `sortOrder` `sortOrder` INT(11) NOT NULL ;

ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounter_patient_age_classification_id`
FOREIGN KEY (`patient_age_classification_id`)
REFERENCES `patient_age_classifications` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `patient_age_classifications`
CHANGE COLUMN `id` `id` INT(11) NOT NULL ,
CHANGE COLUMN `sortOrder` `sortOrder` INT(11) NOT NULL AUTO_INCREMENT ;