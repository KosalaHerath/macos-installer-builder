# --- !Ups

CREATE TABLE `patient_prescription_replacement_reasons` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

CREATE TABLE `patient_prescription_replacements` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `patient_prescription_id_original` INT(11) NOT NULL,
  `patient_prescription_id_replacement` INT(11) NOT NULL,
  `patient_prescription_replacement_reason_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_prescriptionReplacements_id_original_prescriptions_id_idx` (`patient_prescription_id_original` ASC),
  INDEX `fk_prescriptionReplacements_id_replacement_prescriptions_id_idx` (`patient_prescription_id_replacement` ASC),
  INDEX `fk_prescriptionReplacements_replacementReason_id_reasons_id_idx` (`patient_prescription_replacement_reason_id` ASC),
  CONSTRAINT `fk_prescriptionReplacements_id_original_prescriptions_id`
  FOREIGN KEY (`patient_prescription_id_original`)
  REFERENCES `patient_prescriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescriptionReplacements_id_replacement_prescriptions_id`
  FOREIGN KEY (`patient_prescription_id_replacement`)
  REFERENCES `patient_prescriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescriptionReplacements_replacementReason_id_reasons_id`
  FOREIGN KEY (`patient_prescription_replacement_reason_id`)
  REFERENCES `patient_prescription_replacement_reasons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `patient_prescription_replacement_reasons` (`name`, `description`) VALUES ('physician edit', 'the editing of a prescription as it\'s being prescribed by a physician');
INSERT INTO `patient_prescription_replacement_reasons` (`name`, `description`) VALUES ('pharmacist replacement', 'the replacement of a prescription by a pharmacist');
INSERT INTO `patient_prescription_replacement_reasons` (`name`, `description`) VALUES ('encounter edit', 'the editing of a prescription after the encounter has been closed');

# --- !Downs

DROP TABLE `patient_prescription_replacements`;

DROP TABLE `patient_prescription_replacement_reasons`;
