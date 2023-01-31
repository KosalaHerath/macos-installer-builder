# --- !Ups

ALTER TABLE `medication_medication_active_drugs`
RENAME TO  `medication_medication_generic_strengths` ;

ALTER TABLE `medication_medication_generic_strengths`
DROP FOREIGN KEY `fk_medication_medication_active_drugs_medications`;

ALTER TABLE `medication_medication_generic_strengths`
ADD CONSTRAINT `fk_medication_medication_generic_strengths_medications`
FOREIGN KEY (`medications_id`)
REFERENCES `medications` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

ALTER TABLE `medication_medication_generic_strengths`
DROP FOREIGN KEY `fk_medication_medication_generic_strengths_medications`;

ALTER TABLE `medication_medication_generic_strengths`
ADD CONSTRAINT `fk_medication_medication_active_drugs_medications`
FOREIGN KEY (`medication_generic_strength_id`)
REFERENCES `medication_generic_strengths` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `medication_medication_generic_strengths`
RENAME TO  `medication_medication_active_drugs` ;
