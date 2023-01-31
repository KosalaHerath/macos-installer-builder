# --- !Ups

INSERT INTO `roles` (`name`) VALUES ('SuperUser');

# --- !Downs

DELETE FROM `roles`
WHERE `name` = "SuperUser";

