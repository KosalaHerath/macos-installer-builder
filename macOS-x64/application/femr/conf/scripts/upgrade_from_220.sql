## Creates a back up of values that are deleted during a 2.2.0 to 2.2.x upgrade
# Evolutions cause a destructive drop and recreation of 1 column in the
# patient_encounters table##


#----- RUN BEFORE UPGRADE -----#

-- Create a new table as a back up for values that are going to be
-- deleted during the evolution
CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `is_diabetes_screened` tinyint(1) DEFAULT NULL
);

-- Load the table
INSERT INTO `temp` (`id`, `is_diabetes_screened`)
SELECT `id`, `is_diabetes_screened`
FROM `patient_encounters`;



#----- RUN AFTER UPGRADE -----#

-- Restore the proper values
UPDATE `patient_encounters`
INNER JOIN `temp`
ON `patient_encounters`.`id` = `temp`.`id`
SET `patient_encounters`.`is_diabetes_screened` = `temp`.`is_diabetes_screened`;

-- Clean up the mess you made
DROP TABLE `temp`;