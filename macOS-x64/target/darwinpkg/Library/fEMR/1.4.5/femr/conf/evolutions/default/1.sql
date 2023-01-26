# --- !Ups

CREATE  TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NOT NULL ,
  `last_name` VARCHAR(255) NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) );

# --- !Downs

DROP TABLE IF EXISTS users;