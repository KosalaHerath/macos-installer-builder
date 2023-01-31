# --- !Ups

ALTER TABLE `medication_administrations`
CHANGE COLUMN `daily_modifier` `daily_modifier` DECIMAL(9,6) NOT NULL ;

# --- !Downs

ALTER TABLE `medication_administrations`
CHANGE COLUMN `daily_modifier` `daily_modifier` DECIMAL(5,2) NOT NULL ;
