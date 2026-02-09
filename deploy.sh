ssh trent@utils.boise.tvi910.com "sudo rm -rf /tmp/dtm"
scp -r ../dtm trent@utils.boise.tvi910.com:/tmp/.
ssh trent@utils.boise.tvi910.com "sudo rm -rf /var/www/html/dtm"
ssh trent@utils.boise.tvi910.com "sudo cp -a /tmp/dtm /var/www/html/."
