# --- !Ups

ALTER TABLE `concept_medication_generic_strengths`
CHANGE COLUMN `value` `value` DECIMAL(10,4) NOT NULL ;

ALTER TABLE `medication_generic_strengths`
CHANGE COLUMN `value` `value` DECIMAL(10,4) NOT NULL ;

# --- !Downs

ALTER TABLE `concept_medication_generic_strengths`
CHANGE COLUMN `value` `value` INT(11) NOT NULL ;

ALTER TABLE `medication_generic_strengths`
CHANGE COLUMN `value` `value` INT(11) NOT NULL ;
