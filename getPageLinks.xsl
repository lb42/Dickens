<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:h="http://www.w3.org/1999/xhtml"
 exclude-result-prefixes="xs h"
  version="2.0">
 
 <!-- run this on the HTML version of a text to extract a list of pagebreak links -->
 
 <xsl:template match="/">
  <xsl:for-each select="//h:a[@href[starts-with(.,'../')]]">
 <ref>
  <xsl:attribute name="facs">
   <xsl:value-of select="concat('img:', substring-after(@href,'jpegs/'))"/>
  </xsl:attribute>
  <xsl:attribute name="n">
   <xsl:value-of select="substring-after(following::h:a[@name[starts-with(.,'#')]][1]/@name,'#')"/>
  </xsl:attribute>
  <xsl:value-of select="normalize-space(.)"/>
 </ref>
   <xsl:text>
</xsl:text>
 </xsl:for-each>
  
  
 </xsl:template>
 </xsl:stylesheet>