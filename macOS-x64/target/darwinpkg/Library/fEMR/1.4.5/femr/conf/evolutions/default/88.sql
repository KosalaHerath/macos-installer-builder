# --- !Ups

ALTER TABLE `patients`
ADD CONSTRAINT `fk_patients_user_deleted_by_user_id_id`
FOREIGN KEY (`deleted_by_user_id` )
REFERENCES `users` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `patients`
DROP FOREIGN KEY fk_patients_user_deleted_by_user_id_id;