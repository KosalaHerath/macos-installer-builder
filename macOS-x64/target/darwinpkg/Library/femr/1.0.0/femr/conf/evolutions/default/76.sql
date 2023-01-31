
# --- !Ups
ALTER TABLE `login_attempts`
CHANGE COLUMN `date` `date_of_attempt` DATETIME NOT NULL ;

# --- !Downs
ALTER TABLE `login_attempts`
CHANGE COLUMN `date_of_attempt` `date` DATETIME NOT NULL ;