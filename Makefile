rayo:
	xsltproc --path extensions -o extensions/rayo.html xep.xsl xep-0327.xml
	xsltproc --path extensions -o extensions/rayo-cpa.html xep.xsl xep-0341.xml
	xsltproc --path extensions -o extensions/rayo-fax.html xep.xsl xep-0342.xml
	xsltproc --path extensions -o extensions/rayo-clustering.html xep.xsl extensions/inbox/rayo-clustering.xml
