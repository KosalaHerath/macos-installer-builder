# --- !Ups

CREATE  TABLE `vitals` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `data_type` VARCHAR(255) NULL ,
  `unit_of_measurement` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`));

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Respiratory Rate','int','breaths/minute');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Heart Rate','int','beats/minute');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Temperature','float','Fahrenheit');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Oxygen Saturation','float','percent');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Height','int','feet');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Height','int','inches');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Weight','float','pounds');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Blood Pressure','int','systolic');

  INSERT INTO `vitals` (`name`,`data_type`,`unit_of_measurement`)
    VALUES ('Blood Pressure','int','diastolic');

# --- !Downs

DROP TABLE IF EXISTS `vitals`