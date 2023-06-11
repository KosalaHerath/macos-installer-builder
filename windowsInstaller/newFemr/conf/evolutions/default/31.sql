# --- !Ups

ALTER TABLE `patient_encounter_treatment_fields`
CHANGE COLUMN `treatment_field_value` `treatment_field_value` TEXT NOT NULL;

ALTER TABLE `patient_encounters`
CHANGE COLUMN `chief_complaint` `chief_complaint` TEXT NULL DEFAULT NULL;

# --- !Downs

ALTER TABLE `patient_encounter_treatment_fields`
CHANGE COLUMN `treatment_field_value` `treatment_field_value` VARCHAR(255) NOT NULL;

ALTER TABLE `femr`.`patient_encounters`
CHANGE COLUMN `chief_complaint` `chief_complaint` VARCHAR(255) NULL DEFAULT NULL;
