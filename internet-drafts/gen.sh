#!/bin/sh
# for each Internet-Draft XML file, generates HTML file and TXT file
# usage: ./gen.sh

idpath=/var/www/stage.xmpp.org/rfcs
xml2html=/usr/local/share/xml2rfc/xml2html
xml2txt=/usr/local/share/xml2rfc/xml2txt

ls draft-*.xml > tmp.txt
sed s/draft\(.*\).xml/draft-\1/ tmp.txt > names.txt
rm tmp.txt

while read f
do
    $xml2html $f.xml > $idpath/f.html
    $xml2txt $f.xml > $idpath/$f.txt
done < names.txt

rm names.txt

# END

