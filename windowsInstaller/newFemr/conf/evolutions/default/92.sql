# --- !Ups

ALTER TABLE `medication_measurement_units`
RENAME TO  `concept_medication_units` ;

ALTER TABLE `medication_active_drugs`
DROP FOREIGN KEY `fk_medication_active_drugs_medication_measurement_units`;

ALTER TABLE `medication_active_drugs`
CHANGE COLUMN `medication_measurement_units_id` `concept_medication_units_id` INT(11) UNSIGNED NOT NULL ;

ALTER TABLE `medication_active_drugs`
ADD CONSTRAINT `fk_medication_active_drugs_concept_medication_units`
  FOREIGN KEY (`concept_medication_units_id`)
  REFERENCES `concept_medication_units` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `medication_active_drugs`
DROP FOREIGN KEY `fk_medication_active_drugs_concept_medication_units`;

ALTER TABLE `medication_active_drugs`
CHANGE COLUMN `concept_medication_units_id` `medication_measurement_units_id` INT(11) UNSIGNED NOT NULL ;

ALTER TABLE `medication_active_drugs`
ADD CONSTRAINT `fk_medication_active_drugs_medication_measurement_units`
FOREIGN KEY (`medication_measurement_units_id`)
REFERENCES `concept_medication_units` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `concept_medication_units`
RENAME TO  `medication_measurement_units` ;

