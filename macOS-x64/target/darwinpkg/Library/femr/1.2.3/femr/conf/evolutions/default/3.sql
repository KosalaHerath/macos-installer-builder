# --- !Ups

CREATE  TABLE `user_roles` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NOT NULL ,
  `role_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_user_roles_user_id_users_id` (`user_id` ASC) ,
  INDEX `fk_user_roles_role_id_roles_id` (`role_id` ASC) ,
  CONSTRAINT `fk_user_roles_user_id_users_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `users` (`id` ),
  CONSTRAINT `fk_user_roles_role_id_roles_id`
    FOREIGN KEY (`role_id` )
    REFERENCES `roles` (`id` ))
DEFAULT CHARACTER SET = utf8;

# --- !Downs

DROP TABLE IF EXISTS `user_roles`;