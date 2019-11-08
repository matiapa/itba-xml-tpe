<xsl:template match="/">
{"result":
[
<xsl:for-each select="/serie">
	<xsl:apply-template select="/serie"/>
</xsl:for-each>
]
}
</xsl:template>

<xsl:template match="/serie">
	{
	<xsl:call-template name="generate">
		<xsl:with-param name="name" select="area" />
		<xsl:with-param name="text" select="/area" />
	</xsl:call-template>

	<xsl:call-template name="generate">
		<xsl:with-param name="name" select="freq" />
		<xsl:with-param name="text" select="/freq" />
	</xsl:call-template>

	<xsl:call-template name="generate">
		<xsl:with-param name="name" select="activity" />
		<xsl:with-param name="text" select="/activity" />
	</xsl:call-template>

	<xsl:text>"values": [</xsl:text>

	<xsl:call-template match="/values">
	</xsl:call-template>
	]
	}
</xsl:template>

<xsl:template name="generate">
	<xsl:param name="name" />
	<xsl:param name="text" />
	<xsl:text>"$name":"$text",</xsl:text>
</xsl:template>

<xsl:template match="/values">
	
	<xsl:for-each select="/values">
		<xsl:call-template name="generate">
			<xsl:with-param name="period" select="/item/@TIME_PERIOD" />
			<xsl:with-param name="obs" select="/item/obs" />
		</xsl:call-template>		
	</xsl:for-each>
	
</xsl:template>

<xsl:template name="generatevalues">
	<xsl:param name="period" />
	<xsl:param name="obs" />
	<xsl:text>{"period":"$period","obs":"$obs"},</xsl:text>
</xsl:template>

