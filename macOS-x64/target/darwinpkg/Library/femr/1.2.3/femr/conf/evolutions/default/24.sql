# --- !Ups

INSERT INTO `treatment_fields` (`name`)
  VALUES ('prescription');


# --- !Downs

DELETE FROM `treatment_fields`
WHERE `id`='5';
