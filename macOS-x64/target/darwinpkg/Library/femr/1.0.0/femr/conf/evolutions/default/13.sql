# --- !Ups

ALTER TABLE `patients`
CHANGE COLUMN `sex` `sex` VARCHAR(10) NULL  ,
CHANGE COLUMN `address` `address` VARCHAR(255) NULL  ;

# --- !Downs

ALTER TABLE `patients`
CHANGE COLUMN `sex` `sex` VARCHAR(10) NOT NULL  ,
CHANGE COLUMN `address` `address` VARCHAR(255) NOT NULL  ;

