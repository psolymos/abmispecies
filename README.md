# ABMI Species Website: source code development

Alberta Biodiversity Monitoring Institute (ABMI) monitors species and their habitats to understand distribution of biodiversity and to inform sustainable resource development and biological conservation in Alberta.

We provide informaion on spatial distribution, habitat associations, responses to human footprint, and predicted relative abundance distributions for a wide variety of species in Alberta.

We provide maps of native vegetation, maps of human footprint types, temporal change in human footprint in Alberta.

## Versions

* Production server: http://species.abmi.ca/
* Development server: http://sc-dev.abmi.ca/

## Back-end

* figures and small tables are hosted on a Windows Server:
  production server, folder `/contents` as in `site.contents`
* large files are hosted on an ftp server: see `site.ftproot`
* html pages are hosted on production server

## Directory structure

* `/geospatial`
  - `/climate`
  - `/soil`
  - `/topography`
  - `/vegetation`
  - `/footprint`
* `/guilds`
  - TBD
* `/species`
  -`/birds`
  -`/mammals`
  -`/mites`
  -`/vplants`
  -`/mosses`
  -`/lichens`
