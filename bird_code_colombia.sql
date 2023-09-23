CREATE EXTENSION postgis;

--- Creation of a table of hummingbird species and number of records in 
--- Valle del Cauca according to the "Global Biodiversity Information Facility, GBIF"

--- Total number of hummingbird records in Valle del Cauca as of September 2023 
--- according to GBIF: 115,389

SELECT species, COUNT(DISTINCT id) AS GBIF_records FROM hummingbird_valle
GROUP BY species ORDER BY GBIF_records DESC;

--- Creation of a table of the number of hummingbird species for each municipality 
--- of Valle del Cauca according to GBIF

SELECT mpio_cnmbr AS municipio, COUNT(DISTINCT species) AS species_richness
FROM hummingbird_valle, municipios_valle
WHERE ST_Intersects(municipios_valle.geom, hummingbird_valle.geom)
GROUP BY municipio ORDER BY species_richness DESC;