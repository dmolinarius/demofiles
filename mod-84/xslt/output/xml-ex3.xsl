<?xml version="1.0" encoding="utf-8"?>
 
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  	xmlns="http://www.w3.org/2000/svg">

 <xsl:output
 	method="xml"
 	encoding="utf-8"
 	doctype-public="-//W3C//DTD SVG 20010904//EN"
 	doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>

 <xsl:template match="/classe">
  <svg viewBox="0 0 1000 500" preserveAspectRatio="none">
   <rect width="1000" height="500" rx="0" ry="0" fill="#000050" stroke="none"/>
    <text y="6" stroke="none" font-family="Arial" font-size="20" fill="#F0F0EA">
     <xsl:apply-templates/>
    </text>
  </svg>
 </xsl:template>

 <xsl:template match="étudiant">
  <xsl:apply-templates/>
 </xsl:template>

 <xsl:template match="prénom">
  <tspan x="50" dy="30"> 
   <xsl:apply-templates/>
  </tspan>
 </xsl:template>

 <xsl:template match="nom">
  <tspan x="200"> 
   <xsl:apply-templates/>
  </tspan>
 </xsl:template>

</xsl:stylesheet>
