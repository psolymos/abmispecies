cd abmispecies
git pull
git checkout --track -b origin/v2015
cd _scripts
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
