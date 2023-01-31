# --- !Ups

DELETE FROM `patient_encounter_treatment_fields`
WHERE `treatment_field_id` = '5';

DELETE FROM `treatment_fields`
WHERE `id`='5';

# --- !Downs

INSERT INTO `treatment_fields` (`name`)
  VALUES ('prescription');