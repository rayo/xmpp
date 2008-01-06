#!/bin/sh
# for each manifest, generate an HTML file
# usage: ./all.sh

path=/var/www/xmpp.org/protocols

ls -d * > protocols.txt

while read f
do
    xsltproc proto.xsl $f/manifest.xml > $path/$f/index.html
done < protocols.txt

rm protocols.txt

cp index.shtml $protopath/

# END
