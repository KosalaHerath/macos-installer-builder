# --- !Ups

UPDATE `vitals`
SET name="Height_Feet"
WHERE name="Height"
AND unit_of_measurement = "feet";

UPDATE `vitals`
SET name="Height_Inches"
WHERE name="Height"
      AND unit_of_measurement = "inches";

UPDATE `vitals`
SET name="Heart_Rate"
WHERE name="Heart Rate";

UPDATE `vitals`
SET name="Respiratory_Rate"
WHERE name="Respiratory Rate";

UPDATE `vitals`
SET name="Oxygen_Saturation"
WHERE name="Oxygen Saturation";

UPDATE `vitals`
SET name="Blood_Pressure_Systolic"
WHERE name="Blood Pressure"
      AND unit_of_measurement = "systolic";

UPDATE `vitals`
SET name="Blood_Pressure_Diasolic"
WHERE name="Blood Pressure"
      AND unit_of_measurement = "diasolic";

UPDATE `vitals`
SET unit_of_measurement="mmHg"
WHERE unit_of_measurement="diasolic";

UPDATE `vitals`
SET unit_of_measurement="mmHg"
WHERE unit_of_measurement="systolic";

# --- !Downs

UPDATE `vitals`
SET name="Height"
WHERE name="Height Feet"
      AND unit_of_measurement = "feet";

UPDATE `vitals`
SET name="Height"
WHERE name="Height_Inches"
      AND unit_of_measurement = "inches";

UPDATE `vitals`
SET name="Heart Rate"
WHERE name="Heart_Rate";

UPDATE `vitals`
SET name="Respiratory Rate"
WHERE name="Respiratory_Rate";

UPDATE `vitals`
SET name="Oxygen Saturation"
WHERE name="Oxygen_Saturation";

UPDATE `vitals`
SET name="Blood Pressure"
WHERE name="Blood_Pressure_Systolic"
      AND unit_of_measurement = "systolic";

UPDATE `vitals`
SET name="Blood Pressure"
WHERE name="Blood_Pressure_Diasolic"
      AND unit_of_measurement = "diasolic";

UPDATE `vitals`
SET unit_of_measurement="diasolic"
WHERE name="Blood_Pressure_Diasolic";

UPDATE `vitals`
SET unit_of_measurement="systolic"
WHERE name="Blood_Pressure_Systolic";

