# --- !Ups

ALTER TABLE `patient_encounters`
ADD COLUMN `is_diabetes_screened` BOOL NULL DEFAULT NULL AFTER `mission_trip_id`;

ALTER TABLE `patients`
ADD COLUMN `reason_deleted` VARCHAR(255) NULL DEFAULT NULL AFTER `deleted_by_user_id`;

# --- !Downs

ALTER TABLE `patient_encounters`
DROP COLUMN `is_diabetes_screened`;

ALTER TABLE `patients`
DROP COLUMN `reason_deleted`;
