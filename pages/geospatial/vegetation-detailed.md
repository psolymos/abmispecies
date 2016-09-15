---
layout: default
title: Detailed vegetation
description: "Detailed vegetation: spatial distribution."
data:
- short: Decid
  long: 'Deciduous forest'
- short: Mixwood
  long: 'Mixedwood'
- short: Conif
  long: 'Upland coniferous (non-pine)'
- short: Pine
  long: 'Pine forest'
- short: BSpr
  long: 'Lowland coniferous, Black spruce'
- short: Larch
  long: 'Lowland coniferous, Larch'
- short: WetShrub
  long: 'Non-treed shrubby wetlands'
- short: WetGrassHerb
  long: 'Non-treed open wetlands'
- short: Shrub
  long: 'Shrubs'
- short: GrassHerb
  long: 'Grass'
---

The ABMI Detailed Wall-to-Wall Land Cover Map is a comprehensive representation of the types and extent of land cover in Alberta. The map is a seamless full-coverage  map that offers detailed upland and lowland vegetation types throughout Alberta. Due to data-sharing agreements, we cannot share this GIS layer outside of the ABMI.

<div class="row">

  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/geospatial/vegetation/DetailedVeg.png" class="img-responsive" alt="Land cover, 2010"/></p>
  </div>

<span class="pull-right">
<a href="http://abmi.ca/home/publications/251-300/259.html?mode=detail&documenttype=Protocols" class="btn btn-primary" target="_blank">Download metadata <i class="fa fa-external-link-square"></i></a>
</span>

</div>


## Distribution of land cover types used in modeling

The following maps show percent cover of each land cover type within 1 km<sup>2</sup> grid cells throughout Alberta. Due to data-sharing agreements, we cannot share this GIS layer outside of the ABMI.

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Vegetation map: {{ item.long }} (% cover)</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/vegetation/{{ item.short }}.png" class="img-responsive" alt="Vegetation map: {{ item.long }} (% cover)"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="http://abmi.ca/home/data/gis-data/land-cover-download.html?scroll=true" target="_blank">Download <i class="fa fa-external-link-square"></i></a>
      </div>
    </div>
  </div>
</div>

{% endfor %}
