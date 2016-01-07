---
layout: default
title: Topography
description: "Topography: spatial distribution."
data:
- short: slope
  long: 'Slope'
- short: slpasp
  long: 'Slope / aspect solar radiation index'
- short: tpi2km
  long: 'Topographic position index'
- short: tri
  long: 'Topographic ruggedness index'
- short: cti
  long: 'Compound topographic index (wetness)'
- short: vrm5x5
  long: 'Vector ruggedness measure'
---

## Raw data

* <a href="{{ site.ftproot }}/geospatial/topography/topo_grid.zip">Raw topographic raster layers</a> are from <a href="http://www.ace-lab.org/">Dr. Scott Nielsen's lab</a>.

## Distribution of topographic variables

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Topogarphy: {{ item.long }}</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/topography/{{ item.short }}.png" class="img-responsive" alt="Topogarphy: {{ item.long }}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

{% endfor %}
