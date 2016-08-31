<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 6
   Tutorial Project

   DVD Library XSLT Style Sheet
   Author: Wai Yan Kaung
   Date:   11/07/2015

   Filename:         dvdlibrary.xsl
   
-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:variable name="currentYear" select="2015" />

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

   <xsl:template match="/">
	<html>
	   <head>
	      <title>Jenna's DVD Collection</title>
	      <link href="dvdlibrarystyles.css"
	            rel="stylesheet" type="text/css" />
	   </head>
	   <body>
	      <header>
	         <h1>Jenna's DVD Collection</h1>
	      </header>
            <section>
               <h1>DVD List</h1>
               <xsl:apply-templates select="dvdlibrary/dvd">
                  <xsl:sort select="title" />
               </xsl:apply-templates>
            </section>
	   </body>
	</html>
   </xsl:template>

  <xsl:template match="dvd">
      
   
    
      <article>
         <h1>
            <xsl:value-of select="title" />
         </h1>
         <h2>
            Featuring:
            <xsl:for-each select="characters/character">
            [
               <xsl:value-of select="." />
            ]
            </xsl:for-each>
         </h2>
         <p>
            Bonus Features:
            <span>
               <xsl:for-each select="bonus/feature">
                  <xsl:value-of select="." />/
               </xsl:for-each>
            </span>
         </p>
	 <table>
   	    <tr>
	      <th>Price</th>
	      <th>Location</th>
	      <th>Release Date</th>
	      <th>Years Since Release</th>
	    </tr>
	    <tr>
	      <td><xsl:value-of select="format-number(purchased/price,'$#,#0.00')" /></td>
	      <td><xsl:value-of select="purchased/location" /></td>
	      <td><xsl:value-of select="year" /></td>
	      <td><xsl:value-of select="$currentYear - year"/></td>
	    </tr>
	    <tr>
	      <td colspan="4">
	         <p>My Rating:</p>
                 
                <xsl:call-template name="drawStars">
                 <xsl:with-param name="starFile" select="'star.png'" />
                 <xsl:with-param name="starCount" select="rating" />
                 </xsl:call-template>
                
	      </td>
	    </tr>
	  </table>
      </article>
  </xsl:template>

 <xsl:template name="drawStars">
       <xsl:param name="starFile" />
       <xsl:param name="starCount" />
       
       <xsl:if test="$starCount > 0">
           <img src="{$starFile}" alt="" />
       <xsl:call-template name="drawStars">
           <xsl:with-param name="starFile" select="$starFile" />
           <xsl:with-param name="starCount" select="$starCount - 1" />
       </xsl:call-template>
      </xsl:if>
    </xsl:template> 
    
</xsl:stylesheet>


