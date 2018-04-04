---
layout: default
title: "Uniqueness: Mammals"
description: "Uniqueness: Mammals"
long: 'Mammals'
short: mammals
---

Uniqueness of species composition in space is a relative measure and values estimated for specific sites are partly dependent on the scale of study. For example, a given area might be regarded less unique in a relatively homogeneous subset area where it is found but that particular subset area could have high uniqueness compared to a larger scale of study.

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Northern Alberta</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/Species%20Uniqueness%20North.png" class="img-responsive" alt="Uniqueness: {{ page.long }}, North"/></p>

  </div>
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Southern Alberta</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/Species%20Uniqueness%20South.png" class="img-responsive" alt="Uniqueness: {{ page.long }}, South"/></p>

  </div>
</div>

<div class="btn-group">
  <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Download <i class="fa fa-download"></i></a>
  <ul class="dropdown-menu">
    <li><a href="{{ site.ftproot }}/multispecies/uniqueness/uniqueness.zip" download>Uniqueness data (zipped Rdata files)</a></li>
    <li><a href="{{ site.contents }}/multispecies/uniqueness/uniqueness-methods.pdf">Methods and caveats (pdf file)</a></li>
  </ul>
</div>

## Habitat associations by natural regions

The relative uniqueness measure shows the degree to which species composition in each pixel was distinct compared to all other pixels within the Natural Region.  The uniqueness analysis was conducted separately for each Natural Region because the regional species pool and their predicted relative abundances differ between these. Relative abundance of each species in each pixel was predicted using habitat association models that relate species relative abundance to native habitat types (read [methods and caveats]({{ site.contents }}/multispecies/uniqueness/uniqueness-methods.pdf)).

<div class="row">
  <div class="col-12 col-sm-12 col-lg-12">

  <h3>Boreal</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/Uniqueness-Habitat%20association%20Boreal.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Boreal"/></p>

  </div>
  <div class="col-12 col-sm-12 col-lg-12">

  <h3>Foothills</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/Uniqueness-Habitat%20association%20Foothills.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Foothills"/></p>

  </div>
</div>

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Parkland</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/Uniqueness-Habitat%20association%20Parkland.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Parkland"/></p>

  </div>
  <div class="col-6 col-sm-6 col-lg-6">

  <h3>Grasslands</h3>
  <p><img src="{{ site.contents }}/multispecies/uniqueness/{{ page.short }}/Uniqueness-Habitat%20association%20Grassland.png" class="img-responsive" alt="Uniqueness, habitat associations: {{ page.long }}, Grassland"/></p>

  </div>
</div>
