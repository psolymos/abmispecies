#!/bin/sh

## run like:
## sudo bash /home/solymos/repos/abmispecies/_scripts/build.sh

## clear old stuff
echo 'Cleaning up old stuff'
rm -f /home/solymos/repos/abmispecies/_data/*.yml
rm -r -f /home/solymos/repos/abmispecies/pages/species/mammals
rm -r -f /home/solymos/repos/abmispecies/pages/species/vplants
rm -r -f /home/solymos/repos/abmispecies/pages/species/mosses
rm -r -f /home/solymos/repos/abmispecies/pages/species/lichens
rm -r -f /home/solymos/repos/abmispecies/pages/species/birds
rm -r -f /home/solymos/repos/abmispecies/pages/species/mites
#rm -r -f /home/solymos/repos/abmispecies/pages/testspecies/birds

## status update
cd /home/solymos/repos/abmispecies
echo 'Updating git repo'
#git checkout --track -b origin/v2015
#git checkout v2015
#git checkout v2016
git checkout master
git pull

## run R script
echo 'Running R script'
cd /home/solymos/repos/abmispecies/_scripts
Rscript --vanilla website_script.R
#Rscript --vanilla test.R

## run Jekyll
echo 'Running jekyll'
cd /home/solymos/repos/abmispecies/
rm -r -f /var/www/html/development
mkdir /var/www/html/development
jekyll build --destination /var/www/html/development

## package everything
echo 'Packing up site content'
cd /var/www/html/development
zip -r -q sppweb.zip .
mv sppweb.zip /home/solymos/repos/abmispecies/_site/

## return to home folder
#cd /home/solymos

## redirect
echo 'Redirect overwrite'
cp /home/solymos/repos/abmispecies/_scripts/index.html /var/www/html/index.html
cp /home/solymos/repos/abmispecies/_scripts/robots.txt /var/www/html/robots.txt

echo 'Done'
