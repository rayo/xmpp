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

# STAGE
#basepath=/var/www/stage.xmpp.org
# PRODUCTION
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
cp xsf/*.* $basepath/xsf/
cp xsf/board/*.* $basepath/xsf/board/
cp xsf/board/meetings/*.* $basepath/xsf/board/meetings/
cp xsf/docs/*.* $basepath/xsf/docs/
cp xsf/members/*.* $basepath/xsf/members/
cp xsf/members/meetings/*.* $basepath/xsf/members/meetings/
cp xsf/people/*.* $basepath/xsf/people/
cp xsf/press/*.* $basepath/xsf/press/
cp xsf/proposals/*.* $basepath/xsf/proposals/
cp xsf/sponsors/*.* $basepath/xsf/sponsors/

# END
