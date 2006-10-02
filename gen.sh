#!/bin/sh
# rebuilds the entire xmpp.org website

basepath=/var/www/stage.xmpp.org

cp about/* $basepath/about/
cp council/* $basepath/council/
cp council/agendas/* $basepath/council/agendas/
./extensions/all.sh
cp images/* $basepath/images/
cp includes/* $basepath/includes/
cp index.shtml $basepath/
./internet-drafts/gen.sh
./registrar/gen.sh
./rfcs/gen.sh
cp schemas/* $basepath/schemas/
cp sorttable.js $basepath/
cp xmpp.css $basepath/

# END
