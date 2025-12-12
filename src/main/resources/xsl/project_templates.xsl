<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="index_search_form">
    <form
      id="project-searchMainPage"
      class="form-inline"
      role="search"
      action="../servlets/solr/findPublic">
      <div class="input-group input-group-lg w-100">
        <input
          name="condQuery"
          placeholder="{document('i18n:project.index_search.placeholder')/i18n/text()}"
          class="form-control search-query"
          id="project-searchInput"
          type="text" />
        <div class="input-group-append">
          <button type="submit" class="btn btn-primary">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
    </form>
  </xsl:template>

</xsl:stylesheet>
