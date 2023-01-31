# --- !Ups

ALTER TABLE `patient_prescriptions`
ADD COLUMN `date_taken` DATETIME NOT NULL  AFTER `medication_name` ;

UPDATE `patient_prescriptions`
SET `date_taken` = "0000-00-00 00:00:01"
WHERE `date_taken` IS NOT NULL;


# --- !Downs

ALTER TABLE `patient_prescriptions`
DROP COLUMN `date_taken` ;
