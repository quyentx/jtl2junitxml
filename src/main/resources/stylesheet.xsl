<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/testResults">
		<testsuites>
			<testsuite>
				<xsl:for-each select="*">
					<testcase>
						<xsl:attribute name="classname"><xsl:value-of select="name()"/></xsl:attribute>
						<xsl:attribute name="tn"><xsl:value-of select="@tn"/></xsl:attribute>
						<xsl:attribute name="name"><xsl:value-of select="@lb"/></xsl:attribute>
						<xsl:attribute name="time"><xsl:value-of select="@lt div 1000"/></xsl:attribute>
						<xsl:attribute name="responseData"><xsl:value-of select="*"/></xsl:attribute>
						<xsl:attribute name="rc"><xsl:value-of select="@rc"/></xsl:attribute>
						<xsl:attribute name="rm"><xsl:value-of select="@rm"/></xsl:attribute>
						<xsl:choose>
							<xsl:when test= "@s = 'true'">
								<passed><xsl:value-of select="@s"/></passed>
							</xsl:when>
							<xsl:when test= "@s = 'false' ">
								<failure><xsl:value-of select="@s"/></failure>
							</xsl:when>
						</xsl:choose>

						<steps>
							<xsl:for-each select="httpSample">
								<testSteps>
									<assertion><xsl:value-of select="@lb"/></assertion>
									<xsl:choose>
										<xsl:when test="@s = 'false'">
											<failure><xsl:value-of select="@rm"/></failure>
										</xsl:when>
									</xsl:choose>
								</testSteps>
							</xsl:for-each>
						</steps>
					</testcase>
				</xsl:for-each>
			</testsuite>
		</testsuites>
	</xsl:template>
</xsl:stylesheet>