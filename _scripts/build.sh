
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


cd ~/repos/abmispecies
git pull
#git checkout --track -b origin/v2015
git checkout v2015
cd ~/repos/abmispecies/_scripts
Rscript --vanilla website_script.R


unzip abmispecies.zip -d /home/peter/www/species.abmi.ca
cd /home/peter/www/species.abmi.ca
rm _site/site.tar.gz
jekyll build
tar -zcf /home/peter/Dropbox/www/sitebuild.tar.gz -C /home/peter/www/species.abmi.ca/_site .

rm ~/bam/*
module load application/git/1.7.10.1
cd ~/repos/bamanalytics/
git pull
cd ~/repos/bragging/
git pull
cd ~/bam/
cp ~/repos/bamanalytics/wg/* ~/bam/
