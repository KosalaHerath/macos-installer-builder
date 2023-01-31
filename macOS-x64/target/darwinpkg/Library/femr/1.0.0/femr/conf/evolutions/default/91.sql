# --- !Ups

ALTER TABLE `medication_forms`
RENAME TO  `concept_medication_forms` ;

ALTER TABLE `medications`
DROP FOREIGN KEY `fk_medications_medication_forms`;

ALTER TABLE `medications`
CHANGE COLUMN `medication_forms_id` `concept_medication_forms_id` INT(11) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE `medications`
ADD CONSTRAINT `fk_medications_concept_medication_forms`
  FOREIGN KEY (`concept_medication_forms_id`)
  REFERENCES `concept_medication_forms` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

ALTER TABLE `medications`
DROP FOREIGN KEY `fk_medications_concept_medication_forms`;
ALTER TABLE `medications`
CHANGE COLUMN `concept_medication_forms_id` `medication_forms_id` INT(11) UNSIGNED NULL DEFAULT NULL ;
ALTER TABLE `medications`
ADD CONSTRAINT `fk_medications_medication_forms`
FOREIGN KEY (`medication_forms_id`)
REFERENCES `concept_medication_forms` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `concept_medication_forms`
RENAME TO  `medication_forms` ;
