#!/bin/sh
# for each RFC XML file, generates HTML file and TXT file
# usage: ./gen.sh

rfcpath=/var/www/stage.xmpp.org/rfcs
xml2html=/usr/local/share/xml2rfc/xml2html
xml2txt=/usr/local/share/xml2rfc/xml2txt

ls rfc*.xml > tmp.txt
sed s/rfc\(.*\).xml/rfc\1/ tmp.txt > names.txt
rm tmp.txt

while read f
do
    $xml2html $f.xml > $rfcpath/$f.html
    $xml2txt $f.xml > $rfcpath/$f.txt
done < names.txt

rm names.txt

cp reference*.xml $rfcpath/

# END

