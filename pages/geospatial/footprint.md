---
layout: default
title: Human footprint
description: "Human footprint: spatial distribution."
data:
- short: Cult
  long: 'Cultivation'
- short: UrbInd
  long: 'Urban-Industrial'
- short: HardLin
  long: 'Hard linear features'
- short: HWater
  long: 'Human created water bodies'
- short: HFor
  long: 'Forestry'
- short: SoftLin
  long: 'Soft linear features'
---

The ABMI Wall-to-Wall Human Footprint (HF) Inventory (scale 1:15,000) ) identifies all of the human footprint (defined as the temporary or permanent transformation of native ecosystems to industrial, residential or recreational land uses) throughout the province of Alberta. This comprehensive layer includes all the HF information related to the energy, forestry, and agriculture industries, as well as urban development. HF layers can be downloaded for the following years: 2007, 2010, 2012.

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/geospatial/footprint/HF_w2w_dark_300DPI_legend_v6_small.jpg" class="img-responsive" alt="Human footprint"/></p>
  </div>
</div>

## Spatial distribution of footprint types

Each of the maps show percent cover by footprint types (2012 HF) within 1 km<sup>2</sup> grid cells throughout Alberta.

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Human footprint map: {{ item.long }}</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/footprint/{{ item.short }}.png" class="img-responsive" alt="Human footprint map: {{ item.long }}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="http://abmi.ca/home/data/gis-data/human-footprint-download.html?scroll=true" target="_blank">Download <i class="fa fa-external-link-square"></i></a>
      </div>
    </div>
  </div>
</div>

{% endfor %}
