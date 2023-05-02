# --- !Ups

ALTER TABLE `patient_encounter_hpi_fields`
CHANGE COLUMN `hpi_field_value` `hpi_field_value` TEXT NOT NULL;

# --- !Downs

ALTER TABLE `patient_encounter_hpi_fields`
CHANGE COLUMN `hpi_field_value` `hpi_field_value` VARCHAR(255) NOT NULL;

