<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/result">
{"result":
[
<xsl:for-each select="./serie">
	<xsl:call-template name="serie"/>
	<xsl:if test="position() != last()">
        	 <xsl:text>,</xsl:text>
    	</xsl:if> 
</xsl:for-each>
]
}
</xsl:template>

<xsl:template name="serie">
	{
	<xsl:call-template name="generate">
		<xsl:with-param name="name" select="'area'" />
		<xsl:with-param name="text" select="./area" />
	</xsl:call-template>

	<xsl:call-template name="generate">
		<xsl:with-param name="name" select="'freq'" />
		<xsl:with-param name="text" select="./freq" />
	</xsl:call-template>

	<xsl:call-template name="generate">
		<xsl:with-param name="name" select="'activity'" />
		<xsl:with-param name="text" select="./activity" />
	</xsl:call-template>

	<xsl:text>"values": [</xsl:text>

	<xsl:call-template name="values">
	</xsl:call-template>
	]
	}
</xsl:template>

<xsl:template name="generate">

	<xsl:param name="name" />
	<xsl:param name="text" />
	"<xsl:value-of select = "$name" />":"<xsl:value-of select = "$text" />",

</xsl:template>

<xsl:template name="values">
	
	<xsl:for-each select="./values/item">
		<xsl:call-template name="generatevalues">
			<xsl:with-param name="period" select="./@TIME_PERIOD" />
			<xsl:with-param name="obs" select="./obs" />
		</xsl:call-template>
	<xsl:if test="position() != last()">
        	 <xsl:text>,</xsl:text>
    	</xsl:if>		
	</xsl:for-each>
	
</xsl:template>

<xsl:template name="generatevalues">
	<xsl:param name="period" />
	<xsl:param name="obs" />
	{"period":"<xsl:value-of select = "$period"/>","obs":"<xsl:value-of select ="$obs"/>"}
</xsl:template>
</xsl:stylesheet>
