---
layout: default
title: Native vegetation mesh size
description: "Native vegetation mesh size"
---

The Alberta Biodiversity Monitoring Institute tracks changes in human footprint and reports on the status of, and changes in, land use across the province of Alberta. One of the goals of the Institute is to provide credible and understandable information on the amount and location of remaining native vegetation to support natural resources management. 
ABMI created  the Effective Mesh Size layers (Version 1.0) .

The primary source of data when creating the edge buffer layers was the 2012 Human Footprint Inventory (Version 3.0), a GIS polygon layer that describes human footprint in Alberta as of December 31, 2012. Polygons in that layer map the location and geographic extent of areas under human use that either have either lost their natural cover (e.g., cities, roads, agricultural land, industrial areas), or whose natural cover is periodically or temporarily replaced by resource extraction activities (e.g., forestry, seismic lines). 


<p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-mesh-all-hf">Mesh size: all human footprint included</button></p>

<div class="modal fade" id="modal-mesh-all-hf" tabindex="-1" role="dialog" aria-labelledby="modal-edges-all-hf-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-all-hf-label">Mesh size: all human footprint included</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/habitat/mesh-size/MeshAllHF.png" class="img-responsive" alt="Mesh size: all human footprint included"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="{{ site.ftproot }}/habitat/mesh-size/Effective_Mesh_Size_Layer_Metadata_20Jan2016.doc" target="_blank">Download metadata <i class="fa fa-download"></i></a>
      </div>
    </div>
  </div>
</div>

<p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-mesh-no-seismic">Mesh size: all human footprint except seismic lines included</button></p>

<div class="modal fade" id="modal-mesh-no-seismic" tabindex="-1" role="dialog" aria-labelledby="modal-edges-no-seismic-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-no-seismic-label">Mesh size: all human footprint except seismic lines included</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/habitat/mesh-size/MeshNoSeismicLines.png" class="img-responsive" alt="Mesh size: all human footprint except seismic lines included"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="{{ site.ftproot }}/habitat/mesh-size/Effective_Mesh_Size_Layer_Metadata_20Jan2016.doc" target="_blank">Download metadata <i class="fa fa-download"></i></a>
      </div>
    </div>
  </div>
</div>



<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/habitat/edges/NativeVegetation.png" class="img-responsive" alt="Native vegetation"/></p>

<span class="pull-right">
<div class="btn-group">
  <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Download <i class="fa fa-download"></i></a>
  <ul class="dropdown-menu">
    <li><a href="{{ site.contents }}/habitat/edges/NativeVegetation.png" download>Map (png file)</a></li>
    <li><a href="{{ site.ftproot }}/habitat/mesh-size/Effective_Mesh_Size_Layer_Metadata_20Jan2016.doc" download>Metadata (doc file)</a></li>
  </ul>
</div>
</span>

  </div>
</div>

