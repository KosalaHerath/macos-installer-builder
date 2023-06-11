# --- !Ups
INSERT INTO `hpi_fields` (`name`)
VALUES ('narrative');

# --- !Downs

DELETE FROM `patient_encounter_hpi_fields`
WHERE `hpi_field_id` = 10;

DELETE FROM `hpi_fields`
WHERE `id` = 10;
