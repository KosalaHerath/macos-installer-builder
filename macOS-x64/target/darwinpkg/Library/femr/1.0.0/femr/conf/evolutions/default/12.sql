# --- Ups

CREATE TABLE `patient_prescriptions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `encounter_id` INT NOT NULL,
  `medication_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `amount` INT NOT NULL,
  `replaced` BIT NOT NULL DEFAULT 0,
  `reason` VARCHAR(255) NULL,
  `replacement_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_patient_prescriptions_idx` (`encounter_id` ASC),
  INDEX `fk_patient_prescriptions_idx1` (`medication_id` ASC),
  INDEX `fk_patient_prescriptions_user_id__idx` (`user_id` ASC),
  CONSTRAINT `fk_patient_prescriptions_encounter_id_patient_encounters_id`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `patient_encounters` (`id`),
  CONSTRAINT `fk_patient_prescriptions_medication_id_medications_id`
    FOREIGN KEY (`medication_id`)
    REFERENCES `medications` (`id`),
  CONSTRAINT `fk_patient_prescriptions_user_id_users_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`));

ALTER TABLE `patient_prescriptions`
ADD INDEX `fk_patient_prescriptions_replacement_id_patent_prescription_idx` (`replacement_id` ASC);
ALTER TABLE `patient_prescriptions`
ADD CONSTRAINT `fk_patient_prescriptions_replacement_id_patient_prescriptions_id`
  FOREIGN KEY (`replacement_id`)
  REFERENCES `patient_prescriptions` (`id`);

# --- !Downs

DROP TABLE IF EXISTS `patient_prescriptions`