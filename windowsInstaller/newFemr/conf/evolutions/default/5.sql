# --- !Ups

ALTER TABLE `patients`
ADD COLUMN `user_id` INT NOT NULL AFTER `id` ,
ADD CONSTRAINT `fk_patients_user_id_users_id`
FOREIGN KEY (`user_id` )
REFERENCES `users` (`id` )
, ADD INDEX `user_id_idx` (`user_id` ASC);

# --- !Downs

ALTER TABLE `patients` DROP FOREIGN KEY `fk_patients_user_id_users_id` ;
ALTER TABLE `patients` DROP COLUMN `user_id`
, DROP INDEX `user_id_idx` ;