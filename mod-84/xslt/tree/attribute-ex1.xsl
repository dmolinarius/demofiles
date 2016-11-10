<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output
      method="html"
      encoding="utf-8"
      doctype-public="-//W3C//DTD HTML 4.01//EN"
      doctype-system="http://www.w3.org/TR/html4/strict.dtd" />

 <xsl:template match="*">
  <xsl:element name="{translate(name(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')}">
   <xsl:apply-templates select="@*"/>
   <xsl:apply-templates/>
  </xsl:element>
 </xsl:template>

 <xsl:template match="@*">
  <xsl:attribute name="{translate(name(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')}">
   <xsl:value-of select="."/>
  </xsl:attribute>
 </xsl:template>
 
</xsl:stylesheet>
