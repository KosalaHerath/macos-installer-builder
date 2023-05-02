# --- !Ups

#Create chief complaints table
CREATE TABLE `chief_complaints` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` TEXT NOT NULL,
  `patient_encounter_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chief_complaints_patient_encounter_id_idx` (`patient_encounter_id` ASC),
  CONSTRAINT `fk_chief_complaints_patient_encounter_id`
  FOREIGN KEY (`patient_encounter_id`)
  REFERENCES `patient_encounters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

#Move chief complaints to their new home
INSERT INTO `chief_complaints` (`value`, `patient_encounter_id`)
  SELECT pe.`chief_complaint`, pe.`id`
  FROM `patient_encounters` as pe
  WHERE pe.`chief_complaint` <> '';

#Remove the column from the patient encounter table
ALTER TABLE `patient_encounters`
DROP COLUMN `chief_complaint`;

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





# --- !Downs

#Add chief complaint field
ALTER TABLE `patient_encounters`
ADD COLUMN `chief_complaint` TEXT NULL;

#Add chief complaint column
UPDATE `patient_encounters` AS pe
  LEFT JOIN `chief_complaints` AS cc
    ON pe.`id` = cc.`patient_encounter_id`
SET pe.`chief_complaint` = cc.`value`;

#Remove join table (destructive - won't get data back)
DROP TABLE `patient_encounter_tab_field_chief_complaints`;

#Remove chief complaint table
DROP TABLE `chief_complaints`;


