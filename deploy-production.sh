README.md  everything.html  footer.html   header2.html  mastodon-orange-logo.svg  travel
deploy.sh  favicon.png      header1.html  index.html    style.css                 updates


sudo rm -rf /var/www/html/dtm
sudo mkdir /var/www/html/dtm
sudo cp everything.html \
    header1.html \
    header2.html \
    footer.html \
    index.html \
    style.css \
    mastodon-orange-logo.svg \
    /var/www/html/dtm/.
sudo cp -a travel /var/www/html/dtm/.
sudo cp -a updates /var/www/html/dtm/.


