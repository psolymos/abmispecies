---
layout: default
title: "Old forest birds"
taxon: birds
---

## Old forest bird intactness map

Intactness for a single species is defined as SI = 100 x min(Current, Reference) / min(Current, Reference) and is in the range of 0–100% for each 1 km<sup>2</sup> mapping unit. The intactness map for old forest birds is the average of the single-species intactness values within each pixel.

<img src="{{ site.contents }}/multispecies/old-forest-birds/multi-map-intactness.png" class="img-responsive" alt="Intactness map" width="60%"/>

## Species richness map

Species richness is the sum of mean occurrence probabilities of multiple species within each 1 km<sup>2</sup> mapping unit. The scale of reference for species richness is 1 ha.

<img src="{{ site.contents }}/multispecies/old-forest-birds/multi-map-richness.png" class="img-responsive" alt="Richness map" width="60%"/>

## Sector effects

We use the species-habitat models to estimate the effects of individual industrial sectors on each species in a given region. We differentiate the following sectors: Agriculture, Forestry, Energy, Rural/Urban, and Transportation. We summarize current and relative abundance for each industrial sector in that region, besides relative abundance in native (undisturbed) land cover types (where current and reference abundances are equal).

The "vase" diagrams highlight the distribution of sector effects within the set of species, here old forest birds.

### Effects on regional population

Sector effects on regional population for a given sector are calculated as the difference between sector specific current and reference abundance, standardized by the total reference abundance in the entire region (including all sectors and native land cover types).

<img src="{{ site.contents }}/multispecies/old-forest-birds/multi-sector-total.png" class="img-responsive" alt="Sector effects: regional" width="60%"/>

### Effects on population under footprint

Sector effects on population under footprint for a given sector are calculated as the difference between sector specific current and reference abundance, standardized by the reference abundance in that sector.


<img src="{{ site.contents }}/multispecies/old-forest-birds/multi-sector-underhf.png" class="img-responsive" alt="Sector effects: under HF" width="60%"/>

### Regional effects per unit area

Per unit area effects are calculated from the regional population effects, but further divided by the proportion of the sector specific footprint in the region. The corresponding graphs show the area of the sector's footprint as the width of the bars, and the per unit area effect as the height of the bars. The area of the bar corresponds to the regional sector effect.

<img src="{{ site.contents }}/multispecies/old-forest-birds/multi-sector-unit.png" class="img-responsive" alt="Sector effects: unit" width="60%"/>
