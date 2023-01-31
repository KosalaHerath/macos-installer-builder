# --- !Ups

ALTER TABLE `patient_prescriptions`
DROP COLUMN `isDispensed`;

# --- !Downs

ALTER TABLE `patient_prescriptions`
ADD COLUMN `isDispensed` BIT(1) NOT NULL DEFAULT false;