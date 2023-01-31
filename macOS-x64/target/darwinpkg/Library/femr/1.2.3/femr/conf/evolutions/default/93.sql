# --- !Ups

ALTER TABLE `medication_active_drug_names`
RENAME TO  `medication_generics` ;

ALTER TABLE `medication_active_drugs`
DROP FOREIGN KEY `fk_medication_active_drugs_medication_active_drug_names`;

ALTER TABLE `medication_active_drugs`
CHANGE COLUMN `medication_active_drug_names_id` `medication_generics_id` INT(11) UNSIGNED NOT NULL ;

ALTER TABLE `medication_active_drugs`
ADD CONSTRAINT `fk_medication_active_drugs_medication_generics`
  FOREIGN KEY (`medication_generics_id`)
  REFERENCES `medication_generics` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `medication_active_drugs`
DROP FOREIGN KEY `fk_medication_active_drugs_medication_generics`;

ALTER TABLE `medication_active_drugs`
CHANGE COLUMN `medication_generics_id` `medication_active_drug_names_id` INT(11) UNSIGNED NOT NULL ;

ALTER TABLE `medication_active_drugs`
ADD CONSTRAINT `fk_medication_active_drugs_medication_active_drug_names`
FOREIGN KEY (`medication_active_drug_names_id`)
REFERENCES `medication_generics` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `medication_generics`
RENAME TO  `medication_active_drug_names` ;
