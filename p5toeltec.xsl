<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h t xi"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
   
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="ENG18530" xml:lang="en">
           <xsl:copy-of select="t:teiCorpus/t:teiHeader"/>
    
     <text> <body> <xsl:for-each select="//t:TEI">
           <div type="part">
               <xsl:apply-templates select="t:text/t:body//t:div[@type='chapter']"/>
           </div>     
       </xsl:for-each> </body></text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="@rend|@part"/>
    <xsl:template match="t:lb"/>
    <xsl:template match="t:choice">
    <corr>
        <xsl:value-of select="t:corr"/>
    </corr>
    </xsl:template>
    
    <xsl:template match="t:dateline|t:signed|t:salute">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="t:opener|t:closer|t:lg|t:div[@type='letter']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:floatingText">
        <xsl:apply-templates select="t:body/t:div"/>
    </xsl:template>
    
    <xsl:template match="t:q">
        <quote><xsl:apply-templates/></quote>
    </xsl:template>
    
   
    
    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- could normalize() here -->
    </xsl:template>
</xsl:stylesheet>