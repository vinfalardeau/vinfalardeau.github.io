---
layout: page
title: QGIS Gravity Model
---

===

#### Leaflet Map

Here is a link to a [leaflet map](assets/) of hospital catchment areas!

===

#### Methods and Models

Click here to download the QGIS model that cleans up the hospital data: [HospitalPreprocessing](/models/HospitalPreprocessing.model3).

And here is the gravity model of spatial interaction, [DistanceMatrixCatchmentAreas](/models/CatchmentAreas_v1_3.model3).

_**Hospital Pre-processing Model**_

![Hospital Model](/models/HospitalModel.png)

&emsp; The hospital pre-processing model is designed to clean up the Department of Homeland Security hospital data prior to use in the gravity model. To extend this model to other hospital data, the fields of the attribute table would have to follow the same naming convention and contain similar values. The first step is to narrow down the hospitals to the ones that are appropriate for the current application; using extract by expression, we exclude psychiatric and military hospitals, closed hospitals, and hospitals with no data on the number of beds. Next, the hospitals are aggregated by common zip code (taking the sum of the number of beds) so that clusters of hospitals very near one another will be considered together in the next model. Finally, the model generates a single centroid point for each cluster of hospitals in a single zip code.

_**Distance Matrix Catchment Areas Model**_

![Catchment Areas Model](/models/CatchmentAreasModel.png)

&emsp; The purpose of the catchment areas model, in this case, is to group towns by the hospitals that seem ideally suited for them, both geographically and in terms of the town population and number of hospital beds. The model employs a gravity model of spatial interaction, where the potential for interaction between a town and a hospital is weighted by the population and beds, and decreases with distance. The advanced parameters of the model allow the user to customize exponents in the 'gravity' equation; thus, friction of distance can be increased or decreased, and the town population or number of hospital beds can be emphasized or de-emphasized. The end result of the model is a set of polygonal areas that would theoretically be served by a single hospital. This can then be compared with the Dartmouth Atlas of Hospital Service Areas, which reflects the reality of which hospitals are used most by the residents of various zip codes.

&emsp; The model is also designed to be generalizable and reproducible, so it can be used with just about any two vector layers, as long as they have unique ID fields and fields with data that can be used to weight the interaction potential between input and target features. For example, the model could be used to create theoretical service areas around competing businesses.

===

#### Discussion

===

#### Data Sources and References


===
