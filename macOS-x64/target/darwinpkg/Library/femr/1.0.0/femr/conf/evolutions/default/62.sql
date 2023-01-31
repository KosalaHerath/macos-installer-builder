# --- !Ups

ALTER TABLE `tabs`
DROP FOREIGN KEY `fk_custom_tabs_user_id`;
ALTER TABLE `tabs`
CHANGE COLUMN `user_id` `user_id` INT(11) NULL ;
ALTER TABLE `tabs`
ADD CONSTRAINT `fk_custom_tabs_user_id`
FOREIGN KEY (`user_id`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

DELETE FROM `tab_fields`;

ALTER TABLE `tabs`
ADD COLUMN `isCustom` BIT(1) NOT NULL AFTER `right_column_size`;

ALTER TABLE `tab_fields`
DROP FOREIGN KEY `fk_tab_fields_tab`;
ALTER TABLE `tab_fields`
CHANGE COLUMN `tab_id` `tab_id` INT(11) NOT NULL ;
ALTER TABLE `tab_fields`
ADD CONSTRAINT `fk_tab_fields_tab`
FOREIGN KEY (`tab_id`)
REFERENCES `tabs` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


# --- !Downs

ALTER TABLE `tabs`
DROP FOREIGN KEY `fk_custom_tabs_user_id`;
ALTER TABLE `tabs`
CHANGE COLUMN `user_id` `user_id` INT(11) NOT NULL ;
ALTER TABLE `tabs`
ADD CONSTRAINT `fk_custom_tabs_user_id`
FOREIGN KEY (`user_id`)
REFERENCES `users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tabs`
DROP COLUMN `isCustom`;

ALTER TABLE `tab_fields`
DROP FOREIGN KEY `fk_tab_fields_tab`;
ALTER TABLE `tab_fields`
CHANGE COLUMN `tab_id` `tab_id` INT(11) NULL ;
ALTER TABLE `tab_fields`
ADD CONSTRAINT `fk_tab_fields_tab`
FOREIGN KEY (`tab_id`)
REFERENCES `tabs` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;