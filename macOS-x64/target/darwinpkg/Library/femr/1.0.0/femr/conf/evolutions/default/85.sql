# --- !Ups
ALTER TABLE `users`

ADD COLUMN `passwordCreatedDate` DATETIME NOT NULL AFTER `password`,
ADD COLUMN `date_created` DATETIME DEFAULT '0000-01-01 00:00:00' AFTER `last_login`,
ADD COLUMN `created_by` INT AFTER `date_created`;

UPDATE `users`
SET date_created = '0000-01-01 00:00:00';

UPDATE `users`
SET passwordCreatedDate = '0000-01-01 00:00:00';

INSERT INTO vitals (name, data_type, unit_of_measurement)
  VALUES ('weeksPregnant', 'integer', 'weeks');

INSERT INTO patient_encounter_vitals (user_id, patient_encounter_id, vital_id, vital_value, date_taken)
      SELECT user_id_triage,
             id,
             ( SELECT id FROM vitals WHERE name = 'weeksPregnant') as vital_id,
             weeks_pregnant,
             date_of_triage_visit
      FROM patient_encounters
      WHERE weeks_pregnant IS NOT NULL;

ALTER TABLE patient_encounters DROP COLUMN weeks_pregnant;

# --- !Downs
ALTER TABLE `users`
DROP COLUMN `passwordCreatedDate`,
DROP COLUMN `date_created`,
DROP COLUMN `created_by`;

ALTER TABLE `patient_encounters`
ADD COLUMN `weeks_pregnant` INT(255) NULL DEFAULT NULL  AFTER `date_of_triage_visit`;

UPDATE patient_encounters pe, patient_encounter_vitals pev
SET pe.weeks_pregnant = pev.vital_value
WHERE pe.id = pev.patient_encounter_id
AND pev.vital_id = (SELECT id FROM vitals WHERE name = 'weeksPregnant');

DELETE FROM patient_encounter_vitals WHERE vital_id IN
(SELECT id FROM vitals WHERE name = 'weeksPregnant');

DELETE FROM vitals WHERE name = 'weeksPregnant';

