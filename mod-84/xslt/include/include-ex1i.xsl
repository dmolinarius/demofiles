<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

 <xsl:template match="/">
  <html>
   <head>
    <link rel="stylesheet" href="exemple.css" type="text/css" />
   </head>
   <body>
    <h2>Feuilles de style multiples</h2>
    <p>
     Le contenu du document ci-dessous est obtenu à l'aide d'une feuille de style constituée à partir
     de plusieurs documents.<br/>
    </p>
    <h2>Résultat</h2>
     <xsl:apply-templates/>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="classe">
  <table border="2" style="width:50%" align="center">
   <tr>
    <th>Prénom</th>
    <th>Nom</th>
   </tr>
   <xsl:apply-templates/>
  </table>
 </xsl:template>

</xsl:stylesheet>
