# --- !Ups

CREATE TABLE `tab_fields` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `isDeleted` BIT(1) NOT NULL DEFAULT b'0',
  `tab_id` INT(11) NULL DEFAULT NULL,
`type_id` INT(11) NULL DEFAULT NULL,
`size_id` INT(11) NULL DEFAULT NULL,
`sort_order` INT(11) NULL DEFAULT NULL,
`placeholder` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

INSERT INTO tab_fields (`name`, `isDeleted`)
  SELECT `name`, `isDeleted`
  from hpi_fields;

INSERT INTO tab_fields (`name`, `isDeleted`)
  SELECT `name`, `isDeleted`
  from treatment_fields;

INSERT INTO tab_fields (`name`, `isDeleted`)
  SELECT `name`, `isDeleted`
  from pmh_fields;

INSERT INTO tab_fields (`name`, `isDeleted`, `tab_id`, `type_id`, `size_id`, `sort_order`, `placeholder`)
  SELECT `name`, `isDeleted`, `custom_tab_id`, `custom_type_id`, `custom_size_id`, `sort_order`, `placeholder`
  from custom_fields;


CREATE TABLE `patient_encounter_tab_fields`(
`id` INT NOT NULL AUTO_INCREMENT,
`user_id` INT(11) NOT NULL,
`patient_encounter_id` INT(11) NOT NULL,
`tab_field_id` INT(11) NOT NULL,
`tab_field_value` TEXT NOT NULL,
`date_taken` DATETIME NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `id_UNIQUE`(`id` ASC));

INSERT INTO patient_encounter_tab_fields(`user_id`, `patient_encounter_id`, `tab_field_id`, `tab_field_value`, `date_taken`)
SELECT pehf.`user_id`, pehf.`patient_encounter_id`, tf.`id`, pehf.`hpi_field_value`, pehf.`date_taken`
FROM patient_encounter_hpi_fields pehf
INNER JOIN `hpi_fields` hf ON pehf.`hpi_field_id` = hf.`id`
INNER JOIN `tab_fields` tf ON hf.`name` = tf.`name`;

INSERT INTO patient_encounter_tab_fields(`user_id`, `patient_encounter_id`, `tab_field_id`, `tab_field_value`, `date_taken`)
SELECT pepf.`user_id`, pepf.`patient_encounter_id`, tf.`id`, pepf.`pmh_field_value`, pepf.`date_taken`
FROM patient_encounter_pmh_fields pepf
INNER JOIN `pmh_fields` pf ON pepf.`pmh_field_id` = pf.`id`
INNER JOIN `tab_fields` tf ON pf.`name` = tf.`name`;

INSERT INTO patient_encounter_tab_fields(`user_id`, `patient_encounter_id`, `tab_field_id`, `tab_field_value`, `date_taken`)
SELECT petf.`user_id`, petf.`patient_encounter_id`, tf.`id`, petf.`treatment_field_value`, petf.`date_taken`
FROM patient_encounter_treatment_fields petf
INNER JOIN `treatment_fields` trtf ON petf.`treatment_field_id` = trtf.`id`
INNER JOIN `tab_fields` tf ON trtf.`name` = tf.`name`;

INSERT INTO patient_encounter_tab_fields(`user_id`, `patient_encounter_id`, `tab_field_id`, `tab_field_value`, `date_taken`)
SELECT pecf.`user_id`, pecf.`patient_encounter_id`, tf.`id`, pecf.`custom_field_value`, pecf.`date_taken`
FROM patient_encounter_custom_fields pecf
INNER JOIN `custom_fields` cf ON pecf.`custom_field_id` = cf.`id`
INNER JOIN `tab_fields` tf ON cf.`name` = tf.`name`;


DROP TABLE `patient_encounter_hpi_fields`;
DROP TABLE `patient_encounter_custom_fields`;
DROP TABLE `patient_encounter_pmh_fields`;
DROP TABLE `patient_encounter_treatment_fields`;
DROP TABLE `hpi_fields`;
DROP TABLE `custom_fields`;
DROP TABLE `pmh_fields`;
DROP TABLE `treatment_fields`;

ALTER TABLE `custom_field_sizes`
RENAME TO  `tab_field_sizes` ;
ALTER TABLE `custom_field_types`
RENAME TO  `tab_field_types` ;
ALTER TABLE `custom_tabs`
RENAME TO  `tabs` ;

