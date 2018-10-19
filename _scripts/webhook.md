
## this should make build script executable

cd /home/solymos/repos/abmispecies/_scripts
sudo cp build.sh /usr/local/bin/redeploy.sh
sudo chmod u+x redeploy.sh

## now we can run webhook

/home/solymos/go/bin/webhook -hooks /home/solymos/repos/abmispecies/_scripts/hooks.json -verbose -ip 142.244.198.153
