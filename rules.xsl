<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
		<body>
			<h1 align="center">Students' Basic Details</h1>
			<table border="3" align="center" >
				<tr>
					<th>Name</th>
					<th>Branch</th>
					<th>Age</th>
					<th>City</th>
				</tr>
				<xsl:apply-templates/>
			</table>
		</body>
		</html>
	</xsl:template>
	<xsl:template match="student">
		<xsl:for-each select="s">
			<xsl:if test="age &gt; 17">					
				<tr>
					<xsl:apply-templates select="name">
						<xsl:with-param name="nombre">
							<xsl:value-of select="name"/>
						</xsl:with-param> 
						<xsl:with-param name="edad">
							<xsl:value-of select="age"/>
						</xsl:with-param> 
					</xsl:apply-templates>					
					<td><xsl:value-of select="branch"/></td>
					<td><xsl:value-of select="age"/></td>
					<td><xsl:value-of select="city"/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="name">
		<xsl:param name="edad" />
		<xsl:param name="nombre" />
		<xsl:choose>
			<xsl:when test="$edad &gt; 20">
				<td bgcolor="#ff00ff"><xsl:value-of select="$nombre"/></td>
			</xsl:when>
			<xsl:otherwise>
				<td><xsl:value-of select="$nombre"/></td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>