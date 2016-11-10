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
    <title>Les titres HTML</title>
    <link rel="stylesheet" href="../../style/s5.css" type="text/css" />
   </head>
   <body>
    <h1>Exemple de document source</h1>
    <hr />

    <xsl:call-template name="header"/>

    <p><b>N.B.</b> Le style des titres ci-dessus provient évidemment de la feuille de style <b>CSS</b> associée au présent document...</p>
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


 <xsl:template name="header">
  <xsl:param name="level" select="1"/>

  <xsl:element name="{concat('h',$level)}">
   Ceci est un exemple de titre de niveau
   <xsl:value-of select="$level"/>
  </xsl:element>

  <xsl:if test="not($level=6)">
   <xsl:call-template name="header">
    <xsl:with-param name="level" select="$level+1"/>
   </xsl:call-template>
  </xsl:if>

 </xsl:template>
 
</xsl:stylesheet>
