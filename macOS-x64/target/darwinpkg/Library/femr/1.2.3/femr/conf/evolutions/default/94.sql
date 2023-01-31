# --- !Ups

ALTER TABLE `medication_active_drugs`
RENAME TO  `medication_generic_strengths` ;

ALTER TABLE `medication_medication_active_drugs`
DROP FOREIGN KEY `fk_medication_medication_active_drugs_medication_active_drugs`;
ALTER TABLE `medication_medication_active_drugs`
CHANGE COLUMN `medication_active_drugs_id` `medication_generic_strength_id` INT(11) UNSIGNED NOT NULL ;
ALTER TABLE `medication_medication_active_drugs`
ADD CONSTRAINT `fk_medication_medication_generic_strengths`
FOREIGN KEY (`medication_generic_strength_id`)
REFERENCES `medication_generic_strengths` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

ALTER TABLE `medication_medication_active_drugs`
DROP FOREIGN KEY `fk_medication_medication_generic_strengths`;
ALTER TABLE `medication_medication_active_drugs`
CHANGE COLUMN `medication_generic_strength_id` `medication_active_drugs_id` INT(11) UNSIGNED NOT NULL ;
ALTER TABLE `medication_medication_active_drugs`
ADD CONSTRAINT `fk_medication_medication_active_drugs_medication_active_drugs`
FOREIGN KEY (`medication_active_drugs_id`)
REFERENCES `medication_generic_strengths` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `medication_generic_strengths`
RENAME TO  `medication_active_drugs` ;
