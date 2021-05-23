---
layout: page
title: Chicago Hospital Accessibility & COVID-19
---

&ensp;

Reproduction materials available in this [RP-Kang repository](https://github.com/vinfalardeau/RP-Kang).

### Introduction

In the early months of the COVID-19 pandemic, Kang et al (2020) set out to rapidly measure the accessibility of hospitals in Chicago and throughout Illinois, for both vulnerable populations (people over 50 years old, in their analysis) and for actual COVID-19 patients. The study also separately measured access in terms of ICU beds and ventilators. Kang et al employ an enhanced two-step floating catchment area (E2SFCA) method, as outlined in Luo and Qi (2009). Kang et al have maintained a publicly available Jupyter Notebook, allowing reproduction of their study, and they have kept up a COVID-19 hospital accessibility [dashboard](https://wherecovid19.cigi.illinois.edu/spatialAccess.html) for Illinois. The study uses network distance to measure how long it would take to drive between each hospital and the nearest census tracts, and since the road network is very complex, the authors used cyberinfrastructure for the GIS workflow, allowing processes to run remotely on servers. Kang et al propose that their analysis provides useful information regarding how existing and new health resources should be distributed by "policymakers and public health practicioners" in order to optimize access for everyone. Therefore, reproducing the paper by running and/or modifying the code the authors have provided is an important step towards verifying the results and investigating whether any methods could be improved. Doing a reproduction of Kang et al should also reveal how this kind of analysis might be carried out in other states or regions.

### Materials and Methods

🐌🐌🐌

### Results and Discussion

![Original Map](/illinois/chicago/original_100_68_22.png)

Figure 1. Map showing the results of E2SFCA as applied by the authors' provided code. Note the false areas of low accessibility in the northwest of Chicago and along the western edge of the city.

&ensp;

![Revised Map, Same Weights](/illinois/chicago/new_100_68_22.png)

Figure 2. A revised map, using the road network up to a distance of 30 kilometers outside Chicago to avoid hospital displacement errors. This map uses the same weights as the original: 1.00 at 10 minutes, 0.68 at 20 minutes, and 0.22 at 30 minutes.

&ensp;

![Revised Map, Sharp Distance Decay](/illinois/chicago/new_100_42_09.png)

Figure 3. A revised map, using the extended road network and a set of weights reflective of sharper distance decay, as outlined in Luo and Qi (2009). The weights are 1.00 at 10 minutes, 0.42 at 20 minutes, and 0.09 at 30 minutes. 

&ensp;

![Revised Map, Slower Distance Decay](/illinois/chicago/new_100_95_87_75_63.png)

Figure 4. This revised map also uses the extended road network, this time along with a detailed, customized set of weights that represent slower distance decay, which we theorize might make more sense in the context of COVID-19. The weights are 1.00 at 10 minutes, 0.95 at 15 minutes, 0.87 at 20 minutes, 0.75 at 25 minutes, and 0.63 at 30 minutes.

&ensp;

### Conclusions

🐌🐌🐌

### References

Kang, J. Y., A. Michels, F. Lyu, Shaohua Wang, N. Agbodo, V. L. Freeman, and Shaowen Wang. 2020. Rapidly measuring spatial accessibility of COVID-19 healthcare resources: a case study of Illinois, USA. International Journal of Health Geographics 19 (1):1–17. DOI:[10.1186/s12942-020-00229-x](https://doi.org/10.1186/s12942-020-00229-x).

Luo, W., & Qi, Y. (2009). An enhanced two-step floating catchment area (E2SFCA) method for measuring spatial accessibility to primary care physicians. Health & place, 15(4), 1100-1107.

&ensp;
