<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:param name="Teams" select="template_data/Teams"/>
        <xsl:param name="Country" select="template_data/Countries"/>
        <Kierowcy>
            <xsl:for-each select="template_data/Drivers/Driver">
                <xsl:variable name="TeamId" select="TeamId"/>
                <xsl:variable name="CountryId" select="CountryId"/>
                <Kierowca>
                    <ImieNazwisko><xsl:value-of select="Name"/></ImieNazwisko>
                    <Zespol><xsl:value-of select="$Teams/Team[Id=$TeamId]/Name"/></Zespol>
                    <Kraj><xsl:value-of select="$Country/Country[Id=$CountryId]/Name"/></Kraj>
                </Kierowca>
            </xsl:for-each>
        </Kierowcy>
    </xsl:template>

</xsl:stylesheet>