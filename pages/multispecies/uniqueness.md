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

The relative uniqueness index shows the degree to which species composition in each pixel is distinct compared to all other pixels within the Natural Region.  The uniqueness analysis was conducted separately for each Natural Region because the regional species pool, and their predicted relative abundances, differ between these. Relative abundance of each species in each pixel was predicted using habitat association models that relate species abundance to native habitat types. The uniqueness index was calculated based on species co-occurrence
(see [methods]({{ site.ftproot }}/habitat/uniqueness/Description_of_the_Uniqueness_Methods_for_the_website_Final.docx)).

Uniqueness of species composition in space is a relative measure and values estimated for specific sites are partly dependent on the scale of study. For example, a given area might be regarded less unique in a relatively homogeneous subset area where it is found but that particular subset area could have high uniqueness compared to a larger scale of study.

<div class="row">
<div class="col-6 col-sm-6 col-lg-6">
<div class="list-group">
{% for item in page.data %}
<a href="{{ site.baseurl }}/pages/multispecies/uniqueness/{{ item.short }}.html" class="list-group-item">
<h4 class="list-group-item-heading">{{ item.long }}</h4>
</a>
{% endfor %}
</div>
</div>
</div>
