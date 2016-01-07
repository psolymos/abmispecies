---
layout: default
title: Soil
description: "Soil: spatial distribution."
data:
- short: Productive
  long: 'Productive'
- short: RapidDrain
  long: 'Rapid drain'
- short: Saline
  long: 'Saline'
- short: Clay
  long: 'Clay'
---

## Raw data

* <a href="{{ site.ftproot }}/geospatial/soil/ABMI_soilTypes_LayerJan2014.gdb.zip">Raw soil layers</a>
* <a href="{{ site.ftproot }}/geospatial/soil/soillayersfortheabmisppwebsite.zip">Metadata</a>

## Distribution of soil types used in modeling

The maps show percent cover by soil types within 1 km<sup>2</sup> grid cells.

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Soil map: {{ item.long }} (% cover)</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/soil/{{ item.short }}.png" class="img-responsive" alt="Soil map: {{ item.long }} (% cover)"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

{% endfor %}


