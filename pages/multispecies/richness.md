---
layout: default
title: Richness
description: "Richness."
data:
- long: 'Mammals'
  short: mammals
- long: 'Birds'
  short: birds
- long: 'Mites'
  short: mites
- long: 'Native vascular plants'
  short: vplants
- long: 'Bryophytes'
  short: mosses
- long: 'Lichens'
  short: lichens
---

## Average species richness across taxa

Species richness was modelled by stacking predictions from individual species habitat association models. Individual species models were built by relating the species’ occurrence data to three sets of environmental variables: vegetation types, human footprint, and geographic location (see methods). Using these relationships, the mean occurrence probability of each species was projected for each 1 km<sup>2</sup> grid cell in the province. Species richness index for each taxon was produced by summing these predicted probabilities and scaling the values to range between 0 and 1 by dividing each 1 km2 grid cell value by maximum value over all grid cells.
The richness index across all taxa was derived by taking the simple average of standardized richness index for each 1 km<sup>2</sup> grid cell across the six taxa: mammals, birds, vascular plants, bryophytes, lichens and mites.

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/multispecies/richness/richness-allspecies.jpg" class="img-responsive" alt="Richness map: all species"/></p>

  </div>
  <div class="col-6 col-sm-6 col-lg-6">

<span class="pull-right">
<div class="btn-group">
  <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Download <i class="fa fa-download"></i></a>
  <ul class="dropdown-menu">
    <li><a href="{{ site.ftproot }}/multispecies/richness/richness-all.asc" download>Map (raster file)</a></li>
  </ul>
</div>
</span>

  </div>
</div>

## Species richness for each taxa

Species richness maps are available for these taxa:

{% for item in page.data %}
<p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button></p>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-{{ item.short }}-label">Species richness map for {{ item.long }}</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/multispecies/richness/richness-{{ item.short }}.jpg" class="img-responsive" alt="Richness map: {{ item.long }}"/>
        <p>Species richness for each taxon was modelled by stacking predictions from individual species habitat association models. Individual species models were built by relating the species' occurrence data to three sets of environmental variables: vegetation types, human footprint, and geographic location. Using these relationships, the mean occurrence probability of each species was projected for each 1 km<sup>2</sup> grid cell in the province. The species richness index for each taxon was produced by simply summing these predicted probabilities and scaling the values to range between 0 and 1 by dividing each 1 km<sup>2</sup> grid cell value by maximum value over all grid cells.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="{{ site.ftproot }}/multispecies/richness/richness-{{ item.short }}.asc" download>Download raster file <i class="fa fa-download"></i></a>
      </div>
    </div>
  </div>
</div>
{% endfor %}

## Interpretation Caveats

1. The index of richness does not adjust for multiple habitat types occurring within each 1 km<sup>2</sup> grid cell. For each species probability of occurrence was modeled for each habitat type, and an area-weighted average across habitat types determined for each 1 km<sup>2</sup> grid cell. By summing across species an index of richness was determined. This estimate was really just the average of point richness throughout each 1 km<sup>2</sup> grid cell, and did not incorporate the fact that 1 km<sup>2</sup> grid cells often span multiple habitat types and thus have higher richness than any single type alone, or having higher richness due to edge effects. However, a 1 km<sup>2</sup> grid cell dominated by habitats having relatively high richness will have higher index than a 1 km<sup>2</sup> grid cell dominated by habitats with low richness.
2. Rare species were not included when determining the index of richness. ABMI only models species habitat associations for species that have sufficient data to create robust models. Since the index of richness was created from the species models, the index only includes species with more than the minimum number of detections. However, this may not be a large issue because many rare species occur in every habitat type and thus ignoring the less common species may have little influence on the index of richness since it is standardized to a maximum of 1. On the other hand, it is possible that there are some habitat types that have a disproportionate number of rare species (e.g., possibly some wetland types) and an index of richness that does not incorporate rare species would not capture this.
3.	Spatial irregularities in sampling intensity influence the index of richness. In regions with higher intensity of ABMI surveys, more species will have reached the minimum number of detections required for modeling, and thus more species will have been included in the index of richness. ABMI sampling intensity has been relatively low in the Rocky Mountain natural region, and in northwestern Alberta.  Thus, species that are most commonly found in these regions will be less likely to have been included in the index of richness and 1 km<sup>2</sup> grid cells in these regions may have artificially low indices of richness.
