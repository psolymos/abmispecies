---
layout: default
title: Richness
description: "Richness."
---

## Species richness for each taxa

Species richness for each taxon was modelled by stacking predictions from individual species habitat association models. Individual species models were built by relating the species' occurrence data to three sets of environmental variables: vegetation types, human footprint, and geographic location (hyperlink to document describing species modeling methods). Using these relationships, the mean occurrence probability of each species was projected for each 1 km<sup>2</sup> grid cell in the province. The species richness index for each taxon was produced by simply summing these predicted probabilities and scaling the values to range between 0 and 1 by dividing each 1 km<sup>2</sup> grid cell value by maximum value over all grid cells.

### Interpretation Caveats

1. The index of richness does not adjust for multiple habitat types occurring within each 1 km<sup>2</sup> grid cell. For each species probability of occurrence was modeled for each habitat type, and an area-weighted average across habitat types determined for each 1 km<sup>2</sup> grid cell. By summing across species an index of richness was determined. This estimate was really just the average of point richness throughout each 1 km<sup>2</sup> grid cell, and did not incorporate the fact that all 1 km<sup>2</sup> grid cells span multiple habitat types and thus have higher richness than any single type alone, or having higher richness due to edge effects. However, a 1 km<sup>2</sup> grid cell dominated by habitats having relatively high richness will have higher index than a 1 km<sup>2</sup> grid cell dominated by habitats with low richness.
2. Rare species were not included when determining the index of richness. ABMI only models species habitat associations for species that have sufficient data to create robust models. Since the index of richness was created from the species models, the index only includes species with more than the minimum number of detections. However, this may not be a large issue because many rare species occur in every habitat type and thus ignoring the less common species may have little influence on the index of richness since it is standardized to a maximum of 1. On the other hand, it is possible that there are some habitat types may have a disproportionate number of rare species (e.g., possibly some wetland types) and an index of richness that does not incorporate rare species would not capture this.
3.	Spatial irregularities in sampling intensity influence the index of richness. In regions with higher intensity of ABMI surveys, more species will have reached the minimum number of detections required for modeling, and thus more species will have been included in the index of richness. ABMI sampling intensity has been relatively low in the Rocky Mountain natural region, and in northwestern Alberta.  Thus, species that are most commonly found in these regions will be less likely to have been included in the index of richness and 1 km<sup>2</sup> grid cell in these regions may have artificially low indices of richness.

## Average species richness across taxa
The richness index across all taxa was derived by taking a simple average of richness index for each 1 km<sup>2</sup> grid cell across the six taxa: mammals, birds, vascular plants, bryophytes, lichens and mites.
