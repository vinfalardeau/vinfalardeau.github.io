/*
SQL code for investigating buildings' vulnerability to flooding risk, by residential/nonresidential status
and by good or poor building condition – in Dar es Salaam overall, and at the ward level.

Vincent Falardeau
*/

SELECT "building:material", count("building:material") as count_build_mat
from poorb
group by "building:material"
order by count_build_mat desc;

-- Add an empty column “res_status” to the table to fill out with text entries, ’residential’ or ‘nonresidential’
ALTER TABLE poorb
ADD COLUMN res_status text;

-- Figure out what types of buildings there are, and how many of each kind:
SELECT "building", count("building") as count_build
from poorb
group by "building"
order by count_build desc;

-- Use these building types to identify the residential buildings:
UPDATE poorb
SET res_status = 'residential'
WHERE "building" ILIKE '%residential%' OR
"building" = 'yes' OR
"building" = 'apartments' OR
"building" = 'house';

-- Identify the nonresidential buildings by process of elimination:
UPDATE poorb
SET res_status = 'nonresidential'
WHERE "res_status" IS NULL;

-- Count the residential and nonresidential buildings in poor condition in Dar es Salaam:
SELECT "res_status", count("res_status") as count_res
from poorb
group by "res_status"
order by count_res desc;


-- Enter the name of your schema where I have written vincent
CREATE TABLE vincent.osm_polygon AS
SELECT * 
FROM public.planet_osm_polygon;
-- Once this has run, be sure to refresh your schema, and click to find extent and create a spatial index.

ALTER TABLE vincent.osm_polygon
ADD COLUMN res_status text;

-- Slightly modified from above, because there are more residential types of buildings in the full dataset:
UPDATE vincent.osm_polygon
SET res_status = 'residential'
WHERE "building" ILIKE '%residential%' OR
"building" = 'yes' OR
"building" = 'apartments' OR
"building" = 'house' OR
"building" = 'hotel' OR
"building" = 'dormitory' OR
"building" = 'hostel' OR
"building" = 'cabin';
-- It might take a minute, because there are so many features to check against each true/false condition.

UPDATE vincent.osm_polygon
SET res_status = 'nonresidential'
WHERE "res_status" IS NULL;

SELECT "res_status", count("res_status") as count_res
from vincent.osm_polygon
group by "res_status"
order by count_res desc;

-- Repeating binary classification for buildings in good condition.
ALTER TABLE goodb
ADD COLUMN res_status text;

UPDATE goodb
SET res_status = 'residential'
WHERE "building" ILIKE '%residential%' OR
"building" = 'yes' OR
"building" = 'apartments' OR
"building" = 'house';

UPDATE goodb
SET res_status = 'nonresidential'
WHERE "res_status" IS NULL;

SELECT "res_status", count("res_status") as count_res
from goodb
group by "res_status"
order by count_res desc;

-- Dissolve flooding risk areas into one feature for simplicity:
CREATE TABLE flooddissolve
AS
SELECT st_union(geom)::geometry(multipolygon,32737) as geom
FROM flood;

-- Create a field for risk/nonrisk in both the poor/good building condition tables.
ALTER TABLE poorb
ADD COLUMN flood text;

ALTER TABLE goodb
ADD COLUMN flood text;

-- Reproject the poor-condition buildings to EPSG:32737.
CREATE TABLE poorb_reproj
AS
SELECT poorb.*, st_transform(poorb.geom, 32737)::geometry(point,32737) as utm_geom
from poorb;

-- Drop the WGS 84 geometry
ALTER TABLE poorb_reproj
DROP COLUMN geom;

-- Repeat for the good-condition buildings.
CREATE TABLE goodb_reproj
AS
SELECT goodb.*, st_transform(goodb.geom, 32737)::geometry(point,32737) as utm_geom
from goodb;
ALTER TABLE goodb_reproj
DROP COLUMN geom;

-- Create a boolean field to fill in with risk/nonrisk for each poor-condition building.
ALTER TABLE poorb_reproj
ADD COLUMN atrisk boolean;
-- Set risk to true when the building center-point falls within a flood area.
UPDATE poorb_reproj
SET atrisk = TRUE
FROM flooddissolve
WHERE st_within(poorb_reproj.utm_geom, flooddissolve.geom);
-- Set risk to false when it's not true.
UPDATE poorb_reproj
SET atrisk = FALSE
WHERE atrisk IS NULL;

ALTER TABLE goodb_reproj
ADD COLUMN atrisk boolean;
UPDATE goodb_reproj
SET atrisk = TRUE
FROM flooddissolve
WHERE st_within(goodb_reproj.utm_geom, flooddissolve.geom);
UPDATE goodb_reproj
SET atrisk = FALSE
WHERE atrisk IS NULL;

