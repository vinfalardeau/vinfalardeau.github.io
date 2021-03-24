---
layout: page
title: Rosgen Stream Classification
---

&ensp;

### Introduction

&ensp; Rivers and streams are defined by dynamic physical processes, dependent on many variables. As such, it is useful to classify streams into types and subtypes that bear similar characteristics, making it possible to discuss streams with a common parlance. Having a classification scheme for streams is important not just for scientists and geomorphologists, but also for planners, watershed managers, and environmentalists, among others. One common scheme is the Rosgen classification, which is used widely, including by the EPA. For the classification to be useful, it should be reproducible – different people should be able to reach the same conclusions about a particular river. In this lab, we aim to reproduce the Rosgen classification carried out by Kasprak et al. (2016) in the Middle Fork John Day Basin, in Oregon. Our reproduction draws on their Columbia Habitat Monitoring Program (CHaMP) data, as well as independently obtained 1-m resolution LiDAR imagery for the study region. By digitizing specific reaches of rivers and their valleys, and using LiDAR to take longitudinal and cross-sectional profiles, we can investigate whether different methods lead to identification of the same stream types.

&ensp; 

### Methods

&ensp; Kasprak et al. used a combination of field data, aerial imagery, and 10-meter and 0.1-meter DEMs to infer the broader, Level I valley and stream types of their 33 study sites. In this reproduction, we only used a 1-meter LiDAR DEM and the CHaMP field data, and I investigated a single site. Also, Kasprak et al. used the River Bathymetry Toolkit to derive data about the stream reaches, while we applied a workflow in GRASS GIS and RStudio. In the final analysis, our workflow classified my study site differently than the methods used by Kasprak et al., primarily because the different methods arrived at significantly different entrenchment ratios, and the entrenchment ratio is the very first step in narrowing down the Rosgen classification.

### Results

&ensp; 

&ensp;

![Shaded Relief Map](/hypsomap.png)  &ensp; ![Slope Map](/slopemap.png)

![Banks and Centerline Map](/bankscentermap.png)

![Valley Outlines and Centerline Map](/valleycentermap.png)

![Longitudinal Profile Figure](/longitudinalprofile.png)

![Valley Cross-Section Figure](/crosssection1.png)

![Flood-Prone Cross-Section Figure](/crosssection2.png)



Table 1. Site Measurements

| Variable | Value | Source |
| :-: | :-: | :-: |
| Bankfull Width | 12.36 m. | CHaMP |
| Average Bankfull Depth | 0.387 m. | CHaMP |
| Maximum Bankfull Depth | 0.966 m. | CHaMP |
| Flood-Prone Width | 80 m. | LiDAR, CHaMP |
| Valley Width | 190 m. | LiDAR |
| Valley Depth | 3.5 m. | LiDAR |
| Stream/River Length | 632 m. | LiDAR |
| Valley Length | 583 m. | LiDAR |
| Median Channel Material Particle Diameter | 74 mm. | CHaMP |


Table 2. Rosgen Level I Classification

| Criteria | Value |
| :-: | :-: |
| Entrenchment Ratio | 6.47 |
| Width / Depth Ratio | 31.03 |
| Sinuosity | 1.08 |
| Level I Stream Type | Type C |


Table 3. Rosgen Level II Classification

| Criteria | Value |
| :-: | :-: |
| Slope | 0.85 % |
| Channel Material | Cobble |
| Level II Stream Type | Type C3 |
