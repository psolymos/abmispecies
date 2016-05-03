---
layout: default
title: "Uniqueness: All Species"
description: "Uniqueness: All Species"
long: 'All Species'
short: all
---

The uniqueness of species composition in space is a relative measure and values estimated for specific sites are partly dependent on the scale of study. For example, a given area might be regarded less unique in a relatively homogeneous subset area where it is found but that particular subset area could have high uniqueness compared to a larger scale of study. 

## Uniqueness maps

The relative uniqueness measure shows the degree to which species composition in each pixel was distinct compared to all other pixels within the Natural Region.  The uniqueness analysis was conducted separately for each Natural Region because the regional species pool and their predicted relative abundances differ between these. Relative abundance of each species in each pixel was predicted using habitat association models that relate species relative abundance to native habitat types (read [methods and caveats]({{ site.contents }}/multispecies/uniqueness/uniqueness-methods.pdf)).

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Northern Alberta</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/uniqueness-north-{{ page.short }}.png" class="img-responsive" alt="Uniqueness: {{ page.long }}, North"/></p>

  </div>
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Southern Alberta</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/uniqueness-south-{{ page.short }}.png" class="img-responsive" alt="Uniqueness: {{ page.long }}, South"/></p>

  </div>
</div>

<span class="pull-right">
<div class="btn-group">
  <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Download <i class="fa fa-download"></i></a>
  <ul class="dropdown-menu">
    <li><a href="{{ site.ftproot }}/multispecies/uniqueness/uniqueness.zip" download>Uniqueness data (zipped Rdata files)</a></li>
    <li><a href="{{ site.contents }}/multispecies/uniqueness/uniqueness-methods.pdf" download>Methods and caveats (pdf file)</a></li>
  </ul>
</div>
</span>

## Habitat associations by natural regions

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Boreal</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/uniqueness-habitat-boreal-{{ page.short }}.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Boreal"/></p>

  <h3>Foothills</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/uniqueness-habitat-foothills-{{ page.short }}.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Foothills"/></p>

  </div>
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Parkland</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/uniqueness-habitat-parkland-{{ page.short }}.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Parkland"/></p>

  <h3>Grasslands</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/uniqueness-habitat-grassland-{{ page.short }}.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Grassland"/></p>

  </div>
</div>

