---
layout: page
title: Chicago Hospital Accessibility & COVID-19
---

&ensp;

### Introduction

In the early months of the COVID-19 pandemic, Kang et al (2020) set out to rapidly measure the accessibility of hospitals in Chicago and throughout Illinois, for both vulnerable populations (people over 50 years old, in their analysis) and for actual COVID-19 patients. The study also separately measured access in terms of ICU beds and ventilators. Since then, Kang et al have maintained a publicly available Jupyter Notebook, allowing reproduction of their study, and they have kept up a COVID-19 hospital accessibility [dashboard](https://wherecovid19.cigi.illinois.edu/spatialAccess.html) for Illinois. The study uses network distance to measure how long it would take to drive between each hospital and the nearest census tracts, and since the road network is very complex, the authors used cyberinfrastructure for the GIS workflow, allowing processes to run remotely on servers. Kang et al propose that their analysis provides useful information regarding how existing and new health resources should be distributed by "policymakers and public health practicioners" to optimize access for everyone. Therefore, reproducing the paper by running and/or modifying the code the authors have provided is an important step towards verifying the results and investigating whether any methods could be improved. Doing a reproduction of Kang et al should also reveal how this kind of analysis might be carried out in other states or regions.

### Materials and Methods

🐌🐌🐌

### Results and Discussion

![Original Map](/illinois/chicago/original_100_68_22.png)

![Revised Map, Same Weights](/chicago/new_100_68_22.png)

![Revised Map, Sharp Distance Decay](/chicago/new_100_42_09.png)

![Revised Map, Slower Distance Decay](/chicago/new_100_95_87_75_63.png)


### Conclusions

🐌🐌🐌

### References

Kang, J. Y., A. Michels, F. Lyu, Shaohua Wang, N. Agbodo, V. L. Freeman, and Shaowen Wang. 2020. Rapidly measuring spatial accessibility of COVID-19 healthcare resources: a case study of Illinois, USA. International Journal of Health Geographics 19 (1):1–17. DOI:[10.1186/s12942-020-00229-x](https://doi.org/10.1186/s12942-020-00229-x).

Luo, W., & Qi, Y. (2009). An enhanced two-step floating catchment area (E2SFCA) method for measuring spatial accessibility to primary care physicians. Health & place, 15(4), 1100-1107.

&ensp;
