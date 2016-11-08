<?xml version="1.0" encoding="utf-8"?>
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

 <xsl:output
 	method="html"
 	encoding="utf-8"
 	doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
 	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

 <xsl:template match="/classe">
  <html>
   <head>
    <link rel="stylesheet" href="exemple.css" type="text/css" />
   </head>
   <body>
    <h2>Modèle procédural</h2>
    <p>
     Le contenu de la table ci-dessous est obtenu à l'aide d'un modèle procédural unique.<br/>
    </p>
    <h2>Résultat</h2>
    <table border="2" style="width:50%" align="center">
     <tr>
      <th>Prénom</th>
      <th>Nom</th>
     </tr>
     <xsl:for-each select="//étudiant">
      <tr>
       <td><xsl:apply-templates select="prénom"/></td> 
       <td><xsl:apply-templates select="nom"/></td>
      </tr>
     </xsl:for-each>
    </table>
   </body>
  </html>
 </xsl:template>


</xsl:stylesheet>
