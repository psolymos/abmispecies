---
layout: default
title: Bioclimatic variables
description: "Bioclimatic variables."
data:
- long: 'Annual heat-moisture index'
  short: AHM
- long: 'Frost free period'
  short: FFP
- long: 'Mean annual precipitation'
  short: MAP
- long: 'Mean annual temperature'
  short: MAT
- long: 'Mean cold month (January) temperature'
  short: MCMT
- long: 'Mean warm month (July) temperature'
  short: MWMT
- long: 'Potential evapotranspiration'
  short: PET
---

## Raw data

* <a href="{{ site.ftproot }}/geospatial/climate/climate_grid.zip">Raw climate raster layers</a> (see <a href="{{ site.baseurl }}/methods.html">methods</a> and <a href="{{ site.baseurl }}/collaborations.html">collaborations</a> for an explanation and data sources)

## Distribution of bioclimatic variables used in modeling

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Climate map: {{ item.long }}</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/climate/{{ item.short }}.png" class="img-responsive" alt="Climate map: {{ item.long }}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

{% endfor %}

