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

<div class="alert alert-dismissible alert-info">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <h4>What's new in this version?</h4>
  <p>
    Species models were updated including more data.
    Model summaries for habitat elements are added.
    Listed species highlighted.
    Improved documentation.
  </p>
</div>

<div class="section-tout">
    <div class="container">
        <div class="row">

<div class="col-lg-6 col-sm-6">
<h3><a href="{{ site.baseurl }}/pages/species.html"><i class="fa fa-leaf"></i> Single species</a></h3>
<p>We provide informaion on spatial distribution, habitat associations, responses to human footprint, and predicted relative abundance distributions for {% for item in site.data.summary %}{% if item.names == "all" %}{{ item.mapdet }}{% endif %}{% endfor %} species in Alberta, including
<a href="{{ site.baseurl }}/pages/species/mammals.html">mammals</a>,
<a href="{{ site.baseurl }}/pages/species/birds.html">birds</a>,
<a href="{{ site.baseurl }}/pages/species/mites.html">soil mites</a>,
<a href="{{ site.baseurl }}/pages/species/vplants.html">vascular plants</a>,
<a href="{{ site.baseurl }}/pages/species/mosses.html">bryophytes</a>, and
<a href="{{ site.baseurl }}/pages/species/lichens.html">lichens</a>.</p>
</div>

<div class="col-lg-6 col-sm-6">
<h3><a href="{{ site.baseurl }}/pages/multispecies.html"><i class="fa fa-paw"></i> Multiple species</a></h3>
<p>Results on individual species are combined to highlight
how groups of similar species respond to
environmental variation. We provide information on
<a href="{{ site.baseurl }}/pages/multispecies/intactness.html">intactness</a>,
<a href="{{ site.baseurl }}/pages/multispecies/richness.html">richness</a>,
<a href="{{ site.baseurl }}/pages/multispecies/uniqueness.html">uniqueness</a>, and
<a href="{{ site.baseurl }}/pages/multispecies.html">guilds</a>.
</p>
</div>

      </div>
      <div class="row">

<div class="col-lg-6 col-sm-6">
<h3><a href="{{ site.baseurl }}/pages/habitat.html"><i class="fa fa-tree"></i> Habitats</a></h3>
<p>We model abundance and distribution of <a href="{{ site.baseurl }}/pages/habitat/habitatelements.html">habitat elements</a> based field sampling.
We provide information on
native vegetation <a href="{{ site.baseurl }}/pages/habitat/edges.html">edge</a>,
<a href="{{ site.baseurl }}/pages/habitat/mesh-size.html">mesh size</a>, and
<a href="{{ site.baseurl }}/pages/habitat/footprint-change.html">human footprint change</a>
in Alberta.</p>
</div>



<div class="col-lg-6 col-sm-6">
<h3><a href="{{ site.baseurl }}/pages/geospatial.html"><i class="fa fa-map-marker"></i> Geospatial inputs</a></h3>
<p>We provide maps of
<a href="{{ site.baseurl }}/pages/geospatial/footprint.html">human footprint</a>,
<a href="{{ site.baseurl }}/pages/geospatial/vegetation.html">native vegetation</a>,
<a href="{{ site.baseurl }}/pages/geospatial/soil.html">soils</a>,
<a href="{{ site.baseurl }}/pages/geospatial/climate.html">climate</a>, and
<a href="{{ site.baseurl }}/pages/geospatial/topography.html">topography</a>
in Alberta.</p>
</div>

        </div>
    </div>
</div>
