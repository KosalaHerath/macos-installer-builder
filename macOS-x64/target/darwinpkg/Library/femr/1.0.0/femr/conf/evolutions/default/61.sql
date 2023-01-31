# --- !Ups

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_doc`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_pharm`;
ALTER TABLE `patient_encounters`
CHANGE COLUMN `user_id` `user_id_triage` INT(11) NOT NULL,
CHANGE COLUMN `date_of_visit` `date_of_triage_visit` DATETIME NOT NULL;
ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id`
FOREIGN KEY (`user_id_triage`)
REFERENCES `users` (`id`),
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_doc`
FOREIGN KEY (`user_id_triage`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_pharm`
FOREIGN KEY (`user_id_triage`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_doc`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_pharm`;
ALTER TABLE `patient_encounters`
CHANGE COLUMN `user_id_triage` `user_id` INT(11) NOT NULL,
CHANGE COLUMN `date_of_triage_visit` `date_of_visit` DATETIME NOT NULL;
ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id`
FOREIGN KEY (`user_id`)
REFERENCES `users` (`id`),
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
