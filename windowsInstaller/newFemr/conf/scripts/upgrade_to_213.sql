-- Before upgrading to fEMR 2.1.3, run these scripts and upgrade MySQL to 5.6.
-- Seriously, goodluck reverting back.

UPDATE `play_evolutions`
SET `apply_script`='ALTER TABLE `patient_encounters`\nDROP FOREIGN KEY `fk_patient_encounter_patient_age_classification_id`;\n\nALTER TABLE `patient_age_classifications`\nCHANGE COLUMN `id` `id` INT(11) NOT NULL ,\nADD COLUMN `sortOrder` INT NOT NULL AUTO_INCREMENT AFTER `isDeleted`,\nADD UNIQUE INDEX `sortOrder_UNIQUE` (`sortOrder` ASC);\n\nALTER TABLE `patient_encounters`\nADD CONSTRAINT `fk_patient_encounter_patient_age_classification_id`\nFOREIGN KEY (`patient_age_classification_id`)\nREFERENCES `patient_age_classifications` (`id`)\nON DELETE NO ACTION\nON UPDATE NO ACTION;'
WHERE `id`='69';

UPDATE `play_evolutions`
SET `apply_script`='ALTER TABLE `patient_encounters`\nDROP FOREIGN KEY `fk_patient_encounter_patient_age_classification_id`;\n\nALTER TABLE `patient_age_classifications`\nCHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ,\nCHANGE COLUMN `sortOrder` `sortOrder` INT(11) NOT NULL ;\n\nALTER TABLE `patient_encounters`\nADD CONSTRAINT `fk_patient_encounter_patient_age_classification_id`\nFOREIGN KEY (`patient_age_classification_id`)\nREFERENCES `patient_age_classifications` (`id`)\nON DELETE NO ACTION\nON UPDATE NO ACTION;'
WHERE `id`='70';