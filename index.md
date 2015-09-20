---
layout: plain
---

<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">

<h2 class="title">Alberta Biodiversity Monitoring Institute (ABMI)</h2>
<p>monitors species and their habitats to understand distribution of biodiversity and to inform sustainable resource development and biological conservation in Alberta.</p>
<!-- <p><a class="btn btn-primary" href="{{ site.baseurl }}/dc.html">Learn more</a></p> -->

            </div>
        </div>
    </div>
</div>

<div class="section-tout">
    <div class="container">
        <div class="row">

<div class="col-lg-6 col-sm-6">
<h3><i class="fa fa-leaf"></i> Species</h3>
<p>We provide informaion on spatial distribution, habitat associations, responses to human footprint, and predicted relative abundance distributions for {% for item in site.data.summary %}{% if item.names == "all" %}{{ item.mapdet }}{% endif %}{% endfor %} species in Alberta, including
<a href="{{ site.baseurl }}/pages/species/mammals.html">mammals</a>,
<a href="{{ site.baseurl }}/pages/species/birds.html">birds</a>,
<a href="{{ site.baseurl }}/pages/species/mites.html">soil mites</a>,
<a href="{{ site.baseurl }}/pages/species/vplants.html">vascular plants</a>,
<a href="{{ site.baseurl }}/pages/species/mosses.html">bryophytes</a>, and
<a href="{{ site.baseurl }}/pages/species/lichens.html">lichens</a>.</p>
</div>

<div class="col-lg-6 col-sm-6">
<h3><i class="fa fa-map-marker"></i> Geospatial information</h3>
<p>We provide maps of
native vegetation, soils, climate, topography, and human footprint types
<a href="{{ site.baseurl }}/pages/geospatial/vegetation.html">native vegetation</a>,
<a href="{{ site.baseurl }}/pages/geospatial/soil.html">soils</a>,
<a href="{{ site.baseurl }}/pages/geospatial/footprint.html">human footprint</a>,
<a href="{{ site.baseurl }}/pages/geospatial/climate.html">climate</a>, and
<a href="{{ site.baseurl }}/pages/geospatial/topography.html">topography</a>
in Alberta.</p>
</div>

      </div>
      <div class="row">

<div class="col-lg-6 col-sm-6">
<h3><i class="fa fa-paw"></i> Higher taxa and guilds</h3>
<p>Results on individual species are combined to highlight
how groups of similar species &mdash; guilds &mdash; respond to
environmental variation.</p>
</div>

<div class="col-lg-6 col-sm-6">
<h3><i class="fa fa-group"></i> Collaborations</h3>
<p>ABMI collaborated with a variety of institutions, organizations and individuals to develop predictive species/habitat modeling in Alberta. <a href="{{ site.baseurl }}/collaborations.html">These collaborations</a> were essential at all steps of the process of generating the content for this website.</p>
</div>

        </div>
    </div>
</div>
