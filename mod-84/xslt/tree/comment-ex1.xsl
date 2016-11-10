<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output
      method="html"
      encoding="utf-8"
      doctype-public="-//W3C//DTD HTML 4.01//EN"
      doctype-system="http://www.w3.org/TR/html4/strict.dtd" />

 <xsl:template match="/">
  <html>
   <head>
    <title>Une feuille de style mono-maniaque</title>
    <link rel="stylesheet" href="../../style/s5.css" type="text/css" />
   </head>
   <body>

    <!-- Voici comment inclure un commentaire dans le document généré -->
    <xsl:comment> Ce document a été généré par la feuille de style comment-ex1.xsl </xsl:comment>&#160;

    <h1>Exercice de style</h1>
    <hr />
    <p>
     Ce document a été généré par une feuille de style mono-maniaque.
    </p>
    <p>
     En effet, le résultat observé sera le même quel que soit le document
     auquel elle aura été appliquée...
    </p>
    <hr class="bottom" />
    <table width="100%">
     <tr>
      <td align="left">
       <address>Copyright : Daniel Muller</address>
      </td>
      <td align="right">
       <div class="date">20161110</div>
      </td>
     </tr>
    </table>
   </body>
  </html>
 </xsl:template>
 
</xsl:stylesheet>
