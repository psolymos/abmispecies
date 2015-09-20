# ABMI Species Website: source code development

Alberta Biodiversity Monitoring Institute (ABMI) monitors species and their habitats to understand distribution of biodiversity and to inform sustainable resource development and biological conservation in Alberta.

We provide informaion on spatial distribution, habitat associations, responses to human footprint, and predicted relative abundance distributions for a wide variety of species in Alberta.

We provide maps of native vegetation, maps of human footprint types, temporal change in human footprint in Alberta.

## Versions

* Production server: http://species.abmi.ca/
* Development server: http://sc-dev.abmi.ca/

<<<<<<< HEAD
## Structure

* `/pages/` directory holds html content under version control
  but without images and associated files.
* Images corresponding to `pages` are stored in the `/contents/`
  directory that is ignored by git. Under development,
  `contents` is suppsed to change rather infrequently, as opposed to `pages`.
* Big files are stored at an ftp server, as noted in the config file.
=======
## Todo list

- [ ] Include FontAwesome ?
- [ ] remove 'Home' from top navbar
- [ ] Search to pull right
>>>>>>> master
