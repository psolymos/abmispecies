---
layout: default
title: Bioclimatic variables
description: "Bioclimatic variables."
data:
- long: 'Annual heat-moisture index'
  short: AHM
- long: 'Frost free period'
  short: FFP
- long: 'Mean annual precipitation'
  short: MAP
- long: 'Mean annual temperature'
  short: MAT
- long: 'Mean cold month (January) temperature'
  short: MCMT
- long: 'Mean warm month (July) temperature'
  short: MWMT
- long: 'Potential evapotranspiration'
  short: PET
---

The bioclimatic variables were calculated at a 4-km resolution using monthly climate normals of temperature and precipitation averaged over 1961-1990. The monthly climate normals are based on instrument-measured climate data that were interpolated by PRISM (Daly et al., 2002) and WorldClim (Hijmans et al., 2005). The western North American portion of these data are described by Wang et al. (2011). Diana Stralberg (University of Alberta) interpolated climate data.

<div class="row">
  <div class="col-6 col-sm-6 col-lg-6">
  <p><img src="{{ site.contents }}/geospatial/climate/SubRegions.png" class="img-responsive" alt="Natural Subregions in Alberta"/></p>
  </div>
</div>

{% for item in page.data %}

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-{{ item.short }}">{{ item.long }}</button>

<div class="modal fade" id="modal-{{ item.short }}" tabindex="-1" role="dialog" aria-labelledby="modal-{{ item.short }}-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-lichens-label">Climate map: {{ item.long }}</h4>
      </div>
      <div class="modal-body">
        <img src="{{ site.contents }}/geospatial/climate/{{ item.short }}.png" class="img-responsive" alt="Climate map: {{ item.long }}"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="{{ site.ftproot }}/geospatial/climate/climate_grid.zip">Download <i class="fa fa-download"></i></a>
      </div>
    </div>
  </div>
</div>

{% endfor %}


## References

Daly, C., W. P. Gibson, G. H. Taylor, G. L. Johnson, and P. Pasteris. 2002. A knowledge-based approach to the statistical mapping of climate. *Climate Research*, 22, 99-113.

Hijmans, R. J., S. E. Cameron, J. L. Parra, P. G. Jones, and A. Jarvis. 2005. Very high resolution interpolated climate surfaces for global land areas. *International Journal of Climatology*, 25, 1965-1978.

Wang, T., A. Hamann, D. L. Spittlehouse, and T. Q. Murdock. 2011. ClimateWNA - high-resolution spatial climate data for western North America. *Meteorology and Climatology*, 51, 16-29.
