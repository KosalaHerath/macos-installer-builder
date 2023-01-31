# --- !Ups

ALTER TABLE `patient_encounter_treatment_fields`
ADD COLUMN `date_taken` DATETIME NOT NULL
AFTER `treatment_field_value` ;

# --- !Downs

ALTER TABLE `patient_encounter_treatment_fields`
DROP COLUMN `date_taken` ;

