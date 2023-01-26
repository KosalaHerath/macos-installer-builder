# --- !Ups

CREATE TABLE `photos`
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT ,
    description VARCHAR(3072) NOT NULL,
    file_path VARCHAR(1024) NOT NULL
);

CREATE TABLE `patient_encounter_photos`
(
  patient_encounter_id INT(11) NOT NULL,
  photo_id INT(11) NOT NULL,
  PRIMARY KEY (patient_encounter_id, photo_id)
);
CREATE UNIQUE INDEX id_photo_encntr_idx ON patient_encounter_photos ( photo_id );
CREATE INDEX patient_encounter_photos_pci_idx ON `patient_encounter_photos`  ( patient_encounter_id);

ALTER TABLE `patients`
    ADD COLUMN `photo_id` INT(11) NULL DEFAULT NULL  AFTER `city` ;

CREATE INDEX patient_photo_id_idx ON `patients` ( photo_id );


ALTER TABLE `patients` ADD FOREIGN KEY ( photo_id ) REFERENCES photos ( id );
ALTER TABLE `patient_encounter_photos` ADD FOREIGN KEY ( patient_encounter_id ) REFERENCES patient_encounters ( id );
ALTER TABLE `patient_encounter_photos` ADD FOREIGN KEY ( photo_id ) REFERENCES photos ( id );

ALTER TABLE `photos`
    ADD COLUMN `insertTS` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


# --- !Downs

DROP TABLE IF EXISTS `patient_encounter_photos`;
DROP TABLE IF EXISTS `photos`;
ALTER TABLE `patients` DROP COLUMN `photo_id`;