ALTER TABLE `patient_encounter_tab_fields`
ADD INDEX `fk_patient_encounter_tab_fields_user_idx` (`user_id` ASC),
ADD INDEX `fk_patient_encounter_tab_fields_patient_encounter_idx` (`patient_encounter_id` ASC),
ADD INDEX `fk_patient_encounter_tab_fields_tab_field_idx` (`tab_field_id` ASC);
ALTER TABLE `patient_encounter_tab_fields`
ADD CONSTRAINT `fk_patient_encounter_tab_fields_user`
FOREIGN KEY (`user_id`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `patient_encounter_tab_fields`
ADD CONSTRAINT `fk_patient_encounter_tab_fields_patient_encounter`
FOREIGN KEY (`patient_encounter_id`)
REFERENCES `patient_encounters` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `patient_encounter_tab_fields`
ADD CONSTRAINT `fk_patient_encounter_tab_fields_tab_field`
FOREIGN KEY (`tab_field_id`)
REFERENCES `tab_fields` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tab_fields`
ADD INDEX `fk_tab_fields_tab_idx` (`tab_id` ASC),
ADD INDEX `fk_tab_fields_type_idx` (`type_id` ASC),
ADD INDEX `fk_tab_fields_size_idx` (`size_id` ASC);
ALTER TABLE `tab_fields`
ADD CONSTRAINT `fk_tab_fields_tab`
FOREIGN KEY (`tab_id`)
REFERENCES `tabs` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tab_fields_type`
FOREIGN KEY (`type_id`)
REFERENCES `tab_field_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tab_fields_size`
FOREIGN KEY (`size_id`)
REFERENCES `tab_field_sizes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



# --- !Downs

# WARNING: THESE DOWNS ARE VERY DESTRUCTIVE - YOU WILL LOSE
# ALL PATIENT ENCOUNTER FIELD DATA!!!!!!!!!!!!!

ALTER TABLE `tab_fields`
DROP FOREIGN KEY `fk_tab_fields_size`,
DROP FOREIGN KEY `fk_tab_fields_type`,
DROP FOREIGN KEY `fk_tab_fields_tab`;
ALTER TABLE `tab_fields`
DROP INDEX `fk_tab_fields_size_idx` ,
DROP INDEX `fk_tab_fields_type_idx` ,
DROP INDEX `fk_tab_fields_tab_idx` ;

ALTER TABLE `patient_encounter_tab_fields`
DROP FOREIGN KEY `fk_patient_encounter_tab_fields_user`,
DROP FOREIGN KEY `fk_patient_encounter_tab_fields_patient_encounter`,
DROP FOREIGN KEY `fk_patient_encounter_tab_fields_tab_field`;
ALTER TABLE `patient_encounter_tab_fields`
DROP INDEX `fk_patient_encounter_tab_fields_tab_field_idx` ,
DROP INDEX `fk_patient_encounter_tab_fields_patient_encounter_idx` ,
DROP INDEX `fk_patient_encounter_tab_fields_user_idx` ;


ALTER TABLE  `tab_field_sizes`
RENAME TO `custom_field_sizes`;
ALTER TABLE  `tab_field_types`
RENAME TO `custom_field_types`;
ALTER TABLE  `tabs`
RENAME TO `custom_tabs`;

CREATE TABLE `treatment_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `treatment_fields` WRITE;
INSERT INTO `treatment_fields` VALUES (1,'assessment','\0'),(2,'problem','\0'),(3,'treatment','\0');
UNLOCK TABLES;

CREATE TABLE `patient_encounter_treatment_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `patient_encounter_id` int(11) NOT NULL,
  `treatment_field_id` int(11) NOT NULL,
  `treatment_field_value` text NOT NULL,
  `date_taken` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_patient_encounter_treatment_fields_user_id_users_id_idx` (`user_id`),
  KEY `fk_patient_encounter_treatment_fields_patient_encounter_id_idx` (`patient_encounter_id`),
  KEY `fk_patient_encounter_treatment_fields_treatment_id_idx` (`treatment_field_id`),
  CONSTRAINT `fk_patient_encounter_treatment_fields_patient_encounter_id` FOREIGN KEY (`patient_encounter_id`) REFERENCES `patient_encounters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_treatment_fields_treatment_id` FOREIGN KEY (`treatment_field_id`) REFERENCES `treatment_fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_treatment_fields_user_id_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `pmh_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `pmh_fields` WRITE;
INSERT INTO `pmh_fields` VALUES (1,'medicalSurgicalHistory','\0'),(2,'socialHistory','\0'),(3,'currentMedication','\0'),(4,'familyHistory','\0');
UNLOCK TABLES;

CREATE TABLE `patient_encounter_pmh_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `patient_encounter_id` int(11) NOT NULL,
  `pmh_field_id` int(11) NOT NULL,
  `pmh_field_value` text NOT NULL,
  `date_taken` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_patient_encounter_pmh_fields_user_id_users_id_idx` (`user_id`),
  KEY `fk_patient_encounter_pmh_field_id_pmh_fields_id_idx` (`pmh_field_id`),
  KEY `fk_patient_encounter_pmh_fields_patient_encounter_id_idx` (`patient_encounter_id`),
  CONSTRAINT `fk_patient_encounter_pmh_fields_patient_encounter_id` FOREIGN KEY (`patient_encounter_id`) REFERENCES `patient_encounters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_pmh_fields_pmh_field_id_pmh_fields_id` FOREIGN KEY (`pmh_field_id`) REFERENCES `pmh_fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_pmh_fields_user_id_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `hpi_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


LOCK TABLES `hpi_fields` WRITE;
INSERT INTO `hpi_fields` VALUES (1,'onset','\0'),(3,'severity','\0'),(4,'radiation','\0'),(5,'quality','\0'),(6,'provokes','\0'),(7,'palliates','\0'),(8,'timeOfDay','\0'),(9,'physicalExamination','\0'),(10,'narrative','\0');
UNLOCK TABLES;



CREATE TABLE `patient_encounter_hpi_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `patient_encounter_id` int(11) NOT NULL,
  `hpi_field_id` int(11) NOT NULL,
  `hpi_field_value` text NOT NULL,
  `date_taken` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_patient_encounter_hpi_fields_user_id_users_id_idx` (`user_id`),
  KEY `fk_patient_encounter_hpi_field_id_hpi_fields_id_idx` (`hpi_field_id`),
  KEY `fk_patient_encounter_hpi_fields_patient_encounter_id_idx` (`patient_encounter_id`),
  CONSTRAINT `fk_patient_encounter_hpi_fields_hpi_field_id_hpi_fields_id` FOREIGN KEY (`hpi_field_id`) REFERENCES `hpi_fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_hpi_fields_patient_encounter_id` FOREIGN KEY (`patient_encounter_id`) REFERENCES `patient_encounters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_hpi_fields_user_id_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `custom_tab_id` int(11) NOT NULL,
  `custom_type_id` int(11) NOT NULL,
  `isDeleted` bit(1) NOT NULL DEFAULT b'0',
  `custom_size_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_custom_fields_custom_tab_id_idx` (`custom_tab_id`),
  KEY `fk_custom_fields_custom_type_id_idx` (`custom_type_id`),
  KEY `fk_custom_fields_user_id_idx` (`user_id`),
  KEY `fk_custom_fields_custom_size_id_idx` (`custom_size_id`),
  CONSTRAINT `fk_custom_fields_custom_size_id` FOREIGN KEY (`custom_size_id`) REFERENCES tab_field_sizes (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_fields_custom_tab_id` FOREIGN KEY (`custom_tab_id`) REFERENCES `custom_tabs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_fields_custom_type_id` FOREIGN KEY (`custom_type_id`) REFERENCES `custom_field_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_fields_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


CREATE TABLE `patient_encounter_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `patient_encounter_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value` varchar(255) NOT NULL,
  `date_taken` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_patient_encounter_custom_fields_user_id_idx` (`user_id`),
  KEY `fk_patient_encounter_custom_fields_pe_id_idx` (`patient_encounter_id`),
  KEY `fk_patient_encounter_custom_fields_custom_field_id_idx` (`custom_field_id`),
  CONSTRAINT `fk_patient_encounter_custom_fields_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_custom_fields_pe_id` FOREIGN KEY (`patient_encounter_id`) REFERENCES `patient_encounters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_encounter_custom_fields_custom_field_id` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO custom_fields(`name`, `user_id`, `date_created`, `custom_tab_id`, `custom_type_id`, `isDeleted`, `custom_size_id`, `sort_order`, `placeholder`)
  SELECT `name`, '1', '1511-08-02', `tab_id`, `type_id`, `isDeleted`, `size_id`, `sort_order`, `placeholder`
  FROM tab_fields
  WHERE `tab_id` IS NOT NULL;


DROP TABLE `tab_fields`;


DROP TABLE `patient_encounter_tab_fields`;