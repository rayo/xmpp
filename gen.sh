#!/bin/sh
# copies permanent files for the xmpp.org website
#
# NOTEL: after this you still need to run the gen.sh 
# scripts from the following directories:
#
# extensions/
# internet-drafts/
# registrar/
# rfcs/
# 

basepath=/var/www/stage.xmpp.org

cp about/*.* $basepath/about/
cp council/*.* $basepath/council/
cp council/agendas/*.* $basepath/council/agendas/
cp council/members/*.* $basepath/council/members/
cp images/*.* $basepath/images/
cp includes/*.* $basepath/includes/
cp index.shtml $basepath/
cp schemas/*.* $basepath/schemas/
cp sorttable.js $basepath/
cp xmpp.css $basepath/

# END
