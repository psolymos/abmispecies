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

## Raw data

Human footprint layers can be downloaded from the
[ABMI website](http://abmi.ca/home/data/gis-data/human-footprint-download.html?scroll=true).

## Spatial distribution of footprint types

The maps show percent cover by footprint types within 1 km<sup>2</sup> grid cells.

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
      </div>
    </div>
  </div>
</div>

{% endfor %}


