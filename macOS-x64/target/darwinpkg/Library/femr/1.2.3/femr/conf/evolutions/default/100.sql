# --- !Ups

ALTER TABLE `play_evolutions`
CHANGE COLUMN `apply_script` `apply_script` MEDIUMTEXT NULL DEFAULT NULL ,
CHANGE COLUMN `revert_script` `revert_script` MEDIUMTEXT NULL DEFAULT NULL ,
CHANGE COLUMN `last_problem` `last_problem` MEDIUMTEXT NULL DEFAULT NULL ;

# --- !Downs

ALTER TABLE `play_evolutions`
CHANGE COLUMN `apply_script` `apply_script` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `revert_script` `revert_script` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `last_problem` `last_problem` TEXT NULL DEFAULT NULL ;
