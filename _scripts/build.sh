## clear old stuff
rm ~/repos/abmispecies/_data/*.yml -f
rm ~/repos/abmispecies/pages/species/mammals/* -f
rm ~/repos/abmispecies/pages/species/vplants/* -f
rm ~/repos/abmispecies/pages/species/mosses/* -f
rm ~/repos/abmispecies/pages/species/lichens/* -f
#rm ~/repos/abmispecies/pages/species/birds/* -f
rm ~/repos/abmispecies/pages/species/mites/* -f
rmdir ~/repos/abmispecies/pages/species/mammals
rmdir ~/repos/abmispecies/pages/species/vplants
rmdir ~/repos/abmispecies/pages/species/mosses
rmdir ~/repos/abmispecies/pages/species/lichens
#rmdir ~/repos/abmispecies/pages/species/birds
rmdir ~/repos/abmispecies/pages/species/mites

## status update
cd ~/repos/abmispecies
git pull
#git checkout --track -b origin/v2015
git checkout v2015

## run R script
cd ~/repos/abmispecies/_scripts
Rscript --vanilla website_script.R

## run Jekyll
cd ~/repos/abmispecies/
jekyll build --destination /var/www/html

