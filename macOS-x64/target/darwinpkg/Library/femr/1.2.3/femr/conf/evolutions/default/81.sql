# --- !Ups

ALTER TABLE `patient_prescriptions`
DROP FOREIGN KEY `fk_patient_prescriptions_replacement_id_patient_prescriptions_id`;
ALTER TABLE `patient_prescriptions`
DROP COLUMN `replacement_id`,
DROP INDEX `fk_patient_prescriptions_replacement_id_patent_prescription_idx` ;

# --- !Downs

ALTER TABLE `patient_prescriptions`
ADD COLUMN `replacement_id` INT(11) NULL DEFAULT NULL AFTER `date_taken`,
ADD INDEX `fk_patient_prescriptions_replacement_id_patent_prescription_idx` (`replacement_id` ASC);
ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_replacement_id_patient_prescriptions_id`
FOREIGN KEY (`replacement_id`)
REFERENCES `patient_prescriptions` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;