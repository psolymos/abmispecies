---
layout: default
title: Human footprint
description: "Human footprint: spatial distribution."
data:
- Cult:
  - short: Cult
  - long: 'Cultivation'
- UrbInd:
  - short: UrbInd
  - long: 'Urban-Industrial'
- HardLin:
  - short: HardLin
  - long: 'Hard linear features'
- HWater:
  - short: HWater
  - long: 'Human created water bodies'
- HFor:
  - short: HFor
  - long: 'Forestry'
- SoftLin:
  - short: SoftLin
  - long: 'Soft linear features'
---

## Raw data

Human footprint layers can be downloaded from the
[ABMI website](http://abmi.ca/home/data/gis-data/human-footprint-download.html?scroll=true).

## Spatial distribution of footprint types

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">{{ item.long }} human footprint map</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/footprint/{{ item.short }}.png" class="img-responsive" alt="{{ item.long }} human footprint map"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

{% endfor %}


<div class="row">

<div class="col-6 col-sm-6 col-lg-6">
<h3>Cultivation</h3>
<img src="{{ site.contents }}/geospatial/footprint/Cult.png" class="img-responsive" alt="Cultivation">
</div>

<div class="col-6 col-sm-6 col-lg-6">
<h3>Urban-Industrial</h3>
<img src="{{ site.contents }}/geospatial/footprint/UrbInd.png" class="img-responsive" alt="Urban-Industrial">
</div>

<div class="col-6 col-sm-6 col-lg-6">
<h3>Hard linear features</h3>
<img src="{{ site.contents }}/geospatial/footprint/HardLin.png" class="img-responsive" alt="Hard linear features">
</div>

<div class="col-6 col-sm-6 col-lg-6">
<h3>Human created water bodies</h3>
<img src="{{ site.contents }}/geospatial/footprint/HWater.png" class="img-responsive" alt="Human created water bodies">
</div>

<div class="col-6 col-sm-6 col-lg-6">
            <h3>Forestry</h3>
<img src="{{ site.contents }}/geospatial/footprint/HFor.png" class="img-responsive" alt="Forestry">
</div>

<div class="col-6 col-sm-6 col-lg-6">
            <h3>Soft linear features</h3>
<img src="{{ site.contents }}/geospatial/footprint/SoftLin.png" class="img-responsive" alt="Soft linear features">
</div>

</div>

