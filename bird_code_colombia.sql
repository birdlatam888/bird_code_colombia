CREATE EXTENSION postgis;

--- Creation of a table of hummingbird species and number of records in 
--- Valle del Cauca according to the "Global Biodiversity Information Facility, GBIF"

--- Total number of hummingbird records in Valle del Cauca as of September 2023 
--- according to GBIF: 115,389

SELECT species, COUNT(DISTINCT id) AS GBIF_records FROM hummingbird_valle
GROUP BY species ORDER BY GBIF_records DESC;