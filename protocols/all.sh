#!/bin/sh
# for each manifest, generate an HTML file
# usage: ./all.sh

protopath=/var/www/xmpp.org/protocols

ls */manifest.xml > tmp.txt
sed s/\/manifest.xml// tmp.txt > protos.txt
rm tmp.txt

while read f
do
    xsltproc proto.xsl $f/manifest.xml > $protopath/$f/index.html
done < protos.txt

rm nums.txt

# END
