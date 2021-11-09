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
.sommaire { background-color: #ddd; display: inline-block; padding: 1em; border: 1px solid #888; line-height: 1.5em;}
.blocs { margin-left: 2em; }
    </style>
   </head>
   <body>
    <h1><xsl:value-of select="titre"/></h1>
    <div><em><xsl:value-of select="sous-titre"/></em></div>
    <xsl:apply-templates select="bloc"/>
    <div class="sommaire">
     <xsl:apply-templates mode="sommaire" select="paragraphe"/>
    </div>
    <xsl:apply-templates select="paragraphe"/>
   </body>
  </html>
 </xsl:template>


 <!-- traitement des éléments paragraphe en mode normal -->
 <xsl:template match="paragraphe">
  <h2>
   <xsl:number/>&#160;
   <xsl:value-of select="@titre"/>
  </h2>
  <xsl:apply-templates/>
 </xsl:template>

 <!-- traitement des éléments bloc en mode normal -->
 <xsl:template match="bloc">
  <xsl:choose>
   <xsl:when test="@titre">
    <h3><xsl:value-of select="@titre"/></h3>
    <p style="margin-top:0; margin-left: 1.5em;"><xsl:apply-templates/></p>
   </xsl:when>
   <xsl:otherwise>
    <p><xsl:apply-templates/></p>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <!-- traitement des éléments paragraphe en mode sommaire -->
 <xsl:template match="paragraphe" mode="sommaire">
  <div>
   <xsl:number/>&#160;
   <xsl:value-of select="@titre"/>
  </div>
  <div class="blocs">
   <xsl:apply-templates mode="sommaire" select="bloc"/>
  </div>
 </xsl:template>

 <!-- traitement des éléments bloc en mode sommaire -->
 <xsl:template match="bloc" mode="sommaire">
  <xsl:if test="@titre">
   <div><xsl:value-of select="@titre"/></div>
  </xsl:if>
 </xsl:template>

</xsl:stylesheet>
