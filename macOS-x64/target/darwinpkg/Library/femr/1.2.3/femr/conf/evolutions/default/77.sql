# --- !Ups

ALTER TABLE `login_attempts`
DROP FOREIGN KEY `login_attempts_user_id_users_id`;
ALTER TABLE `login_attempts`
ADD INDEX `login_attempts_user_id_users_id_idx` (`user_id` ASC);
ALTER TABLE `login_attempts`
ADD CONSTRAINT `login_attempts_user_id_users_id`
  FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
