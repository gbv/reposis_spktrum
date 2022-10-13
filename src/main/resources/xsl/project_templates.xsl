<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mcrxsl="xalan://org.mycore.common.xml.MCRXMLFunctions"
                xmlns:i18n="xalan://org.mycore.services.i18n.MCRTranslation"
                exclude-result-prefixes="">
  
  <xsl:template match="index_search_form">
    <form action="concat('../servlets/solr/', 'find')" id="project-searchMainPage" class="form-inline" role="search">
      <div class="input-group input-group-lg w-100">
        <input name="condQuery" placeholder="{i18n:translate('project.index_search.placeholder')}" class="form-control search-query" id="project-searchInput" type="text" />
        <div class="input-group-append">
          <button type="submit" class="btn btn-primary">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
    </form>
  </xsl:template>

</xsl:stylesheet>