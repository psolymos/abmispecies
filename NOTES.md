# notes for myself on how to run development

# clean up repo
cd ~/repos
sudo [ -d abmispecies ] && rm -r abmispecies

# clone repo
git clone http://github.com/psolymos/abmispecies

# check out v2015 branch
cd abmispecies
git branch -f v2015 origin/v2015
git pull
git checkout v2015

# build the site
sudo jekyll build --destination /var/www/html

# zip it
cd /var/www/html
sudo zip abmispecies.zip *
