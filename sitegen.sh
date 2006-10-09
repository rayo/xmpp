#!/bin/sh
# copies permanent files for the xmpp.org website
# usage: ./sitegen.sh
#
# NOTE: after running this script, you still need to 
# run the all.sh scripts from the following directories:
#
# extensions/
# internet-drafts/
# registrar/
# rfcs/
# 

basepath=/var/www/xmpp.org

cp about/*.* $basepath/about/
cp council/*.* $basepath/council/
cp council/agendas/*.* $basepath/council/agendas/
cp council/members/*.* $basepath/council/members/
cp extensions/*.shtml $basepath/extensions/
cp extensions/inbox/*.html $basepath/extensions/inbox/
cp images/*.* $basepath/images/
cp includes/*.* $basepath/includes/
cp index.shtml $basepath/
cp schemas/*.* $basepath/schemas/
cp sorttable.js $basepath/
cp xmpp.css $basepath/

# END
