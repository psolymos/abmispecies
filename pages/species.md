---
layout: default
title: "Species"
---

We provide informaion on spatial distribution, habitat associations, responses to human footprint, and predicted relative abundance distributions for {% for item in site.data.summary %}{% if item.names == "all" %}{{ item.mapdet }}{% endif %}{% endfor %} species in Alberta.

* <a href="{{ site.baseurl }}/pages/species/mammals.html">Mammals</a>{% for item in site.data.summary %}{% if item.names == "mammals" %} (basic summaries for {{ item.mapdetonly }}, full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/birds.html">Birds</a>{% for item in site.data.summary %}{% if item.names == "birds" %} (basic summaries for {{ item.mapdetonly }}, full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/mites.html">Soil mites</a>{% for item in site.data.summary %}{% if item.names == "mites" %} (basic summaries for {{ item.mapdetonly }}, full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/vplants.html">Vascular plants</a>{% for item in site.data.summary %}{% if item.names == "vplants" %} (basic summaries for {{ item.mapdetonly }}, full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/mosses.html">Mosses (Bryophytes)</a>{% for item in site.data.summary %}{% if item.names == "mosses" %} (basic summaries for {{ item.mapdetonly }}, full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
* <a href="{{ site.baseurl }}/pages/species/lichens.html">Lichens</a>{% for item in site.data.summary %}{% if item.names == "lichens" %} (basic summaries for {{ item.mapdetonly }}, full model summaries for {{ item.mappred }} species){% endif %}{% endfor %}
