#Fixes any issues where a patient may have made it into the database with an empty string city

#Run before or after upgrade
UPDATE patients SET city = "N/A", isDeleted = NOw() WHERE city = "";