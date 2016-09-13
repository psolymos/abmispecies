## clear old stuff
echo 'Cleaning up old stuff'
rm -f ~/repos/abmispecies/_data/*.yml
rm -r -f ~/repos/abmispecies/pages/species/mammals
rm -r -f ~/repos/abmispecies/pages/species/vplants
rm -r -f ~/repos/abmispecies/pages/species/mosses
rm -r -f ~/repos/abmispecies/pages/species/lichens
rm -r -f ~/repos/abmispecies/pages/species/birds
rm -r -f ~/repos/abmispecies/pages/species/mites
#rm -r -f ~/repos/abmispecies/pages/testspecies/birds

## status update
cd ~/repos/abmispecies
echo 'Updating git repo'
#git checkout --track -b origin/v2015
#git checkout v2015
git checkout v2016
git pull

## run R script
echo 'Running R script'
cd ~/repos/abmispecies/_scripts
Rscript --vanilla website_script.R
#Rscript --vanilla test.R

## run Jekyll
echo 'Running jekyll'
cd ~/repos/abmispecies/
rm -r -f /var/www/html/development
mkdir /var/www/html/development
jekyll build --destination /var/www/html/development

## package everything
echo 'Packing up site content'
cd /var/www/html/development
zip -r -q sppweb.zip .
mv sppweb.zip ~/repos/abmispecies/_site/

## return to home folder
#cd ~

## redirect
echo 'Redirect overwrite'
cp ~/repos/abmispecies/_scripts/index.html /var/www/html/index.html

echo 'Done'
