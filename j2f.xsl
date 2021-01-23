<?xml version="1.0" encoding="UTF-8" ?>

<!--
Extract release notes from Jira RSS XML

# Tools: 

* Curl
* Saxon

# Pre-requisite:

* Create a customfield with the value "Release Notes"
* Creaet an APIkey in Jira (from settings)
* Get the XML download URL from the Export menu in Jira by right-clicking XML.

# Get the source XML:

curl -o input.xml -u user@example.com:APItoken "XML download URL"

# Create the Flare file:

saxon input.xml autorn.xsl > output.html

Note: The example script takes the fix version as an input parameter.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:strip-space elements="*"/>
<xsl:template match="/">
  <html xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd" MadCap:onlyLocalStylesheets="True">
    <head>
        <link rel="stylesheet" type="text/css" href="../Resources/Stylesheets/yourstyles.css" />
    </head>
  <body>
  <h1>Release Notes</h1>
    <table border="1">
      <tr>
        <th>Modules</th>
        <th>Summary</th>
        <th>Ticket</th>
        <th>Category</th>
        <th>Fix Versions</th>
      </tr>
      <xsl:for-each select="rss/channel/item/customfields/customfield">
        <xsl:if test="customfieldname[text()='Release Notes']">
      <tr>
       	<td><xsl:value-of select="../customfield/customfieldname[text()='Modules']/../customfieldvalues/customfieldvalue"/>&#160;</td>
      	<td><xsl:value-of select="customfieldvalues/customfieldvalue"/>&#160;</td>
       	<td><xsl:value-of select="../../key"/>&#160;</td>
       	<td><xsl:value-of select="../customfield/customfieldname[text()='Category']/../customfieldvalues/customfieldvalue"/>&#160;</td>
       	<td><xsl:value-of select="../../fixVersion"/>&#160;</td>
      </tr>
        </xsl:if>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
