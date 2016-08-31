<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 8
   Tutorial Project

   Denison Public Library XSLT Style Sheet
   Author: Wai Yan Kaung
   Date:   12/09/2015
   Filename:         library.xsl
   Supporting Files: book.png, dvd.png

-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     exclude-result-prefixes="xs">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

   <xsl:template match="/">

      <html>
         <head>
            <title>Denison Public Library</title>
            <link href="libstyles.css" rel="stylesheet" type="text/css" />
         </head>

         <header>
            <h1>Denison Public Library</h1>
            <h2>Ennis, Montana</h2>
         </header>

         <body>

               <h1>Checked Out Items</h1>
               <table id="checkoutList">
                  <thead>                  
                     <tr>
                        <th>Call No.</th>
                        <th>Title</th>
                        <th>Due Date</th>
                        <th>Overdue? (Y/N)</th>
                        <th>Overdue Category</th>
                     </tr>
                  </thead>	
                  <tbody>			
       	          <xsl:apply-templates select="itemlist/item" />
                  </tbody>
               </table>
         </body>

      </html>
   </xsl:template>

   <xsl:template match="item">
      <tr>
         <td class="callnoCell">
            <xsl:value-of select="callno" />
         </td>
         <td class="titleCell">
            <xsl:value-of select="title" />
         </td>
         <td class="duedateCell">
            <xsl:value-of select="status/@return" />
         </td>
         <td class="overdueCell">

         </td>
         <td class="categoryCell">

         </td>
      </tr>
   </xsl:template>

</xsl:stylesheet>
