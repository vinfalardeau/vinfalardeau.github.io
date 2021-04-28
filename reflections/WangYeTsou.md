---
layout: page
title: Thoughts on Wang, Ye, and Tsou 2016
---

===

&ensp; The authors, Wang, Ye, and Tsou, carry out a variety of analyses within a 1 % sample of tweets obtained from Twitter’s API, including kernel density estimation (KDE), text mining and k-means clustering of topics, and social network analysis by means of studying retweet patterns. The first step in the process was to filter tweets by keywords, location, and date to those related to “fire” or “wildfire” in a 40 mile radius around downtown San Diego between May 13 and May 22, 2014. This gave the authors a set of about 30,000 tweets, out of which approximately 3 or 4 % were geotagged; these tweets appear to have been aggregated by census block group (or tract, as the sizes and populations seem to indicate), as shown in Figure 3. Population data from the census were also used in order to normalize the frequency of tweets, and KDE was carried out with this normalization for tweets related to two specific fires, Bernardo (Figure 4) and Cocos (Figure 5). With text mining in R, the authors then found the most frequently recurring terms, e.g. “evacuate,” “home,” and “burn” (Figure 7). By creating a term-document matrix, the authors were also able to use k-means clustering to isolate seven distinct groups of tweets where specific terms often appeared together (Table 3). In the third and final section of the analysis, the authors counted retweets by user to show that certain users serve as hubs in the information network (such as local news organizations, or local governments). The authors then diagrammed a large portion of the retweet network, showing who retweeted whom and how much (Figure 10).

&ensp; For the most part, the methods in this paper are very clear, so the analysis and figures ought to be reproducible. However, there are some potential sticking points. Firstly, Twitter provides a 1 % sample of its content, and if this sample is taken randomly, then a reproduction of Wang, Ye, and Tsou might have different data to begin with. Next, there are some gaps in the description of the KDE methods; for instance, the authors appear to have grouped the tweets by census geographies in order to divide tweet frequency by population, but this is not explicitly mentioned in the text. Also, Figures 4 and 5 suggest that KDE was probably conducted in a rectangular region within the 40 mile radius around San Diego, but the ignition location for the Bernardo fire is near the edge of this region, and the ignition location for the Cocos fire falls outside of it entirely. This could be  reproducible, but it might be better to remedy this rather than reproduce it. One last issue with the KDE is that the exact parameters (search radius around points, raster resolution, etc) are not specified. The remaining two sections generally appear to be reproducible as well; there are established methods online for carrying out text mining and k-means clustering of keywords, and the retweet analysis seems straightforward, though it might be difficult to exactly reproduce the graphic in Figure 10.

&ensp; As for replicability, this paper is eminently replicable, because Wang, Ye, and Tsou are clear about what analyses they are performing and why. We could easily substitute different keywords, a different place and time, and conduct a similar study. Twitter data should be structured the same way wherever and whenever it comes from, so methods ought to be transferable. Whether a replication would reveal similar trends remains to be seen. For instance, is it true elsewhere that geotagged tweets clustered near a disruptive event show greater situational awareness? And how great of a role do opinion leaders play in the retweet network?

===

**References**

Wang, Z., X. Ye, and M. H. Tsou. 2016. Spatial, temporal, and content analysis of Twitter for wildfire hazards. Natural Hazards 83 (1):523–540.

National Academies of Sciences, Engineering, and Medicine. 2019. *Reproducibility and Replicability in Science*. Washington, DC: The National Academies Press. [https://doi.org/10.17226/25303](https://doi.org/10.17226/25303).

===
