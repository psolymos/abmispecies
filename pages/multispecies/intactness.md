---
layout: default
title: Intactness
description: "Intactness."
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

## Overall biodiversity intactness

Overall biodiversity intactness is the average of the intactness for each of the included taxa
(birds, mammals, mites, native vascular plants, bryophytes, lichens). 
Each taxon is weighted equally, regardless of how many species it contains.

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/multispecies/intactness/intactness-all.png" class="img-responsive" alt="Overall biodiversity intactness"/></p>

  </div>
  <div class="col-6 col-sm-6 col-lg-6">

<span class="pull-right">
<div class="btn-group">
  <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Download <i class="fa fa-download"></i></a>
  <ul class="dropdown-menu">
    <li><a href="{{ site.ftproot }}/multispecies/intactness/intactness-all.asc" download>Map (raster file)</a></li>
    <li><a href="{{ site.contents }}/multispecies/intactness/47_ABMI_2014-09-25_SpeciesModelingAndIntactnessManual_ABMI.pdf" download>Intactness manual (pdf file)</a></li>
  </ul>
</div>
</span>

  </div>
</div>

## Intactness for groups of species

Intactness for groups of species within a taxon is the average intactness of species in the group. 
The species intactness index compares the predicted relative abundance of each species across
the reporting region to the predicted abundance for that species under zero human footprint in the
same region. This measure of intactness is scaled between 0 and 100, with 100 representing
current abundance equal to that expected under reference conditions, and 0 representing species
abundance as far from reference condition as possible. See more detailed description of
the analyses and limitations in the [methods section]({{ site.baseurl }}/methods.html) 
and in the [intactness manual]({{ site.contents }}/multispecies/intactness/47_ABMI_2014-09-25_SpeciesModelingAndIntactnessManual_ABMI.pdf).

{% for item in page.data %}

<p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button></p>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Intactness map: {{ item.long }}</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/multispecies/intactness/intactness-{{ item.short }}.png" class="img-responsive" alt="Intactness map: {{ item.long }}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="{{ site.ftproot }}/multispecies/intactness/intactness-{{ item.short }}.asc" download>Download raster file <i class="fa fa-download"></i></a>
      </div>
    </div>
  </div>
</div>

{% endfor %}

