---
layout: default
title: 'ABMI soil layer'
description: "Soil: ABMI Soil Layer."
data:
- short: Productive
  long: 'Productive'
- short: RapidDrain
  long: 'Rapid drain'
- short: Saline
  long: 'Saline'
- short: Clay
  long: 'Clay'
---

The Agricultural Region of Alberta Soil Inventory Database (AGRASID) was 
created by a collaboration involving the Alberta Research Council, 
Alberta Agriculture Food and Rural Development, Agriculture and Agri-Food 
Canada - Land Resource Unit, and private sector consulting firms. 
AGRASID consists of seamless GIS coverages and relational data files that 
describes the soil landscapes for the agricultural area of Alberta. 
The AGRASID soil landscape polygons and attribute data were compiled at 
a scale of 1:100,000 and can be accessed [here](http://www1.agric.gov.ab.ca/$Department/deptdocs.nsf/All/sag14653).

To enhance AGRASID for some counties in southern Alberta, the Government of 
Alberta created  a soil polygon layer that has less detail, but higher spatial 
resolution (scale 1:50,000 for GOA higher resolution layer (unpublished information) 
versus 1:100,000 for AGRASID). The higher resolution information was interpreted 
based from remote sensed images with little or no ground truthing. 

ABMI created a simplified GIS polygon layer to describe general soil characteristics 
throughout the Grassland, Parkland and Dry Mixedwood regions of Alberta. 
Based on soil name and soil correlation area from AGRASID, ABMI classified 
polygons to the 24 natural soil types used by GVI (see table in [this document]({{ site.contents }}/geospatial/soil/native-soil-classes.docx)). The crosswalks used to convert 
AGRASID information to GVI soil type are described in Excel tables ([Grassland]({{ site.contents }}/geospatial/soil/AGRASID30_SLM-andGVI-conv-ALL-Parkland-CP-FP-PR-final-Jan-2012.xls), [Parkland]({{ site.contents }}/geospatial/soil/AGRASID-to-GVI-conversion-for-missing-Grassland-codes-January-2012.xlsx), [Dry Mixedwood]({{ site.contents }}/geospatial/soil/AGRASID-Dry-Mixedwood-SLMs-converted-to-ERS-series-groups-October-2013.xlsx) ). For the counties with higher resolution information, that information rather 
than ARGASID information, was used to create the ABMI soil layer. 

Only natural soil types were included In the ABMI's soil layer. For polygons 
where natural soil type was missing, ABMI used historical information where 
possible ([McNeil 2014]({{ site.contents }}/geospatial/soil/LandWise-Undiffer-Poly-Conv-for-ABMI-January-2014.docx)). 
When historical information was not available ABMI used topography soil 
information from the surrounding area to assign natural soil types.

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/geospatial/soil/abmiSoil200dpi.png" class="img-responsive" alt="Soil types"/></p>
  </div>

  <div class="col-6 col-sm-6 col-lg-6">
Summarized soil information used in modeling: 
percent cover by soil types within 1 km<sup>2</sup> grid cells:

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Soil map: {{ item.long }} (% cover)</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/soil/{{ item.short }}.png" class="img-responsive" alt="Soil map: {{ item.long }} (% cover)"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

{% endfor %}

  </div>
</div>
