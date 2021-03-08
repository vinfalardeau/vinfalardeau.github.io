---
layout: page
title: QGIS Gravity Model
---

&nbsp;
&nbsp;

#### Leaflet Map

Here is a link to a [leaflet map](assets/) of hospital catchment areas!

&nbsp;
&nbsp;

#### Methods and Models

Click here to download the QGIS model that cleans up the hospital data: [HospitalPreprocessing](/models/HospitalPreprocessing.model3).

And here is the gravity model of spatial interaction, [DistanceMatrixCatchmentAreas](/models/CatchmentAreas_v1_3.model3).

&nbsp;

_**Hospital Pre-processing Model**_

![Hospital Model](/models/HospitalModel.png)

&emsp; The hospital pre-processing model is designed to clean up the Department of Homeland Security hospital data prior to use in the gravity model. To extend this model to other hospital data, the fields of the attribute table would have to follow the same naming convention and contain similar values. The first step is to narrow down the hospitals to the ones that are appropriate for the current application; using extract by expression, we exclude psychiatric and military hospitals, closed hospitals, and hospitals with no data on the number of beds. Next, the hospitals are aggregated by common zip code (taking the sum of the number of beds) so that clusters of hospitals very near one another will be considered together in the next model. Finally, the model generates a single centroid point for each cluster of hospitals in a single zip code. 

_**Distance Matrix Catchment Areas Model**_

![Catchment Areas Model](/models/CatchmentAreasModel.png)



&nbsp;
&nbsp;

#### Discussion

&nbsp;
&nbsp;

#### Data Sources and References


&nbsp;
&nbsp;
