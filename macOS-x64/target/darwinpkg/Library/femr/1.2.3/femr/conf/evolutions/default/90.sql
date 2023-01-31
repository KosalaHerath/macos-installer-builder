# --- !Ups

ALTER TABLE `medication_administrations`
RENAME TO  `concept_prescription_administrations` ;

ALTER TABLE `patient_prescriptions`
DROP FOREIGN KEY `fk_patient_prescriptions_medication_administrations`;
ALTER TABLE `patient_prescriptions`
CHANGE COLUMN `medication_administrations_id` `concept_prescription_administrations_id` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_concept_prescription_administrations`
  FOREIGN KEY (`concept_prescription_administrations_id`)
  REFERENCES `concept_prescription_administrations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `diagnoses`
RENAME TO  `concept_diagnoses` ;


# --- !Downs

ALTER TABLE `patient_prescriptions`
DROP FOREIGN KEY `fk_patient_prescriptions_concept_prescription_administrations`;

ALTER TABLE `patient_prescriptions`
CHANGE COLUMN `concept_prescription_administrations_id` `medication_administrations_id` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_medication_administrations`
  FOREIGN KEY (`medication_administrations_id`)
  REFERENCES `concept_prescription_administrations` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE  `concept_prescription_administrations`
RENAME TO `medication_administrations`;

ALTER TABLE `concept_diagnoses`
RENAME TO  `diagnoses` ;

