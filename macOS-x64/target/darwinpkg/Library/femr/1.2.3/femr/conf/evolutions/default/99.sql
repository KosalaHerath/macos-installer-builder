# --- !Ups
ALTER TABLE patients ADD COLUMN phone_number VARCHAR(20) NULL DEFAULT NULL AFTER last_name;

# --- !Downs
ALTER TABLE patients DROP COLUMN phone_number;
