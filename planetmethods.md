---
title: PlanetLabs Methods
layout: default
---

Here are some Google Earth Engine scripts with examples of how you can use high-resolution PlanetLabs imagery in your remote sensing project. The first section deals with using NICFI basemaps across a large study region for a simple landcover classification. The second series of scripts is focused on a local analysis in Mwatasi village, Tanzania. Here, multiple years of imagery are used to look at possible change over time, and the local focus allows for greater precision in the classified map.  

### Large Study Region with NICFI
Since the NICFI imagery in Google Earth Engine is limited to those signed up for a joint NICFI-Planet account, these scripts may not work due to restricted sharing permissions. Nevertheless, here is a code for looking at the NICFI basemaps for different years and months, collecting some training points, and applying supervised random forest classification: [https://code.earthengine.google.com/697f5e221e14ef07c58a930ebe6490cf](https://code.earthengine.google.com/697f5e221e14ef07c58a930ebe6490cf). And here is a short script for exploring the classified map: [https://code.earthengine.google.com/cff7488d876a4dcd7dfab45d45a1899a](https://code.earthengine.google.com/cff7488d876a4dcd7dfab45d45a1899a). This one should work regardless of sharing permissions for NICFI imagery.

### Mwatasi Village
In this Google Earth Engine code, images are imported for each year from 2010-2021, and the first four years are used to map landcover in 2010. Training points for ten classes inform a random forest classifier. In the first line, you can choose a year to look at in true color (red, green, blue) or false color (near infrared, red, green). Meanwhile, segmented images are visualized but not used in the classification. [https://code.earthengine.google.com/0ae97b074b25df9146be2849a5886b67](https://code.earthengine.google.com/0ae97b074b25df9146be2849a5886b67)
