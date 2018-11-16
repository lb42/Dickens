This repository contains transcriptions of early editions of Dickens novels which were 
originally prepared as part of the "Documenting the American South" project at the University of North Caroline at Chapel Hill.
I downloaded the XML files in November 2018, and converted them from TEI P4 to TEI P5. 

The scripts I used:
 - `grabDickens` : shell script to download the files
 - `p5ify` : shell script to do the conversion
 - `Makefile` : make driver creates a driver file to permit processing all the files at once
    
The changes I made:
 - I edited the doctype statement of each file so that it referenced a local copy of the P4 teixlite.dtd used for the originals; I needed this
 to expand the named character entities in the files
 - The stylesheet `p4top5.xsl` is mostly self-explanatory: it removes default attributes, changes @id to @xml:id, turns all numbered divs to unnumbered divs, wraps corr elements in a choice, and tries to sort out changes to the teiHeader
 
 After processing all the files, I first validated them against the P5 TEI_all schema. This showed up a small number of residual problems which I fixed by hand. Check the history of the individual files to see what needed to be fixed.
 
