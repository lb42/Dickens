ECHO=
LOCAL=/home/lou/Public
REPO=Dickens/P5
PREFIX=4
SCHEMA=$(LOCAL)/TEI/P5/Exemplars/tei_all.rng
CURRENT=`pwd`
CORPUS=$(LOCAL)/$(REPO)

validate:
	cd $(CORPUS); for f in $(PREFIX)*.xml ; do \
		echo $$f; \
		jing  $(SCHEMA1) \
		$$f ; done; cd $(CURRENT);
driver:
	echo rebuild driver file
	echo '<teiCorpus xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"><teiHeader><fileDesc> <titleStmt> <title>TEI Corpus testharness</title></titleStmt> <publicationStmt><p>Unpublished test file</p></publicationStmt><sourceDesc><p>No source driver file</p> </sourceDesc> </fileDesc> </teiHeader>' >  $(CORPUS)/driver.tei;\
		for f in $(CORPUS)/$(PREFIX)*.xml ; do \
		echo "<xi:include href='$$f'/>" >> $(CORPUS)/driver.tei; \
	done; echo "</teiCorpus>" >>$(CORPUS)/driver.tei
