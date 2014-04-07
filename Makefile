rayo:
	xsltproc --path extensions -o rayo.html xep.xsl xep-0327.xml
	xsltproc --path extensions -o rayo-cpa.html xep.xsl xep-0341.xml
	xsltproc --path extensions -o rayo-fax.html xep.xsl xep-0342.xml
	xsltproc --path extensions -o rayo-clustering.html xep.xsl extensions/inbox/rayo-clustering.xml
