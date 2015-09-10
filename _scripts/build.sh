## clear old stuff
echo 'Cleaning up old stuff'
rm -f ~/repos/abmispecies/_data/*.yml
rm -r -f ~/repos/abmispecies/pages/species/mammals
rm -r -f ~/repos/abmispecies/pages/species/vplants
rm -r -f ~/repos/abmispecies/pages/species/mosses
rm -r -f ~/repos/abmispecies/pages/species/lichens
#rm -r -f ~/repos/abmispecies/pages/species/birds
rm -r -f ~/repos/abmispecies/pages/species/mites

## status update
cd ~/repos/abmispecies
echo 'Updateing git repo'
git pull
#git checkout --track -b origin/v2015
git checkout v2015

## run R script
echo 'Running R script'
cd ~/repos/abmispecies/_scripts
Rscript --vanilla website_script.R

## run Jekyll
echo 'Running jekyll'
cd ~/repos/abmispecies/
jekyll build --destination /var/www/html

## package everything
echo 'Packing up site content'
cd /var/www/html
zip -r -q sppweb.zip .
mv sppweb.zip ~/repos/abmispecies/_site/

## return to home folder
#cd ~
echo 'Done'
