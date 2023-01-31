## Creates a back up of values that are deleted during a 2.1.8 to 2.2.x upgrade
# Evolutions cause a destructive drop and recreation of 2 columns in the
# patient_encounters table##


#----- RUN BEFORE UPGRADE -----#

-- Create a new table as a back up for values that are going to be
-- deleted during the evolution
CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `user_id_diabetes_screen` int(11) DEFAULT NULL,
  `date_of_diabetes_screen` datetime DEFAULT NULL
);

-- Load the table
INSERT INTO `temp` (`id`, `user_id_diabetes_screen`, `date_of_diabetes_screen`)
SELECT `id`, `user_id_diabetes_screen`, `date_of_diabetes_screen`
FROM `patient_encounters`;



#----- RUN AFTER UPGRADE -----#

-- Restore the proper values
UPDATE `patient_encounters`
INNER JOIN `temp`
ON `patient_encounters`.`id` = `temp`.`id`
SET `patient_encounters`.`user_id_diabetes_screen` = `temp`.`user_id_diabetes_screen`,
`patient_encounters`.`date_of_diabetes_screen` = `temp`.`date_of_diabetes_screen`;

-- Clean up the mess you made
DROP TABLE `temp`;