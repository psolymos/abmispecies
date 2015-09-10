## clear old stuff
rm -f ~/repos/abmispecies/_data/*.yml
rm -f ~/repos/abmispecies/pages/species/mammals/*
rm -f ~/repos/abmispecies/pages/species/vplants/*
rm -f ~/repos/abmispecies/pages/species/mosses/*
rm -f ~/repos/abmispecies/pages/species/lichens/*
#rm -f ~/repos/abmispecies/pages/species/birds/*
rm -f ~/repos/abmispecies/pages/species/mites/*
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

## package everything
cd /var/www/html
zip -r sppweb.zip .
mv sppweb.zip ~/repos/abmispecies/_site/

## return to home folder
#cd ~
