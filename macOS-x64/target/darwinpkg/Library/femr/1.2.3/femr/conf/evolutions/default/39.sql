# --- !Ups

DELETE `patient_encounter_hpi_fields` FROM `patient_encounter_hpi_fields`
LEFT JOIN `hpi_fields`
ON `patient_encounter_hpi_fields`.`hpi_field_id` = `hpi_fields`.`id`
WHERE `hpi_fields`.`name` = "onsetTime";

DELETE FROM `hpi_fields`
WHERE `name`="onsetTime";

DELETE `patient_encounter_treatment_fields` FROM `patient_encounter_treatment_fields`
LEFT JOIN `treatment_fields`
ON `patient_encounter_treatment_fields`.`treatment_field_id` = `treatment_fields`.`id`
WHERE `treatment_fields`.`name` = "familyHistory";

DELETE FROM `treatment_fields`
WHERE `name`="familyHistory";

# --- !Downs

INSERT INTO `hpi_fields` (`name`) VALUES ('onsetTime');

INSERT INTO `treatment_fields` (`name`) VALUES ('familyHistory');
