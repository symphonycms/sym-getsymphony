<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fb="http://ogp.me/ns/fb#">

<xsl:import href="../utilities/head.xsl" />
<xsl:import href="../utilities/body.xsl" />

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<!-- Load XML data -->
<xsl:param name="config" select="document('../data/_config.xml')" />
<xsl:param name="website-name" select="$config/data/config/website-name" />
<xsl:param name="page-data" select="document('../data/index.xml')" />
<xsl:param name="site" select="$page-data/data/params/site" />
<xsl:param name="network" select="document('../data/_network.xml')" />
<xsl:param name="navigation" select="document('../data/_navigation.xml')" />

<!-- Directories -->
<xsl:param name="assets" select="concat($workspace, '/assets')" />
<xsl:param name="css" select="concat($assets, '/css')" />
<xsl:param name="scripts" select="concat($assets, '/js')" />
<xsl:param name="images" select="concat($assets, '/images')" />
<xsl:param name="theme" select="concat($workspace, '/factory')" />

<xsl:template match="/">
  <xsl:comment><![CDATA[[if lt IE 7]> <html class="ie ie6 lt-ie7 no-js" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <![endif]]]></xsl:comment>
  <xsl:comment><![CDATA[[if IE 7]>    <html class="ie ie7 lt-ie8 no-js" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <![endif]]]></xsl:comment>
  <xsl:comment><![CDATA[[if IE 8]>    <html class="ie ie8 lt-ie9 no-js" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <![endif]]]></xsl:comment>
  <xsl:comment><![CDATA[[if IE 9]>    <html class="ie ie9 lt-ie10 no-js" lang="en" xmlns:fb="http://ogp.me/ns/fb#"> <![endif]]]></xsl:comment>
  <xsl:comment><![CDATA[[if gt IE 9]><!]]></xsl:comment><html class="no-js" lang="en" xmlns:fb="http://ogp.me/ns/fb#"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
    <xsl:apply-templates select="." mode="head" />
    <xsl:apply-templates select="." mode="body" />
  </html>
</xsl:template>

</xsl:stylesheet>