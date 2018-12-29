<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:param name="Teams" select="template_data/Teams"/>
        <xsl:param name="Country" select="template_data/Countries"/>
        <xsl:param name="Driver" select="template_data/Drivers"/>
            <xsl:for-each select="template_data/Drivers/Driver">
                <xsl:variable name="TeamId" select="TeamId"/>
                <xsl:variable name="CountryId" select="CountryId"/>
                Name and surname of the driver: <xsl:value-of select="Name"/>; Team: <xsl:value-of select="$Teams/Team[Id=$TeamId]/Name"/>; Country of birth: <xsl:value-of select="$Country/Country[Id=$CountryId]/Name"/>
            </xsl:for-each>

                Total number of races won by all drivers: <xsl:value-of select="sum(template_data/Drivers/Driver/RaceWins)"/>

                The driver with the lowest number of winnings is: <xsl:value-of select="template_data/Drivers/Driver[RaceWins=min(../../Drivers/Driver/RaceWins)]/Name"/>
                The driver with the most number of winnings is: <xsl:value-of select="template_data/Drivers/Driver[RaceWins=max(../../Drivers/Driver/RaceWins)]/Name"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="template_data/Teams/Team">
            <xsl:variable name="TeamId" select="Id"/>
                Team: <xsl:value-of select="distinct-values(Name)"/>, Driver/Drivers: <xsl:value-of select="$Driver/Driver[TeamId=$TeamId]/Name" separator=", "/>; Total number of first places: <xsl:value-of select="sum($Driver/Driver[TeamId=$TeamId]/RaceWins)"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>