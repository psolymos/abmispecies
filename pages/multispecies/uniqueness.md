---
layout: default
title: Uniqueness
description: "Uniqueness"
data:
- long: 'All species'
  short: all
- long: 'Land cover types'
  short: habitats
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

The uniqueness of species composition in space is a relative measure and values estimated for specific sites are partly dependent on the scale of study. For example, a given area might be regarded less unique in a relatively homogeneous subset area where it is found but that particular subset area could have high uniqueness compared to a larger scale of study. 

<div class="list-group">
{% for item in page.data %}
<a href="{{ site.contents }}/multispecies/uniqueness/{{ item.short }}" class="list-group-item">
<h4 class="list-group-item-heading">{{ item.long }}</h4>
</a>
{% endfor %}
</div>

