ECHO=
LOCAL=/home/lou/Public/CA16204/Samples/EN
REPO=Dickens
SCHEMA1=$(LOCAL)/WG1/distantreading.github.io/Schema/eltec-1.rng
CORPUS=$(LOCAL)/$(REPO)
REPORTER=$(LOCAL)/Scripts/reporter.xsl
CURRENT=`pwd`

validate:
	cd $(CORPUS1); for f in $(PREFIX)*.* ; do \
		echo $$f; \
		jing  $(SCHEMA1) \
		$$f ; done; cd $(CURRENT);
	cd $(CORPUS0); for f in $(PREFIX)*.* ; do \
		echo $$f; \
		jing  $(SCHEMA0) \
		$$f ; done; cd $(CURRENT);

driver:
	echo rebuild driver file
	echo '<teiCorpus xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"><teiHeader><fileDesc> <titleStmt> <title>TEI Corpus testharness</title></titleStmt> <publicationStmt><p>Unpublished test file</p></publicationStmt><sourceDesc><p>No source driver file</p> </sourceDesc> </fileDesc> </teiHeader>' >  $(CORPUS)/driver.tei;\
		for f in $(CORPUS)/4*.* ; do \
		echo "<xi:include href='$$f'/>" >> $(CORPUS)/driver.tei; \
	done;
	for f in $(CORPUS0)/$(PREFIX)*.* ; do \
		echo "<xi:include href='$$f'/>" >> $(CORPUS)/driver.tei; \
	done; echo "</teiCorpus>" >> $(CORPUS)/driver.tei

report:
	echo report on corpus balance
	saxon -xi $(CORPUS)/driver.tei $(REPORTER) >balance_report.html
