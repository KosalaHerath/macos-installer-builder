# --- !Ups

ALTER TABLE `patient_encounters`
ADD COLUMN `weeks_pregnant` INT(255) NULL DEFAULT NULL  AFTER `chief_complaint`;

# --- !Downs

ALTER TABLE `patient_encounters`
DROP COLUMN `weeks_pregnant`;
