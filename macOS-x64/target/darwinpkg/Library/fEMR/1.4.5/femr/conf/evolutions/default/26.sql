# --- !Ups

INSERT INTO `roles` (`id`, `name`) VALUES ('5', 'Nurse');

# --- !Downs

DELETE FROM `user_roles`
WHERE role_id=5
DELETE FROM `roles`
WHERE name='Nurse'
