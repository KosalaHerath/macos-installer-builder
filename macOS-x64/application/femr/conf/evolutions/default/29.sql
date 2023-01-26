# --- !Ups

ALTER TABLE `patient_encounters`
ADD COLUMN is_pregnant BOOL ;

# --- !Downs

ALTER TABLE `patient_encounters`
DROP COLUMN is_pregnant;