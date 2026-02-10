#!/bin/bash

BASEPATH="dtm"
DOCROOT="dtm"
DOCROOTR=""
DESDIR=""

if [ "$DOCROOT" == "" ]; then
    DESTDIR="staging"
else
    DESTDIR="staging/${DOCROOT}"
fi

if [ "$BASEPATH" == "" ]; then
    DOCROOTR="\/"
else
    DOCROOTR="\/${DOCROOT}\/"
fi

rm -rf ./staging
mkdir -p ${DESTDIR}
cp ./base/* ${DESTDIR}/.

for dir in $(find ./content -type d)
do
    if [ -f "${dir}/index.html" ]; then

        # if this is an upate directory, create the open graph details and
        # update the main index.html
            
        IFS="/" read -r -a parts <<< "${dir}"
        adate="${parts[3]}-${parts[4]}-${parts[5]}"
        wdate=`date -d "${adate}" +"%B %-d, %Y"`
        atitle="${parts[-1]}"
        #apath="up/${parts[3]}/${parts[4]}/${parts[5]}/${parts[6]}/index.html"

        # create the target staging directory and copy all 
        # content to it. 
        newdir="${dir/\.\/content\/}"
        mkdir -p "${DESTDIR}/${newdir}"
        cp -a "${dir}/." "${DESTDIR}/${newdir}"
        rm "${DESTDIR}/${newdir}/index.html"

        # build the index file
        cat include/header1.html | sed "s/__DOCROOT__/${DOCROOTR}/g"  > "${DESTDIR}/${newdir}/index.html"
        echo "<title>${atitle//-/ }</title>" >> "${DESTDIR}/${newdir}/index.html"
        cat include/header2.html | sed "s/__DOCROOT__/${DOCROOTR}/g" >> "${DESTDIR}/${newdir}/index.html"
        echo "<div class=\"heading\"><h1>${atitle//-/ }</h1>" >> "${DESTDIR}/${newdir}/index.html"
        echo "<small>${wdate}</small></div>" >> "${DESTDIR}/${newdir}/index.html"
        cat "${dir}/index.html" >> "${DESTDIR}/${newdir}/index.html"
        cat include/footer.html >> "${DESTDIR}/${newdir}/index.html"

    fi
done

rm ${DESTDIR}/index.html
cat include/header1.html | sed "s/__DOCROOT__/${DOCROOTR}/g" > ${DESTDIR}/index.html
cat include/header2.html | sed "s/__DOCROOT__/${DOCROOTR}/g" >> ${DESTDIR}/index.html
cat base/index.html >> ${DESTDIR}/index.html
cat include/footer.html >> ${DESTDIR}/index.html

rm ${DESTDIR}/everything.html
cat include/header1.html |  sed "s/__DOCROOT__/${DOCROOTR}/g" > ${DESTDIR}/everything.html
cat include/header2.html |  sed "s/__DOCROOT__/${DOCROOTR}/g" >> ${DESTDIR}/everything.html
cat base/everything.html >> ${DESTDIR}/everything.html
cat include/footer.html >> ${DESTDIR}/everything.html

cd ./staging
tar czvf site.tar.gz ./${DOCROOT}
rm -rf ./${DOCROOT}
cd ..
