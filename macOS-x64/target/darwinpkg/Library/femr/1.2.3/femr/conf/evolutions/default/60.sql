# --- !Ups
DROP TABLE `patient_encounter_tab_field_chief_complaints`;

ALTER TABLE `patient_encounter_tab_fields`
ADD COLUMN `chief_complaint_id` INT(11) NULL DEFAULT NULL AFTER `date_taken`,
ADD INDEX `fk_patient_encounter_tab_fields_chief_complaint_idx` (`chief_complaint_id` ASC);
ALTER TABLE `patient_encounter_tab_fields`
ADD CONSTRAINT `fk_patient_encounter_tab_fields_chief_complaint`
  FOREIGN KEY (`chief_complaint_id`)
  REFERENCES `chief_complaints` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

#Create a join table to track fields and chief complaints
CREATE TABLE `patient_encounter_tab_field_chief_complaints` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `patient_encounter_tab_field_id` INT(11) NOT NULL,
  `chief_complaint_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_patient_encounter_tab_field_petfid_idx` (`patient_encounter_tab_field_id` ASC),
  INDEX `fk_patient_encounter_tab_field_ccid_idx` (`chief_complaint_id` ASC),
  CONSTRAINT `fk_patient_encounter_tab_field_petfid`
  FOREIGN KEY (`patient_encounter_tab_field_id`)
  REFERENCES `patient_encounter_tab_fields` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_tab_field_ccid`
  FOREIGN KEY (`chief_complaint_id`)
  REFERENCES `chief_complaints` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


UPDATE `patient_encounter_tab_fields`
SET `chief_complaint_id` = null
WHERE `chief_complaint_id` IS NOT NULL;

    ALTER TABLE `patient_encounter_tab_fields`
DROP FOREIGN KEY `fk_patient_encounter_tab_fields_chief_complaint`;
ALTER TABLE `patient_encounter_tab_fields`
DROP COLUMN `chief_complaint_id`,
DROP INDEX `fk_patient_encounter_tab_fields_chief_complaint_idx` ;
