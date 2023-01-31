# --- !Ups

ALTER TABLE `patient_encounter_pmh_fields`
CHANGE COLUMN `pmh_field_value` `pmh_field_value` TEXT NOT NULL;

# --- !Downs

ALTER TABLE `patient_encounter_pmh_fields`
CHANGE COLUMN `pmh_field_value` `pmh_field_value` VARCHAR(255) NOT NULL;