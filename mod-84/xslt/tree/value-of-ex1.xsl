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
    <title>Le gras manque à l'appel</title>
    <link rel="stylesheet" href="../../style/s5.css" type="text/css" />
   </head>
   <body>
    <h1>Exercice de style</h1>
    <hr />

    <p>Le texte ci-dessous provient du document source :</p>

    <p>
    <xsl:value-of select="/exemple"/>
    </p>

    <p>Malheureusement le texte gras a disparu dans l'opération...</p>

    <hr class="bottom" />
    <table width="100%">
     <tr>
      <td align="left">
       <address>Copyright : Daniel Muller</address>
      </td>
      <td align="right">
       <div class="date">161110</div>
      </td>
     </tr>
    </table>
   </body>
  </html>
 </xsl:template>
 
</xsl:stylesheet>
