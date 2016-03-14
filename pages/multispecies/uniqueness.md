---
layout: default
title: Species Uniqueness
description: "Species Uniqueness"
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

Description comes here

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/multispecies/uniqueness/uniqueness-all.png" class="img-responsive" alt="Species uniqueness"/></p>

  </div>
  <div class="col-6 col-sm-6 col-lg-6">

<span class="pull-right">
<div class="btn-group">
  <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Download <i class="fa fa-download"></i></a>
  <ul class="dropdown-menu">
    <li><a href="{{ site.ftproot }}/multispecies/uniqueness/uniqueness-all.asc" download>Map (raster file)</a></li>
    <li><a href="{{ site.contents }}/multispecies/uniqueness/uniqueness.pdf" download>uniqueness manual (pdf file)</a></li>
  </ul>
</div>
</span>

  </div>
</div>

## Uniqueness for groups of species

Description.

{% for item in page.data %}

<p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button></p>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Uniqueness map: {{ item.long }}</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/multispecies/uniqueness/uniqueness-{{ item.short }}.png" class="img-responsive" alt="Uniqueness map: {{ item.long }}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="{{ site.ftproot }}/multispecies/uniqueness/uniqueness-{{ item.short }}.asc" download>Download raster file <i class="fa fa-download"></i></a>
      </div>
    </div>
  </div>
</div>

{% endfor %}

