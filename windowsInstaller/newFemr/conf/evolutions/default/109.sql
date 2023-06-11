# --- !Ups

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_pharm`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_doc`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id`;
# --- ALTER TABLE `patient_encounters`
# --- DROP INDEX `fk_patient_encounter_user_id_users_id_pharm` ;
ALTER TABLE `patient_encounters`
DROP INDEX `user_id_idx` ;

ALTER TABLE `patient_encounters`
ADD INDEX `fk_patient_encounter_user_id_users_id_nurse_idx` (`user_id_triage` ASC),
ADD INDEX `fk_patient_encounter_user_id_users_id_doc_idx` (`user_id_medical` ASC),
ADD INDEX `fk_patient_encounter_user_id_users_id_pharm_idx` (`user_id_pharmacy` ASC);
ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_nurse`
  FOREIGN KEY (`user_id_triage`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_doc`
  FOREIGN KEY (`user_id_medical`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_pharm`
  FOREIGN KEY (`user_id_pharmacy`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_pharm`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_nurse`,
DROP FOREIGN KEY `fk_patient_encounter_user_id_users_id_doc`;
ALTER TABLE `patient_encounters`
DROP INDEX `fk_patient_encounter_user_id_users_id_pharm_idx` ,
DROP INDEX `fk_patient_encounter_user_id_users_id_doc_idx` ,
DROP INDEX `fk_patient_encounter_user_id_users_id_nurse_idx` ;

ALTER TABLE `patient_encounters`
ADD INDEX `fk_patient_encounter_user_id_users_id_pharm_idx` (`user_id_triage` ASC);
ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_pharm`
  FOREIGN KEY (`user_id_triage`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id_doc`
  FOREIGN KEY (`user_id_triage`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_patient_encounter_user_id_users_id`
  FOREIGN KEY (`user_id_triage`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- ALTER TABLE `patient_encounters`
# --- DROP INDEX `fk_patient_encounter_user_id_users_id_pharm_idx` ,
# --- ADD INDEX `fk_patient_encounter_user_id_users_id_pharm` (`user_id_triage` ASC);

ALTER TABLE `patient_encounters`
DROP INDEX `fk_patient_encounter_user_id_users_id_pharm_idx` ,
ADD INDEX `user_id_idx` (`user_id_triage` ASC);

