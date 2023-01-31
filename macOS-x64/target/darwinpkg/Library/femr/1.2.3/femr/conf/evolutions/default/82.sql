# --- !Ups

ALTER TABLE `patient_prescriptions`
ADD COLUMN `date_dispensed` DATETIME NULL DEFAULT NULL AFTER `date_taken`;

CREATE TABLE `mission_trip_users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `mission_trip_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_mission_trip_users_user_id_users_id_idx` (`user_id` ASC),
  INDEX `fk_mission_trip_users_mission_trip_id_mission_trips_id_idx` (`mission_trip_id` ASC),
  CONSTRAINT `fk_mission_trip_users_user_id_users_id`
  FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_mission_trip_users_mission_trip_id_mission_trips_id`
  FOREIGN KEY (`mission_trip_id`)
  REFERENCES `mission_trips` (`id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT);

# --- !Downs

ALTER TABLE `patient_prescriptions`
DROP COLUMN `date_dispensed`;

DROP TABLE `mission_trip_users`;
