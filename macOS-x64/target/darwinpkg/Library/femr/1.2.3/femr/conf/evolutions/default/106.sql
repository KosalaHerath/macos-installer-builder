# --- !Ups

ALTER TABLE `medication_inventories`
ADD CONSTRAINT `fk_created_by_user_id_user_id`
FOREIGN KEY (`createdBy`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# --- !Downs

ALTER TABLE `medication_inventories`
DROP FOREIGN KEY `fk_created_by_user_id_user_id`;