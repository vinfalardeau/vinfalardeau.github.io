---
layout: page
title:
---


**Replication of**
# Spatial, temporal and content analysis of Twitter data

Original study *by* Wang, Z., X. Ye, and M. H. Tsou. 2016. Spatial, temporal, and content analysis of Twitter for wildfire hazards. *Natural Hazards* 83 (1):523–540. DOI:[10.1007/s11069-016-2329-6](https://doi.org/10.1007/s11069-016-2329-6),  
and
First replication study by Holler, J. 2021 (in preparation). Hurricane Dorian vs Sharpie Pen: an empirical test of social amplification of risk on social media.

Replication Author:
Vincent Falardeau

Replication Materials Available at: [https://github.com/vinfalardeau/RE-Dorian](https://github.com/vinfalardeau/RE-Dorian)

Created: `11 May 2021`
Revised: `11 May 2021`

## Abstract

Why study the spatial distribution of Twitter data?

Wang et al (2016) analyzed Twitter data for wildfires in California, finding that the social media data reflect increased situational awareness on the part of local people during hazardous weather events. Wang et al also examined trends (key words and word clusters) in the content of wildfire-related tweets, identified moments when tweets peaked, and charted a retweet network. The spatial distribution of Twitter activity can reveal to what degree the activity's geography concurs with the geography of real-world events, like the wildfires in California. Spatial Twitter data can also be linked to populations (of cities, counties, etc) to see just who is affected and how they are responding.

Holler (2021) is studying Twitter data for Hurricane Dorian on the Atlantic coast, finding that in spite of tending news and social media content regarding a false narrative of risk, original Tweets still clustered significantly along the real hurricane track, and only along the hurricane track.

Reproducing and replicating spatial research with respect to the overlap of social media and hazardous weather continues to be relevant because people often turn to online platforms to share status updates during natural disasters, to check and share local news, and to comment on emerging situations. There are important ethical questions around privacy and the use of geo-tagged social media content; at the same time, such content can also be used to pinpoint places and people in need of aid. As people become more aware of privacy concerns & social media platforms are kept a little bit more honest, geo-located social media data might become more rare – already, the proportion of tweets with spatial information is under 5 percent. Even so, the sheer volume is great enough that spatial research can provide meaningful results, and will continue to do so well into the future.

In this replication study, I turn from the wildfires of California and the track of Hurricane Dorian to Tornado Alley, conducting another  spatial, temporal, and content analysis for tweets between April 27th and May 4th, 2021 containing the keyword 'tornado.' Over the course of those eight days, there were several tornadoes between EF-1 (moderate damage) and EF-3 (severe damage) on the Enhanced Fujita scale, located primarily in the South and the Great Plains.



## Original Study Information

**summarize Wang et al (2016) similar to the Holler (2021) summary below**

Holler (2021) loosely replicated the methods of Wang et al (2016) for the case of Hurricane Dorian's landfall on the U.S. mainland during the 2019 Atlantic Hurricane season. Data was based on Twitter Search API queries for tweets (excluding retweets) within a 1000-mile search radius encompassing the eastern half of the US.

Holler modified Wang et al's methods by not searching for retweets for network analysis, focusing instead on original Tweet content with keywords hurricane, Dorian, or sharpiegate (a trending hashtag referring to the storm). Holler modified the methodology for normalizing tweet data by creating a normalized Tweet difference index and extended the methodology to test for spatial clustering with the local Getis-Ord statistic. The study tested a hypothesis that false narratives of hurricane risk promulgated at the highest levels of the United States government would significantly distort the geographic distribution of Twitter activity related to the hurricane and its impacts, finding that original Twitter data still clustered only in the affected areas of the Atlantic coast in spite of false narratives about risk of a westward track through Alabama.

Wang et al (2016) conducted their study using the `tm` and `igraph` packages in `R 3.1.2`. Is it known what GIS software was used for spatial analysis?
The replication study by Holler (2021) used R, including the rtweet, rehydratoR, igraph, sf, and spdep packages for analysis. My replication closely follows the methods used by Holler (2021) in R, applying the same packages and code to a different subject.

## Materials and Procedure

Outline the data to be used in your replication study, including:

- twitter search parameters
- attach / link to files containing status_id's for the search results
- any data used to normalize the tweets
- methods for analysis / synthesis

## Replication Results

![Temporal Analysis Graph](/results/figures/tornadoByHour.svg)

![Word Counts Graph](/results/figures/tornadowordcounts.png)

![Word Network Graph](/results/figures/tornadowordpairs.png)

![NDTI MAP](/results/figures/ndti_map.png)

![Clusters Map](/results/figures/cluster_map.png)

## Unplanned Deviations from the Protocol

Summarize changes and uncertainties between
- your expectation of a reproduction workflow based on the reading and Dorian analysis
- your final workflow after completing the lab

## Discussion

Provide a summary and interpretation of your key findings in relation to your research question. Mention if findings confirm or contradict patterns observed by Wang et al (2016) or by Holler (2021).

## Conclusion

Restate the key findings and discuss their broader societal implications or contributions to theory.
Do the research findings suggest a need for any future research?

## References

Include any referenced studies or materials in the [AAG Style of author-date referencing](https://www.tandf.co.uk//journals/authors/style/reference/tf_USChicagoB.pdf).

####  Report Template References & License

This template was developed by Peter Kedron and Joseph Holler with funding support from HEGS-2049837. This template is an adaptation of the ReScience Article Template Developed by N.P Rougier, released under a GPL version 3 license and available here: https://github.com/ReScience/template. Copyright © Nicolas Rougier and coauthors. It also draws inspiration from the pre-registration protocol of the Open Science Framework and the replication studies of Camerer et al. (2016, 2018). See https://osf.io/pfdyw/ and https://osf.io/bzm54/

Camerer, C. F., A. Dreber, E. Forsell, T.-H. Ho, J. Huber, M. Johannesson, M. Kirchler, J. Almenberg, A. Altmejd, T. Chan, E. Heikensten, F. Holzmeister, T. Imai, S. Isaksson, G. Nave, T. Pfeiffer, M. Razen, and H. Wu. 2016. Evaluating replicability of laboratory experiments in economics. Science 351 (6280):1433–1436. https://www.sciencemag.org/lookup/doi/10.1126/science.aaf0918.

Camerer, C. F., A. Dreber, F. Holzmeister, T.-H. Ho, J. Huber, M. Johannesson, M. Kirchler, G. Nave, B. A. Nosek, T. Pfeiffer, A. Altmejd, N. Buttrick, T. Chan, Y. Chen, E. Forsell, A. Gampa, E. Heikensten, L. Hummer, T. Imai, S. Isaksson, D. Manfredi, J. Rose, E.-J. Wagenmakers, and H. Wu. 2018. Evaluating the replicability of social science experiments in Nature and Science between 2010 and 2015. Nature Human Behaviour 2 (9):637–644. http://www.nature.com/articles/s41562-018-0399-z.
