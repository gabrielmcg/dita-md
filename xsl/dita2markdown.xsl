<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  
  <xsl:import href="ast2markdown.xsl"/>
  
  <xsl:import href="dita2markdownImpl.xsl"/>
  <!--xsl:import href="conceptdisplay.xsl"/>
  <xsl:import href="glossdisplay.xsl"/>
  <xsl:import href="taskdisplay.xsl"/>
  <xsl:import href="refdisplay.xsl"/-->
  <xsl:import href="ut-d.xsl"/>
  <xsl:import href="sw-d.xsl"/>
  <xsl:import href="pr-d.xsl"/>
  <xsl:import href="ui-d.xsl"/>
  <xsl:import href="hi-d.xsl"/>
  <!--xsl:import href="abbrev-d.xsl"/-->
  <xsl:import href="markup-d.xsl"/>
  <xsl:import href="xml-d.xsl"/>
  
  <!--xsl:include href="markdownflag.xsl"/-->  
  
  <xsl:output xmlns:dita="http://dita-ot.sourceforge.net" method="text" encoding="utf-8"/>
  
  <xsl:template match="/">
    <xsl:variable name="ast" as="node()">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:variable name="ast-flat" as="node()">
      <xsl:apply-templates select="$ast" mode="flatten"/>
    </xsl:variable>
    <xsl:variable name="ast-clean" as="node()">
      <xsl:apply-templates select="$ast-flat" mode="ast-clean"/>
    </xsl:variable>
    
    <xsl:message>
      <xsl:copy-of select="$ast-clean"/>
      
    </xsl:message>
    
    <xsl:apply-templates select="$ast-clean" mode="ast"/>
    
    
    <xsl:for-each select="$ast-clean//image">
      <xsl:text>[</xsl:text>
      <xsl:value-of select="translate(@href, '/.', '--')"/>
      <xsl:text>]:</xsl:text>   
      <xsl:text>&lt;</xsl:text>
      <xsl:value-of select="'/ops'"/>
      <xsl:value-of select="'/'"/>
      <xsl:value-of select="@href"/>    
      <xsl:text>&gt; "</xsl:text>  
      
      <xsl:message>
        <xsl:for-each select="..">
          <xsl:copy-of select="."/>
        !!!<xsl:copy-of select="following-sibling::para[1]"/>
        </xsl:for-each>
      </xsl:message>
      <xsl:for-each select="..//following-sibling::para[1]/span[@class='figcap']">
        
        <xsl:value-of select="."/>
      </xsl:for-each>
      <xsl:text>"</xsl:text>
      <xsl:value-of select="$linefeed"/>
      
      
    </xsl:for-each>
    
  </xsl:template>
  
</xsl:stylesheet>