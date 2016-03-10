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

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/geospatial/topography/GeneralTopo.png" class="img-responsive" alt="General topography in Alberta"/></p>
  </div>
</div>

## Distribution of topographic variables

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Topogarphy: {{ item.long }}</h4>
        <p>Source: <a href="http://www.ace-lab.org/">Nielsen lab</a></p>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/topography/{{ item.short }}.png" class="img-responsive" alt="Topogarphy: {{ item.long }}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="{{ site.ftproot }}/geospatial/topography/topo_grid.zip">Download <i class="fa fa-download"></i></a>
      </div>
    </div>
  </div>
</div>

{% endfor %}

