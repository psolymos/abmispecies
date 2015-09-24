---
layout: default
title: "Species"
---

We provide informaion on spatial distribution, habitat associations, responses to human footprint, and predicted relative abundance distributions for {% for item in site.data.summary %}{% if item.names == "all" %}{{ item.mapdet }}{% endif %}{% endfor %} species in Alberta.

* <a href="{{ site.baseurl }}/pages/species/mammals.html">Mammals</a>{% for item in site.data.summary %}{% if item.names == "mammals" %}{{ item.mapdet }} (<i class="fa fa-circle" style="color:orange"></i> basic summaries for {{ item.mapdetonly }}, <i class="fa fa-circle" style="color:green"></i> full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/birds.html">Birds</a>{% for item in site.data.summary %}{% if item.names == "birds" %}{{ item.mapdet }} (<i class="fa fa-circle" style="color:orange"></i> basic summaries for {{ item.mapdetonly }}, <i class="fa fa-circle" style="color:green"></i> full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/mites.html">Soil mites</a>{% for item in site.data.summary %}{% if item.names == "mites" %}{{ item.mapdet }} (<i class="fa fa-circle" style="color:orange"></i> basic summaries for {{ item.mapdetonly }}, <i class="fa fa-circle" style="color:green"></i> full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/vplants.html">Vascular plants</a>{% for item in site.data.summary %}{% if item.names == "vplants" %}{{ item.mapdet }} (<i class="fa fa-circle" style="color:orange"></i> basic summaries for {{ item.mapdetonly }}, <i class="fa fa-circle" style="color:green"></i> full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/mosses.html">Bryophytes</a>{% for item in site.data.summary %}{% if item.names == "mosses" %}{{ item.mapdet }} (<i class="fa fa-circle" style="color:orange"></i> basic summaries for {{ item.mapdetonly }}, <i class="fa fa-circle" style="color:green"></i> full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/lichens.html">Lichens</a>{% for item in site.data.summary %}{% if item.names == "lichens" %}{{ item.mapdet }} (<i class="fa fa-circle" style="color:orange"></i> basic summaries for {{ item.mapdetonly }}, <i class="fa fa-circle" style="color:green"></i> full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}

