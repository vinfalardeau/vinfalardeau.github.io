---
layout: page
title: Malawi Vulnerability Workflow
---

## Data:

- UNEP/GRID (raster)
  - Precipitation
  - Precipitation index
  - Flood and drought risk, physical exposure
- DHS (Demographic Health Survey) (points)
  - Assets and access, adaptive capacity
- Famine Early Warning Network
  - Livelihood sensitivity

## Steps:

1. **DHS data**: Aggregate data from village level to TA (traditional authority) level
2. **All data**: Rasterize
3. **All data**: Normalize Indicators 
  1. Group indicators into quintiles
  1. Assign 0-5 value
4. **All data**: Weight indicators - raster calculator
  1. See table 2 on pg. 23
5. Calculate Resilience - raster calculator 
  1. Household Resilience = Adaptive Capacity + Livelihood Sensitivity - Physical Exposure

## Results:

- Maps of average resilience score for 2003 and for 2010 (socioeconomic resilience of households) at TA level 
  - Mapped with 4 classes using natural breaks
  - Using only the DHS data, grouped by TA, normalized into quintiles, weighted, and calculated by formula
- Map of Malawi vulnerability to climate change (based on assets, access, livelihoods and exposure) 
  - Raster
  - Derived from the all of the data sources combined
