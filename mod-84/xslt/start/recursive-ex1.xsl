<?xml version="1.0" encoding="utf-8"?>
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

 <xsl:template match="/classe">
  <html>
   <body>
    <table border="2">
     <xsl:apply-templates/>
    </table>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="étudiant">
  <tr>
   <xsl:apply-templates/>
  </tr>
 </xsl:template>

 <xsl:template match="nom | prénom">
  <td>
   <xsl:apply-templates/>
  </td>
 </xsl:template>

</xsl:stylesheet>
