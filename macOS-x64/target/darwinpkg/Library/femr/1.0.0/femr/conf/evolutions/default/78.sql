# --- !Ups

ALTER TABLE `medications`
DROP COLUMN `quantity_initial`,
DROP COLUMN `quantity_current`;

CREATE TABLE `medication_inventories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `quantity_current` INT(255) NOT NULL,
  `quantity_initial` INT(255) NOT NULL,
  `mission_trip_id` INT(11) NOT NULL,
  `medication_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medication_inventory_mission_trips_id_idx` (`mission_trip_id` ASC),
  INDEX `fk_medication_inventory_medications_id_idx` (`medication_id` ASC),
  CONSTRAINT `fk_medication_inventory_mission_trips_id`
  FOREIGN KEY (`mission_trip_id`)
  REFERENCES `mission_trips` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medication_inventory_medications_id`
  FOREIGN KEY (`medication_id`)
  REFERENCES `medications` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `medication_inventories`
DROP FOREIGN KEY `fk_medication_inventory_mission_trips_id`,
DROP FOREIGN KEY `fk_medication_inventory_medications_id`;
ALTER TABLE `medication_inventories`
ADD CONSTRAINT `fk_medication_inventory_mission_trips_id`
FOREIGN KEY (`mission_trip_id`)
REFERENCES `mission_trips` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_medication_inventory_medications_id`
FOREIGN KEY (`medication_id`)
REFERENCES `medications` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


# --- !Downs

ALTER TABLE `medications`
ADD COLUMN `quantity_current` INT(255) NULL DEFAULT NULL,
ADD COLUMN `quantity_initial` INT(255) NULL DEFAULT NULL;

DROP TABLE `medication_inventories`;
