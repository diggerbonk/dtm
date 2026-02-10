DOCROOT=dtm

#ssh trent@utils.boise.tvi910.com "sudo rm -rf /tmp/staging"
#ssh trent@utils.boise.tvi910.com "sudo mkdir /tmp/ging"
#scp -r ./staging trent@utils.boise.tvi910.com:/tmp/.
scp staging/site.tar.gz trent@utils.boise.tvi910.com:/tmp/.
ssh trent@utils.boise.tvi910.com "sudo rm -rf /var/www/html/${DOCROOT}"
ssh trent@utils.boise.tvi910.com "sudo tar xzvf /tmp/site.tar.gz -C /var/www/html/."
#ssh trent@utils.boise.tvi910.com "sudo cp -a /tmp/staging/. /var/www/html/dtm/."
