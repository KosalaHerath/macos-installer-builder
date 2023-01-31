# --- !Ups

CREATE  TABLE `internet_status` (
  `id` INTEGER NOT NULL,
  `status` BOOLEAN NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `internet_status` (`id`, `status`) VALUES ('0', '0');

# --- !Downs

DROP TABLE IF EXISTS internet_status;