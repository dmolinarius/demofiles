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
    <title>Les paragraphes se séparent</title>
    <link rel="stylesheet" href="../../style/s5.css" type="text/css" />
   </head>
   <body>
    <h1>Exercice de style</h1>
    <hr />

    <p>Le texte ci-dessous provient du document source :</p>

    <xsl:apply-templates select="//bloc"/>


    <hr class="bottom" />
    <table width="100%">
     <tr>
      <td align="left">
       <address>Copyright : Daniel Muller</address>
      </td>
      <td align="right">
       <div class="date">161113</div>
      </td>
     </tr>
    </table>
   </body>
  </html>
 </xsl:template>
 
<xsl:template match="b|i|tt|code">
 <xsl:copy>
  <xsl:apply-templates/>
 </xsl:copy>
</xsl:template>

<xsl:variable name="separ">
 <hr align="center" width="25%"/>
 <hr align="center" width="50%"/>
 <div align="center">
  <font family="fixed" color="#006600">
   <b>- - - + + + 0 0 0 | 0 0 0+ + + - - -</b>
  </font>
 </div>
 <hr align="center" width="50%"/>
 <hr align="center" width="25%" style="margin-bottom:2.66em"/>
</xsl:variable>

<xsl:template match="bloc[1]">
 <p>
  <xsl:apply-templates/>
 </p>
</xsl:template>

<xsl:template match="bloc[position()>1]">
 <xsl:copy-of select="$separ"/>
 <p>
  <xsl:apply-templates/>
 </p>
</xsl:template>

</xsl:stylesheet>
