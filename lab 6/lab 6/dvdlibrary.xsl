<?xml version="1.0" encoding="UTF-8" ?>
<!--
   CT Restaurant Ratings
   
   Author:   Wai Yan Kaung
   Date:     12/10/2015

   Filename:         restrating.xsl
   
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
	      <title>Restaurant Ratings</title>
	      <link href="dvdlibrarystyles.css"
	            rel="stylesheet" type="text/css" />
	   </head>
	   <body>
	      <header>
	         <h1>CT Restaurant Ratings</h1>
	      </header>
            <section>
               <h1>Restaurant List</h1>
               <xsl:apply-templates select="restratings/restaurant">
                  <xsl:sort select="title" />
               </xsl:apply-templates>
            </section>
	   </body>
	</html>
   </xsl:template>

  <xsl:template match="restaurant">
      
   
    
      <article>
         <h1>
            <xsl:value-of select="title" />
         </h1>
         <h2>
            Highlight Dishes: 
            <xsl:for-each select="dishes/character">
            [
               <xsl:value-of select="." />
            ]
            </xsl:for-each>
         </h2>
         <p>
            Favorite Dish:
            <span>
               <xsl:for-each select="bonus/feature">
                  <xsl:value-of select="." />/
               </xsl:for-each>
            </span>
         </p>
	 <table>
   	    <tr>
	      <th>Dish Price</th>
	      <th>Food Type</th>
	      <th>Date Of Visit</th>
	      <th>Years Since Visit</th>
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


