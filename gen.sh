#!/bin/bash

rm -rf ./staging

for dir in $(find ./content -type d)
do
    if [ -f "${dir}/index.html" ]; then
        mkdir -p "./staging/${dir}"
        cp header1.html "./staging/${dir}/index.html"
        cat header2.html >> "./staging/${dir}/index.html"
        cat "${dir}/index.html" >> "./staging/${dir}/index.html"
        cat footer.html >> "./staging/${dir}/index.html"
        echo "$dir"
    fi
done
