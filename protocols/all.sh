#!/bin/sh
# for each manifest, generate an HTML file
# usage: ./all.sh

protopath=/var/www/xmpp.org/protocols

ls -d * > protocols.txt

while read f
do
    xsltproc proto.xsl $f/manifest.xml > $protopath/$f/index.html
done < protocols.txt

rm protocols.txt

cp index.shtml $protopath/

# END
