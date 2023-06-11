# --- !Ups

INSERT INTO `vitals` (`id`, `name`, `data_type`, `unit_of_measurement`)
  VALUES ('10', 'glucose', 'int', 'mg/dl');

# --- !Downs

DELETE FROM `patient_encounter_vitals`
WHERE `vital_id` = 10;

DELETE FROM `vitals`
WHERE `id` =10;


