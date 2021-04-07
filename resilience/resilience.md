---
layout: page
title: Urban Resilience Analysis – Dar es Salaam
---

### Methods, Process, & Code

To start, in the code editor side of [https://overpass-turbo.eu](https://overpass-turbo.eu), enter the following command to select buildings in Dar es Salaam classified as being in poor condition. Using this website allows you to query OpenStreetMap data, obtaining a smaller subset for download. 

```xml
area[name="Dar es Salaam"];
nwr["building:condition"="poor"](area);
out center;
```

Then hit Run in the top left. If a popup window appears saying that the size of the data might pose an issue, click to continue anyway. When the process has finished running, click Export and navigate to Data – download as GeoJSON, which will create a file called *export.geojson*. Within the DB Manager for PostGIS, you can then click the icon labeled Import Layer/File, browse to the location of the file, and load it in to your database. For good measure, check the boxes for converting field names to lowercase and creating a spatial index.

Now we have a layer consisting of the buildings that are in poor condition, and may therefore be especially vulnerable to flooding. As of April 6, 2021 there are 12,821 such buildings marked in Dar es Salaam. I have renamed my *export.geojson* download to *poorb.geojson*, so subsequent queries will refer to *poorb*. We can run this query to get an idea for the types of building materials:

```sql
SELECT "building:material", count("building:material") as count_build_mat
from poorb
group by "building:material"
order by count_build_mat desc;
```

This yields the following result:

| building:material | count_build_mat |
| :-: | :-: |
| cement_block	|       11629 |
| plaster	 |       349 |
| metal	   |           253 |
| wood	    |          176 |
| brick	    |          130 |
| waste_material |	38 |
| stone	         |      20 |
| concrete	    |     19 |
| glass	        |        4 |
| earthen	      |     3 |
| wood and steel binder	| 1 |
| Steel	              |    1 |
