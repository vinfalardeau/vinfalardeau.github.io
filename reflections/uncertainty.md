---
layout: page
title: Error and Uncertainty
---

===

&emsp; One of the interesting points raised by Longley et al. in their chapter on error and uncertainty in GIS is the idea that uncertainty can accrue with the conceptualization, measurement, and analysis of real-world phenomena.  This might seem obvious, but there sometimes seems to be a tendency towards ignoring uncertainty, like scientific ostriches with their heads in the sand!  Even when a GIS analysis uses natural units, the conceptualization of those units can result in generalization and uncertainty. For instance, take the example of a field study of trees in a small forest. A geographer can mark the location of each tree, and can record the important attributes (species, height, diameter…), but no matter how much data they collect and record, that data remains a generalization of the complex living organism.  

&emsp; The potential for uncertainty, vagueness, and ambiguity only becomes more apparent when we are no longer working with what Longley et al. call natural units.  Maybe we are trying to define patches of deciduous and coniferous forest from the field data on trees – the definitions of ‘deciduous’ and ‘coniferous’ are *vague* (what statistical threshold qualifies a forest as one or the other?) as well as *ambiguous* (since the concepts are tied up in personal language, perceptions, values, etc).

&emsp; Sometimes uncertainty goes beyond generalization or ambiguity, to actually not knowing for sure what something is.  I’ve run into this issue before in remote sensing, especially in the context of raster classification.  Collecting training points and validation points from high-resolution imagery rather than going out and ground-truthing in the field, it is sometimes impossible to be 100% certain what type of land cover or land use one is looking at.  This unsureness can get lost in the process when a training or validation point is simply labelled as belonging to one class.  Even with absolute certainty about such points, the classification itself is bound to be uncertain, and will not perfectly match the validation points.  The important thing is to reduce uncertainty as much as possible, and to be transparent about whatever uncertainty cannot be eliminated.  

&emsp; In the context of published scientific work, it is the researcher’s duty to honestly report the degree of uncertainty involved in their findings at each step of their process.  As the National Academies of Science, Engineering, and Medicine put it, “Reporting of uncertainties in scientific results is a central tenet of the scientific process. It is incumbent on scientists to convey the appropriate degree of uncertainty in reporting their claims” (26).  I believe that geographers have a responsibility to mention (and describe in detail) any and all steps they take that could introduce uncertainty or conceptual vagueness/ambiguity.  Of course, spending too much time writing about uncertainty in the body of the publication itself might be impractical, just as it can be impractical to include all of the data or code within the text.  Perhaps brief mention can be made in the publication, and further discussion of uncertainty can take place alongside the data or code in a supplementary materials section.  

&emsp; For the sake of scientific rigor and reproducibility, a thorough account of uncertainty and error is essential.  

===

**References**

Longley, P. A., M. F. Goodchild, D. J. Maguire, and D. W. Rhind. 2008. Geographical information systems and science 2nd ed. Chichester: Wiley.

National Academies of Sciences, Engineering, and Medicine. 2019. *Reproducibility and Replicability in Science*. Washington, DC: The National Academies Press. [https://doi.org/10.17226/25303](https://doi.org/10.17226/25303).

===