-- Edit provided wards data and join census data by ward name.
CREATE TABLE ward_census AS
SELECT wards.*, total_both as totalpop, total_male as male, total_fema as female
FROM wards LEFT JOIN census
ON wards.ward_name = census.ward_name AND wards.district_n = census.dis_name;
-- Transform geometries to EPSG:32737, then drop old geometry.
UPDATE ward_census
SET utmgeom = ST_Transform(geom, 32737);
ALTER TABLE ward_census
DROP COLUMN geom;
-- Calculate the area of wards, in case population density is of interest later.
ALTER TABLE ward_census
ADD COLUMN area_km2 real;
UPDATE ward_census
SET area_km2 = st_area(utmgeom)/1000000
FROM ward_census;

-- Join ward-level data to the poor-condition buildings, dropping geometries for the time being
CREATE TABLE poor_w AS
SELECT 
	poorb_reproj.res_status, 
	poorb_reproj.atrisk,
	ward_census.ward_name,
	ward_census.totalpop,
	ward_census.area_km2
FROM poorb_reproj
JOIN ward_census
ON st_within(poorb_reproj.utm_geom, ward_census.utmgeom);

-- Join ward-level data to the good-condition buildings, dropping geometries for the time being
CREATE TABLE good_w AS
SELECT 
	goodb_reproj.res_status, 
	goodb_reproj.atrisk,
	ward_census.ward_name,
	ward_census.totalpop,
	ward_census.area_km2
FROM goodb_reproj
JOIN ward_census
ON st_within(goodb_reproj.utm_geom, ward_census.utmgeom);

-- Make a new integer field with 1's for risk and 0's for nonrisk so that we can take a sum as well as count
ALTER TABLE poor_w
ADD COLUMN risk int;
UPDATE poor_w
SET risk = 1
where "atrisk" = TRUE;
UPDATE poor_w
SET risk = 0
where "risk" IS NULL;
-- Same, for buildings in good condition
ALTER TABLE good_w
ADD COLUMN risk int;
UPDATE good_w
SET risk = 1
where "atrisk" = TRUE;
UPDATE good_w
SET risk = 0
where "risk" IS NULL;

-- Make a table for poor-condition buildings by ward and (non)residential status, 
-- with the number of buildings at flooding risk (sumrisk) and the total number of buildings (count)
CREATE TABLE p_group as
SELECT ward_name,
	res_status,
	sum(risk) as sumrisk,
	count(risk) as count
FROM poor_w
GROUP BY ward_name, res_status; 
-- Do the same for good-condition buildings grouped by ward and (non)residential status
CREATE TABLE g_group as
SELECT ward_name,
	res_status,
	sum(risk) as sumrisk,
	count(risk) as count
FROM good_w
GROUP BY ward_name, res_status; 

-- Calculate the percent of buildings at risk of flooding, by ward and by residential/nonresidential,
-- for buildings in poor and good condition.
ALTER TABLE p_group 
ADD COLUMN pctrisk float;
ALTER TABLE g_group 
ADD COLUMN pctrisk float;
UPDATE p_group
SET pctrisk = (sumrisk * 100.0) / (count);
UPDATE g_group
SET pctrisk = (sumrisk * 100.0) / (count);

-- Break the percent risk data down into four simplified tables, which we can then join back to the ward_census layer.
CREATE TABLE p_res AS
SELECT ward_name,
	pctrisk
from p_group
where "res_status"='residential';
-- 2.
CREATE TABLE p_nonres AS
SELECT ward_name,
	pctrisk
from p_group
where "res_status"='nonresidential';
-- 3.
CREATE TABLE g_res AS
SELECT ward_name,
	pctrisk
from g_group
where "res_status"='residential';
-- 4. 
CREATE TABLE g_nonres AS
SELECT ward_name,
	pctrisk
from g_group
where "res_status"='nonresidential';

-- Join back to ward_census (x4, iterative). 
CREATE TABLE j1 as
SELECT ward_census.*, pctrisk as poor_res
FROM ward_census LEFT JOIN p_res
ON ward_census.ward_name = p_res.ward_name;

CREATE TABLE j2 as
SELECT j1.*, pctrisk as poor_nonres
FROM j1 LEFT JOIN p_nonres
ON j1.ward_name = p_nonres.ward_name;

CREATE TABLE j3 as
SELECT j2.*, pctrisk as good_res
FROM j2 LEFT JOIN g_res
ON j2.ward_name = g_res.ward_name;

CREATE TABLE j4 as
SELECT j3.*, pctrisk as good_nonres
FROM j3 LEFT JOIN g_nonres
ON j3.ward_name = g_nonres.ward_name;

-- This table (j4) now contains all of the percent risk data for poor/good by res/nonres at a ward level.
-- All that's left to do now is to look into the full set of buildings, including the many that do not have a 
-- marked condition. 

