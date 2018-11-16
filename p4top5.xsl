<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs t"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    
    <xsl:template match="@TEIform | @targOrder | @default | @direct | @rows | @cols | @role"/>
  
    <xsl:template match="TEI.2">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </TEI>
    </xsl:template>
    <xsl:template match="teiHeader">
        <teiHeader>
            <xsl:apply-templates/>
        </teiHeader>
    </xsl:template>
    <xsl:template match="pb/@n"/>
    <xsl:template match="language/@id">
        <xsl:attribute name="ident" select="."/>
    </xsl:template>
    <xsl:template match="@id">
        <xsl:attribute name="xml:id" select="."/>
    </xsl:template>
    <xsl:template match="@lang">
        <xsl:attribute name="xml:lang" select="."/>
    </xsl:template>
    <xsl:template match="@target">
        <xsl:attribute name="target" select="concat('#',.)"/>
    </xsl:template>
    <xsl:template match="note">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
    <xsl:template match="publicationStmt/publisher">
      <publisher>  <xsl:value-of select="preceding-sibling::pubPlace"/>
        <xsl:value-of select="."/></publisher>
    </xsl:template>
    
    <xsl:template match="publicationStmt/pubPlace"/>
        
    <xsl:template match="change">
        <change>
            <xsl:attribute name="when">
                <xsl:value-of select="substring-before(date, ',')"/>
            </xsl:attribute>
            <xsl:value-of select="respStmt"/>
            <xsl:value-of select="item"/>
        </change>
    </xsl:template>
    <xsl:template match="div1 | div2 | div3 | div4">
        <div>
            <xsl:if test="@type">
                <xsl:attribute name="type">
                    <xsl:apply-templates select="@type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="@type[contains(., ' ')]">
        <xsl:value-of select="replace(., ' ', '_')"/>
    </xsl:template>
    <xsl:template match="sic">
        <choice>
            <sic>
                <xsl:value-of select="."/>
            </sic>
            <corr>
                <xsl:value-of select="@corr"/>
            </corr>
        </choice>
    </xsl:template>
    <xsl:template match="q[text]">
        <quote>
            <floatingText>
                <xsl:apply-templates select="text/*"/>
            </floatingText>
        </quote>
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
