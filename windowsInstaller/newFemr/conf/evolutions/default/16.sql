# --- !Ups

UPDATE `vitals` SET `name`='respiratoryRate' WHERE `id`='1';
UPDATE `vitals` SET `name`='heartRate' WHERE `id`='2';
UPDATE `vitals` SET `name`='temperature' WHERE `id`='3';
UPDATE `vitals` SET `name`='oxygenSaturation' WHERE `id`='4';
UPDATE `vitals` SET `name`='heightFeet' WHERE `id`='5';
UPDATE `vitals` SET `name`='heightInches' WHERE `id`='6';
UPDATE `vitals` SET `name`='weight' WHERE `id`='7';
UPDATE `vitals` SET `name`='bloodPressureSystolic' WHERE `id`='8';
UPDATE `vitals` SET `name`='bloodPressureDiastolic' WHERE `id`='9';

# --- !Downs

UPDATE `vitals` SET `name`='Respiratory_Rate' WHERE `id`='1';
UPDATE `vitals` SET `name`='Heart_Rate' WHERE `id`='2';
UPDATE `vitals` SET `name`='Temperature' WHERE `id`='3';
UPDATE `vitals` SET `name`='Oxygen_Saturation' WHERE `id`='4';
UPDATE `vitals` SET `name`='Height_Feet' WHERE `id`='5';
UPDATE `vitals` SET `name`='Height_Inches' WHERE `id`='6';
UPDATE `vitals` SET `name`='Weight' WHERE `id`='7';
UPDATE `vitals` SET `name`='Blood_Pressure_Systolic' WHERE `id`='8';
UPDATE `vitals` SET `name`='Blood_Pressure_Diastolic' WHERE `id`='9';