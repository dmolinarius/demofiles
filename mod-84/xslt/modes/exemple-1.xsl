<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
 <xsl:output method="html" encoding="utf-8"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

 <!-- traitement de l'élément racine -->
 <xsl:template match="page">
  <html>
   <head>
    <style type="text/css">
body { font-family: sans-serif; }
h1,h2 { margin-bottom: 0; border-bottom: 1px solid #888; font-family: serif;}
h3 { margin-bottom: 0; }
    </style>
   </head>
   <body>
    <h1><xsl:value-of select="titre"/></h1>
    <div><em><xsl:value-of select="sous-titre"/></em></div>
    <xsl:apply-templates select="bloc"/>
    <xsl:apply-templates select="paragraphe"/>
   </body>
  </html>
 </xsl:template>

 <!-- traitement des éléments paragraphe -->
 <xsl:template match="paragraphe">
  <h2><xsl:value-of select="@titre"/></h2>
  <xsl:apply-templates/>
 </xsl:template>

 <!-- traitement des éléments bloc -->
 <xsl:template match="bloc">
  <h3><xsl:value-of select="@titre"/></h3>
  <p><xsl:apply-templates/></p>
 </xsl:template>

</xsl:stylesheet>
