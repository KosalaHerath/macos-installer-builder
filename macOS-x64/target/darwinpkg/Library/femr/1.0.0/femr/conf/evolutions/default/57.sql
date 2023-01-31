# --- !Ups

ALTER TABLE `patient_encounters`
ADD COLUMN `user_id_medical` INT(11) NULL DEFAULT NULL AFTER `date_of_pharmacy_visit`,
ADD COLUMN `user_id_pharmacy` INT(11) NULL DEFAULT NULL AFTER `user_id_medical`;

ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_doc`
FOREIGN KEY (`user_id`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_pharm`
FOREIGN KEY (`user_id`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `patient_encounters`
DROP COLUMN `user_id_pharmacy`,
DROP COLUMN `user_id_medical`;

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_pharm`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_doc`;

