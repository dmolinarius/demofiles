<?xml version="1.0" encoding="utf-8"?>
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

 <xsl:output
 	method="html"
 	encoding="utf-8"
 	doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
 	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

 <xsl:include href="import-ex1i.xsl"/>

 <xsl:template match="/">
  <html>
   <head>
    <link rel="stylesheet" href="exemple2.css" type="text/css" />
   </head>
   <body>
    <h2>Import de feuille de style et surcharge de modèles</h2>
    <p>
     La forme finale de ce document est obtenue par surcharge de l'élément racine,
     à partir d'une feuille de style importée.
    </p>
    <h2>Résultat</h2>
     <xsl:apply-templates/>

    <address style="float:left; margin-top: 2.66em">&#169; Daniel Muller</address>
    <div id="date" style="margin-top: 2.66em; text-align: right">20161114</div>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>
